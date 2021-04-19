package com.android.settings.biometrics.face;

import android.app.ActionBar;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.UserHandle;
import android.view.View;
import android.widget.Button;
import com.android.settings.C0010R$id;
import com.android.settings.C0018R$style;
import com.android.settings.core.InstrumentedActivity;
import com.oneplus.settings.utils.OPUtils;

public abstract class FingerprintEnrollBase extends InstrumentedActivity implements View.OnClickListener {
    protected byte[] mToken;

    /* access modifiers changed from: protected */
    public int applyActionBarTitle() {
        return -1;
    }

    /* access modifiers changed from: protected */
    public void onNextButtonClick() {
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, com.android.settingslib.core.lifecycle.ObservableActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.android.settings.core.InstrumentedActivity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ActionBar actionBar = getActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
            if (applyActionBarTitle() == -1) {
                actionBar.setTitle("");
            }
        }
        OPUtils.setLightNavigationBar(getWindow(), OPUtils.getThemeMode(getContentResolver()));
        byte[] byteArrayExtra = getIntent().getByteArrayExtra("hw_auth_token");
        this.mToken = byteArrayExtra;
        if (bundle != null && byteArrayExtra == null) {
            this.mToken = bundle.getByteArray("hw_auth_token");
        }
        getIntent().getIntExtra("android.intent.extra.USER_ID", UserHandle.myUserId());
    }

    /* access modifiers changed from: protected */
    public void onApplyThemeResource(Resources.Theme theme, int i, boolean z) {
        theme.applyStyle(C0018R$style.SetupWizardPartnerResource, true);
        super.onApplyThemeResource(theme, i, z);
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putByteArray("hw_auth_token", this.mToken);
    }

    /* access modifiers changed from: protected */
    @Override // androidx.appcompat.app.AppCompatActivity
    public void onPostCreate(Bundle bundle) {
        super.onPostCreate(bundle);
        initViews();
    }

    /* access modifiers changed from: protected */
    public void initViews() {
        Button nextButton = getNextButton();
        if (nextButton != null) {
            nextButton.setOnClickListener(this);
        }
    }

    /* access modifiers changed from: protected */
    public Button getNextButton() {
        return (Button) findViewById(C0010R$id.next_button);
    }

    public void onClick(View view) {
        if (view == getNextButton()) {
            onNextButtonClick();
        }
    }
}
