package com.android.settings.connecteddevice.usb;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.Looper;
import android.os.SystemProperties;
import android.telephony.SubscriptionManager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.Toast;
import androidx.appcompat.app.AlertDialog;
import androidx.preference.PreferenceCategory;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.android.settings.Utils;
import com.android.settings.widget.RadioButtonPreference;
import com.android.settings.wifi.tether.WifiTetherSwitchBarController;
import com.oneplus.settings.utils.ProductUtils;
import com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient;
import java.util.LinkedHashMap;
import java.util.Map;

public class UsbDetailsFunctionsController extends UsbDetailsController implements RadioButtonPreference.OnClickListener {
    static final Map<Long, Integer> FUNCTIONS_MAP;
    private MhsAuthorizedClient.ICallback mCallBack = new MhsAuthorizedClient.ICallback() {
        /* class com.android.settings.connecteddevice.usb.UsbDetailsFunctionsController.AnonymousClass3 */

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onSuccess(boolean z) {
            Log.e("mhs", "Is se MHS Allowed == " + z);
            UsbDetailsFunctionsController.this.dismissDialog();
            if (z) {
                UsbDetailsFunctionsController.this.mConnectivityManager.startTethering(1, true, UsbDetailsFunctionsController.this.mOnStartTetheringCallback);
                return;
            }
            UsbDetailsFunctionsController.this.resetSwitch();
            UsbDetailsFunctionsController.this.mobileHotspotDialog();
        }

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onError(int i, String str) {
            Log.e("mhs", "MHS se error == " + str);
            Toast.makeText(UsbDetailsFunctionsController.this.mContext, UsbDetailsFunctionsController.this.mContext.getString(C0017R$string.mhs_call_back_error), 1).show();
            UsbDetailsFunctionsController.this.dismissDialog();
            UsbDetailsFunctionsController.this.resetSwitch();
        }

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onTimeout() {
            Log.e("mhs", "MHS se time out");
            Toast.makeText(UsbDetailsFunctionsController.this.mContext, UsbDetailsFunctionsController.this.mContext.getString(C0017R$string.mhs_call_back_error), 1).show();
            UsbDetailsFunctionsController.this.dismissDialog();
            UsbDetailsFunctionsController.this.resetSwitch();
        }
    };
    private MhsAuthorizedClient mClient;
    private ConnectivityManager mConnectivityManager;
    private Context mContext;
    OnStartTetheringCallback mOnStartTetheringCallback;
    long mPreviousFunction;
    private PreferenceCategory mProfilesContainer;
    private ProgressDialog mProgressDialog;
    private RadioButtonPreference mUsbPref;
    private WifiManager mWifiManager;

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public String getPreferenceKey() {
        return "usb_details_functions";
    }

    static {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        FUNCTIONS_MAP = linkedHashMap;
        linkedHashMap.put(4L, Integer.valueOf(C0017R$string.usb_use_file_transfers));
        FUNCTIONS_MAP.put(32L, Integer.valueOf(C0017R$string.usb_use_tethering));
        FUNCTIONS_MAP.put(8L, Integer.valueOf(C0017R$string.usb_use_MIDI));
        FUNCTIONS_MAP.put(16L, Integer.valueOf(C0017R$string.usb_use_photo_transfers));
        if (ProductUtils.isUsvMode()) {
            FUNCTIONS_MAP.put(128L, Integer.valueOf(C0017R$string.system_update));
        }
        FUNCTIONS_MAP.put(0L, Integer.valueOf(C0017R$string.usb_use_charging_only));
    }

    public UsbDetailsFunctionsController(Context context, UsbDetailsFragment usbDetailsFragment, UsbBackend usbBackend) {
        super(context, usbDetailsFragment, usbBackend);
        this.mContext = context;
        this.mWifiManager = (WifiManager) context.getSystemService("wifi");
        this.mConnectivityManager = (ConnectivityManager) context.getSystemService(ConnectivityManager.class);
        this.mOnStartTetheringCallback = new OnStartTetheringCallback();
        this.mPreviousFunction = this.mUsbBackend.getCurrentFunctions();
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        this.mProfilesContainer = (PreferenceCategory) preferenceScreen.findPreference(getPreferenceKey());
    }

