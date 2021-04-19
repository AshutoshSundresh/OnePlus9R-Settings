package com.android.settings.wifi.tether;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.wifi.SoftApCapability;
import android.net.wifi.SoftApConfiguration;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.os.HandlerExecutor;
import android.util.FeatureFlagUtils;
import android.util.Log;
import android.util.OpFeatures;
import androidx.appcompat.app.AlertDialog;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import com.android.settings.C0017R$string;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settings.wifi.dpp.WifiDppUtils;
import com.android.settings.wifi.tether.WifiTetherBasePreferenceController;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.ProductUtils;
import java.util.ArrayList;

public class WifiTetherSecurityPreferenceController extends WifiTetherBasePreferenceController {
    private static final String PREF_KEY = "wifi_tether_security";
    private static final String TAG = "WifiTetherSecurityPreferenceController";
    final Context mContext;
    private boolean mDualSoftApSupported;
    private ListPreference mListPreference;
    private int mNewValue;
    private boolean mOweSapSupprted;
    private boolean mSaeSapSupprted;
    private boolean mSecurityCapaFetched;
    private String[] mSecurityEntries;
    private int mSecurityValue;
    private String[] mSecurityValues;
    private WifiManager.SoftApCallback mSoftApCallback = new WifiManager.SoftApCallback() {
        /* class com.android.settings.wifi.tether.WifiTetherSecurityPreferenceController.AnonymousClass1 */

        public void onCapabilityChanged(SoftApCapability softApCapability) {
            if (!WifiTetherSecurityPreferenceController.this.mSecurityCapaFetched) {
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                WifiTetherSecurityPreferenceController.this.mSecurityCapaFetched = true;
                if (softApCapability.areFeaturesSupported(4)) {
                    WifiTetherSecurityPreferenceController.this.mSaeSapSupprted = true;
                }
                if (softApCapability.areFeaturesSupported(8)) {
                    WifiTetherSecurityPreferenceController.this.mOweSapSupprted = true;
                }
                Log.d(WifiTetherSecurityPreferenceController.TAG, "mSaeSapSupprted = " + WifiTetherSecurityPreferenceController.this.mSaeSapSupprted + ", Feature is support = " + OpFeatures.isSupport(new int[]{256}));
                if (WifiTetherSecurityPreferenceController.this.mSaeSapSupprted) {
                    if (OpFeatures.isSupport(new int[]{256})) {
                        arrayList2.add(String.valueOf(3));
                        arrayList.add(WifiTetherSecurityPreferenceController.this.mContext.getString(C0017R$string.wifi_security_sae));
                    }
                }
                if (WifiTetherSecurityPreferenceController.this.mOweSapSupprted && WifiTetherSecurityPreferenceController.this.mDualSoftApSupported) {
                    if (OpFeatures.isSupport(new int[]{256}) && !OPUtils.isSupportUstMode() && !OPUtils.isSupportUss()) {
                        arrayList2.add(String.valueOf(4));
                        arrayList.add(WifiTetherSecurityPreferenceController.this.mContext.getString(C0017R$string.wifi_security_owe));
                    }
                }
                arrayList2.add(String.valueOf(1));
                arrayList.add(WifiTetherSecurityPreferenceController.this.mContext.getString(C0017R$string.wifi_security_wpa2));
                arrayList2.add(String.valueOf(0));
                if (OPUtils.isSupportUstMode()) {
                    arrayList.add(WifiTetherSecurityPreferenceController.this.mContext.getString(C0017R$string.wifi_security_open));
                } else {
                    arrayList.add(WifiTetherSecurityPreferenceController.this.mContext.getString(C0017R$string.wifi_security_none));
                }
                WifiTetherSecurityPreferenceController.this.mSecurityEntries = (String[]) arrayList.toArray(new String[arrayList.size()]);
                WifiTetherSecurityPreferenceController.this.mSecurityValues = (String[]) arrayList2.toArray(new String[arrayList2.size()]);
                WifiTetherSecurityPreferenceController.this.updateDisplay();
                Log.i(WifiTetherSecurityPreferenceController.TAG, "Updated supported SoftAp AKMs");
            }
        }
    };
    DialogInterface.OnClickListener noneDialogCLickListner = new DialogInterface.OnClickListener() {
        /* class com.android.settings.wifi.tether.WifiTetherSecurityPreferenceController.AnonymousClass2 */

        public void onClick(DialogInterface dialogInterface, int i) {
            if (i == -1) {
                if (WifiTetherSecurityPreferenceController.this.mWifiManager.isWifiApEnabled()) {
                    dialogInterface.dismiss();
                    AlertDialog.Builder builder = new AlertDialog.Builder(WifiTetherSecurityPreferenceController.this.mContext);
                    builder.setTitle(C0017R$string.save_changes);
                    builder.setMessage(C0017R$string.verizon_wifi_tether_band_warning);
                    builder.setPositiveButton(17039370, WifiTetherSecurityPreferenceController.this.onWarningDialogCLickListner);
                    builder.setNegativeButton(17039360, WifiTetherSecurityPreferenceController.this.onWarningDialogCLickListner);
                    builder.setCancelable(false);
                    builder.create().show();
                    return;
                }
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController = WifiTetherSecurityPreferenceController.this;
                wifiTetherSecurityPreferenceController.mSecurityValue = wifiTetherSecurityPreferenceController.mNewValue;
                ListPreference listPreference = WifiTetherSecurityPreferenceController.this.mListPreference;
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController2 = WifiTetherSecurityPreferenceController.this;
                listPreference.setSummary(wifiTetherSecurityPreferenceController2.getSummaryForSecurityType(wifiTetherSecurityPreferenceController2.mNewValue));
                WifiTetherSecurityPreferenceController.this.mListPreference.setValue(String.valueOf(WifiTetherSecurityPreferenceController.this.mNewValue));
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController3 = WifiTetherSecurityPreferenceController.this;
                wifiTetherSecurityPreferenceController3.mListener.onTetherConfigUpdated(wifiTetherSecurityPreferenceController3);
            } else if (i == -2) {
                WifiTetherSecurityPreferenceController.this.mListPreference.setValue(String.valueOf(WifiTetherSecurityPreferenceController.this.mSecurityValue));
            }
        }
    };
    DialogInterface.OnClickListener onClickListener = new DialogInterface.OnClickListener() {
        /* class com.android.settings.wifi.tether.WifiTetherSecurityPreferenceController.AnonymousClass4 */

        public void onClick(DialogInterface dialogInterface, int i) {
            if (WifiTetherSecurityPreferenceController.this.mListPreference == null) {
                return;
            }
            if (i == -1) {
                WifiTetherSecurityPreferenceController.this.mSecurityValue = 0;
                ListPreference listPreference = WifiTetherSecurityPreferenceController.this.mListPreference;
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController = WifiTetherSecurityPreferenceController.this;
                listPreference.setSummary(wifiTetherSecurityPreferenceController.getSummaryForSecurityType(wifiTetherSecurityPreferenceController.mSecurityValue));
                WifiTetherSecurityPreferenceController.this.mListPreference.setValue(String.valueOf(WifiTetherSecurityPreferenceController.this.mSecurityValue));
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController2 = WifiTetherSecurityPreferenceController.this;
                wifiTetherSecurityPreferenceController2.mListener.onTetherConfigUpdated(wifiTetherSecurityPreferenceController2);
            } else if (i == -2) {
                WifiTetherSecurityPreferenceController.this.mSecurityValue = 1;
                WifiTetherSecurityPreferenceController.this.mListPreference.setValue(String.valueOf(WifiTetherSecurityPreferenceController.this.mSecurityValue));
                ListPreference listPreference2 = WifiTetherSecurityPreferenceController.this.mListPreference;
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController3 = WifiTetherSecurityPreferenceController.this;
                listPreference2.setSummary(wifiTetherSecurityPreferenceController3.getSummaryForSecurityType(wifiTetherSecurityPreferenceController3.mSecurityValue));
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController4 = WifiTetherSecurityPreferenceController.this;
                wifiTetherSecurityPreferenceController4.mListener.onTetherConfigUpdated(wifiTetherSecurityPreferenceController4);
            }
        }
    };
    DialogInterface.OnClickListener onWarningDialogCLickListner = new DialogInterface.OnClickListener() {
        /* class com.android.settings.wifi.tether.WifiTetherSecurityPreferenceController.AnonymousClass3 */

        public void onClick(DialogInterface dialogInterface, int i) {
            if (i == -1) {
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController = WifiTetherSecurityPreferenceController.this;
                wifiTetherSecurityPreferenceController.mSecurityValue = wifiTetherSecurityPreferenceController.mNewValue;
                ListPreference listPreference = WifiTetherSecurityPreferenceController.this.mListPreference;
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController2 = WifiTetherSecurityPreferenceController.this;
                listPreference.setSummary(wifiTetherSecurityPreferenceController2.getSummaryForSecurityType(wifiTetherSecurityPreferenceController2.mNewValue));
                WifiTetherSecurityPreferenceController.this.mListPreference.setValue(String.valueOf(WifiTetherSecurityPreferenceController.this.mNewValue));
                WifiTetherSecurityPreferenceController wifiTetherSecurityPreferenceController3 = WifiTetherSecurityPreferenceController.this;
                wifiTetherSecurityPreferenceController3.mListener.onTetherConfigUpdated(wifiTetherSecurityPreferenceController3);
            } else if (i == -2) {
                WifiTetherSecurityPreferenceController.this.mListPreference.setValue(String.valueOf(WifiTetherSecurityPreferenceController.this.mSecurityValue));
            }
        }
    };

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController, com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController, com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ Class<? extends SliceBackgroundWorker> getBackgroundWorkerClass() {
        return super.getBackgroundWorkerClass();
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController, com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ IntentFilter getIntentFilter() {
        return super.getIntentFilter();
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController, com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean hasAsyncUpdate() {
        return super.hasAsyncUpdate();
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController, com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isCopyableSlice() {
        return super.isCopyableSlice();
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController, com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isPublicSlice() {
        return super.isPublicSlice();
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController, com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isSliceable() {
        return super.isSliceable();
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController, com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean useDynamicSliceSummary() {
        return super.useDynamicSliceSummary();
    }

    public WifiTetherSecurityPreferenceController(Context context, WifiTetherBasePreferenceController.OnTetherConfigUpdateListener onTetherConfigUpdateListener) {
        super(context, onTetherConfigUpdateListener, PREF_KEY);
        this.mContext = context;
        this.mDualSoftApSupported = context.getResources().getBoolean(17891599);
        this.mListPreference = (ListPreference) this.mPreference;
        Log.i(TAG, "Register SoftAp callback");
        ((WifiManager) context.getSystemService("wifi")).registerSoftApCallback(new HandlerExecutor(new Handler(this.mContext.getMainLooper())), this.mSoftApCallback);
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public String getPreferenceKey() {
        return FeatureFlagUtils.isEnabled(this.mContext, "settings_tether_all_in_one") ? "wifi_tether_security_2" : PREF_KEY;
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController
    public void updateDisplay() {
        String[] strArr;
        SoftApConfiguration softApConfiguration = this.mWifiManager.getSoftApConfiguration();
        if (softApConfiguration == null) {
            this.mSecurityValue = 1;
        } else if (softApConfiguration.getSecurityType() == 0) {
            this.mSecurityValue = 0;
        } else if (this.mOweSapSupprted && this.mDualSoftApSupported && softApConfiguration.getSecurityType() == 4) {
            this.mSecurityValue = 4;
        } else if (!this.mSaeSapSupprted || softApConfiguration.getSecurityType() != 3) {
            this.mSecurityValue = 1;
        } else {
            this.mSecurityValue = 3;
        }
        if (this.mListPreference == null) {
            this.mListPreference = (ListPreference) this.mPreference;
        }
        ListPreference listPreference = this.mListPreference;
        if (listPreference != null && (strArr = this.mSecurityEntries) != null && this.mSecurityValues != null) {
            listPreference.setEntries(strArr);
            this.mListPreference.setEntryValues(this.mSecurityValues);
            this.mListPreference.setSummary(getSummaryForSecurityType(this.mSecurityValue));
            this.mListPreference.setValue(String.valueOf(this.mSecurityValue));
        }
    }

    @Override // androidx.preference.Preference.OnPreferenceChangeListener, com.android.settings.wifi.tether.WifiTetherBasePreferenceController
    public boolean onPreferenceChange(Preference preference, Object obj) {
        Intent intent;
        if (!this.mWifiManager.isWifiApEnabled() || this.mWifiManager.getSoftApConfiguration() == null) {
            intent = null;
        } else {
            Context context = this.mContext;
            WifiManager wifiManager = this.mWifiManager;
            intent = WifiDppUtils.getHotspotConfiguratorIntentOrNull(context, wifiManager, wifiManager.getSoftApConfiguration());
        }
        String str = (String) obj;
        this.mNewValue = Integer.parseInt(str);
        if (ProductUtils.isUsvMode() && this.mNewValue == 0) {
            AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
            builder.setTitle(C0017R$string.warning_title);
            builder.setMessage(C0017R$string.open_hotspot_warning_message);
            builder.setPositiveButton(C0017R$string.continue_anyway, this.noneDialogCLickListner);
            builder.setNegativeButton(17039360, this.noneDialogCLickListner);
            builder.setCancelable(false);
            builder.create().show();
            return true;
        } else if (intent == null || !ProductUtils.isUsvMode()) {
            this.mSecurityValue = Integer.parseInt(str);
            if (!OPUtils.isSupportUstMode() || this.mSecurityValue != 0) {
                preference.setSummary(getSummaryForSecurityType(this.mSecurityValue));
                this.mListener.onTetherConfigUpdated(this);
                return true;
            }
            AlertDialog.Builder builder2 = new AlertDialog.Builder(this.mContext);
            builder2.setMessage(C0017R$string.wifi_security_dialog);
            builder2.setPositiveButton(17039370, this.onClickListener);
            builder2.setNegativeButton(17039360, this.onClickListener);
            builder2.setCancelable(false);
            builder2.create().show();
            return true;
        } else {
            Log.v("Preference change", isAvailable() + "");
            AlertDialog.Builder builder3 = new AlertDialog.Builder(this.mContext);
            builder3.setTitle(C0017R$string.save_changes);
            builder3.setMessage(C0017R$string.verizon_wifi_tether_band_warning);
            builder3.setPositiveButton(17039370, this.onWarningDialogCLickListner);
            builder3.setNegativeButton(17039360, this.onWarningDialogCLickListner);
            builder3.setCancelable(false);
            builder3.create().show();
            return true;
        }
    }

    public int getSecurityType() {
        return this.mSecurityValue;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private String getSummaryForSecurityType(int i) {
        int findIndexOfValue = ((ListPreference) this.mPreference).findIndexOfValue(String.valueOf(i));
        if (findIndexOfValue < 0) {
            return "";
        }
        return this.mSecurityEntries[findIndexOfValue];
    }

    public boolean isOweSapSupported() {
        return this.mOweSapSupprted;
    }
}
