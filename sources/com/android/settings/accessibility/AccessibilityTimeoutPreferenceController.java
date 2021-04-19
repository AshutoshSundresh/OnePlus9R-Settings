package com.android.settings.accessibility;

import android.content.Context;
import android.content.IntentFilter;
import android.provider.Settings;
import android.util.Log;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import com.android.settings.C0003R$array;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;

public class AccessibilityTimeoutPreferenceController extends BasePreferenceController implements Preference.OnPreferenceChangeListener {
    private Context mContext;

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return 0;
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

    public AccessibilityTimeoutPreferenceController(Context context, String str) {
        super(context, str);
        this.mContext = context;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public CharSequence getSummary() {
        String[] stringArray = this.mContext.getResources().getStringArray(C0003R$array.accessibility_timeout_summaries);
        String[] stringArray2 = this.mContext.getResources().getStringArray(C0003R$array.accessibility_timeout_selector_values);
        String valueOf = String.valueOf(AccessibilityTimeoutController.getSecureAccessibilityTimeoutValue(this.mContext.getContentResolver(), "accessibility_interactive_ui_timeout_ms"));
        int i = 0;
        int i2 = -1;
        for (int i3 = 0; i3 < stringArray2.length; i3++) {
            if (stringArray2[i3].equals(valueOf)) {
                i2 = i3;
            }
        }
        if (i2 != -1) {
            i = i2;
        }
        return stringArray[i];
    }

    @Override // androidx.preference.Preference.OnPreferenceChangeListener
    public boolean onPreferenceChange(Preference preference, Object obj) {
        try {
            String str = (String) obj;
            Log.d("AccessibilityTimeoutPreferenceController", "onPreferenceChange newValue = " + str);
            Settings.Secure.putString(this.mContext.getContentResolver(), "accessibility_non_interactive_ui_timeout_ms", str);
            Settings.Secure.putString(this.mContext.getContentResolver(), "accessibility_interactive_ui_timeout_ms", str);
            updateState((ListPreference) preference);
            return false;
        } catch (NumberFormatException unused) {
            return false;
        }
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public void updateState(Preference preference) {
        super.updateState(preference);
        if (preference instanceof ListPreference) {
            ((ListPreference) preference).setValue(String.valueOf(AccessibilityTimeoutController.getSecureAccessibilityTimeoutValue(this.mContext.getContentResolver(), "accessibility_interactive_ui_timeout_ms")));
        }
    }
}
