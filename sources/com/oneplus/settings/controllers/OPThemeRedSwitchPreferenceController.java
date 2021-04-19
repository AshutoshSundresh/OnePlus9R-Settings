package com.oneplus.settings.controllers;

import android.app.ActivityManager;
import android.app.UiModeManager;
import android.content.Context;
import android.content.IntentFilter;
import android.os.SystemProperties;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0017R$string;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settingslib.core.AbstractPreferenceController;
import com.android.settingslib.utils.ThreadUtils;
import com.oneplus.compat.util.OpThemeNative;
import com.oneplus.settings.ui.OPThemeIconPreference;
import com.oneplus.settings.utils.OPThemeUtils;
import com.oneplus.settings.utils.OPUtils;
import java.util.HashMap;

public class OPThemeRedSwitchPreferenceController extends BasePreferenceController implements Preference.OnPreferenceChangeListener {
    private static final String TAG = "OPThemeRedSwitchPreferenceController";
    Preference mColorAccentPreference;
    int mCurrentMode;
    ListPreference mPreference;
    OPThemeIconPreference mThemeIconPreference;
    UiModeManager mUiModeManager;

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

    public OPThemeRedSwitchPreferenceController(Context context, String str) {
        super(context, str);
        this.mUiModeManager = (UiModeManager) context.getSystemService(UiModeManager.class);
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return OPThemeUtils.isSupportREDTheme() ? 0 : 3;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        Log.d(TAG, "displayPreference");
        Preference findPreference = preferenceScreen.findPreference("preference_divider_line");
        this.mPreference = (ListPreference) preferenceScreen.findPreference(getPreferenceKey());
        this.mThemeIconPreference = (OPThemeIconPreference) preferenceScreen.findPreference("oneplus_theme_custom_key");
        ListPreference listPreference = this.mPreference;
        if (listPreference != null) {
            listPreference.setValue(getSummary().toString());
        }
        this.mCurrentMode = getCurrentMode();
        if (findPreference != null) {
            findPreference.setVisible(getAvailabilityStatus() == 0);
        }
        this.mColorAccentPreference = preferenceScreen.findPreference("oneplus_theme_accent_color");
        updateColorAccentPreference();
    }

    private void updateColorAccentPreference() {
        if (this.mColorAccentPreference != null) {
            if (!OPThemeUtils.isSupportREDTheme() || !OPThemeUtils.isCurrentREDTheme(this.mContext)) {
                this.mColorAccentPreference.setEnabled(true);
            } else {
                this.mColorAccentPreference.setEnabled(false);
            }
            Preference preference = this.mColorAccentPreference;
            preference.setSummary(preference.getSummary());
        }
    }

    private int getCurrentMode() {
        return this.mPreference.findIndexOfValue(this.mContext.getString(OPThemeUtils.isCurrentREDTheme(this.mContext) ? C0017R$string.op_red_theme : C0017R$string.aod_clock_default));
    }

    @Override // androidx.preference.Preference.OnPreferenceChangeListener
    public final boolean onPreferenceChange(Preference preference, final Object obj) {
        int findIndexOfValue = this.mPreference.findIndexOfValue((String) obj);
        if (findIndexOfValue == this.mCurrentMode) {
            return false;
        }
        closeAutoDarkMode();
        this.mCurrentMode = findIndexOfValue;
        boolean z = findIndexOfValue == this.mPreference.findIndexOfValue(this.mContext.getString(C0017R$string.op_red_theme));
        if (z && isCurrentDarkMode()) {
            Settings.System.putInt(this.mContext.getContentResolver(), "already_black_mode", 1);
            ThreadUtils.getUiThreadHandler().postDelayed(new Runnable() {
                /* class com.oneplus.settings.controllers.OPThemeRedSwitchPreferenceController.AnonymousClass1 */

                public void run() {
                    Log.d(OPThemeRedSwitchPreferenceController.TAG, "switchToRedTheme");
                    OPThemeRedSwitchPreferenceController.this.switchToRedTheme();
                    OPThemeRedSwitchPreferenceController.this.updateUI(obj);
                    OPThemeRedSwitchPreferenceController.this.enableTheme();
                }
            }, 300);
            return true;
        } else if (z || Settings.System.getInt(this.mContext.getContentResolver(), "already_black_mode", 0) != 1) {
            switchTheme(z);
            updateUI(obj);
            ThreadUtils.getUiThreadHandler().postDelayed(new Runnable() {
                /* class com.oneplus.settings.controllers.OPThemeRedSwitchPreferenceController.AnonymousClass3 */

                public void run() {
                    OPThemeRedSwitchPreferenceController.this.enableDarkMode();
                }
            }, 400);
            return true;
        } else {
            ThreadUtils.getUiThreadHandler().postDelayed(new Runnable() {
                /* class com.oneplus.settings.controllers.OPThemeRedSwitchPreferenceController.AnonymousClass2 */

                public void run() {
                    Log.d(OPThemeRedSwitchPreferenceController.TAG, "switchToNormalTheme");
                    OPThemeRedSwitchPreferenceController.this.switchToNormalTheme();
                    OPThemeRedSwitchPreferenceController.this.updateUI(obj);
                    OPThemeRedSwitchPreferenceController.this.enableTheme();
                }
            }, 300);
            return true;
        }
    }

