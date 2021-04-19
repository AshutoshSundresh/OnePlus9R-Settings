package com.android.settings.notification.zen;

import android.app.AutomaticZenRule;
import android.content.Context;
import android.service.notification.ZenPolicy;
import android.util.Pair;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.core.PreferenceControllerMixin;
import com.android.settings.notification.OPZenNoDividerCustomRadioButtonPreference;
import com.android.settingslib.core.lifecycle.Lifecycle;

public class ZenRuleVisEffectsAllPreferenceController extends AbstractZenCustomRulePreferenceController implements PreferenceControllerMixin {
    private OPZenNoDividerCustomRadioButtonPreference mPreference;

    public ZenRuleVisEffectsAllPreferenceController(Context context, Lifecycle lifecycle, String str) {
        super(context, str, lifecycle);
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.notification.zen.AbstractZenModePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        OPZenNoDividerCustomRadioButtonPreference oPZenNoDividerCustomRadioButtonPreference = (OPZenNoDividerCustomRadioButtonPreference) preferenceScreen.findPreference(getPreferenceKey());
        this.mPreference = oPZenNoDividerCustomRadioButtonPreference;
        oPZenNoDividerCustomRadioButtonPreference.setOnRadioButtonClickListener(new OPZenNoDividerCustomRadioButtonPreference.OnRadioButtonClickListener() {
            /* class com.android.settings.notification.zen.$$Lambda$ZenRuleVisEffectsAllPreferenceController$kMdzP9t13_rxso3HNXa_DiL8oKI */

            @Override // com.android.settings.notification.OPZenNoDividerCustomRadioButtonPreference.OnRadioButtonClickListener
            public final void onRadioButtonClick(OPZenNoDividerCustomRadioButtonPreference oPZenNoDividerCustomRadioButtonPreference) {
                ZenRuleVisEffectsAllPreferenceController.this.lambda$displayPreference$0$ZenRuleVisEffectsAllPreferenceController(oPZenNoDividerCustomRadioButtonPreference);
            }
        });
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$displayPreference$0 */
    public /* synthetic */ void lambda$displayPreference$0$ZenRuleVisEffectsAllPreferenceController(OPZenNoDividerCustomRadioButtonPreference oPZenNoDividerCustomRadioButtonPreference) {
        this.mMetricsFeatureProvider.action(this.mContext, 1396, Pair.create(1603, this.mId));
        this.mRule.setZenPolicy(new ZenPolicy.Builder(this.mRule.getZenPolicy()).showAllVisualEffects().build());
        this.mBackend.updateZenRule(this.mId, this.mRule);
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.notification.zen.AbstractZenCustomRulePreferenceController
    public void updateState(Preference preference) {
        AutomaticZenRule automaticZenRule;
        super.updateState(preference);
        if (this.mId != null && (automaticZenRule = this.mRule) != null && automaticZenRule.getZenPolicy() != null) {
            this.mPreference.setChecked(this.mRule.getZenPolicy().shouldShowAllVisualEffects());
        }
    }
}
