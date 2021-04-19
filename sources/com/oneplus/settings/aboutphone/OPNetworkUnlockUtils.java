package com.oneplus.settings.aboutphone;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.provider.Settings;

public class OPNetworkUnlockUtils {
    public static boolean getUnlockAppEnabledStatus(Context context) {
        if (context != null) {
            try {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo("com.tmobile.rsuapp", 0);
                if (packageInfo != null) {
                    return packageInfo.applicationInfo.enabled;
                }
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static void saveNetworkUnlockStatus(Context context, boolean z) {
        if (context != null) {
            Settings.Global.putInt(context.getContentResolver(), "key_network_unlock_status", !z ? 1 : 0);
        }
    }

    public static boolean getNetworkUnlockStatus(Context context) {
        return context == null || Settings.Global.getInt(context.getContentResolver(), "key_network_unlock_status", 0) == 0;
    }
}
