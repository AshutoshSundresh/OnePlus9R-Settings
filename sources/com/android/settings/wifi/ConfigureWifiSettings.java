package com.android.settings.wifi;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import androidx.preference.Preference;
import androidx.preference.SwitchPreference;
import com.android.settings.C0005R$bool;
import com.android.settings.C0019R$xml;
import com.android.settings.dashboard.DashboardFragment;
import com.android.settings.search.BaseSearchIndexProvider;
import com.android.settings.wifi.p2p.WifiP2pPreferenceController;
import com.android.settingslib.core.AbstractPreferenceController;
import com.oneplus.android.wifi.OpWifiCustomizeReader;
import com.oneplus.settings.controllers.OPPasspointPreferenceController;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.ProductUtils;
import java.util.ArrayList;
import java.util.List;

public class ConfigureWifiSettings extends DashboardFragment {
    public static final BaseSearchIndexProvider SEARCH_INDEX_DATA_PROVIDER = new BaseSearchIndexProvider(C0019R$xml.wifi_configure_settings) {
        /* class com.android.settings.wifi.ConfigureWifiSettings.AnonymousClass1 */

        /* access modifiers changed from: protected */
        @Override // com.android.settings.search.BaseSearchIndexProvider
        public boolean isPageSearchEnabled(Context context) {
            return context.getResources().getBoolean(C0005R$bool.config_show_wifi_settings);
        }

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<String> getNonIndexableKeys(Context context) {
            List<String> nonIndexableKeys = super.getNonIndexableKeys(context);
            if (OPUtils.isO2()) {
                nonIndexableKeys.add("wapi_cert_manage");
            }
            if (!OpWifiCustomizeReader.isSupportPasspoint() || OPUtils.isGuestMode()) {
                nonIndexableKeys.add(OPPasspointPreferenceController.KEY_ONEPLUS_PASSPOINT);
            }
            return nonIndexableKeys;
        }
    };
    private SwitchPreference mShowWifiPopUp;
    private UseOpenWifiPreferenceController mUseOpenWifiPreferenceController;
    private SwitchPreference mWifiNotification;
    private WifiWakeupPreferenceController mWifiWakeupPreferenceController;

    @Override // com.android.settings.SettingsPreferenceFragment
    public int getInitialExpandedChildCount() {
        return 0;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public String getLogTag() {
        return "ConfigureWifiSettings";
    }

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 338;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment
    public int getPreferenceScreenResId() {
        return C0019R$xml.wifi_configure_settings;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public List<AbstractPreferenceController> createPreferenceControllers(Context context) {
        WifiManager wifiManager = (WifiManager) getSystemService("wifi");
        ArrayList arrayList = new ArrayList();
        this.mWifiWakeupPreferenceController = new WifiWakeupPreferenceController(context);
        this.mUseOpenWifiPreferenceController = new UseOpenWifiPreferenceController(context);
        arrayList.add(new WifiP2pPreferenceController(context, getSettingsLifecycle(), wifiManager));
        arrayList.add(new OPIntelligentlySelectBestWifiPreferenceController(context, getSettingsLifecycle()));
        arrayList.add(new OPWifiScanAlwaysAvailablePreferenceController(context, getSettingsLifecycle(), this.mWifiWakeupPreferenceController));
        arrayList.add(new OPPasspointPreferenceController(context, getSettingsLifecycle()));
        arrayList.add(new OPWapiCertManagePreferenceController(context));
        arrayList.add(new OPWifiInfoPreferenceController(context, getSettingsLifecycle(), wifiManager));
        return arrayList;
    }

    @Override // com.android.settings.SettingsPreferenceFragment, androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (ProductUtils.isUsvMode()) {
            SharedPreferences sharedPreferences = getContext().getSharedPreferences(OPAutoSwitchMobileDataPreferenceController.PREFS_WIFISETTINGS, 0);
            this.mShowWifiPopUp = (SwitchPreference) findPreference("show_wifi_popup");
            boolean z = sharedPreferences.getBoolean("show_wifi_popup_enabled", false);
            if (sharedPreferences.getBoolean("show_wifi_popup_cicked", false)) {
                if (z) {
                    this.mShowWifiPopUp.setChecked(true);
                } else {
                    this.mShowWifiPopUp.setChecked(false);
                }
            }
            this.mWifiNotification = (SwitchPreference) findPreference("wifi_notification");
            boolean z2 = sharedPreferences.getBoolean("wifi_notification_enabled", false);
            if (!sharedPreferences.getBoolean("wifi_notification_Cicked", false)) {
                return;
            }
            if (z2) {
                this.mWifiNotification.setChecked(true);
            } else {
                this.mWifiNotification.setChecked(false);
            }
        } else {
            SwitchPreference switchPreference = (SwitchPreference) findPreference("show_wifi_popup");
            this.mShowWifiPopUp = switchPreference;
            if (switchPreference != null) {
                switchPreference.setVisible(false);
                getPreferenceScreen().removePreference(this.mShowWifiPopUp);
            }
            SwitchPreference switchPreference2 = (SwitchPreference) findPreference("wifi_notification");
            this.mWifiNotification = switchPreference2;
            if (switchPreference2 != null) {
                switchPreference2.setVisible(false);
                getPreferenceScreen().removePreference(this.mWifiNotification);
            }
        }
    }

