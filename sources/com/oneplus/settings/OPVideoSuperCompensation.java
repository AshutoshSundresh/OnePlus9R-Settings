package com.oneplus.settings;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.provider.SearchIndexableResource;
import android.provider.Settings;
import android.util.Log;
import androidx.preference.Preference;
import androidx.preference.PreferenceCategory;
import androidx.preference.SwitchPreference;
import com.android.settings.C0017R$string;
import com.android.settings.C0019R$xml;
import com.android.settings.dashboard.DashboardFragment;
import com.android.settings.search.BaseSearchIndexProvider;
import com.android.settingslib.core.AbstractPreferenceController;
import com.android.settingslib.core.lifecycle.Lifecycle;
import com.oneplus.settings.utils.OPUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class OPVideoSuperCompensation extends DashboardFragment implements Preference.OnPreferenceChangeListener {
    public static final BaseSearchIndexProvider SEARCH_INDEX_DATA_PROVIDER = new BaseSearchIndexProvider() {
        /* class com.oneplus.settings.OPVideoSuperCompensation.AnonymousClass1 */

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<SearchIndexableResource> getXmlResourcesToIndex(Context context, boolean z) {
            SearchIndexableResource searchIndexableResource = new SearchIndexableResource(context);
            if (OPUtils.isSupportViewSR()) {
                searchIndexableResource.xmlResId = C0019R$xml.op_video_super_resolution;
            }
            return Arrays.asList(searchIndexableResource);
        }

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<String> getNonIndexableKeys(Context context) {
            return new ArrayList();
        }
    };
    private PreferenceCategory mSupportedApps;
    private SwitchPreference mVideoSuperCompensationSwitch;

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public String getLogTag() {
        return "OPVideoSuperCompensation";
    }

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 9999;
    }

    @Override // com.android.settings.SettingsPreferenceFragment, androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        SwitchPreference switchPreference = (SwitchPreference) findPreference("video_super_compensation_switch");
        this.mVideoSuperCompensationSwitch = switchPreference;
        if (switchPreference != null) {
            switchPreference.setOnPreferenceChangeListener(this);
        }
        this.mSupportedApps = (PreferenceCategory) findPreference("support_video");
    }

    @Override // androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onStart() {
        super.onStart();
        initSupportedApps();
    }

    private void initSupportedApps() {
        ApplicationInfo applicationInfo;
        List<String> videoSpWhitelist = OPOnlineConfigManager.getVideoSpWhitelist();
        this.mSupportedApps.removeAll();
        PackageManager packageManager = getPrefContext().getPackageManager();
        boolean z = true;
        for (int i = 0; i < videoSpWhitelist.size(); i++) {
            String str = videoSpWhitelist.get(i);
            Log.d("OPVideoSuperCompensation", "initSupportedApps package = " + str);
            try {
                applicationInfo = packageManager.getApplicationInfo(str, 0);
            } catch (Exception e) {
                e.printStackTrace();
                applicationInfo = null;
            }
            if (applicationInfo != null) {
                Preference preference = new Preference(getContext());
                preference.setTitle(applicationInfo.loadLabel(packageManager));
                preference.setKey(str);
                preference.setIcon(applicationInfo.loadIcon(packageManager));
                preference.setSelectable(false);
                this.mSupportedApps.addPreference(preference);
                z = false;
            }
        }
        if (z) {
            this.mSupportedApps.setTitle(C0017R$string.oneplus_memc_support_no_apps);
        } else {
            this.mSupportedApps.setTitle(C0017R$string.oneplus_memc_support_apps);
        }
    }

    @Override // com.android.settings.SettingsPreferenceFragment, com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onResume() {
        super.onResume();
        boolean z = false;
        int i = Settings.Global.getInt(getPrefContext().getContentResolver(), "oplus.software.video.sr_support", 0);
        SwitchPreference switchPreference = this.mVideoSuperCompensationSwitch;
        if (i == 1) {
            z = true;
        }
        switchPreference.setChecked(z);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public List<AbstractPreferenceController> createPreferenceControllers(Context context) {
        return buildPreferenceControllers(context, getSettingsLifecycle());
    }

    private static List<AbstractPreferenceController> buildPreferenceControllers(Context context, Lifecycle lifecycle) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new OPGraphicsOptimizationPreferenceController(context, lifecycle));
        return arrayList;
    }

    @Override // androidx.preference.Preference.OnPreferenceChangeListener
    public boolean onPreferenceChange(Preference preference, Object obj) {
        String key = preference.getKey();
        boolean booleanValue = ((Boolean) obj).booleanValue();
        if (key.equals("video_super_compensation_switch")) {
            if (booleanValue) {
                OPUtils.sendAnalytics("super resolution", "status", "1");
                Settings.Global.putInt(getPrefContext().getContentResolver(), "oplus.software.video.sr_support", 1);
            } else {
                OPUtils.sendAnalytics("super resolution", "status", "0");
                Settings.Global.putInt(getPrefContext().getContentResolver(), "oplus.software.video.sr_support", 0);
            }
        }
        return true;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment
    public int getPreferenceScreenResId() {
        return C0019R$xml.op_video_super_resolution;
    }
}
