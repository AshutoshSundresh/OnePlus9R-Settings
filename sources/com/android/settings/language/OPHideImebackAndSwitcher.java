package com.android.settings.language;

import android.content.Context;
import android.os.Bundle;
import android.provider.Settings;
import android.view.View;
import android.widget.ImageView;
import android.widget.RadioButton;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.oneplus.settings.BaseActivity;
import com.oneplus.settings.SettingsBaseApplication;
import com.oneplus.settings.utils.OPUtils;

public class OPHideImebackAndSwitcher extends BaseActivity implements View.OnClickListener {
    private Context mContext;
    private RadioButton mHideButton;
    private ImageView mHideImage;
    private View mHideView;
    private RadioButton mRaiseButton;
    private ImageView mRaiseImage;
    private View mRaiseView;

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.oneplus.settings.BaseAppCompatActivity, com.oneplus.settings.BaseActivity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(C0012R$layout.op_hide_imeback_and_switcher);
        this.mContext = getBaseContext();
        View findViewById = findViewById(C0010R$id.raise_layout);
        this.mRaiseView = findViewById;
        findViewById.setOnClickListener(this);
        View findViewById2 = findViewById(C0010R$id.hide_layout);
        this.mHideView = findViewById2;
        findViewById2.setOnClickListener(this);
        this.mRaiseButton = (RadioButton) findViewById(C0010R$id.raise_button);
        this.mHideButton = (RadioButton) findViewById(C0010R$id.hide_button);
        this.mRaiseImage = (ImageView) findViewById(C0010R$id.raise_image);
        this.mHideImage = (ImageView) findViewById(C0010R$id.hide_image);
        if (OPUtils.isBlackModeOn(SettingsBaseApplication.mApplication.getContentResolver())) {
            this.mRaiseImage.setImageResource(C0008R$drawable.op_raise_keyboard_dark);
            this.mHideImage.setImageResource(C0008R$drawable.op_hide_keyboard_dark);
        } else {
            this.mRaiseImage.setImageResource(C0008R$drawable.op_raise_keyboard_light);
            this.mHideImage.setImageResource(C0008R$drawable.op_hide_keyboard_light);
        }
        setCurrentMode();
    }

    public void onClick(View view) {
        if (view == this.mRaiseView) {
            this.mRaiseButton.setChecked(true);
            this.mHideButton.setChecked(false);
            Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "nav_icon_hide", 0, -2);
        } else if (view == this.mHideView) {
            this.mRaiseButton.setChecked(false);
            this.mHideButton.setChecked(true);
            Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "nav_icon_hide", 1, -2);
        }
    }

    private void setCurrentMode() {
        boolean z = false;
        int intForUser = Settings.Secure.getIntForUser(this.mContext.getContentResolver(), "nav_icon_hide", 0, -2);
        this.mRaiseButton.setChecked(intForUser == 0);
        RadioButton radioButton = this.mHideButton;
        if (intForUser == 1) {
            z = true;
        }
        radioButton.setChecked(z);
    }
}
