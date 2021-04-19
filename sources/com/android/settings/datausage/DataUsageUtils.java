package com.android.settings.datausage;

import android.app.usage.NetworkStats;
import android.app.usage.NetworkStatsManager;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkTemplate;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.provider.Settings;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.text.BidiFormatter;
import android.text.format.Formatter;
import android.util.Log;
import com.android.settings.C0017R$string;
import com.android.settings.datausage.lib.DataUsageLib;
import com.android.settings.network.ProxySubscriptionManager;
import com.oneplus.settings.utils.ProductUtils;
import java.lang.reflect.Method;
import java.util.List;
import org.codeaurora.internal.IExtTelephony;

public final class DataUsageUtils extends com.android.settingslib.net.DataUsageUtils {
    public static CharSequence formatDataUsage(Context context, long j) {
        String str;
        String str2;
        int i;
        Formatter.BytesResult formatBytes = Formatter.formatBytes(context.getResources(), j, 8);
        if (ProductUtils.isUsvMode()) {
            try {
                i = Settings.System.getInt(context.getContentResolver(), "index_data_usage_unit");
            } catch (Settings.SettingNotFoundException e) {
                e.printStackTrace();
                i = 0;
            }
            if (i == 1) {
                double d = ((double) j) / 1.073741824E9d;
                if (d < 0.01d) {
                    str2 = context.getString(C0017R$string.data_usage_less_than_value);
                } else {
                    str2 = String.format("%.2f", Double.valueOf(d));
                }
                str = context.getString(C0017R$string.data_usage_unit_gb);
            } else if (i != 2) {
                str2 = formatBytes.value;
                str = formatBytes.units;
            } else {
                double d2 = ((double) j) / 1048576.0d;
                if (d2 < 0.01d) {
                    str2 = context.getString(C0017R$string.data_usage_less_than_value);
                } else {
                    str2 = String.format("%.2f", Double.valueOf(d2));
                }
                str = context.getString(C0017R$string.data_usage_unit_mb);
            }
        } else {
            str2 = formatBytes.value;
            str = formatBytes.units;
        }
        return BidiFormatter.getInstance().unicodeWrap(context.getString(17040206, str2, str));
    }

    public static boolean hasEthernet(Context context) {
        if (!((ConnectivityManager) context.getSystemService(ConnectivityManager.class)).isNetworkSupported(9)) {
            return false;
        }
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(TelephonyManager.class);
        try {
            NetworkStats.Bucket querySummaryForUser = ((NetworkStatsManager) context.getSystemService(NetworkStatsManager.class)).querySummaryForUser(9, telephonyManager.getSubscriberId(), 0, System.currentTimeMillis());
            if (querySummaryForUser == null) {
                return false;
            }
            if (querySummaryForUser.getRxBytes() > 0 || querySummaryForUser.getTxBytes() > 0) {
                return true;
            }
            return false;
        } catch (RemoteException e) {
            Log.e("DataUsageUtils", "Exception querying network detail.", e);
            return false;
        }
    }

    public static boolean hasMobileData(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(ConnectivityManager.class);
        if (connectivityManager == null || !connectivityManager.isNetworkSupported(0)) {
            return false;
        }
        return true;
    }

    public static boolean hasReadyMobileRadio(Context context) {
        List<SubscriptionInfo> activeSubscriptionsInfo = ProxySubscriptionManager.getInstance(context).getActiveSubscriptionsInfo();
        if (activeSubscriptionsInfo == null) {
            return false;
        }
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(TelephonyManager.class);
        boolean z = true;
        for (SubscriptionInfo subscriptionInfo : activeSubscriptionsInfo) {
            z &= telephonyManager.getSimState(subscriptionInfo.getSimSlotIndex()) == 5;
        }
        if (!((ConnectivityManager) context.getSystemService(ConnectivityManager.class)).isNetworkSupported(0) || !z) {
            return false;
        }
        return true;
    }

    public static boolean hasWifiRadio(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(ConnectivityManager.class);
        if (connectivityManager == null || !connectivityManager.isNetworkSupported(1)) {
            return false;
        }
        return true;
    }

    public static int getDefaultSubscriptionId(Context context) {
        int defaultDataSubscriptionId = SubscriptionManager.getDefaultDataSubscriptionId();
        if (SubscriptionManager.isValidSubscriptionId(defaultDataSubscriptionId)) {
            return defaultDataSubscriptionId;
        }
        ProxySubscriptionManager instance = ProxySubscriptionManager.getInstance(context);
        List<SubscriptionInfo> activeSubscriptionsInfo = instance.getActiveSubscriptionsInfo();
        if (activeSubscriptionsInfo == null || activeSubscriptionsInfo.size() <= 0) {
            activeSubscriptionsInfo = instance.getAccessibleSubscriptionsInfo();
        }
        if (activeSubscriptionsInfo == null || activeSubscriptionsInfo.size() <= 0) {
            return -1;
        }
        return activeSubscriptionsInfo.get(0).getSubscriptionId();
    }

    public static NetworkTemplate getDefaultTemplate(Context context, int i) {
        if (SubscriptionManager.isValidSubscriptionId(i) && hasMobileData(context)) {
            return DataUsageLib.getMobileTemplate(context, i);
        }
        if (hasWifiRadio(context)) {
            return NetworkTemplate.buildTemplateWifiWildcard();
        }
        return NetworkTemplate.buildTemplateEthernet();
    }

    public static long getVtDataUsageBytes() {
        long j = 0;
        try {
            IExtTelephony asInterface = IExtTelephony.Stub.asInterface(ServiceManager.getService("extphone"));
            Method declaredMethod = asInterface.getClass().getDeclaredMethod("generalGetter", String.class, Bundle.class);
            declaredMethod.setAccessible(true);
            Bundle bundle = new Bundle();
            bundle.putInt("phone", 0);
            Bundle bundle2 = (Bundle) declaredMethod.invoke(asInterface, "getVtDataUsage", bundle);
            if (bundle2 != null) {
                j = bundle2.getLong("getVtDataUsage");
            }
            Log.d("DataUsageUtils", "Vt usage bytes " + j);
            return j;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
