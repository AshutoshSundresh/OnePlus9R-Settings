package com.oneplus.accountsdk.auth;

import android.content.Context;

public class OPAuthInfo {
    private String appId = null;
    private String appKey = null;
    private Context context = null;
    private boolean needEmail = false;
    private boolean needPhoneNum = false;
    private String refreshtoken = null;

    public String toString() {
        return "OPAuthInfo{appId='" + this.appId + "', context=" + this.context + ", refreshtoken='" + this.refreshtoken + "', appKey='" + this.appKey + "', needPhoneNum=" + this.needPhoneNum + ", needEmail=" + this.needEmail + '}';
    }
}
