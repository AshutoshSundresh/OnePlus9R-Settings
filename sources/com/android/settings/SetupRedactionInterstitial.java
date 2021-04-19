package com.android.settings;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.UserManager;
import android.view.View;
import android.widget.TextView;
import com.android.settings.notification.RedactionInterstitial;
import com.google.android.setupcompat.util.WizardManagerHelper;
import com.google.android.setupdesign.GlifLayout;
import com.google.android.setupdesign.template.IconMixin;
import com.oneplus.settings.utils.OPUtils;

public class SetupRedactionInterstitial extends RedactionInterstitial {
    public static void setEnabled(Context context, boolean z) {
        context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, SetupRedactionInterstitial.class), z ? 1 : 2, 1);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.SettingsActivity
    public void onApplyThemeResource(Resources.Theme theme, int i, boolean z) {
        if (WizardManagerHelper.isAnySetupWizard(getIntent())) {
            i = SetupWizardUtils.getGlifTheme(getIntent());
        } else if (OPUtils.isO2()) {
            i = C0018R$style.OnePlusPasswordTheme;
        }
        super.onApplyThemeResource(theme, i, z);
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.oneplus.settings.BaseAppCompatActivity, com.android.settings.core.SettingsBaseActivity, com.android.settings.notification.RedactionInterstitial, com.android.settings.SettingsActivity
    public void onCreate(Bundle bundle) {
        if (!OPUtils.isO2() && !WizardManagerHelper.isAnySetupWizard(getIntent())) {
            finish();
        }
        super.onCreate(bundle);
    }

    public static Intent createStartIntent(Context context, int i) {
        int i2;
        Intent intent = new Intent(context, SetupRedactionInterstitial.class);
        if (UserManager.get(context).isManagedProfile(i)) {
            i2 = C0017R$string.lock_screen_notifications_interstitial_title_profile;
        } else {
            i2 = C0017R$string.lock_screen_notifications_interstitial_title;
        }
        return intent.putExtra(":settings:show_fragment_title_resid", i2).putExtra("android.intent.extra.USER_ID", i);
    }

    @Override // com.android.settings.notification.RedactionInterstitial, com.android.settings.SettingsActivity
    public Intent getIntent() {
        Intent intent = new Intent(super.getIntent());
        intent.putExtra(":settings:show_fragment", SetupRedactionInterstitialFragment.class.getName());
        intent.putExtra("extra_from_setup_wizard", true);
        return intent;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.notification.RedactionInterstitial, com.android.settings.SettingsActivity
    public boolean isValidFragment(String str) {
        return SetupRedactionInterstitialFragment.class.getName().equals(str);
    }

    public static class SetupRedactionInterstitialFragment extends RedactionInterstitial.RedactionInterstitialFragment {
        @Override // com.android.settings.notification.RedactionInterstitial.RedactionInterstitialFragment, androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
        public void onViewCreated(View view, Bundle bundle) {
            super.onViewCreated(view, bundle);
            GlifLayout glifLayout = (GlifLayout) view.findViewById(C0010R$id.setup_wizard_layout);
            if (glifLayout.shouldApplyPartnerResource()) {
                ((IconMixin) glifLayout.getMixin(IconMixin.class)).setIconTint(getResources().getColor(C0006R$color.op_setupwizard_oxygen_accent_color));
                ((TextView) view.findViewById(C0010R$id.tv_show_all)).setTextColor(getResources().getColor(C0006R$color.op_control_text_color_primary_light));
                ((TextView) view.findViewById(C0010R$id.tv_redact_sensitive)).setTextColor(getResources().getColor(C0006R$color.op_control_text_color_primary_light));
                ((TextView) view.findViewById(C0010R$id.tv_hide_all)).setTextColor(getResources().getColor(C0006R$color.op_control_text_color_primary_light));
                if (getActivity() != null) {
                    getActivity().getWindow().setStatusBarColor(getResources().getColor(C0006R$color.white));
                }
            }
        }
    }
}
