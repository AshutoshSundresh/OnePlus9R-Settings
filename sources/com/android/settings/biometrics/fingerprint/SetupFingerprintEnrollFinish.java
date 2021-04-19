package com.android.settings.biometrics.fingerprint;

import android.content.Intent;
import android.widget.Button;
import com.android.settings.C0006R$color;
import com.android.settings.C0017R$string;
import com.android.settings.SetupWizardUtils;
import com.oneplus.settings.utils.OPUtils;

public class SetupFingerprintEnrollFinish extends FingerprintEnrollFinish {
    @Override // com.android.settingslib.core.instrumentation.Instrumentable, com.android.settings.biometrics.fingerprint.FingerprintEnrollFinish
    public int getMetricsCategory() {
        return 248;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.biometrics.BiometricEnrollBase
    public Intent getFingerprintEnrollingIntent() {
        Intent intent = new Intent(this, SetupFingerprintEnrollEnrolling.class);
        intent.putExtra("hw_auth_token", this.mToken);
        int i = this.mUserId;
        if (i != -10000) {
            intent.putExtra("android.intent.extra.USER_ID", i);
        }
        SetupWizardUtils.copySetupExtras(getIntent(), intent);
        return intent;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.biometrics.BiometricEnrollBase
    public void initViews() {
        Button button;
        super.initViews();
        getNextButton().setText(this, C0017R$string.next_label);
        if (OPUtils.isO2() && (button = this.mBtnNext) != null) {
            button.setTextColor(getResources().getColor(C0006R$color.oneplus_setupwizard_accent_color));
        }
    }
}
