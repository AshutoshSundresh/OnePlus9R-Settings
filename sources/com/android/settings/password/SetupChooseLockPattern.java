package com.android.settings.password;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import androidx.fragment.app.Fragment;
import com.android.settings.C0005R$bool;
import com.android.settings.C0006R$color;
import com.android.settings.C0010R$id;
import com.android.settings.C0017R$string;
import com.android.settings.C0018R$style;
import com.android.settings.SetupRedactionInterstitial;
import com.android.settings.SetupWizardUtils;
import com.android.settings.password.ChooseLockPattern;
import com.android.settings.password.ChooseLockTypeDialogFragment;
import com.android.settings.password.SetupChooseLockPattern;
import com.google.android.setupcompat.util.WizardManagerHelper;
import com.google.android.setupdesign.GlifLayout;
import com.oneplus.settings.utils.OPUtils;

public class SetupChooseLockPattern extends ChooseLockPattern {
    public static Intent modifyIntentForSetup(Context context, Intent intent) {
        intent.setClass(context, SetupChooseLockPattern.class);
        return intent;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.SettingsActivity
    public void onApplyThemeResource(Resources.Theme theme, int i, boolean z) {
        if (WizardManagerHelper.isAnySetupWizard(getIntent())) {
            i = SetupWizardUtils.getGlifTheme(getIntent());
        }
        super.onApplyThemeResource(theme, i, z);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.password.ChooseLockPattern, com.android.settings.SettingsActivity
    public boolean isValidFragment(String str) {
        return SetupChooseLockPatternFragment.class.getName().equals(str);
    }

    /* access modifiers changed from: package-private */
    @Override // com.android.settings.password.ChooseLockPattern
    public Class<? extends Fragment> getFragmentClass() {
        return SetupChooseLockPatternFragment.class;
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.oneplus.settings.BaseAppCompatActivity, com.android.settings.core.SettingsBaseActivity, com.android.settings.password.ChooseLockPattern, com.android.settings.SettingsActivity
    public void onCreate(Bundle bundle) {
        if (OPUtils.isO2()) {
            setTheme(C0018R$style.OnePlusSetupPasswordTheme);
        }
        super.onCreate(bundle);
        setTitle(C0017R$string.lockpassword_choose_your_screen_lock_header);
    }

    public static class SetupChooseLockPatternFragment extends ChooseLockPattern.ChooseLockPatternFragment implements ChooseLockTypeDialogFragment.OnLockTypeSelectedListener {
        private GlifLayout mLayout;
        private boolean mLeftButtonIsSkip;
        private Button mOptionsButton;

        @Override // com.android.settings.password.ChooseLockPattern.ChooseLockPatternFragment, androidx.fragment.app.Fragment
        public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
            if (!getResources().getBoolean(C0005R$bool.config_lock_pattern_minimal_ui)) {
                this.mOptionsButton = (Button) onCreateView.findViewById(C0010R$id.screen_lock_options);
                if (OPUtils.isO2()) {
                    this.mOptionsButton.setTextColor(getResources().getColor(C0006R$color.op_setupwizard_oxygen_accent_color));
                }
                this.mOptionsButton.setOnClickListener(new View.OnClickListener() {
                    /* class com.android.settings.password.$$Lambda$SetupChooseLockPattern$SetupChooseLockPatternFragment$oe1sLLLbUw3chjlv8P3cpGYEWs */

                    public final void onClick(View view) {
                        SetupChooseLockPattern.SetupChooseLockPatternFragment.this.lambda$onCreateView$0$SetupChooseLockPattern$SetupChooseLockPatternFragment(view);
                    }
                });
            }
            this.mSkipOrClearButton.setOnClickListener(new View.OnClickListener() {
                /* class com.android.settings.password.$$Lambda$qmj8MbFDaJVoWm4wk3p_uMWO8v0 */

                public final void onClick(View view) {
                    SetupChooseLockPattern.SetupChooseLockPatternFragment.this.onSkipOrClearButtonClick(view);
                }
            });
            GlifLayout glifLayout = (GlifLayout) onCreateView;
            this.mLayout = glifLayout;
            if (glifLayout.shouldApplyPartnerResource() && this.mLayout.getIcon() != null) {
                this.mLayout.getIcon().mutate().setTintList(getResources().getColorStateList(C0006R$color.op_setupwizard_oxygen_accent_color));
            }
            return onCreateView;
        }

        /* access modifiers changed from: private */
        /* renamed from: lambda$onCreateView$0 */
        public /* synthetic */ void lambda$onCreateView$0$SetupChooseLockPattern$SetupChooseLockPatternFragment(View view) {
            ChooseLockTypeDialogFragment.newInstance(this.mUserId).show(getChildFragmentManager(), "skip_screen_lock_dialog");
        }

        @Override // com.android.settings.password.ChooseLockPattern.ChooseLockPatternFragment, androidx.fragment.app.Fragment
        public void onViewCreated(View view, Bundle bundle) {
            super.onViewCreated(view, bundle);
            this.mHeaderText.setTextColor(getResources().getColor(C0006R$color.op_control_text_color_primary_light));
            this.mDefaultHeaderColorList = this.mHeaderText.getTextColors();
            this.mFooterText.setTextColor(getResources().getColor(C0006R$color.op_control_text_color_primary_light));
        }

        /* access modifiers changed from: protected */
        @Override // com.android.settings.password.ChooseLockPattern.ChooseLockPatternFragment
        public void onSkipOrClearButtonClick(View view) {
            if (this.mLeftButtonIsSkip) {
                SetupSkipDialog.newInstance(getActivity().getIntent().getBooleanExtra(":settings:frp_supported", false), true, false, getActivity().getIntent().getBooleanExtra("for_fingerprint", false), getActivity().getIntent().getBooleanExtra("for_face", false), true).show(getFragmentManager());
            } else {
                super.onSkipOrClearButtonClick(view);
            }
        }

        @Override // com.android.settings.password.ChooseLockTypeDialogFragment.OnLockTypeSelectedListener
        public void onLockTypeSelected(ScreenLockType screenLockType) {
            if (ScreenLockType.PATTERN != screenLockType) {
                startChooseLockActivity(screenLockType, getActivity());
            }
        }

        /* access modifiers changed from: protected */
        @Override // com.android.settings.password.ChooseLockPattern.ChooseLockPatternFragment
        public void updateStage(ChooseLockPattern.ChooseLockPatternFragment.Stage stage) {
            Button button;
            super.updateStage(stage);
            if (!getResources().getBoolean(C0005R$bool.config_lock_pattern_minimal_ui) && (button = this.mOptionsButton) != null) {
                button.setVisibility((stage == ChooseLockPattern.ChooseLockPatternFragment.Stage.Introduction || stage == ChooseLockPattern.ChooseLockPatternFragment.Stage.HelpScreen || stage == ChooseLockPattern.ChooseLockPatternFragment.Stage.ChoiceTooShort || stage == ChooseLockPattern.ChooseLockPatternFragment.Stage.FirstChoiceValid) ? 0 : 4);
            }
            if (stage.leftMode == ChooseLockPattern.ChooseLockPatternFragment.LeftButtonMode.Gone && stage == ChooseLockPattern.ChooseLockPatternFragment.Stage.Introduction) {
                this.mSkipOrClearButton.setVisibility(0);
                this.mSkipOrClearButton.setText(getActivity(), C0017R$string.skip_label);
                this.mLeftButtonIsSkip = true;
            } else {
                this.mLeftButtonIsSkip = false;
            }
            int i = stage.message;
            if (i == -1) {
                this.mMessageText.setText("");
            } else {
                this.mMessageText.setText(i);
            }
        }

        /* access modifiers changed from: protected */
        @Override // com.android.settings.password.ChooseLockPattern.ChooseLockPatternFragment
        public Intent getRedactionInterstitialIntent(Context context) {
            SetupRedactionInterstitial.setEnabled(context, true);
            if (OPUtils.isO2()) {
                return SetupRedactionInterstitial.createStartIntent(context, this.mUserId);
            }
            return null;
        }
    }
}
