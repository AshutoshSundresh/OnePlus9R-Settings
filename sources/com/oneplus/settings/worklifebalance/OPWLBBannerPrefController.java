package com.oneplus.settings.worklifebalance;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.provider.Settings;
import android.util.Log;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settingslib.core.lifecycle.Lifecycle;
import com.android.settingslib.core.lifecycle.LifecycleObserver;
import com.android.settingslib.core.lifecycle.events.OnPause;
import com.android.settingslib.core.lifecycle.events.OnResume;
import com.oneplus.settings.utils.OPUtils;

public class OPWLBBannerPrefController extends BasePreferenceController implements LifecycleObserver, OnResume, OnPause {
    private static final String PREF_KEY = "worklifebalance";
    private static final String TAG = "com.oneplus.settings.worklifebalance.OPWLBBannerPrefController";
    private Context mContext;
    private OPWLBBannerPreference mOPWLBBannerPreference;

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

    @Override // com.android.settingslib.core.lifecycle.events.OnPause
    public void onPause() {
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean useDynamicSliceSummary() {
        return super.useDynamicSliceSummary();
    }

    public OPWLBBannerPrefController(Context context, OPWLBBannerPreference oPWLBBannerPreference) {
        super(context, PREF_KEY);
        this.mOPWLBBannerPreference = oPWLBBannerPreference;
        this.mContext = context;
    }

    public void setLifeCycle(Lifecycle lifecycle) {
        lifecycle.addObserver(this);
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return OPUtils.isAppExist(this.mContext, "com.oneplus.opwlb") ? 0 : 3;
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnResume
    public void onResume() {
        int isWLBConfigured = isWLBConfigured();
        String str = TAG;
        Log.d(str, "resume setting WLB pref available status=" + isWLBConfigured + " pref:" + this.mOPWLBBannerPreference);
        OPWLBBannerPreference oPWLBBannerPreference = this.mOPWLBBannerPreference;
        if (oPWLBBannerPreference != null && isWLBConfigured == 1) {
            oPWLBBannerPreference.clearNew();
        }
    }

    private int isWLBConfigured() {
        return Settings.System.getInt(this.mContext.getContentResolver(), "oneplus_wlb_setup_done", 0);
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public boolean handlePreferenceTreeClick(Preference preference) {
        if (!PREF_KEY.equals(preference.getKey())) {
            return false;
        }
        this.mContext.startActivity(new Intent("com.oneplus.intent.ACTION_LAUNCH_WLB"));
        return true;
    }
}
