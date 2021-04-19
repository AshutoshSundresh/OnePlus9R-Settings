package com.android.settings.wifi.tether;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.net.wifi.SoftApConfiguration;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.provider.Settings;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.Toast;
import androidx.appcompat.app.AlertDialog;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.android.settings.datausage.DataSaverBackend;
import com.android.settings.widget.SwitchBar;
import com.android.settings.widget.SwitchWidgetController;
import com.android.settings.wifi.tether.utils.TetherUtils;
import com.android.settingslib.WirelessUtils;
import com.android.settingslib.core.lifecycle.LifecycleObserver;
import com.android.settingslib.core.lifecycle.events.OnStart;
import com.android.settingslib.core.lifecycle.events.OnStop;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.ProductUtils;
import com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient;
import java.lang.reflect.Method;
import org.codeaurora.internal.IExtTelephony;

public class WifiTetherSwitchBarController implements SwitchWidgetController.OnSwitchChangeListener, LifecycleObserver, OnStart, OnStop, DataSaverBackend.Listener, View.OnClickListener, TetherUtils.OnDialogConfirmCallback {
    private static final Uri SOFTSIM_URL = Uri.parse("content://com.redteamobile.provider");
    private static final IntentFilter WIFI_INTENT_FILTER;
    SoftApConfiguration config;
    private boolean isWifiChecked = false;
    private MhsAuthorizedClient.ICallback mCallBack = new MhsAuthorizedClient.ICallback() {
        /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass9 */

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onSuccess(boolean z) {
            Log.i("mhs", "Is se MHS Allowed == " + z);
            WifiTetherSwitchBarController.this.dismissDialog();
            if (z) {
                WifiTetherSwitchBarController.this.startTether();
                return;
            }
            WifiTetherSwitchBarController.this.resetSwitch();
            WifiTetherSwitchBarController.this.mobileHotspotDialog();
        }

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onError(int i, String str) {
            Log.e("mhs", "MHS se error == " + str);
            WifiTetherSwitchBarController.this.resetSwitch();
            Toast.makeText(WifiTetherSwitchBarController.this.mContext, WifiTetherSwitchBarController.this.mContext.getString(C0017R$string.mhs_call_back_error), 1).show();
            WifiTetherSwitchBarController.this.dismissDialog();
        }

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onTimeout() {
            Log.e("mhs", "MHS se time out");
            WifiTetherSwitchBarController.this.resetSwitch();
            Toast.makeText(WifiTetherSwitchBarController.this.mContext, WifiTetherSwitchBarController.this.mContext.getString(C0017R$string.mhs_call_back_error), 1).show();
            WifiTetherSwitchBarController.this.dismissDialog();
        }
    };
    private MhsAuthorizedClient mClient;
    private final ConnectivityManager mConnectivityManager;
    private final Context mContext;
    final DataSaverBackend mDataSaverBackend;
    private Handler mHandler = new Handler();
    final ConnectivityManager.OnStartTetheringCallback mOnStartTetheringCallback = new ConnectivityManager.OnStartTetheringCallback() {
        /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass1 */

        public void onTetheringFailed() {
            WifiTetherSwitchBarController.super.onTetheringFailed();
            WifiTetherSwitchBarController.this.mSwitchBar.setChecked(false);
            WifiTetherSwitchBarController.this.updateWifiSwitch();
        }
    };
    private final SubscriptionManager.OnSubscriptionsChangedListener mOnSubscriptionsChangedListener = new SubscriptionManager.OnSubscriptionsChangedListener() {
        /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass2 */

        public void onSubscriptionsChanged() {
            if (WifiTetherSwitchBarController.this.mSubscriptionInfo != null) {
                WifiTetherSwitchBarController wifiTetherSwitchBarController = WifiTetherSwitchBarController.this;
                wifiTetherSwitchBarController.mSubscriptionInfo = wifiTetherSwitchBarController.mSubscriptionManager.getActiveSubscriptionInfo(WifiTetherSwitchBarController.this.mSubscriptionInfo.getSubscriptionId());
            }
        }
    };
    private ProgressDialog mProgressDialog;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass5 */

        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if ("android.net.wifi.WIFI_AP_STATE_CHANGED".equals(action)) {
                WifiTetherSwitchBarController.this.handleWifiApStateChanged(intent.getIntExtra("wifi_state", 14));
            } else if ("android.intent.action.SIM_STATE_CHANGED".equals(action)) {
                Log.i("WifiTetherSwitchBarController", "action = " + action);
                WifiTetherSwitchBarController wifiTetherSwitchBarController = WifiTetherSwitchBarController.this;
                wifiTetherSwitchBarController.mSoftSimPilotModeEnabled = wifiTetherSwitchBarController.isPilotModeEnabled(context);
                WifiTetherSwitchBarController.this.updateWifiSwitch();
                if (OPUtils.isSupportUss()) {
                    WifiTetherSwitchBarController.this.updateSimStatus(TetherUtils.isSimStatusChange(context));
                }
            } else if ("android.intent.action.setupDataError_tether".equals(action)) {
                Log.d("WifiTetherSwitchBarController", "onReceive tether error braodcast");
                if (OPUtils.isSupportUss() && intent.getBooleanExtra("data_call_error", false) && intent.getIntExtra("data_call_code", 0) == 67) {
                    WifiTetherSwitchBarController.this.tetherError(2);
                }
            }
        }
    };
    private boolean mSoftSimPilotModeEnabled;
    private SubscriptionInfo mSubscriptionInfo = null;
    private SubscriptionManager mSubscriptionManager = null;
    private final Switch mSwitch;
    private final SwitchBar mSwitchBar;
    private final WifiManager mWifiManager;
    SharedPreferences pref;

    @Override // com.android.settings.datausage.DataSaverBackend.Listener
    public void onBlacklistStatusChanged(int i, boolean z) {
    }

    @Override // com.android.settings.datausage.DataSaverBackend.Listener
    public void onWhitelistStatusChanged(int i, boolean z) {
    }

    static {
        IntentFilter intentFilter = new IntentFilter("android.net.wifi.WIFI_AP_STATE_CHANGED");
        WIFI_INTENT_FILTER = intentFilter;
        intentFilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        if (OPUtils.isSupportUss()) {
            WIFI_INTENT_FILTER.addAction("android.intent.action.setupDataError_tether");
        }
    }

    WifiTetherSwitchBarController(Context context, SwitchBar switchBar) {
        this.mContext = context;
        this.mSwitchBar = switchBar;
        this.mSwitch = switchBar.getSwitch();
        this.mDataSaverBackend = new DataSaverBackend(context);
        this.mConnectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
        this.mWifiManager = wifiManager;
        this.mSwitchBar.setChecked(wifiManager.getWifiApState() == 13);
        this.config = this.mWifiManager.getSoftApConfiguration();
        this.pref = this.mContext.getSharedPreferences("OPPref_wifi", 0);
        if (ProductUtils.isUsvMode()) {
            this.mSubscriptionInfo = SubscriptionManager.from(context).getActiveSubscriptionInfoForSimSlotIndex(0);
            TelephonyManager telephonyManager = (TelephonyManager) this.mContext.getSystemService(TelephonyManager.class);
            SubscriptionManager subscriptionManager = (SubscriptionManager) this.mContext.getSystemService(SubscriptionManager.class);
            this.mSubscriptionManager = subscriptionManager;
            subscriptionManager.addOnSubscriptionsChangedListener(this.mOnSubscriptionsChangedListener);
        }
        updateWifiSwitch();
        if (ProductUtils.isUsvMode()) {
            this.mProgressDialog = new ProgressDialog(context);
        }
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnStart
    public void onStart() {
        this.mDataSaverBackend.addListener(this);
        this.mSwitch.setOnClickListener(this);
        this.mContext.registerReceiver(this.mReceiver, WIFI_INTENT_FILTER);
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnStop
    public void onStop() {
        this.mDataSaverBackend.remListener(this);
        this.mContext.unregisterReceiver(this.mReceiver);
        if (ProductUtils.isUsvMode()) {
            MhsAuthorizedClient mhsAuthorizedClient = this.mClient;
            if (mhsAuthorizedClient != null) {
                mhsAuthorizedClient.cancelRequest();
            }
            dismissDialog();
        }
    }

    public void onClick(View view) {
        Context context = this.mContext;
        if (context != null) {
            OPUtils.startVibratePattern(context);
        }
        if (((Switch) view).isChecked()) {
            Log.d("WifiTetherSwitchBarController", "onClick: start tether");
            if (!ProductUtils.isUsvMode()) {
                startTether();
            } else if (WirelessUtils.isAirplaneModeOn(this.mContext)) {
                Context context2 = this.mContext;
                TetherUtils.showTertheringErrorDialog(context2, context2.getString(C0017R$string.hotspot_tip_title), this.mContext.getString(C0017R$string.mobile_hotspot_airplane_off_error));
                this.mSwitchBar.setChecked(false);
            } else if (!this.mConnectivityManager.getMobileDataEnabled()) {
                Context context3 = this.mContext;
                TetherUtils.showTertheringErrorDialog(context3, context3.getString(C0017R$string.hotspot_tip_title), this.mContext.getString(C0017R$string.mobile_hotspot_data_off_error));
                this.mSwitchBar.setChecked(false);
            } else if (this.mProgressDialog == null || !isVerizon() || this.isWifiChecked) {
                startTether();
            } else {
                this.mProgressDialog.setCancelable(false);
                this.mProgressDialog.setMessage(this.mContext.getResources().getString(C0017R$string.dialog_mhs_error));
                if (!((Activity) this.mContext).isDestroyed()) {
                    this.mProgressDialog.show();
                    MhsAuthorizedClient mhsAuthorizedClient = new MhsAuthorizedClient(this.mContext, this.mCallBack, Integer.valueOf(SubscriptionManager.getDefaultDataSubscriptionId()), Looper.getMainLooper());
                    this.mClient = mhsAuthorizedClient;
                    mhsAuthorizedClient.sendRequest(25000);
                }
            }
        } else {
            SwitchBar switchBar = this.mSwitchBar;
            if (switchBar != null) {
                switchBar.setEnabled(false);
            }
            this.mHandler.postDelayed(new Runnable() {
                /* class com.android.settings.wifi.tether.$$Lambda$WifiTetherSwitchBarController$1Q77u4UUtMOQY8TZ1sxe4HO3zzE */

                public final void run() {
                    WifiTetherSwitchBarController.this.lambda$onClick$0$WifiTetherSwitchBarController();
                }
            }, 300);
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$onClick$0 */
    public /* synthetic */ void lambda$onClick$0$WifiTetherSwitchBarController() {
        stopTether();
        if (ProductUtils.isUsvMode()) {
            this.isWifiChecked = false;
        }
    }

    /* access modifiers changed from: package-private */
    public void stopTether() {
        this.mConnectivityManager.stopTethering(0);
        if (TetherUtils.getUstWifiTetheringStatus(this.mContext)) {
            TetherUtils.setTetherState(this.mContext, false);
            TetherUtils.setUstWifiTetheringStatus(this.mContext, 0);
        }
    }

    /* access modifiers changed from: package-private */
    public void startTether() {
        boolean z = this.pref.getBoolean("checked", false);
        this.config = this.mWifiManager.getSoftApConfiguration();
        if (ProductUtils.isUsvMode() && !z && this.config.getSecurityType() != 0) {
            View inflate = View.inflate(this.mContext, C0012R$layout.dialog_checkbox, null);
            ((CheckBox) inflate.findViewById(C0010R$id.dialogCheckbox)).setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass3 */

                public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                    if (z) {
                        SharedPreferences.Editor edit = WifiTetherSwitchBarController.this.pref.edit();
                        edit.putBoolean("checked", true);
                        edit.commit();
                    }
                }
            });
            AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
            builder.setTitle(C0017R$string.hotspot_tip_title);
            builder.setView(inflate);
            builder.setMessage(String.format(this.mContext.getString(C0017R$string.hotspot_tip_message), this.config.getSsid(), this.config.getPassphrase()));
            builder.setPositiveButton(17039370, new DialogInterface.OnClickListener(this) {
                /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass4 */

                public void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.dismiss();
                }
            });
            builder.create().show();
        }
        this.mSwitchBar.setEnabled(false);
        if (OPUtils.isSupportUstMode() && TetherUtils.isWifiEnable(this.mContext)) {
            TetherUtils.startUstTethering(this.mContext, this);
        } else if (OPUtils.isSupportUss()) {
            startUssTethering();
        } else {
            openHotspot();
        }
    }

    @Override // com.android.settings.widget.SwitchWidgetController.OnSwitchChangeListener
    public boolean onSwitchToggled(boolean z) {
        if (!z) {
            this.mSwitchBar.setEnabled(false);
            this.mHandler.postDelayed(new Runnable() {
                /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass6 */

                public void run() {
                    WifiTetherSwitchBarController.this.stopTether();
                }
            }, 300);
        } else if (!this.mWifiManager.isWifiApEnabled()) {
            if (Settings.Global.getInt(this.mContext.getContentResolver(), "op_overheat_temperature_type", 0) != 0) {
                Toast.makeText(this.mContext, C0017R$string.overheat_toast_content, 1).show();
            }
            if (this.config.getSecurityType() == 4 || !ProductUtils.isUsvMode()) {
                startTether();
            } else {
                AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
                builder.setTitle(C0017R$string.warning_title);
                builder.setMessage(C0017R$string.open_hotspot_warning_message);
                builder.setPositiveButton(C0017R$string.continue_anyway, new DialogInterface.OnClickListener() {
                    /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass8 */

                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.dismiss();
                        WifiTetherSwitchBarController.this.startTether();
                    }
                });
                builder.setNegativeButton(17039360, new DialogInterface.OnClickListener() {
                    /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass7 */

                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.dismiss();
                        WifiTetherSwitchBarController.this.mConnectivityManager.stopTethering(0);
                        WifiTetherSwitchBarController.this.mSwitchBar.setChecked(false);
                        WifiTetherSwitchBarController.this.mSwitchBar.setEnabled(true);
                    }
                });
                builder.create().show();
            }
        }
        return true;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void handleWifiApStateChanged(int i) {
        switch (i) {
            case 10:
                if (this.mSwitch.isChecked()) {
                    this.mSwitch.setChecked(false);
                }
                this.mSwitchBar.setEnabled(false);
                return;
            case 11:
                this.mSwitch.setChecked(false);
                updateWifiSwitch();
                return;
            case 12:
                this.mSwitchBar.setEnabled(false);
                return;
            case 13:
                if (!this.mSwitch.isChecked()) {
                    this.mSwitch.setChecked(true);
                    this.isWifiChecked = true;
                }
                updateWifiSwitch();
                return;
            default:
                this.mSwitch.setChecked(false);
                updateWifiSwitch();
                return;
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateWifiSwitch() {
        this.mSwitchBar.setEnabled(!this.mDataSaverBackend.isDataSaverEnabled());
    }

    @Override // com.android.settings.datausage.DataSaverBackend.Listener
    public void onDataSaverChanged(boolean z) {
        updateWifiSwitch();
    }

    private boolean getPilotModeFromSim(Context context, int i) {
        try {
            Cursor query = context.getContentResolver().query(SOFTSIM_URL, new String[]{"slot", "iccid", "permit_package", "forbid_package", "pilot"}, new StringBuilder("slot=\"" + i + "\"").toString(), null, "slot");
            if (query == null) {
                return false;
            }
            query.moveToFirst();
            while (!query.isAfterLast()) {
                String string = query.getString(4);
                boolean equals = "1".equals(string);
                Log.d("WifiTetherSwitchBarController", "getPilotModeFromSim: isPilotMode = " + equals + " sPilot: " + string);
                if (equals) {
                    query.close();
                    return true;
                }
                query.moveToNext();
            }
            query.close();
            return false;
        } catch (SQLiteException e) {
            Log.e("WifiTetherSwitchBarController", "getPilotModeFromSim SQLiteException ", e);
            return false;
        }
    }

    private boolean isSoftSim(int i) {
        try {
            IExtTelephony asInterface = IExtTelephony.Stub.asInterface(ServiceManager.getService("extphone"));
            if (asInterface != null) {
                Bundle bundle = new Bundle();
                bundle.putInt("phone", i);
                Log.d("WifiTetherSwitchBarController", "isSoftSIM slot = " + i);
                Method declaredMethod = asInterface.getClass().getDeclaredMethod("generalGetter", String.class, Bundle.class);
                declaredMethod.setAccessible(true);
                if (((Bundle) declaredMethod.invoke(asInterface, "isSoftSIM", bundle)).getBoolean("isSoftSIM", false)) {
                    Log.d("WifiTetherSwitchBarController", "slot " + i + " is softsim");
                    return true;
                }
                Log.d("WifiTetherSwitchBarController", "slot " + i + " is NOT softsim");
            }
        } catch (Exception e) {
            Log.e("WifiTetherSwitchBarController", "exception : " + e);
        }
        return false;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private boolean isPilotModeEnabled(Context context) {
        int simCount = TelephonyManager.getDefault().getSimCount();
        for (int i = 0; i < simCount; i++) {
            boolean isSoftSim = isSoftSim(i);
            boolean pilotModeFromSim = getPilotModeFromSim(context, i);
            Log.i("WifiTetherSwitchBarController", "hasVirtualSim:" + isSoftSim + " hasPilot:" + pilotModeFromSim);
            if (isSoftSim && pilotModeFromSim) {
                Log.i("WifiTetherSwitchBarController", "Soft sim is in pilot mode");
                return true;
            }
        }
        Log.i("WifiTetherSwitchBarController", "No SIM is in pilot mode");
        return false;
    }

    private void startUssTethering() {
        if (TetherUtils.isNoSimCard(this.mContext)) {
            tetherError(1);
        } else if (TetherUtils.isHaveProfile(this.mContext)) {
            openHotspot();
        } else {
            tetherError(2);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void tetherError(int i) {
        if (i == 1) {
            Context context = this.mContext;
            TetherUtils.showTertheringErrorDialog(context, context.getString(C0017R$string.tether_no_sim_title), this.mContext.getString(C0017R$string.tether_no_sim_message));
            SwitchBar switchBar = this.mSwitchBar;
            if (switchBar != null) {
                switchBar.setChecked(false);
                this.mSwitchBar.setEnabled(false);
            }
        } else if (i == 2) {
            String string = this.mContext.getString(C0017R$string.wifi_hotspot_checkbox_text);
            Context context2 = this.mContext;
            TetherUtils.showTertheringErrorDialog(context2, context2.getString(C0017R$string.tether_error_title, string), this.mContext.getString(C0017R$string.tether_error_message, string));
            openTetheringFail();
        }
    }

    private void openTetheringFail() {
        SwitchBar switchBar = this.mSwitchBar;
        if (switchBar != null) {
            switchBar.setChecked(false);
            this.mSwitchBar.setEnabled(true);
        }
        stopUssTethering();
    }

    private void stopUssTethering() {
        ConnectivityManager connectivityManager = this.mConnectivityManager;
        if (connectivityManager != null) {
            connectivityManager.stopTethering(0);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateSimStatus(boolean z) {
        SwitchBar switchBar;
        if (z && (switchBar = this.mSwitchBar) != null) {
            switchBar.setEnabled(true);
        }
    }

    private void openHotspot() {
        if (this.mConnectivityManager != null) {
            Log.d("WifiTetherSwitchBarController", "openHotspot: start tethering");
            this.mConnectivityManager.startTethering(0, true, this.mOnStartTetheringCallback, new Handler(Looper.getMainLooper()));
        }
    }

    @Override // com.android.settings.wifi.tether.utils.TetherUtils.OnDialogConfirmCallback
    public void onConfirm() {
        openHotspot();
    }

    public static boolean isVerizon() {
        return TextUtils.equals(SystemProperties.get("ril.sim.carrier.name.slot0"), "VZW");
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void mobileHotspotDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
        builder.setTitle(this.mContext.getString(C0017R$string.hotspot_tip_title));
        builder.setMessage(this.mContext.getString(C0017R$string.mobile_hotspot_authoration_error));
        builder.setNegativeButton(17039360, (DialogInterface.OnClickListener) null);
        builder.setPositiveButton(this.mContext.getString(C0017R$string.mhs_app), new DialogInterface.OnClickListener() {
            /* class com.android.settings.wifi.tether.WifiTetherSwitchBarController.AnonymousClass10 */

            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
                try {
                    Uri parse = Uri.parse("https://mobile.vzw.com/hybridClient/mvm/hotspot");
                    Intent launchIntentForPackage = WifiTetherSwitchBarController.this.mContext.getPackageManager().getLaunchIntentForPackage("com.vzw.hss.myverizon");
                    if (launchIntentForPackage != null) {
                        WifiTetherSwitchBarController.this.mContext.sendBroadcast(new Intent("android.intent.action.CLOSE_SYSTEM_DIALOGS"));
                        launchIntentForPackage.setAction("android.intent.action.VIEW");
                        launchIntentForPackage.setFlags(268435456);
                        launchIntentForPackage.setData(parse);
                        WifiTetherSwitchBarController.this.mContext.startActivity(launchIntentForPackage);
                    }
                } catch (ActivityNotFoundException e) {
                    e.printStackTrace();
                }
            }
        });
        builder.create().show();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void resetSwitch() {
        this.mSwitchBar.setChecked(false);
        updateWifiSwitch();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void dismissDialog() {
        ProgressDialog progressDialog = this.mProgressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
        }
    }
}
