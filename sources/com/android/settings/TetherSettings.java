package com.android.settings;

import android.app.Activity;
import android.app.ProgressDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothPan;
import android.bluetooth.BluetoothProfile;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.EthernetManager;
import android.net.TetheringManager;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.HandlerExecutor;
import android.os.Looper;
import android.provider.SearchIndexableResource;
import android.provider.Settings;
import android.telephony.SubscriptionManager;
import android.text.TextUtils;
import android.util.FeatureFlagUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.Toast;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.FragmentActivity;
import androidx.preference.Preference;
import androidx.preference.SwitchPreference;
import com.android.settings.TetherSettings;
import com.android.settings.datausage.DataSaverBackend;
import com.android.settings.search.BaseSearchIndexProvider;
import com.android.settings.wifi.tether.TetherDataObserver;
import com.android.settings.wifi.tether.WifiTetherPreferenceController;
import com.android.settings.wifi.tether.WifiTetherSwitchBarController;
import com.android.settings.wifi.tether.utils.TetherUtils;
import com.android.settingslib.TetherUtil;
import com.oneplus.settings.SettingsBaseApplication;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.ProductUtils;
import com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public class TetherSettings extends RestrictedSettingsFragment implements DataSaverBackend.Listener, TetherDataObserver.OnTetherDataChangeCallback {
    static final String KEY_ENABLE_BLUETOOTH_TETHERING = "enable_bluetooth_tethering";
    static final String KEY_TETHER_PREFS_FOOTER = "tether_prefs_footer";
    static final String KEY_TETHER_PREFS_SCREEN = "tether_prefs_screen";
    static final String KEY_USB_TETHER_SETTINGS = "usb_tether_settings";
    static final String KEY_WIFI_TETHER = "wifi_tether";
    public static final BaseSearchIndexProvider SEARCH_INDEX_DATA_PROVIDER = new BaseSearchIndexProvider() {
        /* class com.android.settings.TetherSettings.AnonymousClass4 */

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<SearchIndexableResource> getXmlResourcesToIndex(Context context, boolean z) {
            SearchIndexableResource searchIndexableResource = new SearchIndexableResource(context);
            searchIndexableResource.xmlResId = C0019R$xml.tether_prefs;
            return Arrays.asList(searchIndexableResource);
        }

        /* access modifiers changed from: protected */
        @Override // com.android.settings.search.BaseSearchIndexProvider
        public boolean isPageSearchEnabled(Context context) {
            return !FeatureFlagUtils.isEnabled(context, "settings_tether_all_in_one");
        }

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<String> getNonIndexableKeys(Context context) {
            List<String> nonIndexableKeys = super.getNonIndexableKeys(context);
            ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(ConnectivityManager.class);
            if (!TetherUtil.isTetherAvailable(context)) {
                nonIndexableKeys.add(TetherSettings.KEY_TETHER_PREFS_SCREEN);
                nonIndexableKeys.add(TetherSettings.KEY_WIFI_TETHER);
            }
            boolean z = false;
            if (!(connectivityManager.getTetherableUsbRegexs().length != 0) || Utils.isMonkeyRunning()) {
                nonIndexableKeys.add(TetherSettings.KEY_USB_TETHER_SETTINGS);
            }
            if (connectivityManager.getTetherableBluetoothRegexs().length != 0) {
                z = true;
            }
            if (!z) {
                nonIndexableKeys.add(TetherSettings.KEY_ENABLE_BLUETOOTH_TETHERING);
            }
            if (!(!TextUtils.isEmpty(context.getResources().getString(17039904)))) {
                nonIndexableKeys.add("enable_ethernet_tethering");
            }
            return nonIndexableKeys;
        }
    };
    private static final Handler mHandler = new Handler(Looper.getMainLooper());
    private int lastTetherData = 3;
    private boolean mBluetoothEnableForTether;
    private AtomicReference<BluetoothPan> mBluetoothPan = new AtomicReference<>();
    private String[] mBluetoothRegexs;
    private SwitchPreference mBluetoothTether;
    private MhsAuthorizedClient.ICallback mCallBack = new MhsAuthorizedClient.ICallback() {
        /* class com.android.settings.TetherSettings.AnonymousClass5 */

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onSuccess(boolean z) {
            Log.i("mhs", "Is se MHS Allowed == " + z);
            TetherSettings.this.dismissDialog();
            if (z) {
                TetherSettings tetherSettings = TetherSettings.this;
                tetherSettings.startTethering(tetherSettings.mChoiceItem);
                return;
            }
            TetherSettings.this.resetSwitch();
            TetherSettings.this.mobileHotspotDialog();
        }

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onError(int i, String str) {
            Log.e("mhs", "MHS se error == " + str);
            TetherSettings.this.resetSwitch();
            Toast.makeText(TetherSettings.this.getContext(), TetherSettings.this.getContext().getString(C0017R$string.mhs_call_back_error), 1).show();
            TetherSettings.this.dismissDialog();
        }

        @Override // com.verizon.loginenginesvc.clientsdk.MhsAuthorizedClient.ICallback
        public void onTimeout() {
            Log.e("mhs", "MHS se time out");
            TetherSettings.this.resetSwitch();
            Toast.makeText(TetherSettings.this.getContext(), TetherSettings.this.getContext().getString(C0017R$string.mhs_call_back_error), 1).show();
            TetherSettings.this.dismissDialog();
        }
    };
    private int mChoiceItem = -1;
    private String mChoiceItemValue;
    private SwitchPreference mChoicePreference;
    private MhsAuthorizedClient mClient;
    private ConnectivityManager mCm;
    private DataSaverBackend mDataSaverBackend;
    private boolean mDataSaverEnabled;
    private Preference mDataSaverFooter;
    private EthernetManager mEm;
    private EthernetListener mEthernetListener;
    private String mEthernetRegex;
    private SwitchPreference mEthernetTether;
    private boolean mMassStorageActive;
    private BluetoothProfile.ServiceListener mProfileServiceListener = new BluetoothProfile.ServiceListener() {
        /* class com.android.settings.TetherSettings.AnonymousClass3 */

        public void onServiceConnected(int i, BluetoothProfile bluetoothProfile) {
            TetherSettings.this.mBluetoothPan.set((BluetoothPan) bluetoothProfile);
        }

        public void onServiceDisconnected(int i) {
            TetherSettings.this.mBluetoothPan.set(null);
        }
    };
    private ProgressDialog mProgressDialog;
    private OnStartTetheringCallback mStartTetheringCallback;
    private BroadcastReceiver mTetherChangeReceiver;
    private TetherDataObserver mTetherDataObserver;
    private TetheringEventCallback mTetheringEventCallback;
    private TetheringManager mTm;
    private boolean mUnavailable;
    private boolean mUsbConnected;
    private String[] mUsbRegexs;
    private SwitchPreference mUsbTether;
    private WifiManager mWifiManager;
    private WifiTetherPreferenceController mWifiTetherPreferenceController;

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 90;
    }

    @Override // com.android.settings.datausage.DataSaverBackend.Listener
    public void onBlacklistStatusChanged(int i, boolean z) {
    }

    @Override // com.android.settings.datausage.DataSaverBackend.Listener
    public void onWhitelistStatusChanged(int i, boolean z) {
    }

    public TetherSettings() {
        super("no_config_tethering");
    }

    @Override // com.android.settings.core.InstrumentedPreferenceFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.mWifiTetherPreferenceController = new WifiTetherPreferenceController(context, getSettingsLifecycle());
    }

    @Override // com.android.settings.SettingsPreferenceFragment, com.android.settings.RestrictedSettingsFragment, androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(C0019R$xml.tether_prefs);
        DataSaverBackend dataSaverBackend = new DataSaverBackend(getContext());
        this.mDataSaverBackend = dataSaverBackend;
        this.mDataSaverEnabled = dataSaverBackend.isDataSaverEnabled();
        this.mDataSaverFooter = findPreference("disabled_on_data_saver");
        setIfOnlyAvailableForAdmins(true);
        if (isUiRestricted()) {
            this.mUnavailable = true;
            getPreferenceScreen().removeAll();
            return;
        }
        getActivity();
        BluetoothAdapter defaultAdapter = BluetoothAdapter.getDefaultAdapter();
        if (defaultAdapter != null && defaultAdapter.getState() == 12) {
            defaultAdapter.getProfileProxy(SettingsBaseApplication.getContext(), this.mProfileServiceListener, 5);
        }
        this.mUsbTether = (SwitchPreference) findPreference(KEY_USB_TETHER_SETTINGS);
        this.mBluetoothTether = (SwitchPreference) findPreference(KEY_ENABLE_BLUETOOTH_TETHERING);
        this.mEthernetTether = (SwitchPreference) findPreference("enable_ethernet_tethering");
        setFooterPreferenceTitle();
        this.mDataSaverBackend.addListener(this);
        this.mCm = (ConnectivityManager) getSystemService("connectivity");
        this.mEm = (EthernetManager) getSystemService("ethernet");
        this.mTm = (TetheringManager) getSystemService("tethering");
        this.mUsbRegexs = this.mCm.getTetherableUsbRegexs();
        this.mBluetoothRegexs = this.mCm.getTetherableBluetoothRegexs();
        this.mEthernetRegex = getContext().getResources().getString(17039904);
        boolean z = this.mUsbRegexs.length != 0;
        boolean z2 = (defaultAdapter == null || this.mBluetoothRegexs.length == 0) ? false : true;
        boolean z3 = !TextUtils.isEmpty(this.mEthernetRegex);
        if (!z || Utils.isMonkeyRunning()) {
            getPreferenceScreen().removePreference(this.mUsbTether);
        }
        this.mWifiTetherPreferenceController.displayPreference(getPreferenceScreen());
        if (!z2) {
            getPreferenceScreen().removePreference(this.mBluetoothTether);
        } else {
            BluetoothPan bluetoothPan = this.mBluetoothPan.get();
            if (bluetoothPan == null || !bluetoothPan.isTetheringOn()) {
                this.mBluetoothTether.setChecked(false);
            } else {
                this.mBluetoothTether.setChecked(true);
            }
        }
        if (!z3) {
            getPreferenceScreen().removePreference(this.mEthernetTether);
        }
        onDataSaverChanged(this.mDataSaverBackend.isDataSaverEnabled());
        this.mWifiManager = (WifiManager) getContext().getSystemService("wifi");
        this.mProgressDialog = new ProgressDialog(getContext());
    }

    @Override // com.android.settings.RestrictedSettingsFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onDestroy() {
        this.mDataSaverBackend.remListener(this);
        BluetoothAdapter defaultAdapter = BluetoothAdapter.getDefaultAdapter();
        BluetoothProfile bluetoothProfile = (BluetoothProfile) this.mBluetoothPan.getAndSet(null);
        if (!(bluetoothProfile == null || defaultAdapter == null)) {
            defaultAdapter.closeProfileProxy(5, bluetoothProfile);
        }
        super.onDestroy();
    }

    @Override // com.android.settings.datausage.DataSaverBackend.Listener
    public void onDataSaverChanged(boolean z) {
        this.mDataSaverEnabled = z;
        this.mUsbTether.setEnabled(!z);
        this.mBluetoothTether.setEnabled(!this.mDataSaverEnabled);
        this.mEthernetTether.setEnabled(!this.mDataSaverEnabled);
        this.mDataSaverFooter.setVisible(this.mDataSaverEnabled);
    }

    /* access modifiers changed from: package-private */
    public void setFooterPreferenceTitle() {
        Preference findPreference = findPreference(KEY_TETHER_PREFS_FOOTER);
        if (((WifiManager) getContext().getSystemService("wifi")).isStaApConcurrencySupported()) {
            findPreference.setSummary(C0017R$string.tethering_footer_info_sta_ap_concurrency);
        } else {
            findPreference.setSummary(C0017R$string.tethering_footer_info);
        }
    }

    private class TetherChangeReceiver extends BroadcastReceiver {
        private TetherChangeReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            BluetoothAdapter defaultAdapter;
            BluetoothAdapter defaultAdapter2;
            String action = intent.getAction();
            if (action.equals("android.net.conn.TETHER_STATE_CHANGED")) {
                ArrayList<String> stringArrayListExtra = intent.getStringArrayListExtra("availableArray");
                ArrayList<String> stringArrayListExtra2 = intent.getStringArrayListExtra("tetherArray");
                ArrayList<String> stringArrayListExtra3 = intent.getStringArrayListExtra("erroredArray");
                TetherSettings.this.updateState((String[]) stringArrayListExtra.toArray(new String[stringArrayListExtra.size()]), (String[]) stringArrayListExtra2.toArray(new String[stringArrayListExtra2.size()]), (String[]) stringArrayListExtra3.toArray(new String[stringArrayListExtra3.size()]));
            } else if (action.equals("android.intent.action.MEDIA_SHARED")) {
                TetherSettings.this.mMassStorageActive = true;
                TetherSettings.this.updateState();
            } else if (action.equals("android.intent.action.MEDIA_UNSHARED")) {
                TetherSettings.this.mMassStorageActive = false;
                TetherSettings.this.updateState();
            } else if (action.equals("android.hardware.usb.action.USB_STATE")) {
                TetherSettings.this.mUsbConnected = intent.getBooleanExtra("connected", false);
                TetherSettings.this.updateState();
            } else if (action.equals("android.bluetooth.adapter.action.STATE_CHANGED")) {
                int intExtra = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE);
                if (TetherSettings.this.mBluetoothEnableForTether) {
                    if (intExtra == Integer.MIN_VALUE || intExtra == 10) {
                        TetherSettings.this.mBluetoothEnableForTether = false;
                    } else if (intExtra == 12) {
                        if (!OPUtils.isSupportUss()) {
                            TetherSettings.this.startTethering(2);
                        } else {
                            TetherSettings tetherSettings = TetherSettings.this;
                            tetherSettings.startUssTethering(tetherSettings.mBluetoothTether, 2);
                        }
                        TetherSettings.this.mBluetoothEnableForTether = false;
                        if (TetherSettings.this.mBluetoothPan.get() == null && (defaultAdapter2 = BluetoothAdapter.getDefaultAdapter()) != null) {
                            defaultAdapter2.getProfileProxy(SettingsBaseApplication.getContext(), TetherSettings.this.mProfileServiceListener, 5);
                        }
                    }
                } else if (intExtra == 12 && TetherSettings.this.mBluetoothPan.get() == null && (defaultAdapter = BluetoothAdapter.getDefaultAdapter()) != null) {
                    defaultAdapter.getProfileProxy(SettingsBaseApplication.getContext(), TetherSettings.this.mProfileServiceListener, 5);
                }
                TetherSettings.this.updateState();
            } else if (action.equals("android.intent.action.setupDataError_tether")) {
                Log.d("TetheringSettings", "onReceive tether error braodcast");
                if (intent.getBooleanExtra("data_call_error", false) && intent.getIntExtra("data_call_code", 0) == 67) {
                    TetherSettings.this.tetherError(2);
                    TetherSettings.this.stopTethering();
                }
            } else if (action.equals("android.intent.action.SIM_STATE_CHANGED")) {
                TetherSettings.this.updateSimStatus(TetherUtils.isSimStatusChange(context));
            }
        }
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onStart() {
        super.onStart();
        if (this.mUnavailable) {
            if (!isUiRestrictedByOnlyAdmin()) {
                getEmptyTextView().setText(C0017R$string.tethering_settings_not_available);
            }
            getPreferenceScreen().removeAll();
            return;
        }
        FragmentActivity activity = getActivity();
        this.mStartTetheringCallback = new OnStartTetheringCallback(this);
        try {
            this.mTetheringEventCallback = new TetheringEventCallback();
            this.mTm.registerTetheringEventCallback(new HandlerExecutor(mHandler), this.mTetheringEventCallback);
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.mMassStorageActive = "shared".equals(Environment.getExternalStorageState());
        this.mTetherChangeReceiver = new TetherChangeReceiver();
        Intent registerReceiver = activity.registerReceiver(this.mTetherChangeReceiver, new IntentFilter("android.net.conn.TETHER_STATE_CHANGED"));
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.hardware.usb.action.USB_STATE");
        activity.registerReceiver(this.mTetherChangeReceiver, intentFilter);
        IntentFilter intentFilter2 = new IntentFilter();
        intentFilter2.addAction("android.intent.action.MEDIA_SHARED");
        intentFilter2.addAction("android.intent.action.MEDIA_UNSHARED");
        intentFilter2.addDataScheme("file");
        activity.registerReceiver(this.mTetherChangeReceiver, intentFilter2);
        IntentFilter intentFilter3 = new IntentFilter();
        intentFilter3.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        activity.registerReceiver(this.mTetherChangeReceiver, intentFilter3);
        if (OPUtils.isSupportUss()) {
            IntentFilter intentFilter4 = new IntentFilter();
            intentFilter4.addAction("android.intent.action.setupDataError_tether");
            intentFilter4.addAction("android.intent.action.SIM_STATE_CHANGED");
            activity.registerReceiver(this.mTetherChangeReceiver, intentFilter4);
        }
        if (registerReceiver != null) {
            this.mTetherChangeReceiver.onReceive(activity, registerReceiver);
        }
        EthernetListener ethernetListener = new EthernetListener();
        this.mEthernetListener = ethernetListener;
        EthernetManager ethernetManager = this.mEm;
        if (ethernetManager != null) {
            ethernetManager.addListener(ethernetListener);
        }
        updateState();
        if (OPUtils.isSupportUss() && getContentResolver() != null) {
            checkTetherData();
            this.mTetherDataObserver = new TetherDataObserver(this);
            getContentResolver().registerContentObserver(Settings.Global.getUriFor("TetheredData"), true, this.mTetherDataObserver);
        }
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onStop() {
        super.onStop();
        if (!this.mUnavailable) {
            getActivity().unregisterReceiver(this.mTetherChangeReceiver);
            this.mTm.unregisterTetheringEventCallback(this.mTetheringEventCallback);
            EthernetManager ethernetManager = this.mEm;
            if (ethernetManager != null) {
                ethernetManager.removeListener(this.mEthernetListener);
            }
            this.mTetherChangeReceiver = null;
            this.mStartTetheringCallback = null;
            this.mTetheringEventCallback = null;
            this.mEthernetListener = null;
            if (!(!OPUtils.isSupportUss() || this.mTetherDataObserver == null || getContentResolver() == null)) {
                getContentResolver().unregisterContentObserver(this.mTetherDataObserver);
                this.mTetherDataObserver = null;
            }
            if (ProductUtils.isUsvMode()) {
                MhsAuthorizedClient mhsAuthorizedClient = this.mClient;
                if (mhsAuthorizedClient != null) {
                    mhsAuthorizedClient.cancelRequest();
                }
                ProgressDialog progressDialog = this.mProgressDialog;
                if (progressDialog != null) {
                    progressDialog.dismiss();
                }
            }
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    public void updateState() {
        updateState(this.mCm.getTetherableIfaces(), this.mCm.getTetheredIfaces(), this.mCm.getTetheringErroredIfaces());
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateState(String[] strArr, String[] strArr2, String[] strArr3) {
        updateUsbState(strArr, strArr2, strArr3);
        updateBluetoothState();
        updateEthernetState(strArr, strArr2);
    }

    private void updateUsbState(String[] strArr, String[] strArr2, String[] strArr3) {
        boolean z = this.mUsbConnected && !this.mMassStorageActive;
        int i = 0;
        for (String str : strArr) {
            for (String str2 : this.mUsbRegexs) {
                if (str.matches(str2) && i == 0) {
                    i = this.mCm.getLastTetherError(str);
                }
            }
        }
        boolean z2 = false;
        for (String str3 : strArr2) {
            for (String str4 : this.mUsbRegexs) {
                if (str3.matches(str4)) {
                    z2 = true;
                }
            }
        }
        for (String str5 : strArr3) {
            for (String str6 : this.mUsbRegexs) {
                str5.matches(str6);
            }
        }
        if (z2) {
            this.mUsbTether.setEnabled(!this.mDataSaverEnabled);
            this.mUsbTether.setChecked(true);
        } else if (z) {
            this.mUsbTether.setEnabled(!this.mDataSaverEnabled);
            this.mUsbTether.setChecked(false);
        } else {
            this.mUsbTether.setEnabled(false);
            this.mUsbTether.setChecked(false);
        }
    }

    private void updateBluetoothState() {
        BluetoothAdapter defaultAdapter = BluetoothAdapter.getDefaultAdapter();
        if (defaultAdapter != null) {
            int state = defaultAdapter.getState();
            if (state == 13) {
                this.mBluetoothTether.setEnabled(false);
            } else if (state == 11) {
                this.mBluetoothTether.setEnabled(false);
            } else {
                BluetoothPan bluetoothPan = this.mBluetoothPan.get();
                if (state != 12 || bluetoothPan == null || !bluetoothPan.isTetheringOn()) {
                    this.mBluetoothTether.setEnabled(!this.mDataSaverEnabled);
                    this.mBluetoothTether.setChecked(false);
                    return;
                }
                this.mBluetoothTether.setChecked(true);
                this.mBluetoothTether.setEnabled(!this.mDataSaverEnabled);
            }
        }
    }

    private void updateEthernetState(String[] strArr, String[] strArr2) {
        EthernetManager ethernetManager;
        boolean z = false;
        for (String str : strArr) {
            if (str.matches(this.mEthernetRegex)) {
                z = true;
            }
        }
        boolean z2 = false;
        for (String str2 : strArr2) {
            if (str2.matches(this.mEthernetRegex)) {
                z2 = true;
            }
        }
        if (z2) {
            this.mEthernetTether.setEnabled(!this.mDataSaverEnabled);
            this.mEthernetTether.setChecked(true);
        } else if (z || ((ethernetManager = this.mEm) != null && ethernetManager.isAvailable())) {
            this.mEthernetTether.setEnabled(!this.mDataSaverEnabled);
            this.mEthernetTether.setChecked(false);
        } else {
            this.mEthernetTether.setEnabled(false);
            this.mEthernetTether.setChecked(false);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void startTethering(int i) {
        if (i == 2) {
            BluetoothAdapter defaultAdapter = BluetoothAdapter.getDefaultAdapter();
            if (defaultAdapter.getState() == 10) {
                this.mBluetoothEnableForTether = true;
                defaultAdapter.enable();
                this.mBluetoothTether.setEnabled(false);
                return;
            }
        }
        this.mCm.startTethering(i, true, this.mStartTetheringCallback, mHandler);
    }

    @Override // androidx.preference.PreferenceFragmentCompat, com.android.settings.core.InstrumentedPreferenceFragment, androidx.preference.PreferenceManager.OnPreferenceTreeClickListener
    public boolean onPreferenceTreeClick(Preference preference) {
        if (!ProductUtils.isUsvMode() || this.mCm.getMobileDataEnabled()) {
            if (preference != this.mUsbTether) {
                SwitchPreference switchPreference = this.mBluetoothTether;
                if (preference != switchPreference) {
                    SwitchPreference switchPreference2 = this.mEthernetTether;
                    if (preference == switchPreference2) {
                        if (!switchPreference2.isChecked()) {
                            this.mCm.stopTethering(5);
                        } else if (!WifiTetherSwitchBarController.isVerizon() || this.mProgressDialog == null) {
                            startTethering(5);
                        } else {
                            startVzwTethering(5, 25000);
                        }
                    }
                } else if (!switchPreference.isChecked()) {
                    this.mCm.stopTethering(2);
                } else if (OPUtils.isSupportUss()) {
                    startUssTethering(this.mBluetoothTether, 2);
                } else if (!WifiTetherSwitchBarController.isVerizon() || this.mProgressDialog == null) {
                    startTethering(2);
                } else {
                    startVzwTethering(2, 25000);
                }
            } else if (ProductUtils.isUsvMode()) {
                if (this.mWifiManager.isWifiEnabled()) {
                    String string = getContext().getSharedPreferences("tether_settings_prefs", 0).getString("checkbox_status", "unchecked");
                    if (!string.equals("checked")) {
                        this.mUsbTether.setChecked(false);
                        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
                        View inflate = LayoutInflater.from(getActivity()).inflate(C0012R$layout.dialog_checkbox, (ViewGroup) null);
                        final CheckBox checkBox = (CheckBox) inflate.findViewById(C0010R$id.dialogCheckbox);
                        builder.setView(inflate);
                        builder.setMessage(C0017R$string.dialog_usb_tether_title);
                        builder.setNegativeButton(C0017R$string.dialog_usb_tether_cancel, new DialogInterface.OnClickListener() {
                            /* class com.android.settings.TetherSettings.AnonymousClass1 */

                            public void onClick(DialogInterface dialogInterface, int i) {
                                String str = checkBox.isChecked() ? "checked" : "unchecked";
                                SharedPreferences.Editor edit = TetherSettings.this.getContext().getSharedPreferences("tether_settings_prefs", 0).edit();
                                edit.putString("checkbox_status", str);
                                edit.commit();
                                dialogInterface.dismiss();
                            }
                        });
                        builder.setPositiveButton(C0017R$string.dialog_usb_tether_ok, new DialogInterface.OnClickListener() {
                            /* class com.android.settings.TetherSettings.AnonymousClass2 */

                            public void onClick(DialogInterface dialogInterface, int i) {
                                String str = checkBox.isChecked() ? "checked" : "unchecked";
                                SharedPreferences.Editor edit = TetherSettings.this.getContext().getSharedPreferences("tether_settings_prefs", 0).edit();
                                edit.putString("checkbox_status", str);
                                edit.commit();
                                TetherSettings.this.mUsbTether.setChecked(true);
                                TetherSettings.this.mWifiManager.setWifiEnabled(false);
                                if (OPUtils.isSupportUss()) {
                                    TetherSettings tetherSettings = TetherSettings.this;
                                    tetherSettings.startUssTethering(tetherSettings.mUsbTether, 1);
                                } else if (!WifiTetherSwitchBarController.isVerizon() || TetherSettings.this.mProgressDialog == null) {
                                    TetherSettings.this.startTethering(1);
                                } else {
                                    TetherSettings.this.startVzwTethering(1, 25000);
                                }
                            }
                        });
                        builder.create();
                        if (!string.equals("checked")) {
                            builder.show();
                        }
                    } else if (this.mUsbTether.isChecked()) {
                        if (OPUtils.isSupportUss()) {
                            startUssTethering(this.mUsbTether, 1);
                        } else if (!WifiTetherSwitchBarController.isVerizon() || this.mProgressDialog == null) {
                            startTethering(1);
                        } else {
                            startVzwTethering(1, 25000);
                        }
                        this.mWifiManager.setWifiEnabled(false);
                    } else {
                        this.mCm.stopTethering(1);
                    }
                } else if (!this.mUsbTether.isChecked()) {
                    this.mCm.stopTethering(1);
                } else if (OPUtils.isSupportUss()) {
                    startUssTethering(this.mUsbTether, 1);
                } else if (!WifiTetherSwitchBarController.isVerizon() || this.mProgressDialog == null) {
                    startTethering(1);
                } else {
                    startVzwTethering(1, 25000);
                }
            } else if (!this.mUsbTether.isChecked()) {
                this.mCm.stopTethering(1);
            } else if (!OPUtils.isSupportUss()) {
                startTethering(1);
            } else {
                startUssTethering(this.mUsbTether, 1);
            }
            return super.onPreferenceTreeClick(preference);
        }
        SwitchPreference switchPreference3 = this.mUsbTether;
        if (preference == switchPreference3) {
            switchPreference3.setChecked(false);
            TetherUtils.showTertheringErrorDialog(getContext(), getContext().getString(C0017R$string.hotspot_tip_title), getContext().getString(C0017R$string.mobile_hotspot_data_off_error));
            return false;
        }
        SwitchPreference switchPreference4 = this.mBluetoothTether;
        if (preference == switchPreference4) {
            switchPreference4.setChecked(false);
            TetherUtils.showTertheringErrorDialog(getContext(), getContext().getString(C0017R$string.hotspot_tip_title), getContext().getString(C0017R$string.mobile_hotspot_data_off_error));
            return false;
        }
        SwitchPreference switchPreference5 = this.mEthernetTether;
        if (preference != switchPreference5) {
            return super.onPreferenceTreeClick(preference);
        }
        switchPreference5.setChecked(false);
        TetherUtils.showTertheringErrorDialog(getContext(), getContext().getString(C0017R$string.hotspot_tip_title), getContext().getString(C0017R$string.mobile_hotspot_data_off_error));
        return false;
    }

    @Override // com.android.settings.support.actionbar.HelpResourceProvider
    public int getHelpResource() {
        return C0017R$string.help_url_tether;
    }

    /* access modifiers changed from: private */
    public static final class OnStartTetheringCallback extends ConnectivityManager.OnStartTetheringCallback {
        final WeakReference<TetherSettings> mTetherSettings;

        OnStartTetheringCallback(TetherSettings tetherSettings) {
            this.mTetherSettings = new WeakReference<>(tetherSettings);
        }

        public void onTetheringStarted() {
            update();
        }

        public void onTetheringFailed() {
            update();
        }

        private void update() {
            TetherSettings tetherSettings = this.mTetherSettings.get();
            if (tetherSettings != null) {
                tetherSettings.updateState();
            }
        }
    }

    private final class TetheringEventCallback implements TetheringManager.TetheringEventCallback {
        private TetheringEventCallback() {
        }

        public void onTetheredInterfacesChanged(List<String> list) {
            TetherSettings.this.updateState();
        }
    }

    /* access modifiers changed from: private */
    public final class EthernetListener implements EthernetManager.Listener {
        private EthernetListener() {
        }

        public void onAvailabilityChanged(String str, boolean z) {
            TetherSettings.mHandler.post(new Runnable() {
                /* class com.android.settings.$$Lambda$TetherSettings$EthernetListener$h2_T0AJJu00WYdLgLWHNeRaOLw */

                public final void run() {
                    TetherSettings.EthernetListener.lambda$onAvailabilityChanged$0(TetherSettings.this);
                }
            });
        }
    }

    private void checkTetherData() {
        int tetherData;
        if (OPUtils.isSupportUss() && this.lastTetherData != (tetherData = TetherUtils.getTetherData(getPrefContext()))) {
            this.lastTetherData = tetherData;
            if (tetherData == 1) {
                finish();
            } else if (tetherData == 2) {
                if (this.mCm != null) {
                    SwitchPreference switchPreference = this.mBluetoothTether;
                    if (switchPreference != null && switchPreference.isChecked()) {
                        this.mCm.stopTethering(2);
                    }
                    SwitchPreference switchPreference2 = this.mUsbTether;
                    if (switchPreference2 != null && switchPreference2.isChecked()) {
                        this.mCm.stopTethering(1);
                    }
                }
                if (getPreferenceScreen() != null) {
                    if (this.mUsbTether != null) {
                        getPreferenceScreen().removePreference(this.mUsbTether);
                    }
                    if (this.mBluetoothTether != null) {
                        getPreferenceScreen().removePreference(this.mBluetoothTether);
                    }
                }
            } else if (tetherData == 3) {
                if (this.mUsbTether != null) {
                    getPreferenceScreen().addPreference(this.mUsbTether);
                }
                if (this.mBluetoothTether != null) {
                    getPreferenceScreen().addPreference(this.mBluetoothTether);
                }
            }
        }
    }

    @Override // com.android.settings.wifi.tether.TetherDataObserver.OnTetherDataChangeCallback
    public void onTetherDataChange() {
        checkTetherData();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void startUssTethering(SwitchPreference switchPreference, int i) {
        this.mChoicePreference = switchPreference;
        this.mChoiceItem = i;
        if (!TetherUtils.isNoSimCard(getContext())) {
            if (i == 1) {
                this.mChoiceItemValue = getPrefContext().getString(C0017R$string.usb_tethering_button_text);
            } else {
                this.mChoiceItemValue = getPrefContext().getString(C0017R$string.bluetooth_tether_checkbox_text);
            }
            if (TetherUtils.isHaveProfile(getPrefContext())) {
                startTethering(i);
            } else {
                tetherError(2);
            }
        } else {
            tetherError(1);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void tetherError(int i) {
        if (i == 1) {
            TetherUtils.showTertheringErrorDialog(getContext(), getPrefContext().getString(C0017R$string.tether_no_sim_title), getPrefContext().getString(C0017R$string.tether_no_sim_message));
            SwitchPreference switchPreference = this.mChoicePreference;
            if (switchPreference != null) {
                switchPreference.setChecked(false);
                this.mChoicePreference.setEnabled(false);
            }
        } else if (i == 2) {
            String str = this.mChoiceItemValue;
            if (str == null || str.isEmpty()) {
                this.mChoiceItemValue = getPrefContext().getString(C0017R$string.tether_error_item_default);
            }
            TetherUtils.showTertheringErrorDialog(getContext(), getPrefContext().getString(C0017R$string.tether_error_title, this.mChoiceItemValue), getPrefContext().getString(C0017R$string.tether_error_message, this.mChoiceItemValue));
            SwitchPreference switchPreference2 = this.mChoicePreference;
            if (switchPreference2 != null) {
                switchPreference2.setChecked(false);
            }
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void stopTethering() {
        SwitchPreference switchPreference;
        if (this.mCm != null && this.mChoiceItem >= 0 && (switchPreference = this.mChoicePreference) != null && switchPreference.isChecked()) {
            int i = this.mChoiceItem;
            if (i == 1) {
                this.mCm.stopTethering(1);
            } else if (i == 2) {
                this.mCm.stopTethering(2);
            }
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateSimStatus(boolean z) {
        if (z) {
            boolean z2 = this.mUsbConnected && !this.mMassStorageActive;
            SwitchPreference switchPreference = this.mUsbTether;
            if (switchPreference != null && z2) {
                switchPreference.setEnabled(true);
            }
            SwitchPreference switchPreference2 = this.mBluetoothTether;
            if (switchPreference2 != null) {
                switchPreference2.setEnabled(true);
            }
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
    private void resetSwitch() {
        int i = this.mChoiceItem;
        if (i == 1) {
            this.mUsbTether.setChecked(false);
        } else if (i == 2) {
            this.mBluetoothTether.setChecked(false);
        } else if (i == 5) {
            this.mEthernetTether.setChecked(false);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void startVzwTethering(int i, long j) {
        Activity activity = (Activity) getContext();
        this.mProgressDialog.setCancelable(false);
        this.mProgressDialog.setMessage(getContext().getResources().getString(C0017R$string.dialog_mhs_error));
        if (activity != null && !activity.isDestroyed()) {
            this.mProgressDialog.show();
            MhsAuthorizedClient mhsAuthorizedClient = new MhsAuthorizedClient(getContext(), this.mCallBack, Integer.valueOf(SubscriptionManager.getDefaultDataSubscriptionId()), Looper.getMainLooper());
            this.mClient = mhsAuthorizedClient;
            mhsAuthorizedClient.sendRequest(j);
            this.mChoiceItem = i;
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void mobileHotspotDialog() {
        final Context context = getContext();
        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle(context.getString(C0017R$string.hotspot_tip_title));
        builder.setMessage(context.getString(C0017R$string.mobile_hotspot_authoration_error));
        builder.setNegativeButton(17039360, (DialogInterface.OnClickListener) null);
        builder.setPositiveButton(context.getString(C0017R$string.mhs_app), new DialogInterface.OnClickListener(this) {
            /* class com.android.settings.TetherSettings.AnonymousClass6 */

            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
                try {
                    Uri parse = Uri.parse("https://mobile.vzw.com/hybridClient/mvm/hotspot");
                    Intent launchIntentForPackage = context.getPackageManager().getLaunchIntentForPackage("com.vzw.hss.myverizon");
                    if (launchIntentForPackage != null) {
                        context.sendBroadcast(new Intent("android.intent.action.CLOSE_SYSTEM_DIALOGS"));
                        launchIntentForPackage.setAction("android.intent.action.VIEW");
                        launchIntentForPackage.setFlags(268435456);
                        launchIntentForPackage.setData(parse);
                        context.startActivity(launchIntentForPackage);
                    }
                } catch (ActivityNotFoundException e) {
                    e.printStackTrace();
                }
            }
        });
        builder.create().show();
    }
}
