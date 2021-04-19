package com.oneplus.settings.others;

import android.content.Context;
import android.os.Bundle;
import android.provider.SearchIndexableResource;
import android.provider.Settings;
import android.util.Log;
import androidx.preference.Preference;
import androidx.preference.SwitchPreference;
import com.android.settings.C0019R$xml;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.search.BaseSearchIndexProvider;
import com.oneplus.settings.ui.OPLottieViewPagerPreference;
import com.oneplus.settings.ui.OPSideBarSeekBarPreference;
import java.util.Arrays;
import java.util.List;

public class OPSmartSideBarSettings extends SettingsPreferenceFragment implements Preference.OnPreferenceChangeListener {
    public static final BaseSearchIndexProvider SEARCH_INDEX_DATA_PROVIDER = new BaseSearchIndexProvider() {
        /* class com.oneplus.settings.others.OPSmartSideBarSettings.AnonymousClass1 */

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<SearchIndexableResource> getXmlResourcesToIndex(Context context, boolean z) {
            SearchIndexableResource searchIndexableResource = new SearchIndexableResource(context);
            searchIndexableResource.xmlResId = C0019R$xml.op_smart_side_bar_settings;
            return Arrays.asList(searchIndexableResource);
        }

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<String> getNonIndexableKeys(Context context) {
            return super.getNonIndexableKeys(context);
        }
    };
    private boolean isSideBarSwitchOn;
    private SwitchPreference mFullscreenGoneSwitch;
    private OPLottieViewPagerPreference mLottieViewPagerPreference;
    private OPSideBarSeekBarPreference mSideBarSeekBarPreference;
    private SwitchPreference mSmartSideBarSwitch;

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 9999;
    }

    @Override // com.android.settings.SettingsPreferenceFragment, androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        addPreferencesFromResource(C0019R$xml.op_smart_side_bar_settings);
        this.mLottieViewPagerPreference = (OPLottieViewPagerPreference) findPreference("lottie_view_pager_preference");
        this.mSmartSideBarSwitch = (SwitchPreference) findPreference("side_bar_switch");
        this.mFullscreenGoneSwitch = (SwitchPreference) findPreference("side_bar_fullscreen_gone_switch");
        this.mSideBarSeekBarPreference = (OPSideBarSeekBarPreference) findPreference("side_bar_transparent_seekbar");
        this.mSmartSideBarSwitch.setOnPreferenceChangeListener(this);
        this.mFullscreenGoneSwitch.setOnPreferenceChangeListener(this);
    }

    @Override // com.android.settings.SettingsPreferenceFragment, com.android.settings.core.InstrumentedPreferenceFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onResume() {
        super.onResume();
        OPLottieViewPagerPreference oPLottieViewPagerPreference = this.mLottieViewPagerPreference;
        if (oPLottieViewPagerPreference != null) {
            oPLottieViewPagerPreference.startAnim();
        }
        boolean z = false;
        boolean z2 = Settings.Secure.getIntForUser(getContext().getContentResolver(), "edge_panel_toggle", 0, -2) == 1;
        this.isSideBarSwitchOn = z2;
        this.mSmartSideBarSwitch.setChecked(z2);
        SwitchPreference switchPreference = this.mFullscreenGoneSwitch;
        if (Settings.Secure.getIntForUser(getContext().getContentResolver(), "edge_panel_hide_float_bar", 0, -2) == 1) {
            z = true;
        }
        switchPreference.setChecked(z);
        updateUI();
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onStop() {
        super.onStop();
        OPLottieViewPagerPreference oPLottieViewPagerPreference = this.mLottieViewPagerPreference;
        if (oPLottieViewPagerPreference != null) {
            oPLottieViewPagerPreference.stopAnim();
        }
    }

    private void updateUI() {
        this.mSideBarSeekBarPreference.setEnabled(this.isSideBarSwitchOn);
        this.mFullscreenGoneSwitch.setEnabled(this.isSideBarSwitchOn);
    }

    @Override // androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onDestroy() {
        super.onDestroy();
        OPLottieViewPagerPreference oPLottieViewPagerPreference = this.mLottieViewPagerPreference;
        if (oPLottieViewPagerPreference != null) {
            oPLottieViewPagerPreference.releaseAnim();
        }
    }

    @Override // androidx.preference.Preference.OnPreferenceChangeListener
    public boolean onPreferenceChange(Preference preference, Object obj) {
        Log.d("OPLittleWindowSettings", "onPreferenceChange newValue" + obj);
        if (preference == this.mSmartSideBarSwitch) {
            Boolean bool = (Boolean) obj;
            this.isSideBarSwitchOn = bool.booleanValue();
            this.mSmartSideBarSwitch.setChecked(bool.booleanValue());
            Settings.Secure.putIntForUser(getContext().getContentResolver(), "edge_panel_toggle", bool.booleanValue() ? 1 : 0, -2);
            updateUI();
            return true;
        }
        SwitchPreference switchPreference = this.mFullscreenGoneSwitch;
        if (preference != switchPreference) {
            return false;
        }
        Boolean bool2 = (Boolean) obj;
        switchPreference.setChecked(bool2.booleanValue());
        Settings.Secure.putIntForUser(getContext().getContentResolver(), "edge_panel_hide_float_bar", bool2.booleanValue() ? 1 : 0, -2);
        return true;
    }
}
