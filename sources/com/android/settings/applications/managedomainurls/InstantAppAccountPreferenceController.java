package com.android.settings.applications.managedomainurls;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import androidx.preference.Preference;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.oneplus.settings.utils.OPUtils;

public class InstantAppAccountPreferenceController extends BasePreferenceController {
    private static final String CLASS_NAME_GMS = "com.google.android.gms.instantapps.settings.SettingsActivity";
    private static final String CLASS_NAME_VENDING = "com.google.android.finsky.instantapps.SettingsActivity";
    private static final String PACKAGE_NAME_VENDING = "com.android.vending";
    private Intent mLaunchIntent;

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

    public InstantAppAccountPreferenceController(Context context, String str) {
        super(context, str);
        initAppSettingsIntent();
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        if (this.mLaunchIntent == null || WebActionCategoryController.isDisableWebActions(this.mContext)) {
            return 3;
        }
        ComponentName componentName = new ComponentName("com.google.android.gms", CLASS_NAME_GMS);
        Intent intent = this.mLaunchIntent;
        if (intent == null || !componentName.equals(intent.getComponent())) {
            return 0;
        }
        Intent intent2 = new Intent();
        intent2.setClassName(PACKAGE_NAME_VENDING, CLASS_NAME_VENDING);
        if (!OPUtils.isActionExist(this.mContext, intent2, null)) {
            return 3;
        }
        return 0;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public boolean handlePreferenceTreeClick(Preference preference) {
        if (!getPreferenceKey().equals(preference.getKey())) {
            return false;
        }
        Intent intent = this.mLaunchIntent;
        if (intent == null) {
            return true;
        }
        this.mContext.startActivity(intent);
        return true;
    }

    private void initAppSettingsIntent() {
        ComponentName instantAppResolverSettingsComponent = this.mContext.getPackageManager().getInstantAppResolverSettingsComponent();
        Intent component = instantAppResolverSettingsComponent != null ? new Intent().setComponent(instantAppResolverSettingsComponent) : null;
        if (component != null) {
            this.mLaunchIntent = component;
        }
    }
}
