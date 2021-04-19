package com.oneplus.settings.controllers;

import android.content.Context;
import android.content.IntentFilter;
import android.text.TextUtils;
import android.util.Log;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.dashboard.DashboardFeatureProvider;
import com.android.settings.dashboard.DashboardFragmentRegistry;
import com.android.settings.overlay.FeatureFactory;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settingslib.drawer.DashboardCategory;
import com.android.settingslib.drawer.Tile;
import java.util.List;

public class OPDashboardTilePlaceholderPreferenceCategoryController extends BasePreferenceController {
    private String mCategoryKeyId;
    private DashboardFeatureProvider mDashboardFeatureProvider;

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

    public OPDashboardTilePlaceholderPreferenceCategoryController(Context context, String str, String str2) {
        super(context, str);
        this.mDashboardFeatureProvider = FeatureFactory.getFactory(context).getDashboardFeatureProvider(context);
        this.mCategoryKeyId = str2;
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        String str = DashboardFragmentRegistry.PARENT_TO_CATEGORY_KEY_MAP.get(this.mCategoryKeyId);
        Log.d("OPDashboardTilePlaceholderPreferenceCategoryController", "Secureti status categoryKey:" + str + " mCategoryKeyId:" + this.mCategoryKeyId);
        if (TextUtils.isEmpty(str)) {
            return 3;
        }
        DashboardCategory tilesForCategory = this.mDashboardFeatureProvider.getTilesForCategory(str);
        Log.d("OPDashboardTilePlaceholderPreferenceCategoryController", "Secureti status category:" + tilesForCategory);
        if (tilesForCategory == null) {
            return 2;
        }
        List<Tile> tiles = tilesForCategory.getTiles();
        Log.d("OPDashboardTilePlaceholderPreferenceCategoryController", "Secureti status tiles:" + tiles);
        if (tiles == null) {
            return 2;
        }
        return 0;
    }
}
