package com.android.settings.password;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.android.settings.C0006R$color;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0010R$id;
import com.android.settings.C0017R$string;
import com.android.settings.C0018R$style;
import com.android.settings.SetupRedactionInterstitial;
import com.android.settings.SetupWizardUtils;
import com.android.settings.password.ChooseLockPassword;
import com.android.settings.password.ChooseLockTypeDialogFragment;
import com.android.settings.password.SetupChooseLockPassword;
import com.google.android.setupcompat.util.WizardManagerHelper;
import com.oneplus.settings.utils.OPUtils;

public class SetupChooseLockPassword extends ChooseLockPassword {
    public static Intent modifyIntentForSetup(Context context, Intent intent) {
        intent.setClass(context, SetupChooseLockPassword.class);
        intent.putExtra("extra_prefs_show_button_bar", false);
        return intent;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.SettingsActivity
    public void onApplyThemeResource(Resources.Theme theme, int i, boolean z) {
        if (WizardManagerHelper.isAnySetupWizard(getIntent())) {
            i = SetupWizardUtils.getGlifTheme(getIntent());
        } else if (OPUtils.isO2()) {
            i = C0018R$style.OnePlusSetupPasswordTheme;
        }
        super.onApplyThemeResource(theme, i, z);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.SettingsActivity, com.android.settings.password.ChooseLockPassword
    public boolean isValidFragment(String str) {
        return SetupChooseLockPasswordFragment.class.getName().equals(str);
    }

    /* access modifiers changed from: package-private */
    @Override // com.android.settings.password.ChooseLockPassword
    public Class<? extends Fragment> getFragmentClass() {
        return SetupChooseLockPasswordFragment.class;
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.oneplus.settings.BaseAppCompatActivity, com.android.settings.core.SettingsBaseActivity, com.android.settings.SettingsActivity, com.android.settings.password.ChooseLockPassword
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        findViewById(C0010R$id.content_parent).setFitsSystemWindows(true);
    }

    public static class SetupChooseLockPasswordFragment extends ChooseLockPassword.ChooseLockPasswordFragment implements ChooseLockTypeDialogFragment.OnLockTypeSelectedListener {
        private boolean mLeftButtonIsSkip;
        private Button mOptionsButton;

        /* access modifiers changed from: protected */
        @Override // com.android.settings.password.ChooseLockPassword.ChooseLockPasswordFragment
        public int getStageType() {
            return 0;
        }

        @Override // com.android.settings.password.ChooseLockPassword.ChooseLockPasswordFragment, androidx.fragment.app.Fragment
        public void onViewCreated(View view, Bundle bundle) {
            super.onViewCreated(view, bundle);
            FragmentActivity activity = getActivity();
            boolean z = new ChooseLockGenericController(activity, this.mUserId).getVisibleScreenLockTypes(65536, false).size() > 0;
            boolean booleanExtra = activity.getIntent().getBooleanExtra("show_options_button", false);
            if (!z) {
                Log.w("SetupChooseLockPassword", "Visible screen lock types is empty!");
            }
            if (booleanExtra && z) {
                Button button = (Button) view.findViewById(C0010R$id.screen_lock_options);
                this.mOptionsButton = button;
                button.setVisibility(0);
                if (OPUtils.isO2()) {
                    this.mOptionsButton.setTextColor(getResources().getColor(C0006R$color.op_setupwizard_oxygen_accent_color));
                }
                this.mOptionsButton.setOnClickListener(new View.OnClickListener() {
                    /* class com.android.settings.password.$$Lambda$SetupChooseLockPassword$SetupChooseLockPasswordFragment$7LM1nvoqFsQTROd0Ke7_TfhlYM */

                    public final void onClick(View view) {
                        SetupChooseLockPassword.SetupChooseLockPasswordFragment.this.lambda$onViewCreated$0$SetupChooseLockPassword$SetupChooseLockPasswordFragment(view);
                    }
                });
            }
            if (this.mLayout.shouldApplyPartnerResource()) {
                if (this.mLayout.getIcon() != null) {
                    this.mLayout.getIcon().mutate().setTintList(getResources().getColorStateList(C0006R$color.op_setupwizard_oxygen_accent_color));
                }
                this.mPasswordRequirementAdapter.setForSetup(true);
                this.mPasswordEntry.setBackground(getResources().getDrawable(C0008R$drawable.abc_edit_text_material));
            }
        }

        /* access modifiers changed from: private */
        /* renamed from: lambda$onViewCreated$0 */
        public /* synthetic */ void lambda$onViewCreated$0$SetupChooseLockPassword$SetupChooseLockPasswordFragment(View view) {
            ChooseLockTypeDialogFragment.newInstance(this.mUserId).show(getChildFragmentManager(), "skip_screen_lock_dialog");
        }

        /* access modifiers changed from: protected */
        @Override // com.android.settings.password.ChooseLockPassword.ChooseLockPasswordFragment
        public void onSkipOrClearButtonClick(View view) {
            try {
                SetupChooseLockPassword.hideSoftKeyboard(getActivity());
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (this.mLeftButtonIsSkip) {
                SetupSkipDialog.newInstance(getActivity().getIntent().getBooleanExtra(":settings:frp_supported", false), false, this.mIsAlphaMode, getActivity().getIntent().getBooleanExtra("for_fingerprint", false), getActivity().getIntent().getBooleanExtra("for_face", false), true).show(getFragmentManager());
            } else {
                super.onSkipOrClearButtonClick(view);
            }
        }

        /* access modifiers changed from: protected */
        @Override // com.android.settings.password.ChooseLockPassword.ChooseLockPasswordFragment
        public Intent getRedactionInterstitialIntent(Context context) {
            SetupRedactionInterstitial.setEnabled(context, true);
            if (OPUtils.isO2()) {
                return SetupRedactionInterstitial.createStartIntent(context, this.mUserId);
            }
            return null;
        }

        @Override // com.android.settings.password.ChooseLockTypeDialogFragment.OnLockTypeSelectedListener
        public void onLockTypeSelected(ScreenLockType screenLockType) {
            if (screenLockType != (this.mIsAlphaMode ? ScreenLockType.PASSWORD : ScreenLockType.PIN)) {
                startChooseLockActivity(screenLockType, getActivity());
            }
        }

        /* access modifiers changed from: protected */
        @Override // com.android.settings.password.ChooseLockPassword.ChooseLockPasswordFragment
        public void updateUi() {
            super.updateUi();
            int i = 0;
            if (this.mUiStage == ChooseLockPassword.ChooseLockPasswordFragment.Stage.Introduction) {
                this.mSkipOrClearButton.setText(getActivity(), C0017R$string.skip_label);
                this.mLeftButtonIsSkip = true;
            } else {
                this.mSkipOrClearButton.setText(getActivity(), C0017R$string.lockpassword_clear_label);
                this.mLeftButtonIsSkip = false;
            }
            Button button = this.mOptionsButton;
            if (button != null) {
                if (this.mUiStage != ChooseLockPassword.ChooseLockPasswordFragment.Stage.Introduction) {
                    i = 8;
                }
                button.setVisibility(i);
            }
        }
    }

    /* access modifiers changed from: private */
    public static void hideSoftKeyboard(Activity activity) {
        ((InputMethodManager) activity.getSystemService("input_method")).hideSoftInputFromWindow(activity.getCurrentFocus().getWindowToken(), 0);
    }
}
