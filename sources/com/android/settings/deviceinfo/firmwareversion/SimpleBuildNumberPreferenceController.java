package com.android.settings.deviceinfo.firmwareversion;

import android.content.Context;
import android.content.IntentFilter;
import android.os.Build;
import android.os.SystemProperties;
import android.text.BidiFormatter;
import android.text.TextUtils;
import android.util.Log;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0017R$string;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.ProductUtils;

public class SimpleBuildNumberPreferenceController extends BasePreferenceController {
    private static final String TAG = "SimpleBuildNumberPreferenceController";
    private Context mContext;
    private Preference mOSBuildNumber;

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return 1;
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

    public SimpleBuildNumberPreferenceController(Context context, String str) {
        super(context, str);
        this.mContext = context;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        this.mOSBuildNumber = preferenceScreen.findPreference("os_build_number");
        if (OPUtils.isO2()) {
            this.mOSBuildNumber.setTitle(C0017R$string.build_number);
        } else {
            this.mOSBuildNumber.setTitle(C0017R$string.op_build_number);
        }
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public CharSequence getSummary() {
        if (OPUtils.isO2()) {
            String unicodeWrap = BidiFormatter.getInstance().unicodeWrap(Build.DISPLAY);
            Context context = this.mContext;
            String string = context != null ? context.getResources().getString(C0017R$string.device_info_default) : unicodeWrap;
            if (OPUtils.isSM8X50Products()) {
                unicodeWrap = SystemProperties.get("ro.rom.version", string);
            }
            if (!ProductUtils.isUsvMode()) {
                return unicodeWrap;
            }
            String str = Build.DISPLAY;
            if (TextUtils.isEmpty(str)) {
                return BidiFormatter.getInstance().unicodeWrap(Build.DISPLAY);
            }
            String[] split = str.split("_");
            String str2 = SystemProperties.get("ro.boot.hw_version", this.mContext.getResources().getString(C0017R$string.device_info_default));
            if (!TextUtils.isEmpty(str2)) {
                int parseInt = Integer.parseInt(str2);
                if (parseInt > 13) {
                    split[1] = "_15_";
                } else {
                    split[1] = "_" + parseInt + "_";
                }
            }
            return split[0] + split[1] + split[2];
        }
        String str3 = Build.DISPLAY;
        if (TextUtils.isEmpty(str3)) {
            return BidiFormatter.getInstance().unicodeWrap(Build.DISPLAY);
        }
        String[] split2 = str3.split("_");
        if (split2.length < 3) {
            String str4 = TAG;
            Log.d(str4, "invalid displayId " + str3);
            return BidiFormatter.getInstance().unicodeWrap(Build.DISPLAY);
        }
        split2[1] = "_15_";
        return split2[0] + split2[1] + split2[2];
    }
}
