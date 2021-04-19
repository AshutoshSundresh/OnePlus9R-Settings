package com.oneplus.settings.wifi.tether;

import android.content.Context;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.net.wifi.SoftApConfiguration;
import android.net.wifi.WifiManager;
import android.provider.Settings;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0003R$array;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.ProductUtils;

public class OPWifiTetherCustomAutoTurnOffPreferenceController extends BasePreferenceController implements Preference.OnPreferenceChangeListener {
    private static final int CUSTOM_AUTO_TURN_OFF_10_MIN_INDEX = 2;
    private static final int CUSTOM_AUTO_TURN_OFF_10_MIN_VALUE = 2;
    private static final int CUSTOM_AUTO_TURN_OFF_15_MIN_INDEX = 3;
    private static final int CUSTOM_AUTO_TURN_OFF_15_MIN_VALUE = 3;
    private static final int CUSTOM_AUTO_TURN_OFF_20_MIN_INDEX = 4;
    private static final int CUSTOM_AUTO_TURN_OFF_20_MIN_VALUE = 4;
    private static final int CUSTOM_AUTO_TURN_OFF_30_MIN_INDEX = 5;
    private static final int CUSTOM_AUTO_TURN_OFF_30_MIN_VALUE = 6;
    private static final int CUSTOM_AUTO_TURN_OFF_5_MIN_INDEX = 1;
    private static final int CUSTOM_AUTO_TURN_OFF_5_MIN_VALUE = 1;
    private static final int CUSTOM_AUTO_TURN_OFF_60_MIN_INDEX = 6;
    private static final int CUSTOM_AUTO_TURN_OFF_60_MIN_VALUE = 12;
    private static final int CUSTOM_AUTO_TURN_OFF_ALWAYS_INDEX = 0;
    private static final int CUSTOM_AUTO_TURN_OFF_ALWAYS_VALUE = 0;
    private static final int CUSTOM_AUTO_TURN_OFF_TIME_DEFAULT = 600000;
    private static final String PREF_KEY = "wifi_tether_custom_auto_turn_off";
    private final String[] mCustomEntries;
    private String[] mCustomTimes;
    private WifiManager mWifiManager;

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ Class<? extends SliceBackgroundWorker> getBackgroundWorkerClass() {
        return super.getBackgroundWorkerClass();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ IntentFilter getIntentFilter() {
        return super.getIntentFilter();
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public String getPreferenceKey() {
        return PREF_KEY;
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean hasAsyncUpdate() {
        return super.hasAsyncUpdate();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isCopyableSlice() {
        return super.isCopyableSlice();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isPublicSlice() {
        return super.isPublicSlice();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isSliceable() {
        return super.isSliceable();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean useDynamicSliceSummary() {
        return super.useDynamicSliceSummary();
    }

    public OPWifiTetherCustomAutoTurnOffPreferenceController(Context context) {
        super(context, PREF_KEY);
        int i;
        Resources resources = this.mContext.getResources();
        if (ProductUtils.isUsvMode()) {
            i = C0003R$array.wifi_tether_verizon_custom_auto_turn_off_summary;
        } else {
            i = C0003R$array.wifi_tether_custom_auto_turn_off_summary;
        }
        this.mCustomEntries = resources.getStringArray(i);
        if (context != null) {
            this.mCustomTimes = context.getResources().getStringArray(C0003R$array.wifi_tether_custom_auto_turn_off_time);
            this.mWifiManager = (WifiManager) context.getSystemService("wifi");
        }
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return (OPUtils.isSupportUstMode() || ProductUtils.isUsvMode()) ? 0 : 3;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        SoftApConfiguration softApConfiguration;
        int i;
        super.displayPreference(preferenceScreen);
        ListPreference listPreference = (ListPreference) preferenceScreen.findPreference(getPreferenceKey());
        if (ProductUtils.isUsvMode()) {
            listPreference.setEntries(this.mCustomEntries);
            Resources resources = this.mContext.getResources();
            if (ProductUtils.isUsvMode()) {
                i = C0003R$array.wifi_tether_verizon_custom_auto_turn_off_values;
            } else {
                i = C0003R$array.wifi_tether_custom_auto_turn_off_values;
            }
            listPreference.setEntryValues(resources.getStringArray(i));
        }
        int i2 = ProductUtils.isUsvMode() ? 4 : 2;
        WifiManager wifiManager = this.mWifiManager;
        if (!(wifiManager == null || (softApConfiguration = wifiManager.getSoftApConfiguration()) == null)) {
            if (softApConfiguration.isAutoShutdownEnabled()) {
                long shutdownTimeoutMillis = softApConfiguration.getShutdownTimeoutMillis();
                if (shutdownTimeoutMillis != 0) {
                    i2 = getCustomAutoOffTimeOutIndex(shutdownTimeoutMillis);
                }
            } else {
                i2 = 0;
            }
        }
        Settings.Global.putInt(this.mContext.getContentResolver(), "soft_ap_timeout_enabled", i2);
        listPreference.setSummary(getSummaryForDisplay(i2));
        listPreference.setValue(String.valueOf(i2));
    }

    @Override // androidx.preference.Preference.OnPreferenceChangeListener
    public boolean onPreferenceChange(Preference preference, Object obj) {
        SoftApConfiguration.Builder builder;
        int parseInt = Integer.parseInt((String) obj);
        preference.setSummary(getSummaryForDisplay(parseInt));
        boolean z = parseInt != 0;
        if (this.mWifiManager == null) {
            return false;
        }
        Settings.Global.putInt(this.mContext.getContentResolver(), "soft_ap_timeout_enabled", parseInt);
        SoftApConfiguration softApConfiguration = this.mWifiManager.getSoftApConfiguration();
        if (softApConfiguration == null) {
            builder = new SoftApConfiguration.Builder();
        } else {
            builder = new SoftApConfiguration.Builder(softApConfiguration);
        }
        return this.mWifiManager.setSoftApConfiguration(builder.setShutdownTimeoutMillis(getCustomAutoOffTimeOut(parseInt)).setAutoShutdownEnabled(z).build());
    }

    private int getCustomAutoOffTimeOutIndex(long j) {
        int i = ProductUtils.isUsvMode() ? 4 : 2;
        String[] strArr = this.mCustomTimes;
        if (strArr == null || strArr.length <= 0) {
            return i;
        }
        int i2 = 0;
        while (true) {
            if (i2 >= this.mCustomTimes.length) {
                break;
            } else if (j == getTimeOut(i2)) {
                i = i2;
                break;
            } else {
                i2++;
            }
        }
        if (i == 0) {
            return 0;
        }
        int i3 = 1;
        if (i != 1) {
            i3 = 3;
            if (i != 3) {
                if (i == 4) {
                    return 4;
                }
                if (i == 5) {
                    return 6;
                }
                if (i != 6) {
                    return ProductUtils.isUsvMode() ? 4 : 2;
                }
                return 12;
            }
        }
        return i3;
    }

    private long getCustomAutoOffTimeOut(int i) {
        if (i == 1) {
            return getTimeOut(1);
        }
        if (i == 2) {
            return getTimeOut(2);
        }
        if (i == 3) {
            return getTimeOut(3);
        }
        if (i == 4) {
            return getTimeOut(4);
        }
        if (i == 6) {
            return getTimeOut(5);
        }
        if (i == 12) {
            return getTimeOut(6);
        }
        if (i == 0) {
            return getTimeOut(0);
        }
        return 600000;
    }

    private long getTimeOut(int i) {
        String[] strArr = this.mCustomTimes;
        if (strArr == null) {
            return 600000;
        }
        try {
            return Long.parseLong(strArr[i]);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return 600000;
        } catch (IndexOutOfBoundsException e2) {
            e2.printStackTrace();
            return 600000;
        }
    }

    private String getSummaryForDisplay(int i) {
        if (ProductUtils.isUsvMode()) {
            if (i == 1) {
                return this.mCustomEntries[0];
            }
            if (i == 2) {
                return this.mCustomEntries[1];
            }
            if (i == 4) {
                return this.mCustomEntries[2];
            }
            if (i == 6) {
                return this.mCustomEntries[3];
            }
            if (i == 12) {
                return this.mCustomEntries[4];
            }
            if (i == 0) {
                return this.mCustomEntries[5];
            }
            return this.mCustomEntries[2];
        } else if (i == 1) {
            return this.mCustomEntries[0];
        } else {
            if (i == 2) {
                return this.mCustomEntries[1];
            }
            if (i == 3) {
                return this.mCustomEntries[2];
            }
            if (i == 0) {
                return this.mCustomEntries[3];
            }
            return this.mCustomEntries[0];
        }
    }
}