    private void switchTheme(boolean z) {
        if (z) {
            switchToRedTheme();
        } else {
            switchToNormalTheme();
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void enableTheme() {
        ThreadUtils.getUiThreadHandler().postDelayed(new Runnable() {
            /* class com.oneplus.settings.controllers.OPThemeRedSwitchPreferenceController.AnonymousClass4 */

            public void run() {
                OPThemeUtils.enableTheme("oneplus_shape", OPThemeUtils.getCurrentShapeByIndex(OPThemeUtils.getCurrentShape(((AbstractPreferenceController) OPThemeRedSwitchPreferenceController.this).mContext)), ((AbstractPreferenceController) OPThemeRedSwitchPreferenceController.this).mContext);
            }
        }, 100);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateUI(Object obj) {
        this.mPreference.setValue((String) obj);
        updateColorAccentPreference();
        this.mThemeIconPreference.refreshUI();
        this.mPreference.setSummary(getSummary());
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public CharSequence getSummary() {
        if (OPThemeUtils.isCurrentREDTheme(this.mContext)) {
            return this.mContext.getString(C0017R$string.op_red_theme);
        }
        return this.mContext.getString(C0017R$string.aod_clock_default);
    }

    public void enableDarkMode() {
        Log.d(TAG, "enableDarkMode");
        int i = 0;
        Settings.System.putInt(this.mContext.getContentResolver(), "already_black_mode", 0);
        int i2 = 1;
        if ((this.mContext.getResources().getConfiguration().uiMode & 32) != 0) {
            i = 1;
        }
        String str = i != 0 ? "0" : "1";
        Settings.System.putInt(this.mContext.getContentResolver(), "oem_black_mode", i ^ 1);
        SystemProperties.set("persist.sys.theme.status", str);
        if (i == 0) {
            i2 = 2;
        }
        this.mUiModeManager.setNightMode(i2);
    }

    public void setRedAccentColor() {
        String string = this.mContext.getString(C0017R$string.op_control_red_theme_accent_color);
        Settings.System.putStringForUser(this.mContext.getContentResolver(), "oem_black_mode_last_accent_color", Settings.System.getStringForUser(this.mContext.getContentResolver(), "oem_black_mode_accent_color", -2), -2);
        Settings.System.putStringForUser(this.mContext.getContentResolver(), "oem_black_mode_accent_color", string, -2);
        Settings.System.putStringForUser(this.mContext.getContentResolver(), "oneplus_accent_color", string, ActivityManager.getCurrentUser());
        SystemProperties.set("persist.sys.theme.accentcolor", string.replace("#", ""));
        Log.d(TAG, "setRedAccentColor redAccentColor = " + string);
        String textAccentColor = OPUtils.getTextAccentColor(string);
        Settings.System.putStringForUser(this.mContext.getContentResolver(), "oneplus_accent_text_color", textAccentColor, ActivityManager.getCurrentUser());
        SystemProperties.set("persist.sys.theme.accent_text_color", textAccentColor.replace("#", ""));
        HashMap hashMap = new HashMap();
        hashMap.put("oneplus_accentcolor", "");
        OpThemeNative.enableTheme(this.mContext, hashMap);
    }

    public void restoreLastDarkModeAccentColor() {
        String stringForUser = Settings.System.getStringForUser(this.mContext.getContentResolver(), "oem_black_mode_last_accent_color", -2);
        if (TextUtils.isEmpty(stringForUser)) {
            stringForUser = this.mContext.getString(C0017R$string.op_control_red_theme_accent_color_default);
        }
        Log.d(TAG, "restoreLastDarkModeAccentColor lastDarkModeAccentColor = " + stringForUser);
        Settings.System.putStringForUser(this.mContext.getContentResolver(), "oem_black_mode_accent_color", stringForUser, -2);
        if (!TextUtils.isEmpty(stringForUser)) {
            SystemProperties.set("persist.sys.theme.accentcolor", stringForUser.replace("#", ""));
        }
        String textAccentColor = OPUtils.getTextAccentColor(stringForUser);
        Settings.System.putStringForUser(this.mContext.getContentResolver(), "oneplus_accent_text_color", textAccentColor, ActivityManager.getCurrentUser());
        if (!TextUtils.isEmpty(textAccentColor)) {
            SystemProperties.set("persist.sys.theme.accent_text_color", textAccentColor.replace("#", ""));
        }
        HashMap hashMap = new HashMap();
        hashMap.put("oneplus_accentcolor", "");
        OpThemeNative.enableTheme(this.mContext, hashMap);
    }

    private boolean isCurrentDarkMode() {
        return (this.mContext.getResources().getConfiguration().uiMode & 32) != 0;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void switchToRedTheme() {
        setRedAccentColor();
        OPThemeUtils.setCurrentREDTheme(this.mContext, 1);
        Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "aod_clock_style", 50, -2);
        Settings.System.putIntForUser(this.mContext.getContentResolver(), "op_custom_unlock_animation_style", 11, -2);
        OPThemeUtils.setCurrentHorizonLight(this.mContext, 20);
    }

    private void closeAutoDarkMode() {
        if (this.mUiModeManager.getNightMode() == 0 || this.mUiModeManager.getNightMode() == 3) {
            int i = 1;
            boolean z = (this.mContext.getResources().getConfiguration().uiMode & 32) != 0;
            Log.d(TAG, "closeAutoDarkMode active = " + z);
            if (z) {
                i = 2;
            }
            this.mUiModeManager.setNightMode(i);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void switchToNormalTheme() {
        restoreLastDarkModeAccentColor();
        OPThemeUtils.setCurrentREDTheme(this.mContext, 0);
        Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "aod_clock_style", 0, -2);
        Settings.System.putIntForUser(this.mContext.getContentResolver(), "op_custom_unlock_animation_style", 0, -2);
        OPThemeUtils.setCurrentHorizonLight(this.mContext, 0);
    }
}
