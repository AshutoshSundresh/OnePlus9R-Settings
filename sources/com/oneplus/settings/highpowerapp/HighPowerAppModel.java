package com.oneplus.settings.highpowerapp;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import android.view.View;
import android.widget.Switch;
import java.lang.ref.SoftReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class HighPowerAppModel implements View.OnClickListener {
    private IMyActivityManager mActivityManager;
    private List<HighPowerApp> mAppList = new ArrayList();
    private SoftReference<Context> mContext;
    private List<IHighPowerAppObserver> mDataObserverList = new LinkedList();
    private Object mDataObserverListLock;
    private Map<String, PackageInfo> mInstalledPackages = new ConcurrentHashMap();
    private PackageManager mPackageManager;
    private ExecutorService mThreadPool;

    public HighPowerAppModel(Context context, IHighPowerAppObserver iHighPowerAppObserver) {
        new ArrayList();
        this.mThreadPool = Executors.newCachedThreadPool();
        this.mDataObserverListLock = new Byte[0];
        this.mContext = new SoftReference<>(context);
        this.mActivityManager = MyActivityManager.get(context);
        registerObserver(iHighPowerAppObserver);
        initialize();
    }

    public void initialize() {
        this.mThreadPool.execute(new Runnable() {
            /* class com.oneplus.settings.highpowerapp.HighPowerAppModel.AnonymousClass1 */

            public void run() {
                HighPowerAppModel.this.process();
            }
        });
    }

    public void update() {
        this.mThreadPool.execute(new Runnable() {
            /* class com.oneplus.settings.highpowerapp.HighPowerAppModel.AnonymousClass2 */

            public void run() {
                HighPowerAppModel.this.process();
            }
        });
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void process() {
        List<HighPowerApp> bgPowerHungryList = this.mActivityManager.getBgPowerHungryList();
        Log.d("HighPowerAppModel", "HighPowerAppModel getBgPowerHungryList: " + bgPowerHungryList);
        for (HighPowerApp highPowerApp : bgPowerHungryList) {
            if (this.mInstalledPackages.containsKey(highPowerApp.pkgName)) {
                highPowerApp.uid = this.mInstalledPackages.get(highPowerApp.pkgName).applicationInfo.uid;
            } else {
                if (this.mPackageManager == null) {
                    this.mPackageManager = getContext().getPackageManager();
                }
                try {
                    PackageInfo packageInfo = this.mPackageManager.getPackageInfo(highPowerApp.pkgName, 0);
                    this.mInstalledPackages.put(packageInfo.packageName, packageInfo);
                    highPowerApp.uid = packageInfo.applicationInfo.uid;
                } catch (Exception unused) {
                }
            }
        }
        Collections.sort(bgPowerHungryList, new Comparator<HighPowerApp>(this) {
            /* class com.oneplus.settings.highpowerapp.HighPowerAppModel.AnonymousClass3 */

            public int compare(HighPowerApp highPowerApp, HighPowerApp highPowerApp2) {
                return highPowerApp.pkgName.hashCode() - highPowerApp2.pkgName.hashCode();
            }
        });
        this.mAppList = bgPowerHungryList;
        notifyDataChanged();
    }

    public void stopApp(String str) {
        for (HighPowerApp highPowerApp : this.mAppList) {
            if (highPowerApp.pkgName.equals(str)) {
                this.mActivityManager.stopBgPowerHungryApp(str, highPowerApp.powerLevel);
                return;
            }
        }
    }

    public List<HighPowerApp> getDataList() {
        return this.mAppList;
    }

    public void onClick(View view) {
        Switch r3 = (Switch) view;
        this.mActivityManager.setBgMonitorMode(r3.isChecked());
        if (r3.isChecked()) {
            update();
        }
    }

    public void registerObserver(IHighPowerAppObserver iHighPowerAppObserver) {
        synchronized (this.mDataObserverListLock) {
            if (!this.mDataObserverList.contains(iHighPowerAppObserver)) {
                this.mDataObserverList.add(iHighPowerAppObserver);
            }
        }
    }

    public void unregisterObserver(IHighPowerAppObserver iHighPowerAppObserver) {
        synchronized (this.mDataObserverListLock) {
            if (this.mDataObserverList.contains(iHighPowerAppObserver)) {
                this.mDataObserverList.remove(iHighPowerAppObserver);
            }
        }
    }

    private void notifyDataChanged() {
        if (this.mDataObserverList != null) {
            synchronized (this.mDataObserverListLock) {
                for (IHighPowerAppObserver iHighPowerAppObserver : this.mDataObserverList) {
                    if (iHighPowerAppObserver != null) {
                        iHighPowerAppObserver.OnDataChanged();
                    }
                }
            }
        }
    }

    private Context getContext() {
        return this.mContext.get();
    }
}
