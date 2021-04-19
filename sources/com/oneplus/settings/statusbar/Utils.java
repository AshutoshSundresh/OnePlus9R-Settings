package com.oneplus.settings.statusbar;

import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.Context;
import android.provider.Settings;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.ArraySet;
import android.util.Log;
import android.util.OpFeatures;
import com.android.internal.util.ArrayUtils;
import java.util.ArrayList;
import java.util.Arrays;

public class Utils {
    private ContentResolver mContentResolver;
    private Context mContext;
    private int mCurrentUser;

    public Utils(Context context) {
        this.mContext = context;
        if (context != null) {
            this.mContentResolver = context.getContentResolver();
        }
        this.mCurrentUser = ActivityManager.getCurrentUser();
    }

    public static ArraySet<String> getIconBlacklist(String str) {
        String[] strArr;
        ArraySet<String> arraySet = new ArraySet<>();
        String[] strArr2 = new String[0];
        if (str == null) {
            strArr = addBlackList(strArr2, new String[]{"rotate", "networkspeed"});
            TelephonyManager telephonyManager = TelephonyManager.getDefault();
            if (telephonyManager != null && TextUtils.equals(telephonyManager.getSimOperatorNumeric(SubscriptionManager.getDefaultDataSubscriptionId()), "23410")) {
                Log.d("Utils", "O2 UK sim, add volte/vowifi to blacklist by default");
                strArr = addBlackList(strArr, new String[]{"volte", "vowifi"});
            }
            if (OpFeatures.isSupport(new int[]{362})) {
                strArr = addBlackList(strArr, new String[]{"volte"});
            }
        } else {
            strArr = str.split(",");
        }
        for (String str2 : strArr) {
            if (!TextUtils.isEmpty(str2)) {
                arraySet.add(str2);
            }
        }
        return arraySet;
    }

    static String[] addBlackList(String[] strArr, String[] strArr2) {
        ArrayList arrayList = new ArrayList(Arrays.asList(strArr));
        for (String str : strArr2) {
            if (!ArrayUtils.contains(strArr, str)) {
                arrayList.add(str);
            }
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public String getValue(String str) {
        return Settings.Secure.getStringForUser(this.mContentResolver, str, this.mCurrentUser);
    }

    public void setValue(String str, String str2) {
        Settings.Secure.putStringForUser(this.mContentResolver, str, str2, this.mCurrentUser);
    }

    public int getValue(String str, int i) {
        return Settings.Secure.getIntForUser(this.mContentResolver, str, i, this.mCurrentUser);
    }

    public void setValue(String str, int i) {
        Settings.Secure.putIntForUser(this.mContentResolver, str, i, this.mCurrentUser);
    }
}
