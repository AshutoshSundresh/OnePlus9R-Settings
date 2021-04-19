package com.oneplus.settings.highpowerapp;

import android.content.Context;
import android.util.Log;
import android.util.OpFeatures;
import com.oneplus.settings.backgroundoptimize.Logutil;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MyActivityManager implements IMyActivityManager {
    private static final String TAG = "MyActivityManager";
    private static volatile MyActivityManager instance;
    private Method getBgPowerHungryList;
    Field isLocked = null;
    Field isStopped = null;
    Field packageName = null;
    Field powerLevel = null;
    private Method stopBgPowerHungryApp;
    Field timeStamp = null;
    Field uId = null;

    @Override // com.oneplus.settings.highpowerapp.IMyActivityManager
    public void setBgMonitorMode(boolean z) {
    }

    private MyActivityManager(Context context) {
        try {
            Class<?> cls = Class.forName("com.oneplus.os.OnePlusServiceManagerInjector");
            this.getBgPowerHungryList = cls.getDeclaredMethod("getBgPowerHungryList", new Class[0]);
            this.stopBgPowerHungryApp = cls.getDeclaredMethod("stopBgPowerHungryApp", String.class, Integer.TYPE);
        } catch (Exception e) {
            String str = TAG;
            Log.e(str, "MyActivityManager Exception=" + e);
            e.printStackTrace();
        }
    }

    public static MyActivityManager get(Context context) {
        if (instance == null) {
            synchronized (MyActivityManager.class) {
                if (instance == null) {
                    instance = new MyActivityManager(context);
                }
            }
        }
        return instance;
    }

    @Override // com.oneplus.settings.highpowerapp.IMyActivityManager
    public List<HighPowerApp> getBgPowerHungryList() {
        return convert((List) invoke(this.getBgPowerHungryList, new Object[0]));
    }

    @Override // com.oneplus.settings.highpowerapp.IMyActivityManager
    public void stopBgPowerHungryApp(String str, int i) {
        invoke(this.stopBgPowerHungryApp, str, Integer.valueOf(i));
    }

    private List<HighPowerApp> convert(List<?> list) {
        Iterator<?> it;
        Exception e;
        MyActivityManager myActivityManager = this;
        ArrayList arrayList = new ArrayList();
        Iterator<?> it2 = list.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            if (myActivityManager.packageName == null) {
                try {
                    Field field = next.getClass().getField("pkgName");
                    myActivityManager.packageName = field;
                    field.setAccessible(true);
                    Field field2 = next.getClass().getField("powerLevel");
                    myActivityManager.powerLevel = field2;
                    field2.setAccessible(true);
                    Field field3 = next.getClass().getField("isLocked");
                    myActivityManager.isLocked = field3;
                    field3.setAccessible(true);
                    Field field4 = next.getClass().getField("isStopped");
                    myActivityManager.isStopped = field4;
                    field4.setAccessible(true);
                    Field field5 = next.getClass().getField("timeStamp");
                    myActivityManager.timeStamp = field5;
                    field5.setAccessible(true);
                    if (OpFeatures.isSupport(new int[]{26})) {
                        Field field6 = next.getClass().getField("uid");
                        myActivityManager.uId = field6;
                        field6.setAccessible(true);
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
            try {
                String str = (String) myActivityManager.packageName.get(next);
                int intValue = ((Integer) myActivityManager.powerLevel.get(next)).intValue();
                boolean booleanValue = ((Boolean) myActivityManager.isLocked.get(next)).booleanValue();
                boolean booleanValue2 = ((Boolean) myActivityManager.isStopped.get(next)).booleanValue();
                long longValue = ((Long) myActivityManager.timeStamp.get(next)).longValue();
                if (OpFeatures.isSupport(new int[]{26})) {
                    int intValue2 = ((Integer) myActivityManager.uId.get(next)).intValue();
                    it = it2;
                    try {
                        arrayList.add(new HighPowerApp(str, intValue2, intValue, booleanValue, booleanValue2, longValue));
                        String str2 = TAG;
                        Logutil.loge(str2, "convert pn: " + str + ", uid =" + intValue2 + ", level=" + intValue + ", lock=" + intValue + ", stop=" + booleanValue2);
                    } catch (Exception e3) {
                        e = e3;
                        e.printStackTrace();
                        myActivityManager = this;
                        it2 = it;
                    }
                } else {
                    it = it2;
                    arrayList.add(new HighPowerApp(str, intValue, booleanValue, booleanValue2, longValue));
                    String str3 = TAG;
                    Logutil.loge(str3, "convert pn: " + str + ", level=" + intValue + ", lock=" + intValue + ", stop=" + booleanValue2);
                }
            } catch (Exception e4) {
                e = e4;
                it = it2;
                e.printStackTrace();
                myActivityManager = this;
                it2 = it;
            }
            myActivityManager = this;
            it2 = it;
        }
        return arrayList;
    }

    public Object invoke(Method method, Object... objArr) {
        if (method == null) {
            return null;
        }
        try {
            return method.invoke(null, objArr);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return null;
        } catch (IllegalArgumentException e2) {
            e2.printStackTrace();
            return null;
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
            return null;
        }
    }
}
