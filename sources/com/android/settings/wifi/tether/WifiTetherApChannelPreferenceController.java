package com.android.settings.wifi.tether;

import android.content.Context;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.net.wifi.SoftApConfiguration;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import com.android.settings.C0003R$array;
import com.android.settings.C0017R$string;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settings.wifi.tether.WifiTetherBasePreferenceController;
import com.oneplus.settings.utils.ProductUtils;

public class WifiTetherApChannelPreferenceController extends WifiTetherBasePreferenceController {
    private static final String PREF_KEY = "wifi_tether_ap_channel";
    private static final String TAG = "WifiTetherApChannelPref";
    private String[] mBandEntries;
    private int mBandIndex;
    private String[] mBandSummaries;
    private int mChannelIndex;

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

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public String getPreferenceKey() {
        return PREF_KEY;
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

    public WifiTetherApChannelPreferenceController(Context context, WifiTetherBasePreferenceController.OnTetherConfigUpdateListener onTetherConfigUpdateListener) {
        super(context, onTetherConfigUpdateListener, PREF_KEY);
        this.mChannelIndex = 2;
        this.mBandIndex = 1;
        this.mBandIndex = this.mWifiManager.getSoftApConfiguration().getBand();
        this.mChannelIndex = this.mWifiManager.getSoftApConfiguration().getChannel();
        updatePreferenceEntries();
    }

    @Override // com.android.settings.core.BasePreferenceController, com.android.settings.wifi.tether.WifiTetherBasePreferenceController
    public int getAvailabilityStatus() {
        return ProductUtils.isUsvMode() ? 0 : 3;
    }

    public void onBandIndexChange(int i) {
        this.mBandIndex = i;
        ListPreference listPreference = (ListPreference) this.mPreference;
        if ((i & 2) != 0) {
            listPreference.setEnabled(false);
            listPreference.setValue(Integer.toString(0));
            listPreference.setSummary(getConfigSummary());
        } else {
            listPreference.setEnabled(true);
            listPreference.setSummary(getConfigSummary());
            listPreference.setValue(getConfigSummary());
            new SoftApConfiguration.Builder(this.mWifiManager.getSoftApConfiguration()).setChannel(getChannelIndex(), this.mBandIndex).build();
        }
        updateDisplay();
    }

    @Override // com.android.settings.wifi.tether.WifiTetherBasePreferenceController
    public void updateDisplay() {
        SoftApConfiguration softApConfiguration = this.mWifiManager.getSoftApConfiguration();
        updatePreferenceEntries();
        ListPreference listPreference = (ListPreference) this.mPreference;
        listPreference.setEntries(this.mBandSummaries);
        listPreference.setEntryValues(this.mBandEntries);
        SoftApConfiguration.Builder builder = new SoftApConfiguration.Builder(softApConfiguration);
        int band = softApConfiguration.getBand();
        this.mBandIndex = band;
        if (softApConfiguration != null) {
            int i = 2;
            if ((band & 2) != 0) {
                listPreference.setEnabled(false);
                listPreference.setValue(Integer.toString(0));
                listPreference.setSummary(getConfigSummary());
                return;
            }
            listPreference.setEnabled(true);
            listPreference.setSummary(getConfigSummary());
            listPreference.setValue(getConfigSummary());
            if (getChannelIndex() >= 2 && getChannelIndex() <= 13) {
                i = getChannelIndex();
            }
            this.mChannelIndex = i;
            builder.setChannel(getChannelIndex(), 1).build();
        }
    }

    /* access modifiers changed from: package-private */
    public String getConfigSummary() {
        if ((this.mWifiManager.getSoftApConfiguration().getBand() & 2) != 0) {
            return this.mContext.getResources().getString(C0017R$string.wifi_ap_choose_auto);
        }
        return Integer.toString(getChannelIndex());
    }

    @Override // androidx.preference.Preference.OnPreferenceChangeListener, com.android.settings.wifi.tether.WifiTetherBasePreferenceController
    public boolean onPreferenceChange(Preference preference, Object obj) {
        this.mChannelIndex = Integer.parseInt((String) obj);
        preference.setSummary(getConfigSummary());
        this.mListener.onTetherConfigUpdated(this);
        return true;
    }

    private void updatePreferenceEntries() {
        Resources resources = this.mContext.getResources();
        if ((this.mBandIndex & 2) != 0) {
            int i = C0003R$array.wifi_ap_channel_config_5band;
            this.mBandEntries = resources.getStringArray(i);
            this.mBandSummaries = resources.getStringArray(i);
            this.mChannelIndex = 49;
            return;
        }
        int i2 = C0003R$array.wifi_ap_channel_band;
        this.mBandEntries = resources.getStringArray(i2);
        this.mBandSummaries = resources.getStringArray(i2);
        this.mChannelIndex = getChannelIndex();
    }

    public int getChannelIndex() {
        if ((this.mWifiManager.getSoftApConfiguration().getBand() & 2) != 0) {
            return 49;
        }
        int i = this.mChannelIndex;
        if (i < 2 || i > 13) {
            return 2;
        }
        return i;
    }
}
