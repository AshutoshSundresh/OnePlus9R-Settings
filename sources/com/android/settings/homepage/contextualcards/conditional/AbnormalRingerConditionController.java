package com.android.settings.homepage.contextualcards.conditional;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import com.android.settingslib.utils.ThreadUtils;

public abstract class AbnormalRingerConditionController implements ConditionalCardController {
    private static final IntentFilter FILTER = new IntentFilter("android.media.INTERNAL_RINGER_MODE_CHANGED_ACTION");
    private final Context mAppContext;
    protected final AudioManager mAudioManager;
    private final ConditionManager mConditionManager;
    private final RingerModeChangeReceiver mReceiver = new RingerModeChangeReceiver();

    public AbnormalRingerConditionController(Context context, ConditionManager conditionManager) {
        this.mAppContext = context;
        this.mConditionManager = conditionManager;
        this.mAudioManager = (AudioManager) context.getSystemService("audio");
    }

    @Override // com.android.settings.homepage.contextualcards.conditional.ConditionalCardController
    public void onPrimaryClick(Context context) {
        Intent intent = new Intent("android.settings.SOUND_SETTINGS");
        intent.setFlags(805306368);
        context.startActivity(intent);
    }

    @Override // com.android.settings.homepage.contextualcards.conditional.ConditionalCardController
    public void onActionClick() {
        this.mAudioManager.setRingerModeInternal(2);
        this.mAudioManager.setStreamVolume(2, 1, 0);
    }

    @Override // com.android.settings.homepage.contextualcards.conditional.ConditionalCardController
    public void startMonitoringStateChange() {
        this.mAppContext.registerReceiver(this.mReceiver, FILTER);
    }

    @Override // com.android.settings.homepage.contextualcards.conditional.ConditionalCardController
    public void stopMonitoringStateChange() {
        this.mAppContext.unregisterReceiver(this.mReceiver);
    }

    class RingerModeChangeReceiver extends BroadcastReceiver {
        RingerModeChangeReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if ("android.media.INTERNAL_RINGER_MODE_CHANGED_ACTION".equals(intent.getAction())) {
                ThreadUtils.postOnBackgroundThread(new Runnable() {
                    /* class com.android.settings.homepage.contextualcards.conditional.AbnormalRingerConditionController.RingerModeChangeReceiver.AnonymousClass1 */

                    public void run() {
                        if (AbnormalRingerConditionController.this.mConditionManager != null) {
                            AbnormalRingerConditionController.this.mConditionManager.onConditionChanged();
                        }
                    }
                });
            }
        }
    }
}
