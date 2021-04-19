package com.android.settings.datausage;

import android.app.AppGlobals;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.UserHandle;
import android.provider.Settings;
import android.util.Log;
import com.google.android.collect.Maps;
import com.oneplus.settings.utils.OPSNSUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OPDataUsageUtils {
    public static final long getDataWarnBytes(Context context, int i) {
        ContentResolver contentResolver = context.getContentResolver();
        return Settings.System.getLong(contentResolver, "key_datausage_alert_number_sim_" + i, 0);
    }

    public static final int getDataWarnState(Context context, int i) {
        ContentResolver contentResolver = context.getContentResolver();
        return Settings.System.getInt(contentResolver, "key_ten_percent_low_remaining_state_sim_" + i, 0);
    }

    public static final long getDataLimitBytes(Context context, int i) {
        ContentResolver contentResolver = context.getContentResolver();
        return Settings.System.getLong(contentResolver, "key_datausage_limit_number_sim_" + i, 0);
    }

    public static final int getDataLimitState(Context context, int i) {
        ContentResolver contentResolver = context.getContentResolver();
        return Settings.System.getInt(contentResolver, "key_data_usage_total_state_subid_" + i, 0);
    }

    public static long[] getDataUsageSectionTimeMillByAccountDay(Context context, int i) {
        if (i != -1) {
            return getOneplusDataUsageRegion(context, OPSNSUtils.findSlotIdBySubId(i));
        }
        return getOneplusDataUsageRegion(context, -1);
    }

    public static List<ApplicationInfo> getApplicationInfoByUid(Context context, int i) {
        ArrayList arrayList = new ArrayList();
        String[] packagesForUid = context.getPackageManager().getPackagesForUid(i);
        int length = packagesForUid != null ? packagesForUid.length : 0;
        try {
            int userId = UserHandle.getUserId(i);
            IPackageManager packageManager = AppGlobals.getPackageManager();
            for (int i2 = 0; i2 < length; i2++) {
                ApplicationInfo applicationInfo = packageManager.getApplicationInfo(packagesForUid[i2], 0, userId);
                if (applicationInfo != null) {
                    arrayList.add(applicationInfo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arrayList;
    }

    public static Map<String, Object> getOneplusDataUsage(Context context, int i) {
        Bundle bundle = new Bundle();
        bundle.putInt("oneplus_datausage_slotid", i);
        try {
            Bundle call = context.getContentResolver().call(Uri.parse("content://com.oneplus.security.database.comm.SafeProvider"), "method_query_oneplus_datausage", (String) null, bundle);
            if (call == null) {
                return null;
            }
            int i2 = call.getInt("oneplus_datausage_error_code");
            int i3 = call.getInt("oneplus_datausage_accountday");
            long j = call.getLong("oneplus_datausage_time_start");
            long j2 = call.getLong("oneplus_datausage_time_end");
            long j3 = call.getLong("oneplus_datausage_total");
            long j4 = call.getLong("oneplus_datausage_used");
            boolean z = call.getBoolean("oneplus_datausage_warn_state");
            long j5 = call.getLong("oneplus_datausage_warn_value");
            boolean z2 = call.getBoolean("oneplus_datausage_limit_state");
            HashMap newHashMap = Maps.newHashMap();
            newHashMap.put("oneplus_datausage_error_code", Integer.valueOf(i2));
            newHashMap.put("oneplus_datausage_accountday", Integer.valueOf(i3));
            newHashMap.put("oneplus_datausage_total", Long.valueOf(j3));
            newHashMap.put("oneplus_datausage_used", Long.valueOf(j4));
            newHashMap.put("oneplus_datausage_time_start", Long.valueOf(j));
            newHashMap.put("oneplus_datausage_time_end", Long.valueOf(j2));
            newHashMap.put("oneplus_datausage_warn_state", Boolean.valueOf(z));
            newHashMap.put("oneplus_datausage_warn_value", Long.valueOf(j5));
            newHashMap.put("oneplus_datausage_limit_state", Boolean.valueOf(z2));
            return newHashMap;
        } catch (Exception e) {
            Log.e("OPDataUsageUtils", "getOneplusDataUsage error");
            e.printStackTrace();
            return null;
        }
    }

    public static long[] getOneplusDataUsageRegion(Context context, int i) {
        Bundle bundle = new Bundle();
        bundle.putInt("oneplus_datausage_slotid", i);
        try {
            Bundle call = context.getContentResolver().call(Uri.parse("content://com.oneplus.security.database.SafeProvider"), "method_query_oneplus_datausage_region", (String) null, bundle);
            if (!(call == null || call.getInt("oneplus_datausage_error_code") == 2)) {
                return new long[]{call.getLong("oneplus_datausage_time_start"), call.getLong("oneplus_datausage_time_end")};
            }
        } catch (Exception e) {
            Log.e("OPDataUsageUtils", "getOneplusDataUsage error");
            e.printStackTrace();
        }
        return new long[]{0, System.currentTimeMillis()};
    }
}