    private RadioButtonPreference getProfilePreference(String str, int i) {
        RadioButtonPreference radioButtonPreference = (RadioButtonPreference) this.mProfilesContainer.findPreference(str);
        if (radioButtonPreference != null) {
            return radioButtonPreference;
        }
        RadioButtonPreference radioButtonPreference2 = new RadioButtonPreference(this.mProfilesContainer.getContext());
        radioButtonPreference2.setKey(str);
        radioButtonPreference2.setTitle(i);
        radioButtonPreference2.setOnClickListener(this);
        this.mProfilesContainer.addPreference(radioButtonPreference2);
        return radioButtonPreference2;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.connecteddevice.usb.UsbDetailsController
    public void refresh(boolean z, long j, int i, int i2) {
        if (z) {
            this.mProfilesContainer.setEnabled(true);
        } else {
            this.mProfilesContainer.setEnabled(false);
        }
        for (Long l : FUNCTIONS_MAP.keySet()) {
            long longValue = l.longValue();
            RadioButtonPreference profilePreference = getProfilePreference(UsbBackend.usbFunctionsToString(longValue), FUNCTIONS_MAP.get(Long.valueOf(longValue)).intValue());
            if (this.mUsbBackend.areFunctionsSupported(longValue)) {
                profilePreference.setChecked(j == longValue);
            } else {
                this.mProfilesContainer.removePreference(profilePreference);
            }
            String str = SystemProperties.get("sys.debug.watchdog");
            int i3 = SystemProperties.getInt("ro.boot.qe", 0);
            if ("true".equals(str) || 1 == i3) {
                profilePreference.setEnabled(false);
            }
        }
    }

    @Override // com.android.settings.widget.RadioButtonPreference.OnClickListener
    public void onRadioButtonClicked(final RadioButtonPreference radioButtonPreference) {
        long usbFunctionsFromString = UsbBackend.usbFunctionsFromString(radioButtonPreference.getKey());
        long currentFunctions = this.mUsbBackend.getCurrentFunctions();
        if (usbFunctionsFromString != currentFunctions && !Utils.isMonkeyRunning()) {
            this.mPreviousFunction = currentFunctions;
            final RadioButtonPreference radioButtonPreference2 = (RadioButtonPreference) this.mProfilesContainer.findPreference(UsbBackend.usbFunctionsToString(currentFunctions));
            if (radioButtonPreference2 != null) {
                radioButtonPreference2.setChecked(false);
                radioButtonPreference.setChecked(true);
            }
            if (usbFunctionsFromString == 32) {
                this.mProgressDialog = new ProgressDialog(this.mContext);
                this.mUsbPref = radioButtonPreference;
                if (!ProductUtils.isUsvMode() || !this.mWifiManager.isWifiEnabled()) {
                    if (radioButtonPreference2 != null) {
                        radioButtonPreference2.setChecked(false);
                        radioButtonPreference.setChecked(true);
                    }
                    if (!WifiTetherSwitchBarController.isVerizon() || this.mProgressDialog == null) {
                        this.mConnectivityManager.startTethering(1, true, this.mOnStartTetheringCallback);
                    } else {
                        startVzwTethering(25000);
                    }
                } else if (this.mContext.getSharedPreferences("tether_settings_prefs", 0).getString("checkbox_status", "unchecked").equals("checked")) {
                    if (radioButtonPreference2 != null) {
                        radioButtonPreference2.setChecked(false);
                        radioButtonPreference.setChecked(true);
                    }
                    this.mWifiManager.setWifiEnabled(false);
                    if (!WifiTetherSwitchBarController.isVerizon() || this.mProgressDialog == null) {
                        this.mConnectivityManager.startTethering(1, true, this.mOnStartTetheringCallback);
                    } else {
                        startVzwTethering(25000);
                    }
                } else {
                    AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
                    View inflate = LayoutInflater.from(this.mContext).inflate(C0012R$layout.dialog_checkbox, (ViewGroup) null);
                    final CheckBox checkBox = (CheckBox) inflate.findViewById(C0010R$id.dialogCheckbox);
                    builder.setView(inflate);
                    builder.setCancelable(false);
                    builder.setMessage(C0017R$string.dialog_usb_tether_title);
                    builder.setNegativeButton(C0017R$string.dialog_usb_tether_cancel, new DialogInterface.OnClickListener() {
                        /* class com.android.settings.connecteddevice.usb.UsbDetailsFunctionsController.AnonymousClass1 */

                        public void onClick(DialogInterface dialogInterface, int i) {
                            String str = checkBox.isChecked() ? "checked" : "unchecked";
                            SharedPreferences.Editor edit = UsbDetailsFunctionsController.this.mContext.getSharedPreferences("tether_settings_prefs", 0).edit();
                            edit.putString("checkbox_status", str);
                            edit.commit();
                            RadioButtonPreference radioButtonPreference = radioButtonPreference2;
                            if (radioButtonPreference != null) {
                                radioButtonPreference.setChecked(true);
                                radioButtonPreference.setChecked(false);
                            }
                            dialogInterface.dismiss();
                        }
                    });
                    builder.setPositiveButton(C0017R$string.dialog_usb_tether_ok, new DialogInterface.OnClickListener() {
                        /* class com.android.settings.connecteddevice.usb.UsbDetailsFunctionsController.AnonymousClass2 */

                        public void onClick(DialogInterface dialogInterface, int i) {
                            String str = checkBox.isChecked() ? "checked" : "unchecked";
                            SharedPreferences.Editor edit = UsbDetailsFunctionsController.this.mContext.getSharedPreferences("tether_settings_prefs", 0).edit();
                            edit.putString("checkbox_status", str);
                            edit.commit();
                            UsbDetailsFunctionsController.this.mWifiManager.setWifiEnabled(false);
                            RadioButtonPreference radioButtonPreference = radioButtonPreference2;
                            if (radioButtonPreference != null) {
                                radioButtonPreference.setChecked(false);
                                radioButtonPreference.setChecked(true);
                            }
                            if (!WifiTetherSwitchBarController.isVerizon() || UsbDetailsFunctionsController.this.mProgressDialog == null) {
                                UsbDetailsFunctionsController.this.mConnectivityManager.startTethering(1, true, UsbDetailsFunctionsController.this.mOnStartTetheringCallback);
                            } else {
                                UsbDetailsFunctionsController.this.startVzwTethering(25000);
                            }
                        }
                    });
                    builder.create();
                    builder.show();
                }
            } else {
                this.mUsbBackend.setCurrentFunctions(usbFunctionsFromString);
            }
        }
    }

    @Override // com.android.settings.connecteddevice.usb.UsbDetailsController, com.android.settingslib.core.AbstractPreferenceController
    public boolean isAvailable() {
        return !Utils.isMonkeyRunning();
    }

    final class OnStartTetheringCallback extends ConnectivityManager.OnStartTetheringCallback {
        OnStartTetheringCallback() {
        }

        public void onTetheringFailed() {
            UsbDetailsFunctionsController.super.onTetheringFailed();
            UsbDetailsFunctionsController usbDetailsFunctionsController = UsbDetailsFunctionsController.this;
            usbDetailsFunctionsController.mUsbBackend.setCurrentFunctions(usbDetailsFunctionsController.mPreviousFunction);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void resetSwitch() {
        RadioButtonPreference radioButtonPreference = (RadioButtonPreference) this.mProfilesContainer.findPreference(UsbBackend.usbFunctionsToString(this.mPreviousFunction));
        if (radioButtonPreference != null) {
            radioButtonPreference.setChecked(true);
        }
        RadioButtonPreference radioButtonPreference2 = this.mUsbPref;
        if (radioButtonPreference2 != null) {
            radioButtonPreference2.setChecked(false);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void startVzwTethering(long j) {
        Activity activity = (Activity) this.mContext;
        this.mProgressDialog.setCancelable(false);
        this.mProgressDialog.setMessage(this.mContext.getResources().getString(C0017R$string.dialog_mhs_error));
        if (activity != null && !activity.isDestroyed()) {
            this.mProgressDialog.show();
            MhsAuthorizedClient mhsAuthorizedClient = new MhsAuthorizedClient(this.mContext, this.mCallBack, Integer.valueOf(SubscriptionManager.getDefaultDataSubscriptionId()), Looper.getMainLooper());
            this.mClient = mhsAuthorizedClient;
            mhsAuthorizedClient.sendRequest(j);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void dismissDialog() {
        ProgressDialog progressDialog = this.mProgressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void mobileHotspotDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
        builder.setTitle(this.mContext.getString(C0017R$string.hotspot_tip_title));
        builder.setMessage(this.mContext.getString(C0017R$string.mobile_hotspot_authoration_error));
        builder.setNegativeButton(17039360, (DialogInterface.OnClickListener) null);
        builder.setPositiveButton(this.mContext.getString(C0017R$string.mhs_app), new DialogInterface.OnClickListener() {
            /* class com.android.settings.connecteddevice.usb.UsbDetailsFunctionsController.AnonymousClass4 */

            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
                try {
                    Uri parse = Uri.parse("https://mobile.vzw.com/hybridClient/mvm/hotspot");
                    Intent launchIntentForPackage = UsbDetailsFunctionsController.this.mContext.getPackageManager().getLaunchIntentForPackage("com.vzw.hss.myverizon");
                    if (launchIntentForPackage != null) {
                        UsbDetailsFunctionsController.this.mContext.sendBroadcast(new Intent("android.intent.action.CLOSE_SYSTEM_DIALOGS"));
                        launchIntentForPackage.setAction("android.intent.action.VIEW");
                        launchIntentForPackage.setFlags(268435456);
                        launchIntentForPackage.setData(parse);
                        UsbDetailsFunctionsController.this.mContext.startActivity(launchIntentForPackage);
                    }
                } catch (ActivityNotFoundException e) {
                    e.printStackTrace();
                }
            }
        });
        builder.create().show();
    }
}
