package com.android.settings.biometrics.face;

import android.app.ActionBar;
import android.app.KeyguardManager;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.oneplus.faceunlock.internal.IOPFaceSettingService;
import com.oneplus.settings.utils.OPUtils;

public class FaceUnlockEnrollIntroduction extends FingerprintEnrollBase {
    private boolean mAlreadyHadLockScreenSetup = false;
    private IOPFaceSettingService mFaceSettingService;
    private ServiceConnection mFaceUnlockConnection = new ServiceConnection() {
        /* class com.android.settings.biometrics.face.FaceUnlockEnrollIntroduction.AnonymousClass1 */

        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            Log.i("FaceUnlockIntroduction", "Oneplus face unlock service connected");
            FaceUnlockEnrollIntroduction.this.mFaceSettingService = IOPFaceSettingService.Stub.asInterface(iBinder);
            FaceUnlockEnrollIntroduction.this.getNextButton().setText(C0017R$string.security_settings_fingerprint_enroll_introduction_continue_setup);
            if (FaceUnlockEnrollIntroduction.this.isFaceAdded()) {
                FaceUnlockEnrollIntroduction.this.getNextButton().setVisibility(8);
                FaceUnlockEnrollIntroduction.this.finish();
                return;
            }
            FaceUnlockEnrollIntroduction.this.getNextButton().setVisibility(0);
        }