    @Override // androidx.preference.PreferenceFragmentCompat, com.android.settings.core.InstrumentedPreferenceFragment, androidx.preference.PreferenceManager.OnPreferenceTreeClickListener, com.android.settings.dashboard.DashboardFragment
    public boolean onPreferenceTreeClick(Preference preference) {
        if (ProductUtils.isUsvMode()) {
            SharedPreferences.Editor edit = getContext().getSharedPreferences(OPAutoSwitchMobileDataPreferenceController.PREFS_WIFISETTINGS, 0).edit();
            if (preference == this.mShowWifiPopUp) {
                edit.putBoolean("show_wifi_popup_cicked", true);
                if (this.mShowWifiPopUp.isChecked()) {
                    edit.putBoolean("show_wifi_popup_enabled", this.mShowWifiPopUp.isChecked());
                    edit.commit();
                } else {
                    edit.putBoolean("show_wifi_popup_enabled", this.mShowWifiPopUp.isChecked());
                    edit.commit();
                }
                SwitchPreference switchPreference = this.mShowWifiPopUp;
                switchPreference.setChecked(switchPreference.isChecked());
            }
            if (preference == this.mWifiNotification) {
                edit.putBoolean("wifi_notification_Cicked", true);
                if (this.mWifiNotification.isChecked()) {
                    edit.putBoolean("wifi_notification_enabled", this.mWifiNotification.isChecked());
                    edit.commit();
                } else {
                    edit.putBoolean("wifi_notification_enabled", this.mWifiNotification.isChecked());
                    edit.commit();
                }
                SwitchPreference switchPreference2 = this.mWifiNotification;
                switchPreference2.setChecked(switchPreference2.isChecked());
            }
        }
        return super.onPreferenceTreeClick(preference);
    }

    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onAttach(Context context) {
        super.onAttach(context);
        WifiWakeupPreferenceController wifiWakeupPreferenceController = (WifiWakeupPreferenceController) use(WifiWakeupPreferenceController.class);
        this.mWifiWakeupPreferenceController = wifiWakeupPreferenceController;
        wifiWakeupPreferenceController.setFragment(this);
        UseOpenWifiPreferenceController useOpenWifiPreferenceController = (UseOpenWifiPreferenceController) use(UseOpenWifiPreferenceController.class);
        this.mUseOpenWifiPreferenceController = useOpenWifiPreferenceController;
        useOpenWifiPreferenceController.setFragment(this);
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 600) {
            this.mWifiWakeupPreferenceController.onActivityResult(i, i2);
        } else if (i == 400) {
            this.mUseOpenWifiPreferenceController.onActivityResult(i, i2);
        } else {
            super.onActivityResult(i, i2, intent);
        }
    }
}
