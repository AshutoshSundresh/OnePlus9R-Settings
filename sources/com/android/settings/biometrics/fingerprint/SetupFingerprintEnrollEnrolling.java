package com.android.settings.biometrics.fingerprint;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import androidx.appcompat.app.AlertDialog;
import com.android.settings.C0006R$color;
import com.android.settings.C0007R$dimen;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.android.settings.C0018R$style;
import com.android.settings.SetupWizardUtils;
import com.oneplus.settings.utils.OPThemeUtils;
import com.oneplus.settings.utils.OPUtils;

public class SetupFingerprintEnrollEnrolling extends FingerprintEnrollEnrolling {
    @Override // com.android.settingslib.core.instrumentation.Instrumentable, com.android.settings.biometrics.fingerprint.FingerprintEnrollEnrolling
    public int getMetricsCategory() {
        return 246;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.biometrics.BiometricsEnrollEnrolling, com.android.settings.biometrics.fingerprint.FingerprintEnrollEnrolling
    public Intent getFinishIntent() {
        Intent intent = new Intent(this, SetupFingerprintEnrollFinish.class);
        SetupWizardUtils.copySetupExtras(getIntent(), intent);
        return intent;
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, com.android.settings.biometrics.BiometricEnrollBase, com.android.settingslib.core.lifecycle.ObservableActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.android.settings.biometrics.fingerprint.FingerprintEnrollEnrolling, com.android.settings.core.InstrumentedActivity
    public void onCreate(Bundle bundle) {
        this.isSetupPage = true;
        super.onCreate(bundle);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.biometrics.fingerprint.FingerprintEnrollEnrolling
    public void showEnrollNoteDialog() {
        AlertDialog alertDialog = this.mDialog;
        if (alertDialog != null && !alertDialog.isShowing()) {
            this.mDialog.show();
        }
        View inflate = LayoutInflater.from(this).inflate(C0012R$layout.op_fingerprint_note_dialog, (ViewGroup) null);
        int dimensionPixelSize = getResources().getDimensionPixelSize(C0007R$dimen.oneplus_contorl_avatar_standard);
        CheckBox checkBox = (CheckBox) inflate.findViewById(C0010R$id.checkbox);
        boolean z = true;
        if (Settings.System.getIntForUser(getContentResolver(), "op_do_not_show_fingerprint_enroll_note", 0, -2) != 1) {
            z = false;
        }
        checkBox.setChecked(z);
        checkBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            /* class com.android.settings.biometrics.fingerprint.$$Lambda$SetupFingerprintEnrollEnrolling$H_1Abi0s03yEana6GrqYNiKAA8 */

            public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                SetupFingerprintEnrollEnrolling.this.lambda$showEnrollNoteDialog$0$SetupFingerprintEnrollEnrolling(compoundButton, z);
            }
        });
        expandViewTouchDelegate(checkBox, dimensionPixelSize);
        AlertDialog.Builder builder = new AlertDialog.Builder(this, C0018R$style.OPDarkDialogAlert);
        builder.setTitle(C0017R$string.op_fingerprint_enroll_note);
        builder.setMessage(C0017R$string.op_fingerprint_enroll_note_dialog_msg);
        builder.setView(inflate);
        builder.setCancelable(false);
        builder.setPositiveButton(C0017R$string.oneplus_device_name_ok, new DialogInterface.OnClickListener() {
            /* class com.android.settings.biometrics.fingerprint.SetupFingerprintEnrollEnrolling.AnonymousClass1 */

            public void onClick(DialogInterface dialogInterface, int i) {
                SetupFingerprintEnrollEnrolling.this.mDialog.dismiss();
                SetupFingerprintEnrollEnrolling.this.delayCallFingerprintService();
            }
        });
        AlertDialog create = builder.create();
        this.mDialog = create;
        create.show();
        if (OPUtils.isO2()) {
            OPThemeUtils.setDialogTextColorForO2SUW(this.mDialog);
            Button button = this.mNextButton;
            if (button != null) {
                button.setTextColor(getResources().getColor(C0006R$color.oneplus_setupwizard_accent_color));
                return;
            }
            return;
        }
        OPThemeUtils.setDialogTextColor(this.mDialog);
    }

    /* access modifiers changed from: private */
    @Override // com.android.settings.biometrics.fingerprint.FingerprintEnrollEnrolling
    /* renamed from: lambda$showEnrollNoteDialog$0 */
    public /* synthetic */ void lambda$showEnrollNoteDialog$0$SetupFingerprintEnrollEnrolling(CompoundButton compoundButton, boolean z) {
        Settings.System.putIntForUser(getContentResolver(), "op_do_not_show_fingerprint_enroll_note", z ? 1 : 0, -2);
        Log.d("FingerprintNoteDialog", "Don't show again:" + z);
    }
}
