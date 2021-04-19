package com.oneplus.settings.utils;

import android.app.ActivityManager;
import android.app.UiModeManager;
import android.content.Context;
import android.os.Handler;
import android.os.SystemProperties;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Button;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import com.android.settings.C0006R$color;
import com.oneplus.compat.util.OpThemeNative;
import com.oneplus.custom.utils.OpCustomizeSettings;
import com.oneplus.settings.SettingsBaseApplication;
import java.io.PrintStream;
import java.lang.reflect.Field;
import java.util.HashMap;

public final class OPThemeUtils {
    private static int CLOCK_TYPE_DEFAULT = 0;
    public static String KEY_AOD_CLOCK_STYLE = "aod_clock_style";

    public static String getCurrentHorizonLightByIndex(Context context, int i) {
        return i != 1 ? i != 2 ? i != 3 ? i != 10 ? i != 20 ? "blue" : "red1" : "mcl" : "purple" : "gold" : "red";
    }

    public static String getCurrentShapeByIndex(int i) {
        return i != 2 ? i != 3 ? i != 4 ? "circle" : "squircle" : "teardrop" : "roundedrect";
    }

    public static void setDefaultWallpaper(Context context, String str) {
    }

    public static int getCurrentCustomizationTheme(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "op_customization_theme_style", 0);
    }

    public static int getCurrentBasicColorMode(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "oem_black_mode", 0);
    }

    public static void setCurrentBasicColorMode(Context context, int i) {
        Settings.System.putInt(context.getContentResolver(), "oem_black_mode", i);
        SystemProperties.set("persist.sys.theme.status", String.valueOf(i));
    }

    public static int getCurrentShape(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "oneplus_shape", 1);
    }

    public static void setCurrentShape(Context context, int i) {
        Settings.System.putInt(context.getContentResolver(), "oneplus_shape", i);
    }

    public static int getCurrentFont(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "oem_font_mode", 1);
    }

    public static void setCurrentFont(Context context, int i) {
        Settings.System.putInt(context.getContentResolver(), "oem_font_mode", i);
    }

    public static void setCurrentHorizonLight(Context context, int i) {
        Settings.System.putIntForUser(context.getContentResolver(), "op_custom_horizon_light_animation_style", i, -2);
    }

    public static void enableTheme(String str, String str2, Context context) {
        HashMap hashMap = new HashMap();
        if (TextUtils.equals(str, "oneplus_basiccolor")) {
            hashMap.put("oneplus_basiccolor", "white");
            OpThemeNative.disableTheme(context, hashMap);
            hashMap.put("oneplus_basiccolor", "black");
            OpThemeNative.disableTheme(context, hashMap);
        } else if (TextUtils.equals(str, "oneplus_dynamicfont")) {
            hashMap.put("oneplus_dynamicfont", "2");
            OpThemeNative.disableTheme(context, hashMap);
            hashMap.put("oneplus_dynamicfont", "1");
            OpThemeNative.disableTheme(context, hashMap);
        } else if (TextUtils.equals(str, "oneplus_shape")) {
            hashMap.put("oneplus_shape", "squircle");
            OpThemeNative.disableTheme(context, hashMap);
            hashMap.put("oneplus_shape", "circle");
            OpThemeNative.disableTheme(context, hashMap);
            hashMap.put("oneplus_shape", "teardrop");
            OpThemeNative.disableTheme(context, hashMap);
            hashMap.put("oneplus_shape", "roundedrect");
            OpThemeNative.disableTheme(context, hashMap);
        } else if (TextUtils.equals(str, "oneplus_aodnotification")) {
            hashMap.put("oneplus_aodnotification", "gold");
            OpThemeNative.disableTheme(context, hashMap);
            hashMap.put("oneplus_aodnotification", "red");
            OpThemeNative.disableTheme(context, hashMap);
            hashMap.put("oneplus_aodnotification", "purple");
            OpThemeNative.disableTheme(context, hashMap);
        }
        PrintStream printStream = System.out;
        printStream.println("oneplus--enableTheme-category:" + str + " secondCategory:" + str2);
        HashMap hashMap2 = new HashMap();
        hashMap2.put(str, str2);
        OpThemeNative.enableTheme(context, hashMap2);
    }

    public static void disableAllThemes(Context context) {
        HashMap hashMap = new HashMap();
        hashMap.clear();
        setCurrentFont(context, 1);
        hashMap.put("oneplus_dynamicfont", "2");
        OpThemeNative.disableTheme(context, hashMap);
        hashMap.put("oneplus_dynamicfont", "1");
        OpThemeNative.disableTheme(context, hashMap);
        hashMap.clear();
        setCurrentShape(context, 1);
        hashMap.put("oneplus_shape", "squircle");
        OpThemeNative.disableTheme(context, hashMap);
        hashMap.put("oneplus_shape", "circle");
        OpThemeNative.disableTheme(context, hashMap);
        hashMap.put("oneplus_shape", "teardrop");
        OpThemeNative.disableTheme(context, hashMap);
        hashMap.put("oneplus_shape", "roundedrect");
        OpThemeNative.disableTheme(context, hashMap);
        hashMap.clear();
        setCurrentHorizonLight(context, 0);
        hashMap.put("oneplus_aodnotification", "gold");
        OpThemeNative.disableTheme(context, hashMap);
        hashMap.put("oneplus_aodnotification", "red");
        OpThemeNative.disableTheme(context, hashMap);
        hashMap.put("oneplus_aodnotification", "purple");
        OpThemeNative.disableTheme(context, hashMap);
    }

    public static void enableLightThemes(Context context) {
        disableAllThemes(context);
        setDefaultWallpaper(context, "wallpaper_g_live_blue");
        HashMap hashMap = new HashMap();
        setCurrentBasicColorMode(context, 0);
        hashMap.put("oneplus_shape", "circle");
        setCurrentShape(context, 1);
        String string = context.getString(C0006R$color.op_primary_default_light);
        hashMap.put("oneplus_accentcolor", string);
        OpThemeNative.enableTheme(context, hashMap);
        setCurrentHorizonLight(context, 0);
        Settings.System.putStringForUser(context.getContentResolver(), "oneplus_accent_color", string, ActivityManager.getCurrentUser());
        if (!TextUtils.isEmpty(string)) {
            string = string.replace("#", "");
        }
        enableAospDarkThemeDelay(context, false, 1000);
        SystemProperties.set("persist.sys.theme.accentcolor", string);
        Settings.System.putString(context.getContentResolver(), "oem_black_mode_accent_color", context.getResources().getString(C0006R$color.op_primary_default_dark));
        Settings.System.putString(context.getContentResolver(), "oem_white_mode_accent_color", context.getResources().getString(C0006R$color.op_primary_default_light));
        Settings.System.putInt(context.getContentResolver(), "oem_black_mode_accent_color_index", 0);
        Settings.System.putInt(context.getContentResolver(), "oem_white_mode_accent_color_index", 0);
        if (OPUtils.isEightSeriesProducts()) {
            Settings.System.putIntForUser(context.getContentResolver(), "op_custom_unlock_animation_style", 4, -2);
        } else {
            Settings.System.putIntForUser(context.getContentResolver(), "op_custom_unlock_animation_style", 0, -2);
        }
        Settings.Secure.putIntForUser(context.getContentResolver(), KEY_AOD_CLOCK_STYLE, CLOCK_TYPE_DEFAULT, -2);
    }

    public static boolean isSupportMclTheme() {
        return OpCustomizeSettings.CUSTOM_TYPE.MCL.equals(OpCustomizeSettings.getCustomType());
    }

    public static boolean isSupportAVGTheme() {
        return OpCustomizeSettings.CUSTOM_TYPE.AVG.equals(OpCustomizeSettings.getCustomType());
    }

    public static boolean isSupportSwTheme() {
        return OpCustomizeSettings.CUSTOM_TYPE.SW.equals(OpCustomizeSettings.getCustomType());
    }

    public static boolean isSupportCustomeTheme() {
        return isSupportMclTheme() || isSupportAVGTheme() || isSupportSwTheme();
    }

    private static void enableAospDarkThemeDelay(final Context context, final boolean z, long j) {
        new Handler().postDelayed(new Runnable() {
            /* class com.oneplus.settings.utils.OPThemeUtils.AnonymousClass1 */

            public void run() {
                Log.d("OPThemeUtils", "enableAospDarkTheme delay");
                OPThemeUtils.enableAospDarkTheme(context, z);
            }
        }, j);
    }

    /* access modifiers changed from: private */
    public static void enableAospDarkTheme(Context context, boolean z) {
        ((UiModeManager) context.getSystemService(UiModeManager.class)).setNightMode(z ? 2 : 1);
    }

    public static void setDialogTextColor(AlertDialog alertDialog) {
        try {
            Field declaredField = AlertDialog.class.getDeclaredField("mAlert");
            declaredField.setAccessible(true);
            PrintStream printStream = System.out;
            printStream.println("zhuyang--setDialogTextColor-dialog:" + alertDialog + " mAlert:" + declaredField);
            Object obj = declaredField.get(alertDialog);
            Field declaredField2 = obj.getClass().getDeclaredField("mTitleView");
            declaredField2.setAccessible(true);
            ((TextView) declaredField2.get(obj)).setTextColor(SettingsBaseApplication.mApplication.getResources().getColor(C0006R$color.op_control_text_color_primary_dark));
            Field declaredField3 = obj.getClass().getDeclaredField("mMessageView");
            declaredField3.setAccessible(true);
            ((TextView) declaredField3.get(obj)).setTextColor(SettingsBaseApplication.mApplication.getResources().getColor(C0006R$color.op_control_text_color_secondary_dark));
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e2) {
            e2.printStackTrace();
        }
    }

    public static void setDialogTextColorForO2SUW(AlertDialog alertDialog) {
        try {
            Field declaredField = AlertDialog.class.getDeclaredField("mAlert");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(alertDialog);
            Field declaredField2 = obj.getClass().getDeclaredField("mTitleView");
            declaredField2.setAccessible(true);
            ((TextView) declaredField2.get(obj)).setTextColor(SettingsBaseApplication.mApplication.getResources().getColor(C0006R$color.op_control_text_color_primary_dark));
            Field declaredField3 = obj.getClass().getDeclaredField("mMessageView");
            declaredField3.setAccessible(true);
            ((TextView) declaredField3.get(obj)).setTextColor(SettingsBaseApplication.mApplication.getResources().getColor(C0006R$color.op_control_text_color_secondary_dark));
            Field declaredField4 = obj.getClass().getDeclaredField("mButtonPositive");
            declaredField4.setAccessible(true);
            ((Button) declaredField4.get(obj)).setTextColor(SettingsBaseApplication.mApplication.getResources().getColor(C0006R$color.oneplus_setupwizard_accent_color));
            Field declaredField5 = obj.getClass().getDeclaredField("mButtonNegative");
            declaredField5.setAccessible(true);
            ((Button) declaredField5.get(obj)).setTextColor(SettingsBaseApplication.mApplication.getResources().getColor(C0006R$color.oneplus_setupwizard_accent_color));
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e2) {
            e2.printStackTrace();
        }
    }

    public static void setDialogButtonColorForO2SUW(AlertDialog alertDialog) {
        try {
            Field declaredField = AlertDialog.class.getDeclaredField("mAlert");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(alertDialog);
            Field declaredField2 = obj.getClass().getDeclaredField("mButtonPositive");
            declaredField2.setAccessible(true);
            ((Button) declaredField2.get(obj)).setTextColor(SettingsBaseApplication.mApplication.getResources().getColor(C0006R$color.oneplus_setupwizard_accent_color));
            Field declaredField3 = obj.getClass().getDeclaredField("mButtonNegative");
            declaredField3.setAccessible(true);
            ((Button) declaredField3.get(obj)).setTextColor(SettingsBaseApplication.mApplication.getResources().getColor(C0006R$color.oneplus_setupwizard_accent_color));
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e2) {
            e2.printStackTrace();
        }
    }

    public static boolean isSupportREDTheme() {
        return OpCustomizeSettings.CUSTOM_TYPE.RED.equals(OpCustomizeSettings.getCustomType());
    }

    public static void setCurrentREDTheme(Context context, int i) {
        Settings.System.putInt(context.getContentResolver(), "oem_special_theme", i);
        SystemProperties.set("persist.sys.oem.special.theme", String.valueOf(i));
    }

    public static boolean isCurrentREDTheme(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "oem_special_theme", 0) == 1;
    }

    public static boolean isCurrentMCLTheme(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "oem_special_theme", 0) == 1;
    }

    public static void setCurrentMCLTheme(Context context, int i) {
        Settings.System.putInt(context.getContentResolver(), "oem_special_theme", i);
        SystemProperties.set("persist.sys.oem.special.theme", String.valueOf(i));
    }
}
