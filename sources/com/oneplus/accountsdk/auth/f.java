package com.oneplus.accountsdk.auth;

import android.app.Activity;
import android.content.Context;
import com.oneplus.accountsdk.entity.UserBindInfo;
import com.oneplus.accountsdk.entity.UserTokenInfo;

public interface f {
    void a(UserBindInfo userBindInfo);

    boolean a(Activity activity, int i, String[] strArr);

    void b(Context context);

    void b(Context context, OPAuthListener<UserTokenInfo> oPAuthListener);
}
