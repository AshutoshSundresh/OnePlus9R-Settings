package com.oneplus.security.network.calibrate;

import android.app.Service;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.IBinder;
import com.oneplus.security.SecureService;
import com.oneplus.security.network.operator.AccountDayLocalCache;
import com.oneplus.security.network.operator.NativeOperatorDataManager;
import com.oneplus.security.network.operator.PkgInfoLocalCache;
import com.oneplus.security.network.simcard.SimcardDataModel;
import com.oneplus.security.network.simcard.SimcardDataModelInterface;
import com.oneplus.security.network.trafficalarm.TrafficUsageAlarmUtils;
import com.oneplus.security.utils.LogUtils;
import com.oneplus.security.widget.WidgetViewService;
import java.lang.ref.WeakReference;
import java.util.Calendar;
import java.util.Date;

public class AutoCalibrateService extends Service {
    private AccountDayUpdateTask mAccountDayUpdateTask;
    private SimcardDataModelInterface mSimcardDataModel;

    public void onCreate() {
        super.onCreate();
        this.mSimcardDataModel = SimcardDataModel.getInstance(getApplicationContext());
    }

    public void onDestroy() {
        super.onDestroy();
        LogUtils.d("AutoCalibrateService", "destroy service");
        AccountDayUpdateTask accountDayUpdateTask = this.mAccountDayUpdateTask;
        if (accountDayUpdateTask != null) {
            accountDayUpdateTask.cancel(true);
        }
    }

    public IBinder onBind(Intent intent) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        if (intent != null) {
            int intExtra = intent.getIntExtra("key_auto_calibrate_service_task", -1);
            LogUtils.d("AutoCalibrateService", "called on start command ,taskIndex=" + intExtra);
            if (intExtra == 0) {
                if (this.mSimcardDataModel.isSlotSimInserted(0)) {
                    onAccountDayUpdate(0);
                }
                if (this.mSimcardDataModel.isSlotSimInserted(1)) {
                    onAccountDayUpdate(1);
                }
            } else {
                stopSelf();
            }
        } else {
            stopSelf();
        }
        return super.onStartCommand(intent, i, i2);
    }

    public void onAccountDayUpdate(int i) {
        int accountDay = NativeOperatorDataManager.getAccountDay(this, i);
        if (!this.mSimcardDataModel.isSlotSimReady(i)) {
            LogUtils.d("AutoCalibrateService", "finish service because of sim card is not ready, simIndex:" + i);
            stopSelf();
            return;
        }
        AccountDayUpdateTask accountDayUpdateTask = new AccountDayUpdateTask(this);
        this.mAccountDayUpdateTask = accountDayUpdateTask;
        accountDayUpdateTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, Integer.valueOf(i), Integer.valueOf(accountDay));
    }

    /* access modifiers changed from: private */
    public static class AccountDayUpdateTask extends AsyncTask<Integer, Void, Integer> {
        private WeakReference<AutoCalibrateService> mService;

        AccountDayUpdateTask(AutoCalibrateService autoCalibrateService) {
            this.mService = new WeakReference<>(autoCalibrateService);
        }

        /* access modifiers changed from: protected */
        public Integer doInBackground(Integer... numArr) {
            if (this.mService.get() == null) {
                return null;
            }
            this.mService.get().accountDayUpdateDoInBackground(numArr);
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            if (this.mService.get() != null && num != null) {
                this.mService.get().accountDayUpdateOnPostExecute(num);
            }
        }
    }

    private void resetDataUsage(int i) {
        TrafficUsageAlarmUtils.resetTrafficDialogAlertedState(this, i);
        PkgInfoLocalCache.clearPkgUsedMonthlyLocalCache(this, i);
        NativeOperatorDataManager.clearPkgUsedMonthlyInByte(this, i);
        TrafficUsageAlarmUtils.clearSystemDataLimitValue(this, i);
        TrafficUsageAlarmUtils.clearSystemDataWarnValue(this, i);
        SecureService.startServiceForDataUsage(this, i);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void accountDayUpdateOnPostExecute(Integer num) {
        if (num.intValue() == 0) {
            WidgetViewService.startService(getApplicationContext());
            LogUtils.d("AutoCalibrateService", "finish service without any task to wait.");
            stopSelf();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:7:0x002b, code lost:
        if (r0.getActualMaximum(5) < r7) goto L_0x002f;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean isReachingAccountDay(int r7) {
        /*
            java.util.Calendar r0 = java.util.Calendar.getInstance()
            long r1 = java.lang.System.currentTimeMillis()
            r0.setTimeInMillis(r1)
            r1 = 5
            int r2 = r0.get(r1)
            r3 = 1
            if (r7 != r2) goto L_0x0015
            r4 = r3
            goto L_0x0016
        L_0x0015:
            r4 = 0
        L_0x0016:
            if (r2 != r3) goto L_0x002e
            if (r7 == r3) goto L_0x002e
            int r5 = r0.get(r3)
            r6 = 2
            int r6 = r0.get(r6)
            int r6 = r6 - r3
            r0.set(r5, r6, r3)
            int r0 = r0.getActualMaximum(r1)
            if (r0 >= r7) goto L_0x002e
            goto L_0x002f
        L_0x002e:
            r3 = r4
        L_0x002f:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "isReachingAccountDay current day is "
            r0.append(r1)
            r0.append(r2)
            java.lang.String r1 = " account day is "
            r0.append(r1)
            r0.append(r7)
            java.lang.String r7 = " reach account day "
            r0.append(r7)
            r0.append(r3)
            java.lang.String r7 = r0.toString()
            java.lang.String r0 = "AutoCalibrateService"
            com.oneplus.security.utils.LogUtils.i(r0, r7)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.oneplus.security.network.calibrate.AutoCalibrateService.isReachingAccountDay(int):boolean");
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private int accountDayUpdateDoInBackground(Integer... numArr) {
        int intValue = numArr[0].intValue();
        if (isReachingAccountDay(numArr[1].intValue())) {
            Calendar instance = Calendar.getInstance();
            instance.setTime(new Date(System.currentTimeMillis()));
            instance.set(10, 0);
            instance.set(12, 0);
            instance.set(13, 0);
            long timeInMillis = instance.getTimeInMillis();
            if (timeInMillis > AutoCalibrateUtil.getLastCalibrateTime(this, intValue)) {
                AutoCalibrateUtil.setLastCalibrateTime(this, timeInMillis, intValue, true);
            }
            LogUtils.d("AutoCalibrateService", "reach account day and clear related data");
            resetDataUsage(intValue);
        } else {
            long lastCalibrateTime = AutoCalibrateUtil.getLastCalibrateTime(this, intValue);
            long[] dataUsageSectionTimeMillByAccountDay = AccountDayLocalCache.getDataUsageSectionTimeMillByAccountDay(this, intValue);
            if (lastCalibrateTime < dataUsageSectionTimeMillByAccountDay[0]) {
                LogUtils.d("AutoCalibrateService", "The datausage is not reset at current datausage section, so we reset it now.");
                resetDataUsage(intValue);
                AutoCalibrateUtil.setLastCalibrateTime(this, dataUsageSectionTimeMillByAccountDay[0], intValue, true);
            }
        }
        return 0;
    }
}
