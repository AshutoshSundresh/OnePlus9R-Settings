package com.oneplus.settings;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.provider.Settings;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settingslib.core.AbstractPreferenceController;
import com.android.settingslib.core.lifecycle.Lifecycle;
import com.android.settingslib.core.lifecycle.LifecycleObserver;
import com.android.settingslib.core.lifecycle.events.OnPause;
import com.android.settingslib.core.lifecycle.events.OnResume;
import com.oneplus.settings.widget.OPCustomTwoTargetPreference;

public class OPPowerMenuPreferenceController extends BasePreferenceController implements LifecycleObserver, OnResume, OnPause {
    private static final Uri QUICK_TURN_ON_VOICE_ASSISTANT_URI = Settings.System.getUriFor("quick_turn_on_voice_assistant");
    final String mKEY;
    private OPCustomTwoTargetPreference mPreference;
    private SettingObserver mSettingObserver;

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return 0;
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

    public OPPowerMenuPreferenceController(Context context, Lifecycle lifecycle, String str) {
        super(context, str);
        this.mKEY = str;
        if (lifecycle != null) {
            lifecycle.addObserver(this);
        }
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        OPCustomTwoTargetPreference oPCustomTwoTargetPreference = (OPCustomTwoTargetPreference) preferenceScreen.findPreference(getPreferenceKey());
        this.mPreference = oPCustomTwoTargetPreference;
        oPCustomTwoTargetPreference.setOnGearClickListener(new OPCustomTwoTargetPreference.OnGearClickListener() {
            /* class com.oneplus.settings.$$Lambda$OPPowerMenuPreferenceController$Tt4_EhPuCQOEXd_T6GIn4LcaSs */

            @Override // com.oneplus.settings.widget.OPCustomTwoTargetPreference.OnGearClickListener
            public final void onGearClick(OPCustomTwoTargetPreference oPCustomTwoTargetPreference) {
                OPPowerMenuPreferenceController.this.lambda$displayPreference$0$OPPowerMenuPreferenceController(oPCustomTwoTargetPreference);
            }
        });
        this.mPreference.setOnRadioButtonClickListener(new OPCustomTwoTargetPreference.OnRadioButtonClickListener() {
            /* class com.oneplus.settings.$$Lambda$OPPowerMenuPreferenceController$vbC30vzQbsKGxQm6wiQf2dpOXH0 */

            @Override // com.oneplus.settings.widget.OPCustomTwoTargetPreference.OnRadioButtonClickListener
            public final void onRadioButtonClick(OPCustomTwoTargetPreference oPCustomTwoTargetPreference) {
                OPPowerMenuPreferenceController.this.lambda$displayPreference$1$OPPowerMenuPreferenceController(oPCustomTwoTargetPreference);
            }
        });
        this.mSettingObserver = new SettingObserver();
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$displayPreference$0 */
    public /* synthetic */ void lambda$displayPreference$0$OPPowerMenuPreferenceController(OPCustomTwoTargetPreference oPCustomTwoTargetPreference) {
        Intent intent = new Intent();
        intent.setAction("android.settings.ACTION_POWER_MENU_SETTINGS");
        this.mContext.startActivity(intent);
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$displayPreference$1 */
    public /* synthetic */ void lambda$displayPreference$1$OPPowerMenuPreferenceController(OPCustomTwoTargetPreference oPCustomTwoTargetPreference) {
        this.mPreference.setChecked(true);
        Settings.System.putInt(this.mContext.getContentResolver(), "quick_turn_on_voice_assistant", 0);
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public String getPreferenceKey() {
        return this.mKEY;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public void updateState(Preference preference) {
        super.updateState(preference);
        OPCustomTwoTargetPreference oPCustomTwoTargetPreference = this.mPreference;
        boolean z = false;
        if (Settings.System.getInt(this.mContext.getContentResolver(), "quick_turn_on_voice_assistant", 0) == 0) {
            z = true;
        }
        oPCustomTwoTargetPreference.setChecked(z);
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnResume
    public void onResume() {
        SettingObserver settingObserver = this.mSettingObserver;
        if (settingObserver != null) {
            settingObserver.register(this.mContext.getContentResolver(), true);
        }
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnPause
    public void onPause() {
        SettingObserver settingObserver = this.mSettingObserver;
        if (settingObserver != null) {
            settingObserver.register(this.mContext.getContentResolver(), false);
        }
    }

    class SettingObserver extends ContentObserver {
        public SettingObserver() {
            super(new Handler());
        }

        public void register(ContentResolver contentResolver, boolean z) {
            if (z) {
                contentResolver.registerContentObserver(OPPowerMenuPreferenceController.QUICK_TURN_ON_VOICE_ASSISTANT_URI, false, this);
            } else {
                contentResolver.unregisterContentObserver(this);
            }
        }

        public void onChange(boolean z, Uri uri) {
            super.onChange(z, uri);
            if (OPPowerMenuPreferenceController.QUICK_TURN_ON_VOICE_ASSISTANT_URI.equals(uri)) {
                if (Settings.System.getInt(((AbstractPreferenceController) OPPowerMenuPreferenceController.this).mContext.getContentResolver(), "quick_turn_on_voice_assistant", 0) == 0) {
                    OPPowerMenuPreferenceController.this.mPreference.setChecked(true);
                } else {
                    OPPowerMenuPreferenceController.this.mPreference.setChecked(false);
                }
            }
        }
    }
}
