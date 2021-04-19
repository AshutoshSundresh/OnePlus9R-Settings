package com.android.settings.applications.manageapplications;

import android.app.ActivityManager;
import android.app.AppOpsManager;
import android.app.INotificationManager;
import android.app.NotificationChannel;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.IPackageManager;
import android.content.pm.PackageManager;
import android.net.NetworkPolicyManager;
import android.os.Build;
import android.os.Bundle;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.UserHandle;
import android.util.Log;
import android.util.OpFeatures;
import androidx.appcompat.app.AlertDialog;
import com.android.settings.C0017R$string;
import com.android.settingslib.utils.ThreadUtils;
import java.util.List;

public class ResetAppsHelper implements DialogInterface.OnClickListener, DialogInterface.OnDismissListener {
    private static volatile boolean isResetting;
    private final AppOpsManager mAom;
    private final Context mContext;
    private final IPackageManager mIPm = IPackageManager.Stub.asInterface(ServiceManager.getService("package"));
    private final INotificationManager mNm = INotificationManager.Stub.asInterface(ServiceManager.getService("notification"));
    private final NetworkPolicyManager mNpm;
    private final PackageManager mPm;
    private AlertDialog mResetDialog;

    public ResetAppsHelper(Context context) {
        this.mContext = context;
        this.mPm = context.getPackageManager();
        this.mNpm = NetworkPolicyManager.from(context);
        this.mAom = (AppOpsManager) context.getSystemService("appops");
    }

