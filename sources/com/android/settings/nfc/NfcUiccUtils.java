package com.android.settings.nfc;

import android.annotation.TargetApi;
import android.content.ComponentName;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0017R$string;
import com.android.settings.nfc.PaymentBackend;
import com.oneplus.settings.SettingsBaseApplication;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class NfcUiccUtils {
    private static final String[] ESE_APPS = {"cn.oneplus.wallet", "com.finshell.wallet", "com.oppo.wallet", "com.oneplus.oppay"};

    @TargetApi(17)
    public static List<PaymentBackend.PaymentAppInfo> getSEList(Context context) {
        if (context == null) {
            return null;
        }
        String string = Settings.Global.getString(context.getApplicationContext().getContentResolver(), "nfc_multise_list");
        Log.d("NfcUiccUtils", "getSEList seListString = " + string);
        if (TextUtils.isEmpty(string)) {
            return null;
        }
        if (string.contains(",")) {
            ArrayList<String> arrayList = new ArrayList(Arrays.asList(string.split(",")));
            ArrayList arrayList2 = new ArrayList();
            for (String str : arrayList) {
                if (TextUtils.equals("SIM1", str) || TextUtils.equals("SIM2", str)) {
                    arrayList2.add(str);
                }
            }
            if (arrayList2.size() > 0) {
                return transformInfoList(context, arrayList2);
            }
            return null;
        } else if (!TextUtils.equals("SIM1", string) && !TextUtils.equals("SIM2", string)) {
            return null;
        } else {
            return transformInfoList(context, Arrays.asList(string));
        }
    }

    @TargetApi(17)
    public static boolean enableUICC(Context context, String str) {
        if (context != null) {
            return Settings.Global.putString(context.getApplicationContext().getContentResolver(), "nfc_multise_active", str);
        }
        return false;
    }

    @TargetApi(17)
    public static boolean enableUnUICC(Context context, ComponentName componentName) {
        String str = isEsePaymentApp(componentName) ? "Embedded SE" : "HCE";
        if (context != null) {
            return Settings.Global.putString(context.getApplicationContext().getContentResolver(), "nfc_multise_active", str);
        }
        return false;
    }

    @TargetApi(17)
    private static String getUICCDefault(Context context) {
        if (context == null) {
            return "";
        }
        String string = Settings.Global.getString(context.getApplicationContext().getContentResolver(), "nfc_multise_active");
        Log.d("NfcUiccUtils", "getUICCDefault activeApp = " + string);
        return (TextUtils.equals(string, "SIM1") || TextUtils.equals(string, "SIM2")) ? string : "";
    }

    public static PaymentBackend.PaymentAppInfo getUICCDefaultAppInfo(Context context) {
        List<PaymentBackend.PaymentAppInfo> sEList;
        if (!(context == null || (sEList = getSEList(context)) == null || sEList.size() == 0)) {
            String uICCDefault = getUICCDefault(context);
            if (!TextUtils.isEmpty(uICCDefault)) {
                for (PaymentBackend.PaymentAppInfo paymentAppInfo : sEList) {
                    if (uICCDefault.equals(paymentAppInfo.label)) {
                        return paymentAppInfo;
                    }
                }
            }
        }
        return null;
    }

    @TargetApi(21)
    private static List<PaymentBackend.PaymentAppInfo> transformInfoList(Context context, List<String> list) {
        if (context == null || list == null || list.size() <= 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        Drawable drawable = SettingsBaseApplication.mApplication.getApplicationContext().getResources().getDrawable(C0008R$drawable.op_ic_sim_card, null);
        String uICCDefault = getUICCDefault(context);
        for (String str : list) {
            PaymentBackend.PaymentAppInfo paymentAppInfo = new PaymentBackend.PaymentAppInfo();
            ComponentName componentName = new ComponentName(str, str);
            paymentAppInfo.label = str;
            Log.d("NfcUiccUtils", "transformInfoList: se =" + str);
            if (TextUtils.equals(uICCDefault, str)) {
                paymentAppInfo.isDefault = true;
            } else {
                paymentAppInfo.isDefault = false;
            }
            if (TextUtils.equals("SIM1", str)) {
                paymentAppInfo.description = context.getResources().getString(C0017R$string.nfc_uicc_sim1);
            } else if (TextUtils.equals("SIM2", str)) {
                paymentAppInfo.description = context.getResources().getString(C0017R$string.nfc_uicc_sim2);
            }
            paymentAppInfo.icon = drawable;
            paymentAppInfo.isUicc = true;
            paymentAppInfo.componentName = componentName;
            arrayList.add(paymentAppInfo);
        }
        return arrayList;
    }

    public static boolean isEsePaymentApp(ComponentName componentName) {
        String packageName = componentName.getPackageName();
        if (!TextUtils.isEmpty(packageName)) {
            for (String str : ESE_APPS) {
                if (str.equals(packageName)) {
                    Log.d("NfcUiccUtils", "isEsePaymentApp true, packageName = " + packageName);
                    return true;
                }
            }
        }
        Log.d("NfcUiccUtils", "isEsePaymentApp false, packageName = " + packageName);
        return false;
    }
}
