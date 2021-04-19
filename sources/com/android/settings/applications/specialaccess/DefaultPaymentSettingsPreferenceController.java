package com.android.settings.applications.specialaccess;

import android.content.ContentResolver;
import android.content.Context;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.database.ContentObserver;
import android.net.Uri;
import android.nfc.NfcAdapter;
import android.nfc.cardemulation.CardEmulation;
import android.os.Handler;
import android.os.UserManager;
import android.provider.Settings;
import android.text.TextUtils;
import androidx.fragment.app.Fragment;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0017R$string;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.nfc.PaymentBackend;
import com.android.settings.slices.SliceBackgroundWorker;
import com.android.settingslib.core.AbstractPreferenceController;
import com.android.settingslib.core.lifecycle.Lifecycle;
import com.android.settingslib.core.lifecycle.LifecycleObserver;
import com.android.settingslib.core.lifecycle.events.OnPause;
import com.android.settingslib.core.lifecycle.events.OnResume;

public class DefaultPaymentSettingsPreferenceController extends BasePreferenceController implements LifecycleObserver, OnResume, OnPause {
    private CardEmulation mCardEmuManager;
    private Fragment mFragment;
    private final NfcAdapter mNfcAdapter = NfcAdapter.getDefaultAdapter(this.mContext);
    private final PackageManager mPackageManager;
    private PaymentBackend mPaymentBackend;
    private PaymentSettingsEnabler mPaymentSettingsEnabler;
    private SettingObserver mSettingObserver;
    private final UserManager mUserManager;

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ Class<? extends SliceBackgroundWorker> getBackgroundWorkerClass() {
        return super.getBackgroundWorkerClass();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ IntentFilter getIntentFilter() {
        return super.getIntentFilter();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean hasAsyncUpdate() {
        return super.hasAsyncUpdate();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isCopyableSlice() {
        return super.isCopyableSlice();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isPublicSlice() {
        return super.isPublicSlice();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isSliceable() {
        return super.isSliceable();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean useDynamicSliceSummary() {
        return super.useDynamicSliceSummary();
    }

    public DefaultPaymentSettingsPreferenceController(Context context, Lifecycle lifecycle, String str) {
        super(context, str);
        this.mPackageManager = context.getPackageManager();
        this.mUserManager = (UserManager) context.getSystemService(UserManager.class);
        if (lifecycle != null) {
            lifecycle.addObserver(this);
        }
        NfcAdapter nfcAdapter = this.mNfcAdapter;
        if (nfcAdapter != null) {
            this.mCardEmuManager = CardEmulation.getInstance(nfcAdapter);
        }
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        Preference findPreference = preferenceScreen.findPreference(getPreferenceKey());
        this.mSettingObserver = new SettingObserver(findPreference);
        if (!isAvailable()) {
            this.mPaymentSettingsEnabler = null;
        } else if (this.mNfcAdapter != null) {
            this.mPaymentSettingsEnabler = new PaymentSettingsEnabler(this.mContext, findPreference);
        }
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnResume
    public void onResume() {
        PaymentSettingsEnabler paymentSettingsEnabler = this.mPaymentSettingsEnabler;
        if (paymentSettingsEnabler != null) {
            paymentSettingsEnabler.resume();
        }
        SettingObserver settingObserver = this.mSettingObserver;
        if (settingObserver != null) {
            settingObserver.register(this.mContext.getContentResolver(), true);
        }
    }

    @Override // com.android.settingslib.core.lifecycle.events.OnPause
    public void onPause() {
        PaymentSettingsEnabler paymentSettingsEnabler = this.mPaymentSettingsEnabler;
        if (paymentSettingsEnabler != null) {
            paymentSettingsEnabler.pause();
        }
        SettingObserver settingObserver = this.mSettingObserver;
        if (settingObserver != null) {
            settingObserver.register(this.mContext.getContentResolver(), false);
        }
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        if (!this.mPackageManager.hasSystemFeature("android.hardware.nfc") || !this.mPackageManager.hasSystemFeature("android.hardware.nfc.hce")) {
            return 3;
        }
        return !this.mUserManager.isAdminUser() ? 4 : 0;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public void updateState(Preference preference) {
        if (this.mPaymentBackend == null) {
            if (this.mNfcAdapter != null) {
                PaymentBackend paymentBackend = new PaymentBackend(this.mContext);
                this.mPaymentBackend = paymentBackend;
                Fragment fragment = this.mFragment;
                if (fragment != null) {
                    paymentBackend.setFragment(fragment);
                }
            } else {
                this.mPaymentBackend = null;
            }
        }
        if (this.mPaymentBackend != null && preference != null) {
            NfcAdapter nfcAdapter = this.mNfcAdapter;
            if (nfcAdapter == null || nfcAdapter.isEnabled()) {
                CardEmulation cardEmulation = this.mCardEmuManager;
                if (cardEmulation == null || !cardEmulation.getServices("payment").isEmpty()) {
                    this.mPaymentBackend.refresh();
                    PaymentBackend.PaymentAppInfo defaultApp = this.mPaymentBackend.getDefaultApp();
                    Settings.Secure.getString(this.mContext.getContentResolver(), "nfc_payment_default_component");
                    if (defaultApp != null) {
                        CharSequence charSequence = defaultApp.label;
                        if (!TextUtils.isEmpty(charSequence)) {
                            preference.setSummary(charSequence);
                            return;
                        }
                        return;
                    }
                    preference.setSummary(C0017R$string.app_list_preference_none);
                    return;
                }
                preference.setSummary(C0017R$string.nfc_and_payment_settings_no_payment_installed_summary);
                preference.setEnabled(false);
                return;
            }
            preference.setEnabled(false);
            preference.setSummary(C0017R$string.nfc_and_payment_settings_payment_off_nfc_off_summary);
        }
    }

    public void setFragment(Fragment fragment) {
        this.mFragment = fragment;
    }

    class SettingObserver extends ContentObserver {
        private final Uri NFC_ON_URI = Settings.Global.getUriFor("nfc_on");
        private final Preference mPreference;

        public SettingObserver(Preference preference) {
            super(new Handler());
            this.mPreference = preference;
        }

        public void register(ContentResolver contentResolver, boolean z) {
            if (z) {
                contentResolver.registerContentObserver(this.NFC_ON_URI, true, this);
            } else {
                contentResolver.unregisterContentObserver(this);
            }
        }

        public void onChange(boolean z, Uri uri) {
            super.onChange(z, uri);
            if (this.NFC_ON_URI.equals(uri) && this.mPreference != null) {
                if (Settings.Global.getInt(((AbstractPreferenceController) DefaultPaymentSettingsPreferenceController.this).mContext.getContentResolver(), "nfc_on", 0) == 1) {
                    this.mPreference.setEnabled(true);
                    new Handler().postDelayed(new Runnable() {
                        /* class com.android.settings.applications.specialaccess.DefaultPaymentSettingsPreferenceController.SettingObserver.AnonymousClass1 */

                        public void run() {
                            SettingObserver settingObserver = SettingObserver.this;
                            DefaultPaymentSettingsPreferenceController.this.updateState(settingObserver.mPreference);
                        }
                    }, 1000);
                    return;
                }
                this.mPreference.setSummary(C0017R$string.nfc_and_payment_settings_payment_off_nfc_off_summary);
                this.mPreference.setEnabled(false);
            }
        }
    }
}
