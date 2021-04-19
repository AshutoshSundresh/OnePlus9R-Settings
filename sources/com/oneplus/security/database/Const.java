package com.oneplus.security.database;

import android.net.Uri;

public class Const {
    public static final Uri AUTHORITY_URI = Uri.parse("content://com.oneplus.security.database.SafeProvider");
    public static final Uri AUTHORITY_URI_FROM_Q = Uri.parse("content://com.oneplus.security.database.comm.SafeProvider");
    public static Uri URI_NETWORK_RESTRICT = Uri.withAppendedPath(AUTHORITY_URI, "network_restrict");
    public static Uri URI_NETWORK_RESTRICT_FROM_Q = Uri.withAppendedPath(AUTHORITY_URI_FROM_Q, "network_restrict");

    static {
        Uri.withAppendedPath(AUTHORITY_URI, "tm_network_control");
        Uri.withAppendedPath(AUTHORITY_URI, "intercept_logs");
    }
}
