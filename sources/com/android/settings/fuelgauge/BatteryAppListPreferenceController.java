package com.android.settings.fuelgauge;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.BatteryStats;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.UserHandle;
import android.os.UserManager;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.OnLifecycleEvent;
import androidx.preference.Preference;
import androidx.preference.PreferenceGroup;
import androidx.preference.PreferenceScreen;
import com.android.internal.os.BatterySipper;
import com.android.internal.os.BatteryStatsHelper;
import com.android.internal.os.PowerProfile;
import com.android.settings.C0003R$array;
import com.android.settings.C0017R$string;
import com.android.settings.SettingsActivity;
import com.android.settings.core.InstrumentedPreferenceFragment;
import com.android.settings.core.PreferenceControllerMixin;
import com.android.settingslib.core.AbstractPreferenceController;
import com.android.settingslib.core.lifecycle.Lifecycle;
import com.android.settingslib.core.lifecycle.LifecycleObserver;
import com.android.settingslib.utils.StringUtil;
import com.oneplus.settings.backgroundoptimize.Logutil;
import com.oneplus.settings.highpowerapp.HighPowerApp;
import com.oneplus.settings.highpowerapp.HighPowerAppModel;
import com.oneplus.settings.highpowerapp.IHighPowerAppObserver;
import com.oneplus.settings.utils.OPUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

public class BatteryAppListPreferenceController extends AbstractPreferenceController implements PreferenceControllerMixin, LifecycleObserver, IHighPowerAppObserver {
    static final boolean USE_FAKE_DATA = false;
    private SettingsActivity mActivity;
    PreferenceGroup mAppListGroup;
    private BatteryStatsHelper mBatteryStatsHelper;
    BatteryUtils mBatteryUtils;
    private View.OnClickListener mForceCloseListener = new View.OnClickListener() {
        /* class com.android.settings.fuelgauge.BatteryAppListPreferenceController.AnonymousClass3 */

        public void onClick(View view) {
            Object tag = view.getTag();
            if (tag != null && (tag instanceof String)) {
                BatteryAppListPreferenceController.this.mHighPowerAppModel.stopApp((String) tag);
                BatteryAppListPreferenceController.this.mHighPowerAppModel.update();
            }
        }
    };
    private InstrumentedPreferenceFragment mFragment;
    private Handler mHandler = new Handler(Looper.getMainLooper()) {
        /* class com.android.settings.fuelgauge.BatteryAppListPreferenceController.AnonymousClass1 */

        public void handleMessage(Message message) {
            int i = message.what;
            if (i == 1) {
                BatteryEntry batteryEntry = (BatteryEntry) message.obj;
                PowerGaugePreference powerGaugePreference = (PowerGaugePreference) BatteryAppListPreferenceController.this.mAppListGroup.findPreference(Integer.toString(batteryEntry.sipper.uidObj.getUid()));
                if (powerGaugePreference != null) {
                    powerGaugePreference.setIcon(BatteryAppListPreferenceController.this.mUserManager.getBadgedIconForUser(batteryEntry.getIcon(), new UserHandle(UserHandle.getUserId(batteryEntry.sipper.getUid()))));
                    powerGaugePreference.setTitle(batteryEntry.name);
                    if (batteryEntry.sipper.drainType == BatterySipper.DrainType.APP) {
                        powerGaugePreference.setContentDescription(batteryEntry.name);
                    }
                }
            } else if (i == 2) {
                SettingsActivity settingsActivity = BatteryAppListPreferenceController.this.mActivity;
                if (settingsActivity != null) {
                    settingsActivity.reportFullyDrawn();
                }
            } else if (i == 1000) {
                BatteryAppListPreferenceController.this.mHighPowerAppModel.update();
                if (!BatteryAppListPreferenceController.this.mPauseUpdate) {
                    BatteryAppListPreferenceController.this.nextUpdate();
                }
            }
            super.handleMessage(message);
        }
    };
    private HighPowerAppModel mHighPowerAppModel;
    private boolean mPauseUpdate;
    private Context mPrefContext;
    private ArrayMap<String, Preference> mPreferenceCache;
    private final String mPreferenceKey;
    private int mStatsType = 0;
    private UserManager mUserManager;

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public boolean isAvailable() {
        return true;
    }

