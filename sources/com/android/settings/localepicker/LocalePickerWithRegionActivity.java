package com.android.settings.localepicker;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.MenuItem;
import android.view.View;
import androidx.appcompat.widget.Toolbar;
import com.android.internal.app.LocaleStore;
import com.android.settings.C0007R$dimen;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.oneplus.settings.BaseAppCompatActivity;
import com.oneplus.settings.localepicker.OPLocalePickerWithRegion;
import com.oneplus.settings.utils.OPUtils;
import java.io.Serializable;

public class LocalePickerWithRegionActivity extends BaseAppCompatActivity implements OPLocalePickerWithRegion.LocaleSelectedListener {
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.oneplus.settings.BaseAppCompatActivity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(C0012R$layout.settings_base_layout);
        Toolbar toolbar = (Toolbar) findViewById(C0010R$id.action_bar);
        if (toolbar != null) {
            if (OPUtils.isO2()) {
                toolbar.setTitle(getString(17040434) + " " + getString(84869230));
            } else {
                toolbar.setTitle(getTitle());
            }
            toolbar.setNavigationOnClickListener(new View.OnClickListener() {
                /* class com.android.settings.localepicker.LocalePickerWithRegionActivity.AnonymousClass1 */

                public void onClick(View view) {
                    LocalePickerWithRegionActivity.this.onBackPressed();
                }
            });
            setSupportActionBar(toolbar);
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        }
        final OPLocalePickerWithRegion createLanguagePicker = OPLocalePickerWithRegion.createLanguagePicker(this, this, false);
        getFragmentManager().beginTransaction().setTransition(4097).replace(C0010R$id.content_frame, createLanguagePicker).addToBackStack("localeListEditor").commit();
        new Handler().post(new Runnable() {
            /* class com.android.settings.localepicker.LocalePickerWithRegionActivity.AnonymousClass2 */

            public void run() {
                View findViewById = LocalePickerWithRegionActivity.this.findViewById(C0010R$id.content_frame);
                if (findViewById != null) {
                    findViewById.setPadding(findViewById.getPaddingLeft(), findViewById.getPaddingTop() + LocalePickerWithRegionActivity.this.getResources().getDimensionPixelSize(C0007R$dimen.op_control_margin_space4), findViewById.getPaddingRight(), findViewById.getPaddingBottom());
                }
                createLanguagePicker.getListView().setDivider(null);
            }
        });
    }

    /* access modifiers changed from: protected */
    @Override // androidx.appcompat.app.AppCompatActivity
    public void onTitleChanged(CharSequence charSequence, int i) {
        super.onTitleChanged(charSequence, i);
        Toolbar toolbar = (Toolbar) findViewById(C0010R$id.action_bar);
        if (toolbar == null) {
            return;
        }
        if (OPUtils.isO2()) {
            toolbar.setTitle(getString(17040434) + " " + getString(84869230));
            return;
        }
        toolbar.setTitle(getTitle());
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return super.onOptionsItemSelected(menuItem);
        }
        handleBackPressed();
        return true;
    }

    @Override // com.oneplus.settings.localepicker.OPLocalePickerWithRegion.LocaleSelectedListener
    public void onLocaleSelected(LocaleStore.LocaleInfo localeInfo) {
        Intent intent = new Intent();
        intent.putExtra("localeInfo", (Serializable) localeInfo);
        setResult(-1, intent);
        finish();
    }

    @Override // androidx.activity.ComponentActivity
    public void onBackPressed() {
        handleBackPressed();
    }

    private void handleBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() > 1) {
            finish();
            return;
        }
        setResult(0);
        finish();
    }
}