        public void onServiceDisconnected(ComponentName componentName) {
            Log.i("FaceUnlockIntroduction", "Oneplus face unlock service disconnected");
            FaceUnlockEnrollIntroduction.this.mFaceSettingService = null;
        }
    };

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 249;
    }

    private void bindFaceUnlockService() {
        try {
            Intent intent = new Intent();
            intent.setClassName("com.oneplus.faceunlock", "com.oneplus.faceunlock.FaceSettingService");
            bindService(intent, this.mFaceUnlockConnection, 1);
            Log.i("FaceUnlockIntroduction", "Start bind oneplus face unlockservice");
        } catch (Exception unused) {
            Log.i("FaceUnlockIntroduction", "Bind oneplus face unlockservice exception");
        }
    }

    private void unbindFaceUnlockService() {
        Log.i("FaceUnlockIntroduction", "Start unbind oneplus face unlockservice");
        unbindService(this.mFaceUnlockConnection);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private boolean isFaceAdded() {
        IOPFaceSettingService iOPFaceSettingService = this.mFaceSettingService;
        if (iOPFaceSettingService == null) {
            return false;
        }
        int i = 2;
        try {
            i = iOPFaceSettingService.checkState(0);
            Log.i("FaceUnlockIntroduction", "Start check face state:" + i);
        } catch (RemoteException e) {
            Log.i("FaceUnlockIntroduction", "Start check face State RemoteException:" + e);
        }
        if (i == 0) {
            return true;
        }
        return false;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settingslib.core.lifecycle.ObservableActivity, androidx.fragment.app.FragmentActivity
    public void onResume() {
        super.onResume();
        bindFaceUnlockService();
        if (isFaceAdded()) {
            finish();
        }
    }

    @Override // com.android.settingslib.core.lifecycle.ObservableActivity, androidx.fragment.app.FragmentActivity
    public void onPause() {
        unbindFaceUnlockService();
        super.onPause();
    }

    @Override // com.android.settingslib.core.lifecycle.ObservableActivity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return false;
        }
        finish();
        return true;
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, com.android.settingslib.core.lifecycle.ObservableActivity, androidx.appcompat.app.AppCompatActivity, com.android.settings.biometrics.face.FingerprintEnrollBase, androidx.fragment.app.FragmentActivity, com.android.settings.core.InstrumentedActivity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            this.mAlreadyHadLockScreenSetup = isKeyguardSecure();
        } else {
            this.mAlreadyHadLockScreenSetup = bundle.getBoolean("wasLockScreenPresent", false);
        }
        setContentView(C0012R$layout.op_face_unlock_introduction);
        ActionBar actionBar = getActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
            actionBar.setElevation(0.0f);
        }
        adjustTitleSize();
        adjustForGuideImage();
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, com.android.settings.biometrics.face.FingerprintEnrollBase, androidx.fragment.app.FragmentActivity
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("wasLockScreenPresent", this.mAlreadyHadLockScreenSetup);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.biometrics.face.FingerprintEnrollBase
    public void initViews() {
        super.initViews();
        TextView textView = (TextView) findViewById(C0010R$id.sud_layout_description);
        textView.setText(C0017R$string.security_settings_fingerprint_enroll_introduction_message_setup);
        Button nextButton = getNextButton();
        if (OPUtils.isSupportXCamera()) {
            setHeaderText(C0017R$string.oneplus_face_unlock_add_title);
            textView.setText(C0017R$string.oneplus_faceunlock_introduction_title);
            findViewById(C0010R$id.rich_warning_text).setVisibility(0);
        } else if (OPUtils.isSupportCustomFingerprint()) {
            setHeaderText(C0017R$string.oneplus_use_faceunlock_and_fingerprint_settings_title);
            textView.setText(C0017R$string.oneplus_use_faceunlock_and_fingerprint_settings_summary);
        } else {
            setHeaderText(C0017R$string.oneplus_face_setup_unlock_settings_title);
            textView.setText(C0017R$string.oneplus_face_setup_unlock_settings_summary);
        }
        nextButton.setText(C0017R$string.oneplus_face_unlock_add_title);
        Button button = (Button) findViewById(C0010R$id.fingerprint_cancel_button);
        button.setOnClickListener(this);
        button.setText(C0017R$string.oneplus_password_cancel);
        ((TextView) findViewById(C0010R$id.functional_terms)).setOnClickListener(new View.OnClickListener() {
            /* class com.android.settings.biometrics.face.FaceUnlockEnrollIntroduction.AnonymousClass2 */

            public void onClick(View view) {
                Intent intent = new Intent("android.oem.intent.action.OP_LEGAL");
                intent.putExtra("op_legal_notices_type", 10);
                intent.putExtra("key_from_settings", true);
                FaceUnlockEnrollIntroduction.this.startActivity(intent);
            }
        });
    }

    /* access modifiers changed from: protected */
    public void setHeaderText(int i) {
        ((TextView) findViewById(C0010R$id.suc_layout_title)).setText(i);
    }

    private void adjustForGuideImage() {
        LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) ((ImageView) findViewById(C0010R$id.img_faceunlock_guide)).getLayoutParams();
        if (!OPUtils.isSupportXCamera()) {
            layoutParams.topMargin /= 2;
        } else if (OPUtils.isLargerFontSize(this) && OPUtils.isLargerScreenZoom(this)) {
            layoutParams.topMargin /= 2;
        }
    }

    @Override // com.android.settings.biometrics.face.FingerprintEnrollBase
    public void onClick(View view) {
        if (view.getId() == C0010R$id.fingerprint_cancel_button) {
            onCancelButtonClick();
        } else {
            super.onClick(view);
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.biometrics.face.FingerprintEnrollBase
    public Button getNextButton() {
        return (Button) findViewById(C0010R$id.fingerprint_next_button);
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.fragment.app.FragmentActivity
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.biometrics.face.FingerprintEnrollBase
    public void onNextButtonClick() {
        Intent intent = null;
        try {
            Intent intent2 = new Intent();
            try {
                intent2.setClassName("com.oneplus.faceunlock", "com.oneplus.faceunlock.FaceUnlockActivity");
                intent2.putExtra("FaceUnlockActivity.StartMode", 0);
                startActivity(intent2);
            } catch (ActivityNotFoundException unused) {
                intent = intent2;
            }
        } catch (ActivityNotFoundException unused2) {
            Log.d("OPFaceUnlockSettings", "No activity found for " + intent);
        }
    }

    /* access modifiers changed from: protected */
    public void onCancelButtonClick() {
        finish();
    }

    private boolean isKeyguardSecure() {
        return ((KeyguardManager) getSystemService(KeyguardManager.class)).isKeyguardSecure();
    }

    private void adjustTitleSize() {
        if (OPUtils.isLargerFontSize(this) && OPUtils.isLargerScreenZoom(this)) {
            ((TextView) findViewById(C0010R$id.suc_layout_title)).setTextSize(20.0f);
            ((TextView) findViewById(C0010R$id.sud_layout_description)).setTextSize(16.0f);
        }
    }
}