    public BatteryAppListPreferenceController(Context context, String str, Lifecycle lifecycle, SettingsActivity settingsActivity, InstrumentedPreferenceFragment instrumentedPreferenceFragment) {
        super(context);
        if (lifecycle != null) {
            lifecycle.addObserver(this);
        }
        this.mPreferenceKey = str;
        this.mBatteryUtils = BatteryUtils.getInstance(context);
        this.mUserManager = (UserManager) context.getSystemService("user");
        this.mActivity = settingsActivity;
        this.mFragment = instrumentedPreferenceFragment;
        this.mHighPowerAppModel = new HighPowerAppModel(context, null);
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    public void onPause() {
        BatteryEntry.stopRequestQueue();
        this.mHandler.removeMessages(1);
        this.mPauseUpdate = true;
        this.mHighPowerAppModel.unregisterObserver(this);
        this.mHandler.removeMessages(1000);
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_RESUME)
    public void onResume() {
        this.mPauseUpdate = USE_FAKE_DATA;
        this.mHighPowerAppModel.registerObserver(this);
        this.mHighPowerAppModel.update();
        nextUpdate();
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    public void onDestroy() {
        if (this.mActivity.isChangingConfigurations()) {
            BatteryEntry.clearUidCache();
        }
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        this.mPrefContext = preferenceScreen.getContext();
        this.mAppListGroup = (PreferenceGroup) preferenceScreen.findPreference(this.mPreferenceKey);
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public String getPreferenceKey() {
        return this.mPreferenceKey;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public boolean handlePreferenceTreeClick(Preference preference) {
        if (!(preference instanceof PowerGaugePreference)) {
            return USE_FAKE_DATA;
        }
        PowerGaugePreference powerGaugePreference = (PowerGaugePreference) preference;
        AdvancedPowerUsageDetail.startBatteryDetailPage(this.mActivity, this.mFragment, this.mBatteryStatsHelper, 0, powerGaugePreference.getInfo(), powerGaugePreference.getPercent());
        return true;
    }

    public void refreshAppListGroup(BatteryStatsHelper batteryStatsHelper, boolean z) {
        SettingsActivity settingsActivity;
        double d;
        int i;
        List<BatterySipper> list;
        boolean z2;
        if (isAvailable()) {
            this.mBatteryStatsHelper = batteryStatsHelper;
            this.mAppListGroup.setTitle(C0017R$string.power_usage_list_summary);
            PowerProfile powerProfile = batteryStatsHelper.getPowerProfile();
            BatteryStats stats = batteryStatsHelper.getStats();
            double averagePower = powerProfile.getAveragePower("screen.full");
            List<BatterySipper> coalescedUsageList = getCoalescedUsageList(new ArrayList(batteryStatsHelper.getUsageList()));
            if (!OPUtils.isGuestMode()) {
                coalescedUsageList = concatHighPowerApp(coalescedUsageList, stats);
            }
            HashMap hashMap = new HashMap();
            HashSet hashSet = new HashSet();
            if (this.mHighPowerAppModel != null && (settingsActivity = this.mActivity) != null && !settingsActivity.isFinishing()) {
                List<HighPowerApp> dataList = this.mHighPowerAppModel.getDataList();
                boolean z3 = USE_FAKE_DATA;
                int i2 = 0;
                while (dataList != null && i2 < dataList.size()) {
                    hashSet.add(Integer.valueOf(dataList.get(i2).uid));
                    i2++;
                }
                this.mPrefContext.getString(C0017R$string.op_app_already_uninstalled);
                int dischargeAmount = stats != null ? stats.getDischargeAmount(0) : 0;
                cacheRemoveAllPrefs(this.mAppListGroup);
                this.mAppListGroup.setOrderingAsAdded(USE_FAKE_DATA);
                if (averagePower >= 10.0d) {
                    if (z) {
                        d = 0.0d;
                    } else {
                        d = this.mBatteryUtils.removeHiddenBatterySippers(coalescedUsageList);
                    }
                    this.mBatteryUtils.sortUsageList(coalescedUsageList);
                    int size = coalescedUsageList.size();
                    int i3 = 0;
                    boolean z4 = false;
                    while (true) {
                        if (i3 >= size) {
                            z3 = z4;
                            break;
                        }
                        BatterySipper batterySipper = coalescedUsageList.get(i3);
                        if (batterySipper.totalPowerMah * 3600.0d >= 5.0d || hashSet.contains(Integer.valueOf(batterySipper.getUid()))) {
                            i = i3;
                            double calculateBatteryPercent = this.mBatteryUtils.calculateBatteryPercent(batterySipper.totalPowerMah, batteryStatsHelper.getTotalPower(), d, dischargeAmount);
                            if (((int) (calculateBatteryPercent + 0.5d)) < 1 && hashSet.contains(Integer.valueOf(batterySipper.getUid()))) {
                                calculateBatteryPercent = 0.5d;
                            }
                            if (((int) (0.5d + calculateBatteryPercent)) >= 1 && !shouldHideSipper(batterySipper)) {
                                UserHandle userHandle = new UserHandle(UserHandle.getUserId(batterySipper.getUid()));
                                BatteryEntry batteryEntry = new BatteryEntry(this.mActivity, this.mHandler, this.mUserManager, batterySipper);
                                Drawable badgedIconForUser = this.mUserManager.getBadgedIconForUser(batteryEntry.getIcon(), userHandle);
                                CharSequence badgedLabelForUser = this.mUserManager.getBadgedLabelForUser(batteryEntry.getLabel(), userHandle);
                                String extractKeyFromSipper = extractKeyFromSipper(batterySipper);
                                PowerGaugePreference powerGaugePreference = (PowerGaugePreference) getCachedPreference(extractKeyFromSipper);
                                if (powerGaugePreference == null) {
                                    list = coalescedUsageList;
                                    powerGaugePreference = new PowerGaugePreference(this.mPrefContext, badgedIconForUser, badgedLabelForUser, batteryEntry);
                                    powerGaugePreference.setKey(extractKeyFromSipper);
                                } else {
                                    list = coalescedUsageList;
                                }
                                batterySipper.percent = calculateBatteryPercent;
                                powerGaugePreference.setTitle(batteryEntry.getLabel());
                                powerGaugePreference.setOrder(i + 1);
                                powerGaugePreference.setPercent(calculateBatteryPercent);
                                powerGaugePreference.shouldShowAnomalyIcon(USE_FAKE_DATA);
                                powerGaugePreference.setOnButtonClickListener(this.mForceCloseListener);
                                hashMap.put(Integer.valueOf(batterySipper.getUid()), powerGaugePreference);
                                if (batterySipper.usageTimeMs == 0 && batterySipper.drainType == BatterySipper.DrainType.APP) {
                                    BatteryUtils batteryUtils = this.mBatteryUtils;
                                    BatteryStats.Uid uid = batterySipper.uidObj;
                                    z3 = true;
                                    z2 = USE_FAKE_DATA;
                                    batterySipper.usageTimeMs = batteryUtils.getProcessTimeMs(1, uid, 0);
                                } else {
                                    z3 = true;
                                    z2 = USE_FAKE_DATA;
                                }
                                this.mAppListGroup.addPreference(powerGaugePreference);
                                if (this.mAppListGroup.getPreferenceCount() - getCachedCount() > 21) {
                                    break;
                                }
                                z4 = z3;
                                i3 = i + 1;
                                coalescedUsageList = list;
                            }
                        } else {
                            i = i3;
                        }
                        list = coalescedUsageList;
                        z2 = USE_FAKE_DATA;
                        i3 = i + 1;
                        coalescedUsageList = list;
                    }
                    setPowerState(hashMap);
                }
                if (!z3) {
                    addNotAvailableMessage();
                }
                removeCachedPrefs(this.mAppListGroup);
                BatteryEntry.startRequestQueue();
            }
        }
    }

    private List<BatterySipper> getCoalescedUsageList(List<BatterySipper> list) {
        String str;
        SparseArray sparseArray = new SparseArray();
        ArrayList arrayList = new ArrayList();
        int size = list.size();
        for (int i = 0; i < size; i++) {
            BatterySipper batterySipper = list.get(i);
            if (batterySipper.getUid() > 0) {
                int uid = batterySipper.getUid();
                if (isSharedGid(batterySipper.getUid())) {
                    uid = UserHandle.getUid(0, UserHandle.getAppIdFromSharedAppGid(batterySipper.getUid()));
                }
                if (isSystemUid(uid) && !"mediaserver".equals(batterySipper.packageWithHighestDrain)) {
                    uid = 1000;
                }
                if (uid != batterySipper.getUid()) {
                    BatterySipper batterySipper2 = new BatterySipper(batterySipper.drainType, new FakeUid(uid), 0.0d);
                    batterySipper2.add(batterySipper);
                    batterySipper2.packageWithHighestDrain = batterySipper.packageWithHighestDrain;
                    batterySipper2.mPackages = batterySipper.mPackages;
                    batterySipper = batterySipper2;
                }
                int indexOfKey = sparseArray.indexOfKey(uid);
                if (indexOfKey < 0) {
                    sparseArray.put(uid, batterySipper);
                } else {
                    BatterySipper batterySipper3 = (BatterySipper) sparseArray.valueAt(indexOfKey);
                    batterySipper3.add(batterySipper);
                    if (batterySipper3.packageWithHighestDrain == null && (str = batterySipper.packageWithHighestDrain) != null) {
                        batterySipper3.packageWithHighestDrain = str;
                    }
                    String[] strArr = batterySipper3.mPackages;
                    int length = strArr != null ? strArr.length : 0;
                    String[] strArr2 = batterySipper.mPackages;
                    int length2 = strArr2 != null ? strArr2.length : 0;
                    if (length2 > 0) {
                        String[] strArr3 = new String[(length + length2)];
                        if (length > 0) {
                            System.arraycopy(batterySipper3.mPackages, 0, strArr3, 0, length);
                        }
                        System.arraycopy(batterySipper.mPackages, 0, strArr3, length, length2);
                        batterySipper3.mPackages = strArr3;
                    }
                }
            } else {
                arrayList.add(batterySipper);
            }
        }
        int size2 = sparseArray.size();
        for (int i2 = 0; i2 < size2; i2++) {
            arrayList.add((BatterySipper) sparseArray.valueAt(i2));
        }
        this.mBatteryUtils.sortUsageList(arrayList);
        return arrayList;
    }

    /* access modifiers changed from: package-private */
    public void setUsageSummary(Preference preference, BatterySipper batterySipper) {
        long j = batterySipper.usageTimeMs;
        if (shouldShowSummary(batterySipper) && j >= 60000) {
            CharSequence formatElapsedTime = StringUtil.formatElapsedTime(this.mContext, (double) j, USE_FAKE_DATA);
            if (batterySipper.drainType == BatterySipper.DrainType.APP && !this.mBatteryUtils.shouldHideSipper(batterySipper)) {
                formatElapsedTime = TextUtils.expandTemplate(this.mContext.getText(C0017R$string.battery_used_for), formatElapsedTime);
            }
            preference.setSummary(formatElapsedTime);
        }
    }

    /* access modifiers changed from: package-private */
    public boolean shouldHideSipper(BatterySipper batterySipper) {
        BatterySipper.DrainType drainType = batterySipper.drainType;
        if (drainType == BatterySipper.DrainType.OVERCOUNTED || drainType == BatterySipper.DrainType.UNACCOUNTED || this.mBatteryUtils.isHiddenSystemModule(batterySipper) || batterySipper.getUid() < 0) {
            return true;
        }
        return USE_FAKE_DATA;
    }

    /* access modifiers changed from: package-private */
    public String extractKeyFromSipper(BatterySipper batterySipper) {
        if (batterySipper.uidObj != null) {
            return extractKeyFromUid(batterySipper.getUid());
        }
        BatterySipper.DrainType drainType = batterySipper.drainType;
        if (drainType == BatterySipper.DrainType.USER) {
            return batterySipper.drainType.toString() + batterySipper.userId;
        } else if (drainType != BatterySipper.DrainType.APP) {
            return drainType.toString();
        } else {
            if (batterySipper.getPackages() != null) {
                return TextUtils.concat(batterySipper.getPackages()).toString();
            }
            Log.w("BatteryAppList", "Inappropriate BatterySipper without uid and package names: " + batterySipper);
            return "-1";
        }
    }

    /* access modifiers changed from: package-private */
    public String extractKeyFromUid(int i) {
        return Integer.toString(i);
    }

    private void cacheRemoveAllPrefs(PreferenceGroup preferenceGroup) {
        this.mPreferenceCache = new ArrayMap<>();
        int preferenceCount = preferenceGroup.getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            Preference preference = preferenceGroup.getPreference(i);
            if (!TextUtils.isEmpty(preference.getKey())) {
                this.mPreferenceCache.put(preference.getKey(), preference);
            }
        }
    }

    private boolean shouldShowSummary(BatterySipper batterySipper) {
        CharSequence[] textArray = this.mContext.getResources().getTextArray(C0003R$array.whitelist_hide_summary_in_battery_usage);
        String str = batterySipper.packageWithHighestDrain;
        for (CharSequence charSequence : textArray) {
            if (TextUtils.equals(str, charSequence)) {
                return USE_FAKE_DATA;
            }
        }
        return true;
    }

    private static boolean isSharedGid(int i) {
        if (UserHandle.getAppIdFromSharedAppGid(i) > 0) {
            return true;
        }
        return USE_FAKE_DATA;
    }

    private static boolean isSystemUid(int i) {
        int appId = UserHandle.getAppId(i);
        if (appId < 1000 || appId >= 10000) {
            return USE_FAKE_DATA;
        }
        return true;
    }

    private Preference getCachedPreference(String str) {
        ArrayMap<String, Preference> arrayMap = this.mPreferenceCache;
        if (arrayMap != null) {
            return arrayMap.remove(str);
        }
        return null;
    }

    private void removeCachedPrefs(PreferenceGroup preferenceGroup) {
        for (Preference preference : this.mPreferenceCache.values()) {
            preferenceGroup.removePreference(preference);
        }
        this.mPreferenceCache = null;
    }

    private int getCachedCount() {
        ArrayMap<String, Preference> arrayMap = this.mPreferenceCache;
        if (arrayMap != null) {
            return arrayMap.size();
        }
        return 0;
    }

    private void addNotAvailableMessage() {
        if (getCachedPreference("not_available") == null) {
            Preference preference = new Preference(this.mPrefContext);
            preference.setKey("not_available");
            preference.setTitle(C0017R$string.power_usage_not_available);
            preference.setSelectable(USE_FAKE_DATA);
            this.mAppListGroup.addPreference(preference);
        }
    }

    @Override // com.oneplus.settings.highpowerapp.IHighPowerAppObserver
    public void OnDataChanged() {
        Log.d("BatteryAppList", "OnDataChanged");
        SettingsActivity settingsActivity = this.mActivity;
        if (settingsActivity == null) {
            Log.e("BatteryAppList", "null activity");
        } else {
            settingsActivity.runOnUiThread(new Runnable() {
                /* class com.android.settings.fuelgauge.BatteryAppListPreferenceController.AnonymousClass2 */

                public void run() {
                    try {
                        ((PowerUsageAdvanced) BatteryAppListPreferenceController.this.mFragment).lambda$onCreate$0(0);
                    } catch (IllegalStateException e) {
                        Log.e("BatteryAppList", "IllegalStateException " + e);
                    }
                }
            });
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void nextUpdate() {
        if (!OPUtils.isGuestMode()) {
            this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(1000), 10000);
        }
    }

    private List<BatterySipper> concatHighPowerApp(List<BatterySipper> list, BatteryStats batteryStats) {
        if (list == null) {
            list = new ArrayList<>();
        }
        HashMap hashMap = new HashMap();
        for (BatterySipper batterySipper : list) {
            hashMap.put(Integer.valueOf(batterySipper.getUid()), batterySipper);
        }
        HighPowerAppModel highPowerAppModel = this.mHighPowerAppModel;
        if (highPowerAppModel != null) {
            List<HighPowerApp> dataList = highPowerAppModel.getDataList();
            StringBuilder sb = new StringBuilder();
            sb.append("HighPowerApp list.size=");
            sb.append(dataList != null ? Integer.valueOf(dataList.size()) : null);
            Logutil.loge("BatteryAppList", sb.toString());
            if (dataList != null && dataList.size() > 0) {
                int dischargeAmount = batteryStats != null ? batteryStats.getDischargeAmount(this.mStatsType) : 0;
                double totalPower = this.mBatteryStatsHelper.getTotalPower();
                double d = (dischargeAmount == 0 || 0.0d == totalPower) ? 1.0d : (0.6d / ((double) dischargeAmount)) * totalPower;
                Logutil.loge("BatteryAppList", "concatHighPowerApp list.size=" + dataList.size());
                for (HighPowerApp highPowerApp : dataList) {
                    if (!hashMap.containsKey(Integer.valueOf(highPowerApp.uid))) {
                        Logutil.loge("BatteryAppList", "concatHighPowerApp add pkg=" + highPowerApp.pkgName + ", uid=" + highPowerApp.uid);
                        BatterySipper batterySipper2 = new BatterySipper(BatterySipper.DrainType.APP, new FakeUid(highPowerApp.uid), 1.0d);
                        batterySipper2.totalPowerMah = d;
                        list.add(batterySipper2);
                    } else {
                        Logutil.loge("BatteryAppList", "concatHighPowerApp exist pkg=" + highPowerApp.pkgName + ", uid=" + highPowerApp.uid);
                        BatterySipper batterySipper3 = (BatterySipper) hashMap.get(Integer.valueOf(highPowerApp.uid));
                        if (batterySipper3.totalPowerMah < d) {
                            batterySipper3.totalPowerMah = d;
                        }
                    }
                }
            }
        }
        return list;
    }

    private void setPowerState(Map<Integer, PowerGaugePreference> map) {
        List<HighPowerApp> dataList;
        if (map != null) {
            for (PowerGaugePreference powerGaugePreference : map.values()) {
                powerGaugePreference.setState(-1);
            }
            HighPowerAppModel highPowerAppModel = this.mHighPowerAppModel;
            if (!(highPowerAppModel == null || (dataList = highPowerAppModel.getDataList()) == null || dataList.size() <= 0)) {
                Logutil.loge("BatteryAppList", "setPowerState list.size=" + dataList.size());
                for (HighPowerApp highPowerApp : dataList) {
                    if (map.containsKey(Integer.valueOf(highPowerApp.uid))) {
                        Logutil.loge("BatteryAppList", "setPowerState pkg=" + highPowerApp.pkgName + ", uid=" + highPowerApp.uid);
                        map.get(Integer.valueOf(highPowerApp.uid)).setState(highPowerApp.getState());
                    }
                }
            }
        }
    }
}
