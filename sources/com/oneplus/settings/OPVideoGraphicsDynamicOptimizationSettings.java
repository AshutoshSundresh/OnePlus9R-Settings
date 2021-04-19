package com.oneplus.settings;

import android.content.Context;
import android.os.Bundle;
import android.os.SystemProperties;
import android.provider.SearchIndexableResource;
import android.provider.Settings;
import androidx.preference.Preference;
import androidx.preference.SwitchPreference;
import com.android.settings.C0019R$xml;
import com.android.settings.dashboard.DashboardFragment;
import com.android.settings.search.BaseSearchIndexProvider;
import com.android.settingslib.core.AbstractPreferenceController;
import com.android.settingslib.core.lifecycle.Lifecycle;
import com.android.settingslib.search.Indexable$SearchIndexProvider;
import com.oneplus.settings.utils.OPUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class OPVideoGraphicsDynamicOptimizationSettings extends DashboardFragment implements Preference.OnPreferenceChangeListener {
    public static final Indexable$SearchIndexProvider SEARCH_INDEX_DATA_PROVIDER = new BaseSearchIndexProvider() {
        /* class com.oneplus.settings.OPVideoGraphicsDynamicOptimizationSettings.AnonymousClass1 */

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<SearchIndexableResource> getXmlResourcesToIndex(Context context, boolean z) {
            SearchIndexableResource searchIndexableResource = new SearchIndexableResource(context);
            if (OPUtils.isSupportMotionGraphicsCompensation()) {
                searchIndexableResource.xmlResId = C0019R$xml.op_video_graphics_dynamic_optimization;
            }
            return Arrays.asList(searchIndexableResource);
        }
    };
    private Context mContext;
    private SwitchPreference mVideoEnhancerSwitch;

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public String getLogTag() {
        return "OPVideoGraphicsDynamicOptimizationSettings";
    }

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 9999;
    }

    @Override // com.android.settings.SettingsPreferenceFragment, androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mContext = SettingsBaseApplication.mApplication;
        SwitchPreference switchPreference = (SwitchPreference) findPreference("video_enhancer_switch");
        this.mVideoEnhancerSwitch = switchPreference;
        switchPreference.setOnPreferenceChangeListener(this);
        boolean z = false;
        if (!OPUtils.isSupportIRISHQV()) {
            this.mVideoEnhancerSwitch.setChecked(SystemProperties.getBoolean("persist.sys.oem.vendor.media.vpp.enable", false));
            return;
        }
        int i = Settings.System.getInt(this.mContext.getContentResolver(), "op_iris_video_sdr2hdr_status", 0);
        SwitchPreference switchPreference2 = this.mVideoEnhancerSwitch;
        if (i == 1) {
            z = true;
        }
        switchPreference2.setChecked(z);
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

    /* access modifiers changed from: protected */
    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment
    public int getPreferenceScreenResId() {
        return C0019R$xml.op_video_graphics_dynamic_optimization;
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [int, boolean] */
    /* JADX WARNING: Unknown variable types count: 1 */
    @Override // androidx.preference.Preference.OnPreferenceChangeListener
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean onPreferenceChange(androidx.preference.Preference r2, java.lang.Object r3) {
        /*
            r1 = this;
            java.lang.Boolean r3 = (java.lang.Boolean) r3
            boolean r2 = r3.booleanValue()
            boolean r3 = com.oneplus.settings.utils.OPUtils.isSupportIRISHQV()
            if (r3 != 0) goto L_0x0024
            if (r2 == 0) goto L_0x0011
            java.lang.String r3 = "true"
            goto L_0x0013
        L_0x0011:
            java.lang.String r3 = "false"
        L_0x0013:
            java.lang.String r0 = "persist.sys.oem.vendor.media.vpp.enable"
            android.os.SystemProperties.set(r0, r3)
            android.content.Context r1 = r1.mContext
            android.content.ContentResolver r1 = r1.getContentResolver()
            java.lang.String r3 = "op_video_enhancer"
            android.provider.Settings.Global.putInt(r1, r3, r2)
            goto L_0x003d
        L_0x0024:
            android.content.Context r1 = r1.mContext
            android.content.ContentResolver r1 = r1.getContentResolver()
            java.lang.String r3 = "op_iris_video_sdr2hdr_status"
            android.provider.Settings.System.putInt(r1, r3, r2)
            if (r2 == 0) goto L_0x0034
            java.lang.String r1 = "1"
            goto L_0x0036
        L_0x0034:
            java.lang.String r1 = "0"
        L_0x0036:
            java.lang.String r2 = "video_enhancer"
            java.lang.String r3 = "status"
            com.oneplus.settings.utils.OPUtils.sendAnalytics(r2, r3, r1)
        L_0x003d:
            r1 = 1
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.oneplus.settings.OPVideoGraphicsDynamicOptimizationSettings.onPreferenceChange(androidx.preference.Preference, java.lang.Object):boolean");
    }
}
