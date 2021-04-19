package com.android.settings.fuelgauge;

import android.content.Context;
import android.content.IntentFilter;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0005R$bool;
import com.android.settings.C0017R$string;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.fuelgauge.BatteryBroadcastReceiver;
import com.android.settings.fuelgauge.BatteryInfo;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settingslib.core.lifecycle.LifecycleObserver;
import com.android.settingslib.core.lifecycle.events.OnStart;
import com.android.settingslib.core.lifecycle.events.OnStop;
import com.oneplus.settings.utils.OPUtils;

public class TopLevelBatteryPreferenceController extends BasePreferenceController implements LifecycleObserver, OnStart, OnStop {
    private BatteryBroadcastReceiver mBatteryBroadcastReceiver;
    private BatteryInfo mBatteryInfo;
    private Preference mPreference;

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ Class<? extends SliceBackgroundWorker> getBackgroundWorkerClass() {
        return super.getBackgroundWorkerClass();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ IntentFilter getIntentFilter() {
        return super.getIntentFilter();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean hasAsyncUpdate() {
        return super.hasAsyncUpdate();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isCopyableSlice() {
        return super.isCopyableSlice();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isPublicSlice() {
        return super.isPublicSlice();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isSliceable() {
        return super.isSliceable();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean useDynamicSliceSummary() {
        return super.useDynamicSliceSummary();
    }

    public TopLevelBatteryPreferenceController(Context context, String str) {
        super(context, str);
        BatteryBroadcastReceiver batteryBroadcastReceiver = new BatteryBroadcastReceiver(this.mContext);
        this.mBatteryBroadcastReceiver = batteryBroadcastReceiver;
        batteryBroadcastReceiver.setBatteryChangedListener(new BatteryBroadcastReceiver.OnBatteryChangedListener() {
            /* class com.android.settings.fuelgauge.$$Lambda$TopLevelBatteryPreferenceController$8JSAEgfckSLQsOFfnNTF6D2Wbto */

            @Override // com.android.settings.fuelgauge.BatteryBroadcastReceiver.OnBatteryChangedListener
            public final void onBatteryChanged(int i) {
                TopLevelBatteryPreferenceController.this.lambda$new$1$TopLevelBatteryPreferenceController(i);
            }
        });
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$new$1 */
    public /* synthetic */ void lambda$new$1$TopLevelBatteryPreferenceController(int i) {
        BatteryInfo.getBatteryInfo(this.mContext, (BatteryInfo.Callback) new BatteryInfo.Callback() {
            /* class com.android.settings.fuelgauge.$$Lambda$TopLevelBatteryPreferenceController$sfaKl_Ba9LgHCHIeh29r_Q8XWZA */

            @Override // com.android.settings.fuelgauge.BatteryInfo.Callback
            public final void onBatteryInfoLoaded(BatteryInfo batteryInfo) {
                TopLevelBatteryPreferenceController.this.lambda$new$0$TopLevelBatteryPreferenceController(batteryInfo);
            }
        }, true);
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$new$0 */
    public /* synthetic */ void lambda$new$0$TopLevelBatteryPreferenceController(BatteryInfo batteryInfo) {
        this.mBatteryInfo = batteryInfo;
        updateState(this.mPreference);
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return this.mContext.getResources().getBoolean(C0005R$bool.config_show_top_level_battery) ? 0 : 3;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        this.mPreference = preferenceScreen.findPreference(getPreferenceKey());
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnStart
    public void onStart() {
        if (this.mBatteryBroadcastReceiver == null) {
            BatteryBroadcastReceiver batteryBroadcastReceiver = new BatteryBroadcastReceiver(this.mContext);
            this.mBatteryBroadcastReceiver = batteryBroadcastReceiver;
            batteryBroadcastReceiver.setBatteryChangedListener(new BatteryBroadcastReceiver.OnBatteryChangedListener() {
                /* class com.android.settings.fuelgauge.$$Lambda$TopLevelBatteryPreferenceController$6eBs6ym5J3TDPguAayTPJrWp6EM */

                @Override // com.android.settings.fuelgauge.BatteryBroadcastReceiver.OnBatteryChangedListener
                public final void onBatteryChanged(int i) {
                    TopLevelBatteryPreferenceController.this.lambda$onStart$3$TopLevelBatteryPreferenceController(i);
                }
            });
        }
        this.mBatteryBroadcastReceiver.register();
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$onStart$3 */
    public /* synthetic */ void lambda$onStart$3$TopLevelBatteryPreferenceController(int i) {
        BatteryInfo.getBatteryInfo(this.mContext, (BatteryInfo.Callback) new BatteryInfo.Callback() {
            /* class com.android.settings.fuelgauge.$$Lambda$TopLevelBatteryPreferenceController$I1pChPHtQkjktazhyhvPlLMcME */

            @Override // com.android.settings.fuelgauge.BatteryInfo.Callback
            public final void onBatteryInfoLoaded(BatteryInfo batteryInfo) {
                TopLevelBatteryPreferenceController.this.lambda$onStart$2$TopLevelBatteryPreferenceController(batteryInfo);
            }
        }, true);
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$onStart$2 */
    public /* synthetic */ void lambda$onStart$2$TopLevelBatteryPreferenceController(BatteryInfo batteryInfo) {
        this.mBatteryInfo = batteryInfo;
        updateState(this.mPreference);
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnStop
    public void onStop() {
        BatteryBroadcastReceiver batteryBroadcastReceiver = this.mBatteryBroadcastReceiver;
        if (batteryBroadcastReceiver != null) {
            batteryBroadcastReceiver.unRegister();
            this.mBatteryBroadcastReceiver = null;
        }
        this.mBatteryInfo = null;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public CharSequence getSummary() {
        return getDashboardLabel(this.mContext, this.mBatteryInfo);
    }

    static CharSequence getDashboardLabel(Context context, BatteryInfo batteryInfo) {
        CharSequence charSequence;
        if (batteryInfo == null || context == null) {
            return null;
        }
        if (batteryInfo.discharging || (charSequence = batteryInfo.chargeLabel) == null) {
            CharSequence charSequence2 = batteryInfo.remainingLabel;
            if (charSequence2 == null) {
                charSequence = batteryInfo.batteryPercentString;
            } else {
                charSequence = context.getString(C0017R$string.power_remaining_settings_home_page, batteryInfo.batteryPercentString, charSequence2);
            }
        }
        return OPUtils.handleTimeSummary(charSequence);
    }
}
