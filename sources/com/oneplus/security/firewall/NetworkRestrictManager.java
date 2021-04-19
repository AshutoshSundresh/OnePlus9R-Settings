package com.oneplus.security.firewall;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.provider.Settings;
import com.android.settings.datausage.OPDataUsageUtils;
import com.oneplus.security.network.simcard.SimcardDataModel;
import com.oneplus.security.network.trafficalarm.TrafficUsageAlarmUtils;
import com.oneplus.security.utils.HanziToPinyin;
import com.oneplus.security.utils.LogUtils;
import com.oneplus.security.utils.Utils;
import com.oneplus.settings.SettingsBaseApplication;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;

public class NetworkRestrictManager {
    private static NetworkRestrictManager instance;
    private static final Object instanceLock = new byte[0];
    private WeakReference<IAppsNetworkRestrictTaskCallBack> mCallBack;
    private Context mContext;
    private Handler mHandler = new Handler(Looper.getMainLooper()) {
        /* class com.oneplus.security.firewall.NetworkRestrictManager.AnonymousClass2 */

        public void handleMessage(Message message) {
            if (NetworkRestrictManager.this.mCallBack != null) {
                switch (message.what) {
                    case 273:
                        if (NetworkRestrictManager.this.mCallBack.get() != null) {
                            ((IAppsNetworkRestrictTaskCallBack) NetworkRestrictManager.this.mCallBack.get()).onTaskFinished(1, message.obj);
                            return;
                        }
                        return;
                    case 274:
                        if (NetworkRestrictManager.this.mCallBack.get() != null) {
                            ((IAppsNetworkRestrictTaskCallBack) NetworkRestrictManager.this.mCallBack.get()).onTaskError(1, (String) message.obj);
                            return;
                        }
                        return;
                    case 275:
                        if (NetworkRestrictManager.this.mCallBack.get() != null && ((Integer) message.obj).intValue() > 0) {
                            ((IAppsNetworkRestrictTaskCallBack) NetworkRestrictManager.this.mCallBack.get()).onTaskFinished(2, null);
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    };
    private PackageManager mPackageManager;

    public interface IAppsNetworkRestrictTaskCallBack {
        void onTaskError(int i, String str);

        void onTaskFinished(int i, Object obj);

        void onTaskStart(int i, boolean z);
    }

    private NetworkRestrictManager(Context context) {
        Context applicationContext = context.getApplicationContext();
        this.mContext = applicationContext;
        this.mPackageManager = applicationContext.getPackageManager();
    }

    public static NetworkRestrictManager getInstance(Context context) {
        synchronized (instanceLock) {
            if (instance == null) {
                instance = new NetworkRestrictManager(context);
            }
        }
        return instance;
    }

    public void init() {
        if (Settings.System.getInt(this.mContext.getContentResolver(), "update_rules_from_Q", 0) == 0) {
            Settings.System.putInt(this.mContext.getContentResolver(), "update_rules_from_Q", 1);
            new Thread(new UpdateRulesFromQRunnable()).start();
            SettingsBaseApplication.getHandler().postDelayed(new Runnable() {
                /* class com.oneplus.security.firewall.NetworkRestrictManager.AnonymousClass1 */

                public void run() {
                    NetworkRestrictManager.this.handleUpgradeTrafficState();
                }
            }, 5000);
            return;
        }
        new Thread(new RefreshTaskRunnable(false)).start();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void handleUpgradeTrafficState() {
        SimcardDataModel instance2 = SimcardDataModel.getInstance(this.mContext);
        for (int i = 0; i <= 1; i++) {
            if (i == instance2.getCurrentTrafficRunningSlotId() && instance2.isSlotSimInserted(i)) {
                try {
                    Map<String, Object> oneplusDataUsage = OPDataUsageUtils.getOneplusDataUsage(this.mContext, i);
                    if (oneplusDataUsage != null && ((Integer) oneplusDataUsage.get("oneplus_datausage_error_code")).intValue() == 0) {
                        boolean booleanValue = ((Boolean) oneplusDataUsage.get("oneplus_datausage_limit_state")).booleanValue();
                        long longValue = ((Long) oneplusDataUsage.get("oneplus_datausage_total")).longValue();
                        boolean booleanValue2 = ((Boolean) oneplusDataUsage.get("oneplus_datausage_warn_state")).booleanValue();
                        long longValue2 = ((Long) oneplusDataUsage.get("oneplus_datausage_warn_value")).longValue();
                        TrafficUsageAlarmUtils.setDataTotalState(this.mContext, booleanValue, i);
                        TrafficUsageAlarmUtils.setDataLimitValue(this.mContext, longValue, i);
                        TrafficUsageAlarmUtils.setDataWarnState(this.mContext, booleanValue2, i);
                        TrafficUsageAlarmUtils.setDataWarnValue(this.mContext, longValue2, i);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void refreshAppsNetworkRestrict(IAppsNetworkRestrictTaskCallBack iAppsNetworkRestrictTaskCallBack, boolean z, Executor executor) {
        if (executor == null) {
            executor = AsyncTask.THREAD_POOL_EXECUTOR;
        }
        WeakReference<IAppsNetworkRestrictTaskCallBack> weakReference = new WeakReference<>(iAppsNetworkRestrictTaskCallBack);
        this.mCallBack = weakReference;
        weakReference.get().onTaskStart(1, false);
        executor.execute(new RefreshTaskRunnable(z));
    }

    public void batchUpdateRules(List<AppUidItem> list, int i, int i2, IAppsNetworkRestrictTaskCallBack iAppsNetworkRestrictTaskCallBack, Executor executor) {
        if (!Utils.isCollectionEmpty(list)) {
            LogUtils.d("NetworkRestrictManager", "batchUpdateRules data=" + i + ",wlan=" + i2);
            this.mCallBack = new WeakReference<>(iAppsNetworkRestrictTaskCallBack);
            iAppsNetworkRestrictTaskCallBack.onTaskStart(2, false);
            executor.execute(new BatchUpdateRulesRunnable(list, i, i2));
        }
    }

    public void updateRules(AppUidItem appUidItem, int i, int i2) {
        if (appUidItem != null) {
            LogUtils.d("NetworkRestrictManager", "updateRules appUidItem=" + appUidItem + ",data=" + i + ",wlan=" + i2);
            for (AppPkgItem appPkgItem : appUidItem.getApps()) {
                FirewallRule.addOrUpdateRole(this.mContext, new FirewallRule(appPkgItem.getPkgName(), Integer.valueOf(i2), Integer.valueOf(i)));
            }
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private Map<Integer, AppUidItem> getAllAppsUidItemsMap() throws Exception {
        int i;
        int i2;
        HashMap hashMap = new HashMap();
        Map<String, FirewallRule> selectAllFirewallRulesAsMap = FirewallRule.selectAllFirewallRulesAsMap(this.mContext);
        List<PackageInfo> installedPackages = this.mPackageManager.getInstalledPackages(0);
        if (!installedPackages.isEmpty()) {
            Iterator<PackageInfo> it = installedPackages.iterator();
            while (true) {
                boolean z = true;
                if (!it.hasNext()) {
                    break;
                }
                PackageInfo next = it.next();
                ApplicationInfo applicationInfo = this.mPackageManager.getApplicationInfo(next.packageName, 1);
                if (this.mPackageManager.checkPermission("android.permission.INTERNET", next.packageName) != 0) {
                    z = false;
                }
                if (applicationInfo != null && (i2 = applicationInfo.uid) > 1000 && z && hashMap.get(Integer.valueOf(i2)) == null) {
                    AppUidItem appUidItem = new AppUidItem();
                    appUidItem.setAppUid(applicationInfo.uid);
                    hashMap.put(Integer.valueOf(applicationInfo.uid), appUidItem);
                }
            }
            for (PackageInfo packageInfo : installedPackages) {
                ApplicationInfo applicationInfo2 = this.mPackageManager.getApplicationInfo(packageInfo.packageName, 1);
                boolean z2 = this.mPackageManager.checkPermission("android.permission.INTERNET", packageInfo.packageName) == 0;
                if (applicationInfo2 != null && (i = applicationInfo2.uid) > 1000 && z2) {
                    AppUidItem appUidItem2 = (AppUidItem) hashMap.get(Integer.valueOf(i));
                    if (selectAllFirewallRulesAsMap == null) {
                        appUidItem2.setDataEnable(true);
                        appUidItem2.setWlanEnable(true);
                    } else {
                        FirewallRule firewallRule = selectAllFirewallRulesAsMap.get(packageInfo.packageName);
                        if (firewallRule != null) {
                            appUidItem2.setDataEnable(firewallRule.getMobile().intValue() != 1);
                            appUidItem2.setWlanEnable(firewallRule.getWlan().intValue() != 1);
                        } else {
                            appUidItem2.setDataEnable(true);
                            appUidItem2.setWlanEnable(true);
                        }
                    }
                    AppPkgItem appPkgItem = new AppPkgItem();
                    String charSequence = packageInfo.applicationInfo.loadLabel(this.mPackageManager).toString();
                    appPkgItem.setSystemApp(Utils.isSystemApp(packageInfo));
                    appPkgItem.setPkgName(packageInfo.packageName);
                    appPkgItem.setAppName(charSequence);
                    appPkgItem.setAppSortKey(HanziToPinyin.getSpell(charSequence));
                    appPkgItem.setAppIcon(packageInfo.applicationInfo.loadIcon(this.mPackageManager));
                    appUidItem2.getApps().add(appPkgItem);
                }
            }
        }
        return hashMap;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private Map<Integer, AppUidItem> getAppsUidItemsMap() throws Exception {
        int i;
        int i2;
        HashMap hashMap = new HashMap();
        Map<String, FirewallRule> selectAllFirewallRulesAsMap = FirewallRule.selectAllFirewallRulesAsMap(this.mContext);
        Intent intent = new Intent("android.intent.action.MAIN", (Uri) null);
        intent.addCategory("android.intent.category.LAUNCHER");
        List<ResolveInfo> queryIntentActivities = this.mPackageManager.queryIntentActivities(intent, 0);
        if (!queryIntentActivities.isEmpty()) {
            Iterator<ResolveInfo> it = queryIntentActivities.iterator();
            while (true) {
                boolean z = true;
                if (!it.hasNext()) {
                    break;
                }
                ResolveInfo next = it.next();
                ApplicationInfo applicationInfo = this.mPackageManager.getApplicationInfo(next.activityInfo.packageName, 1);
                if (this.mPackageManager.checkPermission("android.permission.INTERNET", next.activityInfo.packageName) != 0) {
                    z = false;
                }
                if (applicationInfo != null && (i2 = applicationInfo.uid) > 1000 && z && hashMap.get(Integer.valueOf(i2)) == null) {
                    AppUidItem appUidItem = new AppUidItem();
                    appUidItem.setAppUid(applicationInfo.uid);
                    hashMap.put(Integer.valueOf(applicationInfo.uid), appUidItem);
                }
            }
            for (ResolveInfo resolveInfo : queryIntentActivities) {
                ApplicationInfo applicationInfo2 = this.mPackageManager.getApplicationInfo(resolveInfo.activityInfo.packageName, 1);
                boolean z2 = this.mPackageManager.checkPermission("android.permission.INTERNET", resolveInfo.activityInfo.packageName) == 0;
                if (applicationInfo2 != null && (i = applicationInfo2.uid) > 1000 && z2) {
                    AppUidItem appUidItem2 = (AppUidItem) hashMap.get(Integer.valueOf(i));
                    if (selectAllFirewallRulesAsMap == null) {
                        appUidItem2.setDataEnable(true);
                        appUidItem2.setWlanEnable(true);
                    } else {
                        FirewallRule firewallRule = selectAllFirewallRulesAsMap.get(resolveInfo.activityInfo.packageName);
                        if (firewallRule != null) {
                            appUidItem2.setDataEnable(firewallRule.getMobile().intValue() != 1);
                            appUidItem2.setWlanEnable(firewallRule.getWlan().intValue() != 1);
                        } else {
                            appUidItem2.setDataEnable(true);
                            appUidItem2.setWlanEnable(true);
                        }
                    }
                    AppPkgItem appPkgItem = new AppPkgItem();
                    String charSequence = resolveInfo.activityInfo.applicationInfo.loadLabel(this.mPackageManager).toString();
                    appPkgItem.setSystemApp(Utils.isSystemApp(resolveInfo));
                    appPkgItem.setPkgName(resolveInfo.activityInfo.packageName);
                    appPkgItem.setAppName(charSequence);
                    appPkgItem.setAppSortKey(HanziToPinyin.getSpell(charSequence));
                    appPkgItem.setAppIcon(resolveInfo.activityInfo.applicationInfo.loadIcon(this.mPackageManager));
                    appUidItem2.getApps().add(appPkgItem);
                }
            }
        }
        return hashMap;
    }

    /* access modifiers changed from: private */
    public class RefreshTaskRunnable implements Runnable {
        boolean mShowSystemApp;

        RefreshTaskRunnable(boolean z) {
            this.mShowSystemApp = z;
        }

        public void run() {
            Map map;
            try {
                if (!this.mShowSystemApp) {
                    map = NetworkRestrictManager.this.getAppsUidItemsMap();
                } else {
                    map = NetworkRestrictManager.this.getAllAppsUidItemsMap();
                }
                ArrayList arrayList = new ArrayList();
                for (Integer num : map.keySet()) {
                    arrayList.add((AppUidItem) map.get(num));
                }
                Message obtainMessage = NetworkRestrictManager.this.mHandler.obtainMessage(273);
                obtainMessage.obj = arrayList;
                NetworkRestrictManager.this.mHandler.sendMessage(obtainMessage);
            } catch (Exception e) {
                e.printStackTrace();
                Message obtainMessage2 = NetworkRestrictManager.this.mHandler.obtainMessage(274);
                obtainMessage2.obj = e.getMessage();
                NetworkRestrictManager.this.mHandler.sendMessage(obtainMessage2);
            }
        }
    }

    /* access modifiers changed from: private */
    public class BatchUpdateRulesRunnable implements Runnable {
        List<AppUidItem> appUidItemList;
        private int data;
        private int wlan;

        BatchUpdateRulesRunnable(List<AppUidItem> list, int i, int i2) {
            this.appUidItemList = list;
            this.data = i;
            this.wlan = i2;
        }

        public void run() {
            int batchSetRules = batchSetRules(this.appUidItemList, this.data, this.wlan);
            Message obtainMessage = NetworkRestrictManager.this.mHandler.obtainMessage(275);
            obtainMessage.obj = Integer.valueOf(batchSetRules);
            NetworkRestrictManager.this.mHandler.sendMessage(obtainMessage);
        }

        private int batchSetRules(List<AppUidItem> list, int i, int i2) {
            int i3 = 0;
            for (AppUidItem appUidItem : list) {
                for (AppPkgItem appPkgItem : appUidItem.getApps()) {
                    FirewallRule.addOrUpdateRole(NetworkRestrictManager.this.mContext, new FirewallRule(appPkgItem.getPkgName(), Integer.valueOf(i2), Integer.valueOf(i)));
                    i3++;
                }
            }
            return i3;
        }
    }

    /* access modifiers changed from: private */
    public class UpdateRulesFromQRunnable implements Runnable {
        UpdateRulesFromQRunnable() {
        }

        public void run() {
            batchSetRules();
        }

        private void batchSetRules() {
            Map<String, FirewallRule> selectAllFirewallRulesAsMapFromQ = FirewallRule.selectAllFirewallRulesAsMapFromQ(NetworkRestrictManager.this.mContext);
            if (selectAllFirewallRulesAsMapFromQ != null) {
                for (FirewallRule firewallRule : new ArrayList(selectAllFirewallRulesAsMapFromQ.values())) {
                    FirewallRule.addOrUpdateRole(NetworkRestrictManager.this.mContext, firewallRule);
                }
            }
        }
    }
}
