package com.oneplus.accountsdk.entity;

public class UserTokenInfo {
    public boolean isLogin;
    public String oneplushToken;
    public String resultCode;
    public String resultMsg;
    public String token;

    public String toString() {
        return "UserTokenInfo{isLogin=" + this.isLogin + ", resultCode='" + this.resultCode + "', resultMsg='" + this.resultMsg + "', token='" + this.token + "', oneplushToken='" + this.oneplushToken + "'}";
    }
}
