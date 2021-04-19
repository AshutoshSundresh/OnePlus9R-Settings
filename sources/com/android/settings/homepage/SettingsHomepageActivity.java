package com.android.settings.homepage;

import android.app.ActivityManager;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.android.settings.C0007R$dimen;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0013R$menu;
import com.android.settings.homepage.contextualcards.ContextualCardsFragment;
import com.android.settings.overlay.FeatureFactory;
import com.google.android.material.appbar.Appbar;
import com.google.android.material.edgeeffect.SpringNestScrollView;
import com.oneplus.settings.BaseAppCompatActivity;
import com.oneplus.settings.utils.OPUtils;

public class SettingsHomepageActivity extends BaseAppCompatActivity {
    private Handler mHandler = new Handler() {
        /* class com.android.settings.homepage.SettingsHomepageActivity.AnonymousClass1 */

        public void handleMessage(Message message) {
            if (message.what == 1) {
                SettingsHomepageActivity.this.showContextualCardsFragment();
            }
        }
    };
    private SpringNestScrollView mSpringNestScrollView;
    private Toolbar mToolbar;

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void showContextualCardsFragment() {
        if (!((ActivityManager) getSystemService(ActivityManager.class)).isLowRamDevice()) {
            showFragment(new ContextualCardsFragment(), C0010R$id.contextual_cards_content);
        }
    }

    /* access modifiers changed from: protected */
    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.oneplus.settings.BaseAppCompatActivity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(C0012R$layout.settings_homepage_container);
        findViewById(C0010R$id.settings_homepage_container);
        this.mSpringNestScrollView = (SpringNestScrollView) findViewById(C0010R$id.main_content_scrollable_container);
        Appbar appbar = (Appbar) findViewById(C0010R$id.appbar);
        appbar.setTitle(getTitle());
        appbar.setDisplayHomeAsUpEnabled(false);
        Toolbar toolbar = (Toolbar) findViewById(C0010R$id.toolbar);
        this.mToolbar = toolbar;
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        OPUtils.setLightNavigationBar(getWindow(), OPUtils.getThemeMode(getContentResolver()));
        setRequestedOrientation(1);
        this.mHandler.sendEmptyMessageDelayed(1, 200);
        showFragment(new TopLevelSettings(), C0010R$id.main_content);
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        Log.d("SettingsHomepageActivity", "onConfigurationChanged:" + configuration);
        Handler handler = this.mHandler;
        if (handler != null) {
            handler.postDelayed(new Runnable() {
                /* class com.android.settings.homepage.$$Lambda$SettingsHomepageActivity$ea6VmZQVI8D6y4CFImpE4BZvhy8 */

                public final void run() {
                    SettingsHomepageActivity.this.lambda$onConfigurationChanged$0$SettingsHomepageActivity();
                }
            }, 50);
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$onConfigurationChanged$0 */
    public /* synthetic */ void lambda$onConfigurationChanged$0$SettingsHomepageActivity() {
        this.mSpringNestScrollView.requestLayout();
    }

    /* access modifiers changed from: protected */
    @Override // androidx.fragment.app.FragmentActivity
    public void onResume() {
        super.onResume();
    }

    /* access modifiers changed from: protected */
    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity
    public void onDestroy() {
        super.onDestroy();
        this.mHandler.removeMessages(1);
        this.mHandler.removeCallbacksAndMessages(null);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        this.mToolbar.getMenu().clear();
        getMenuInflater().inflate(C0013R$menu.op_search_settings, menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != C0010R$id.action_search) {
            return super.onOptionsItemSelected(menuItem);
        }
        startActivity(FeatureFactory.getFactory(this).getSearchFeatureProvider().buildSearchIntent(this, 1502));
        return true;
    }

    private void showFragment(Fragment fragment, int i) {
        FragmentManager supportFragmentManager = getSupportFragmentManager();
        FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction();
        Fragment findFragmentById = supportFragmentManager.findFragmentById(i);
        if (findFragmentById == null) {
            beginTransaction.add(i, fragment);
        } else {
            beginTransaction.show(findFragmentById);
        }
        beginTransaction.commitAllowingStateLoss();
    }

    /* access modifiers changed from: package-private */
    public void setHomepageContainerPaddingTop() {
        View findViewById = findViewById(C0010R$id.homepage_container);
        findViewById.setPadding(0, getResources().getDimensionPixelSize(C0007R$dimen.search_bar_height) + (getResources().getDimensionPixelSize(C0007R$dimen.search_bar_margin) * 2), 0, 0);
        findViewById.setFocusableInTouchMode(true);
        findViewById.requestFocus();
    }
}
