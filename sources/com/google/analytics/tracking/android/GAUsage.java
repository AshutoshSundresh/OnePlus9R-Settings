package com.google.analytics.tracking.android;

import java.util.SortedSet;
import java.util.TreeSet;

/* access modifiers changed from: package-private */
public class GAUsage {
    private static final GAUsage INSTANCE = new GAUsage();
    private boolean mDisableUsage = false;
    private StringBuilder mSequence = new StringBuilder();
    private SortedSet<Field> mUsedFields = new TreeSet();

    public enum Field {
        MAP_BUILDER_SET,
        MAP_BUILDER_SET_ALL,
        MAP_BUILDER_GET,
        MAP_BUILDER_SET_CAMPAIGN_PARAMS,
        BLANK_04,
        BLANK_05,
        BLANK_06,
        BLANK_07,
        BLANK_08,
        GET,
        SET,
        SEND,
        BLANK_12,
        BLANK_13,
        BLANK_14,
        BLANK_15,
        BLANK_16,
        BLANK_17,
        BLANK_18,
        BLANK_19,
        BLANK_20,
        BLANK_21,
        BLANK_22,
        BLANK_23,
        BLANK_24,
        BLANK_25,
        BLANK_26,
        BLANK_27,
        BLANK_28,
        BLANK_29,
        SET_EXCEPTION_PARSER,
        GET_EXCEPTION_PARSER,
        CONSTRUCT_TRANSACTION,
        CONSTRUCT_EXCEPTION,
        CONSTRUCT_RAW_EXCEPTION,
        CONSTRUCT_TIMING,
        CONSTRUCT_SOCIAL,
        BLANK_37,
        BLANK_38,
        GET_TRACKER,
        GET_DEFAULT_TRACKER,
        SET_DEFAULT_TRACKER,
        SET_APP_OPT_OUT,
        GET_APP_OPT_OUT,
        DISPATCH,
        SET_DISPATCH_PERIOD,
        BLANK_46,
        REPORT_UNCAUGHT_EXCEPTIONS,
        SET_AUTO_ACTIVITY_TRACKING,
        SET_SESSION_TIMEOUT,
        CONSTRUCT_EVENT,
        CONSTRUCT_ITEM,
        BLANK_52,
        BLANK_53,
        SET_DRY_RUN,
        GET_DRY_RUN,
        SET_LOGGER,
        SET_FORCE_LOCAL_DISPATCH,
        GET_TRACKER_NAME,
        CLOSE_TRACKER,
        EASY_TRACKER_ACTIVITY_START,
        EASY_TRACKER_ACTIVITY_STOP,
        CONSTRUCT_APP_VIEW
    }

    public static GAUsage getInstance() {
        return INSTANCE;
    }

    static GAUsage getPrivateInstance() {
        return new GAUsage();
    }

    private GAUsage() {
    }

    public synchronized void setDisableUsage(boolean z) {
        this.mDisableUsage = z;
    }

    public synchronized void setUsage(Field field) {
        if (!this.mDisableUsage) {
            this.mUsedFields.add(field);
            this.mSequence.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(field.ordinal()));
        }
    }

    public synchronized String getAndClearUsage() {
        StringBuilder sb;
        sb = new StringBuilder();
        int i = 0;
        int i2 = 6;
        while (this.mUsedFields.size() > 0) {
            Field first = this.mUsedFields.first();
            this.mUsedFields.remove(first);
            int ordinal = first.ordinal();
            while (ordinal >= i2) {
                sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(i));
                i2 += 6;
                i = 0;
            }
            i += 1 << (first.ordinal() % 6);
        }
        if (i > 0 || sb.length() == 0) {
            sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(i));
        }
        this.mUsedFields.clear();
        return sb.toString();
    }

    public synchronized String getAndClearSequence() {
        String sb;
        if (this.mSequence.length() > 0) {
            this.mSequence.insert(0, ".");
        }
        sb = this.mSequence.toString();
        this.mSequence = new StringBuilder();
        return sb;
    }
}
