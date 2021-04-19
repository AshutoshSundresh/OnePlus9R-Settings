package com.oneplus.settings.utils;

import android.util.OpFeatures;
import java.util.ArrayList;

public class ProductUtils {
    public static boolean isUsvMode() {
        return OpFeatures.isSupport(new int[]{231});
    }

    public static String[] splitTextToNChar(String str, int i) {
        ArrayList arrayList = new ArrayList();
        int length = str.length();
        int i2 = 0;
        while (i2 < length) {
            int i3 = i2 + i;
            arrayList.add(str.substring(i2, Math.min(length, i3)));
            i2 = i3;
        }
        return (String[]) arrayList.toArray(new String[0]);
    }

    public static boolean isdual5GProject() {
        return OpFeatures.isSupport(new int[]{312});
    }

    public static boolean isLDEV() {
        return OpFeatures.isSupport(new int[]{337});
    }
}
