package com.oneplus.accountsdk.auth;

import android.accounts.AccountManager;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.text.TextUtils;
import android.util.Log;
import com.oneplus.accountsdk.auth.c;
import com.oneplus.accountsdk.entity.UserBindInfo;
import com.oneplus.accountsdk.entity.UserTokenInfo;
import com.oneplus.accountsdk.utils.OnePlusAuthLogUtils;

public final class d implements f {
    private static int b = -1;
    private OPAuthListener<UserBindInfo> c;

    private static int e(Context context) {
        if (b < 0) {
            PackageManager packageManager = context.getPackageManager();
            try {
                ApplicationInfo applicationInfo = packageManager.getApplicationInfo("com.oneplus.account", 0);
                if (applicationInfo != null && !applicationInfo.enabled) {
                    return -1;
                }
                b = packageManager.getPackageInfo("com.oneplus.account", 0).versionCode;
            } catch (Exception unused) {
            }
        }
        Log.e("sdk", "versionCode: " + b);
        return b;
    }

    @Override // com.oneplus.accountsdk.auth.f
    public final void a(UserBindInfo userBindInfo) {
        OPAuthListener<UserBindInfo> oPAuthListener = this.c;
        if (oPAuthListener != null) {
            oPAuthListener.onReqFinish(userBindInfo);
            this.c.onReqComplete();
            return;
        }
        OnePlusAuthLogUtils.e("listener is null", new Object[0]);
    }

    @Override // com.oneplus.accountsdk.auth.f
    public final boolean a(Activity activity, int i, String[] strArr) {
        if (activity == null) {
            return false;
        }
        if (Build.VERSION.SDK_INT < 26) {
            if (ContextCompat.checkSelfPermission(activity, "android.permission.GET_ACCOUNTS") == 0) {
                if (a(activity.getApplicationContext())) {
                    return true;
                }
                a.a(strArr, activity, i);
            }
            return false;
        } else if (a(activity.getApplicationContext())) {
            return true;
        } else {
            if (i == 2) {
                try {
                    Bundle bundle = new Bundle();
                    bundle.putString("flag", "");
                    bundle.putStringArray("extra_bind_info_array", strArr);
                    activity.startActivityForResult(AccountManager.newChooseAccountIntent(null, null, new String[]{"com.oneplus.account"}, null, null, null, bundle), i);
                } catch (Exception e) {
                    OnePlusAuthLogUtils.e(e.getMessage(), new Object[0]);
                }
            } else {
                a.a(strArr, activity, i);
            }
            return false;
        }
    }

    public final boolean a(Context context) {
        return b.a(context).length > 0;
    }

    @Override // com.oneplus.accountsdk.auth.f
    public final void b(Context context) {
        try {
            if (a(context)) {
                a.a(context);
            } else if (e(context) >= 330) {
                a.a(context);
            } else {
                Log.e("OPAccountSDK", "Account versioncode is lower than 330");
            }
        } catch (ActivityNotFoundException e) {
            e.printStackTrace();
            Log.e("OPAccountSDK", "OnePlus Account is not existed. Please check the phone has OnePlus Account");
        }
    }

    @Override // com.oneplus.accountsdk.auth.f
    public final void b(Context context, final OPAuthListener<UserTokenInfo> oPAuthListener) {
        if (oPAuthListener != null) {
            oPAuthListener.onReqStart();
            oPAuthListener.onReqLoading();
        }
        b.a(context, new c.a(this) {
            /* class com.oneplus.accountsdk.auth.d.AnonymousClass2 */

            @Override // com.oneplus.accountsdk.auth.c.a
            public final void a() {
                UserTokenInfo userTokenInfo = new UserTokenInfo();
                userTokenInfo.isLogin = false;
                userTokenInfo.resultCode = "1003";
                userTokenInfo.resultMsg = e.a("1003");
                OPAuthListener oPAuthListener = oPAuthListener;
                if (oPAuthListener != null) {
                    oPAuthListener.onReqFinish(userTokenInfo);
                    oPAuthListener.onReqComplete();
                }
            }

            @Override // com.oneplus.accountsdk.auth.c.a
            public final void a(Bundle bundle) {
                UserTokenInfo userTokenInfo = new UserTokenInfo();
                String string = bundle.getString("authtoken");
                if (!TextUtils.isEmpty(string)) {
                    userTokenInfo.isLogin = true;
                    userTokenInfo.resultCode = "6000";
                    userTokenInfo.resultMsg = e.a("6000");
                    userTokenInfo.token = string;
                    userTokenInfo.oneplushToken = bundle.getString("oplustoken");
                } else {
                    userTokenInfo.isLogin = false;
                    userTokenInfo.resultCode = "1003";
                    userTokenInfo.resultMsg = e.a("1003");
                }
                OPAuthListener oPAuthListener = oPAuthListener;
                if (oPAuthListener != null) {
                    oPAuthListener.onReqFinish(userTokenInfo);
                    oPAuthListener.onReqComplete();
                }
            }
        });
    }
}
