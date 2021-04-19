package com.android.settings.applications.specialaccess;

import android.content.Context;
import android.nfc.cardemulation.CardEmulation;
import android.text.TextUtils;
import androidx.preference.Preference;
import com.android.settings.C0017R$string;
import com.android.settings.nfc.BaseNfcEnabler;
import com.android.settings.nfc.PaymentBackend;
import java.util.List;

public class PaymentSettingsEnabler extends BaseNfcEnabler {
    private final CardEmulation mCardEmuManager = CardEmulation.getInstance(this.mNfcAdapter);
    private Context mContext;
    boolean mIsPaymentAvailable = false;
    private PaymentBackend mPaymentBackend;
    private final Preference mPreference;

    public PaymentSettingsEnabler(Context context, Preference preference) {
        super(context);
        this.mPreference = preference;
        this.mContext = context;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.nfc.BaseNfcEnabler
    public void handleNfcStateChanged(int i) {
        if (i == 1) {
            this.mPreference.setSummary(C0017R$string.nfc_and_payment_settings_payment_off_nfc_off_summary);
            this.mPreference.setEnabled(false);
        } else if (i == 3) {
            if (this.mIsPaymentAvailable) {
                PaymentBackend paymentBackend = new PaymentBackend(this.mContext);
                this.mPaymentBackend = paymentBackend;
                paymentBackend.refresh();
                PaymentBackend.PaymentAppInfo defaultApp = this.mPaymentBackend.getDefaultApp();
                if (defaultApp != null) {
                    CharSequence charSequence = defaultApp.label;
                    if (!TextUtils.isEmpty(charSequence)) {
                        this.mPreference.setSummary(charSequence);
                    }
                } else {
                    this.mPreference.setSummary(C0017R$string.app_list_preference_none);
                }
                this.mPreference.setEnabled(true);
                return;
            }
            this.mPreference.setSummary(C0017R$string.nfc_and_payment_settings_no_payment_installed_summary);
            this.mPreference.setEnabled(false);
        }
    }

    @Override // com.android.settings.nfc.BaseNfcEnabler
    public void resume() {
        if (isNfcAvailable()) {
            List services = this.mCardEmuManager.getServices("payment");
            if (services == null || services.isEmpty()) {
                this.mIsPaymentAvailable = false;
            } else {
                this.mIsPaymentAvailable = true;
            }
            super.resume();
        }
    }
}
