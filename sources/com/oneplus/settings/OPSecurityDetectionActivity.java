package com.oneplus.settings;

import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.widget.TextView;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.oneplus.settings.utils.OPUtils;

public class OPSecurityDetectionActivity extends BaseActivity {
    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.oneplus.settings.BaseAppCompatActivity, com.oneplus.settings.BaseActivity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (OPUtils.isO2()) {
            finish();
        }
        setContentView(C0012R$layout.op_activity_app_security_detection);
        TextView textView = (TextView) findViewById(C0010R$id.t_legal);
        TextView textView2 = (TextView) findViewById(C0010R$id.o_legal);
        textView.setText(OPUtils.parseLink(getString(C0017R$string.op_app_security_check_text_legal_t), getString(C0017R$string.op_legal_ten_secure), getString(C0017R$string.op_app_security_check_text_legal_t_link), ""));
        textView.setMovementMethod(LinkMovementMethod.getInstance());
        textView2.setText(OPUtils.parseLink(getString(C0017R$string.op_app_security_check_text_legal_o), getString(C0017R$string.op_legal_ht_secure), getString(C0017R$string.op_app_security_check_text_legal_o_link), ""));
        textView2.setMovementMethod(LinkMovementMethod.getInstance());
    }
}
