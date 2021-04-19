package com.android.settings.core;

import android.content.Context;
import android.content.IntentFilter;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.Observer;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0017R$string;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settingslib.utils.ThreadUtils;

public abstract class LiveDataController extends BasePreferenceController {
    private MutableLiveData<CharSequence> mData = new MutableLiveData<>();
    private final Observer<CharSequence> mObserver;
    private Preference mPreference;
    protected CharSequence mSummary;

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

    /* access modifiers changed from: protected */
    public abstract CharSequence getSummaryTextInBackground();

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

    public LiveDataController(Context context, String str) {
        super(context, str);
        this.mSummary = context.getText(C0017R$string.summary_placeholder);
        this.mObserver = new Observer<CharSequence>() {
            /* class com.android.settings.core.LiveDataController.AnonymousClass1 */

            public void onChanged(CharSequence charSequence) {
                LiveDataController liveDataController = LiveDataController.this;
                liveDataController.mSummary = charSequence;
                liveDataController.refreshSummary(liveDataController.mPreference);
            }
        };
    }

    public void removeLifeCycleOwner() {
        MutableLiveData<CharSequence> mutableLiveData = this.mData;
        if (mutableLiveData != null) {
            mutableLiveData.removeObserver(this.mObserver);
        }
    }

    public void initLifeCycleOwner(Fragment fragment) {
        this.mData.observe(fragment, this.mObserver);
        ThreadUtils.postOnBackgroundThread(new Runnable() {
            /* class com.android.settings.core.$$Lambda$LiveDataController$DcM3i2QJWAMPbUz_Uv88EhW3gv8 */

            public final void run() {
                LiveDataController.this.lambda$initLifeCycleOwner$0$LiveDataController();
            }
        });
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$initLifeCycleOwner$0 */
    public /* synthetic */ void lambda$initLifeCycleOwner$0$LiveDataController() {
        this.mData.postValue(getSummaryTextInBackground());
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        this.mPreference = preferenceScreen.findPreference(getPreferenceKey());
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public CharSequence getSummary() {
        return this.mSummary;
    }
}