    public void onRestoreInstanceState(Bundle bundle) {
        if (bundle != null && bundle.getBoolean("resetDialog")) {
            buildResetDialog();
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        if (this.mResetDialog != null) {
            bundle.putBoolean("resetDialog", true);
        }
    }

    public void stop() {
        AlertDialog alertDialog = this.mResetDialog;
        if (alertDialog != null) {
            alertDialog.dismiss();
            this.mResetDialog = null;
        }
    }

    /* access modifiers changed from: package-private */
    public void buildResetDialog() {
        if (this.mResetDialog == null) {
            AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
            builder.setTitle(C0017R$string.reset_app_preferences_title);
            builder.setMessage(C0017R$string.reset_app_preferences_desc);
            builder.setPositiveButton(C0017R$string.reset_app_preferences_button, this);
            builder.setNegativeButton(C0017R$string.cancel, (DialogInterface.OnClickListener) null);
            builder.setOnDismissListener(this);
            this.mResetDialog = builder.show();
        }
    }

    public void onDismiss(DialogInterface dialogInterface) {
        if (this.mResetDialog == dialogInterface) {
            this.mResetDialog = null;
        }
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (this.mResetDialog == dialogInterface) {
            if (isResetting) {
                Log.d("ResetAppsHelper", "isResetting return");
            } else {
                ThreadUtils.postOnBackgroundThread(new Runnable() {
                    /* class com.android.settings.applications.manageapplications.ResetAppsHelper.AnonymousClass1 */

                    public void run() {
                        boolean unused = ResetAppsHelper.isResetting = true;
                        List<ApplicationInfo> installedApplications = ResetAppsHelper.this.mPm.getInstalledApplications(512);
                        for (int i = 0; i < installedApplications.size(); i++) {
                            ApplicationInfo applicationInfo = installedApplications.get(i);
                            try {
                                ResetAppsHelper.this.mNm.clearData(applicationInfo.packageName, applicationInfo.uid, false);
                            } catch (RemoteException unused2) {
                            }
                            try {
                                NotificationChannel notificationChannelForPackage = ResetAppsHelper.this.mNm.getNotificationChannelForPackage(applicationInfo.packageName, applicationInfo.uid, "miscellaneous", (String) null, true);
                                if (notificationChannelForPackage != null && (ResetAppsHelper.this.mNm.onlyHasDefaultChannel(applicationInfo.packageName, applicationInfo.uid) || "miscellaneous".equals(notificationChannelForPackage.getId()))) {
                                    notificationChannelForPackage.setImportance(-1000);
                                    ResetAppsHelper.this.mNm.updateNotificationChannelForPackage(applicationInfo.packageName, applicationInfo.uid, notificationChannelForPackage);
                                }
                                ResetAppsHelper.this.mNm.setNotificationsEnabledForPackage(applicationInfo.packageName, applicationInfo.uid, true);
                                if (OpFeatures.isSupport(new int[]{26}) && ResetAppsHelper.this.mAom.checkOp(1005, applicationInfo.uid, applicationInfo.packageName) == 0) {
                                    int uid = UserHandle.getUid(999, applicationInfo.uid);
                                    NotificationChannel notificationChannelForPackage2 = ResetAppsHelper.this.mNm.getNotificationChannelForPackage(applicationInfo.packageName, uid, "miscellaneous", (String) null, true);
                                    if (notificationChannelForPackage2 != null && (ResetAppsHelper.this.mNm.onlyHasDefaultChannel(applicationInfo.packageName, uid) || "miscellaneous".equals(notificationChannelForPackage2.getId()))) {
                                        notificationChannelForPackage2.setImportance(3);
                                        ResetAppsHelper.this.mNm.updateNotificationChannelForPackage(applicationInfo.packageName, uid, notificationChannelForPackage2);
                                    }
                                    ResetAppsHelper.this.mNm.setNotificationsEnabledForPackage(applicationInfo.packageName, uid, true);
                                }
                            } catch (RemoteException e) {
                                e.printStackTrace();
                            }
                            if (!applicationInfo.enabled && ResetAppsHelper.this.mPm.getApplicationEnabledSetting(applicationInfo.packageName) == 3) {
                                ResetAppsHelper.this.mPm.setApplicationEnabledSetting(applicationInfo.packageName, 0, 1);
                            }
                        }
                        try {
                            ResetAppsHelper.this.mIPm.resetApplicationPreferences(UserHandle.myUserId());
                            if (OpFeatures.isSupport(new int[]{26}) && UserHandle.myUserId() == 0) {
                                ResetAppsHelper.this.mIPm.resetApplicationPreferences(999);
                            }
                        } catch (RemoteException unused3) {
                        }
                        ResetAppsHelper resetAppsHelper = ResetAppsHelper.this;
                        resetAppsHelper.resetDefaultApps(resetAppsHelper.mContext);
                        ResetAppsHelper.this.mAom.resetAllModes();
                        ResetAppsHelper resetAppsHelper2 = ResetAppsHelper.this;
                        resetAppsHelper2.sendResetAllModesIntent(resetAppsHelper2.mContext);
                        int[] uidsWithPolicy = ResetAppsHelper.this.mNpm.getUidsWithPolicy(1);
                        int currentUser = ActivityManager.getCurrentUser();
                        for (int i2 : uidsWithPolicy) {
                            if (UserHandle.getUserId(i2) == currentUser) {
                                ResetAppsHelper.this.mNpm.setUidPolicy(i2, 0);
                            }
                        }
                        if (Build.VERSION.IS_CTA_BUILD) {
                            Intent intent = new Intent("com.oneplus.cta.permission.RESET");
                            intent.setClassName("com.oneplus.permissionutil", "com.oneplus.permissionutil.ResetReceiver");
                            ResetAppsHelper.this.mContext.sendBroadcast(intent);
                        }
                        boolean unused4 = ResetAppsHelper.isResetting = false;
                    }
                });
            }
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void sendResetAllModesIntent(Context context) {
        Intent intent = new Intent("oneplus.intent.action.RESET_ALL_MODES");
        intent.setPackage("android");
        this.mContext.sendBroadcast(intent);
    }

    private boolean isAppExist(String str) {
        ApplicationInfo applicationInfo;
        try {
            applicationInfo = this.mContext.getPackageManager().getApplicationInfo(str, 0);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
            applicationInfo = null;
        }
        if (applicationInfo != null) {
            return true;
        }
        return false;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x0051  */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x007d  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x00a2  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x00d6 A[LOOP:0: B:35:0x00d0->B:37:0x00d6, LOOP_END] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void resetDefaultApps(android.content.Context r13) {
        /*
        // Method dump skipped, instructions count: 283
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.settings.applications.manageapplications.ResetAppsHelper.resetDefaultApps(android.content.Context):void");
    }
}
