package com.oneplus.common;

import android.content.Context;
import android.content.res.Resources;
import android.provider.Settings;

public class NavigationButtonUtils {
    public static boolean isGestureNavigationBar(Context context) {
        return 2 == getSystemIntegerRes(context, "config_navBarInteractionMode");
    }

    public static boolean is3ButtonNavigationBar(Context context) {
        return getSystemIntegerRes(context, "config_navBarInteractionMode") == 0;
    }

    public static int getSystemIntegerRes(Context context, String str) {
        Resources resources = context.getResources();
        int identifier = resources.getIdentifier(str, "integer", "android");
        if (identifier != 0) {
            return resources.getInteger(identifier);
        }
        return -1;
    }

    public static boolean isGestureButtonShowOnCreen(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "buttons_show_on_screen_navkeys", 0) == 1;
    }
}
