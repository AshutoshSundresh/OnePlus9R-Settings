package com.oneplus.settings.system;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ResolveInfo;
import android.os.UserManager;
import android.util.Log;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0005R$bool;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.ProductUtils;

public class OPUsvSystemUpdateController extends BasePreferenceController {
    private static final String KEY_OP_VZW_SYSTEM_UPDATE_SETTINGS = "oneplus_vzw_system_update_settings";
    private static final String TAG = "OPUsvSystemUpdateController";
    private Context mContext;
    private final UserManager mUm;
    private Preference mUpdatePreference;

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
        return KEY_OP_VZW_SYSTEM_UPDATE_SETTINGS;
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

    public OPUsvSystemUpdateController(Context context, String str) {
        super(context, str);
        this.mContext = context;
        this.mUm = UserManager.get(context);
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return isNeedAvailable() ? 0 : 3;
    }

    public boolean isNeedAvailable() {
        return !this.mContext.getResources().getBoolean(C0005R$bool.config_use_gota) && ProductUtils.isUsvMode() && (OPUtils.isAppPakExist(this.mContext, "com.oneplus.dm") || OPUtils.isAppPakExist(this.mContext, "com.oneplus.oma.dm")) && this.mUm.isAdminUser();
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        if (isAvailable()) {
            this.mUpdatePreference = preferenceScreen.findPreference(getPreferenceKey());
        }
        if (this.mUpdatePreference != null) {
            ResolveInfo resolveActivity = this.mContext.getPackageManager().resolveActivity(this.mUpdatePreference.getIntent(), 65536);
            if (resolveActivity == null) {
                Log.d(TAG, "Resolve info is null");
            }
            if (!(this.mUpdatePreference.getIntent() == null || this.mUpdatePreference.getIntent().resolveActivity(this.mContext.getPackageManager()) == null)) {
                if (!ProductUtils.isUsvMode()) {
                    return;
                }
                if ((!OPUtils.isAppPakExist(this.mContext, "com.oneplus.dm") && !OPUtils.isAppPakExist(this.mContext, "com.oneplus.oma.dm")) || resolveActivity != null) {
                    return;
                }
            }
            this.mUpdatePreference.setEnabled(false);
        }
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public boolean handlePreferenceTreeClick(Preference preference) {
        if (!KEY_OP_VZW_SYSTEM_UPDATE_SETTINGS.equals(preference.getKey())) {
            return false;
        }
        try {
            Intent intent = new Intent();
            intent.setFlags(268435456);
            if (OPUtils.isAppPakExist(this.mContext, "com.oneplus.dm")) {
                intent.setClassName("com.oneplus.dm", "com.oneplus.dm.SystemUpdateActivity");
            } else if (ProductUtils.isUsvMode()) {
                intent.setClassName("com.oneplus.oma.dm", "com.oma.business.ui.MainActivity");
            }
            this.mContext.startActivity(intent);
            return true;
        } catch (ActivityNotFoundException e) {
            e.printStackTrace();
            return true;
        }
    }
}
