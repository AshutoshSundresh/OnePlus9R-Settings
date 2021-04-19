package com.oneplus.accountsdk.auth;

import android.app.Activity;
import android.content.Context;
import com.oneplus.accountsdk.b;
import com.oneplus.accountsdk.entity.UserBindInfo;
import com.oneplus.accountsdk.entity.UserTokenInfo;

public class OPAuth {
    private static f mAuth = new d();

    private static void checkContextNotNull(Context context) {
        if (context == null) {
            throw new NullPointerException("Please check context, it must not be null");
        }
    }

    protected static boolean getAccessAccountPremission(Activity activity, int i, String[] strArr) {
        return mAuth.a(activity, i, strArr);
    }

    public static void getAuthToken(Context context, OPAuthInfo oPAuthInfo, OPAuthListener<UserTokenInfo> oPAuthListener) {
        checkContextNotNull(context);
        b.a = context.getApplicationContext();
        mAuth.b(context, oPAuthListener);
    }

    protected static void sendBindResult(UserBindInfo userBindInfo) {
        mAuth.a(userBindInfo);
    }

    public static void startAccountSettingsActivity(Context context) {
        checkContextNotNull(context);
        b.a = context.getApplicationContext();
        mAuth.b(context);
    }
}
