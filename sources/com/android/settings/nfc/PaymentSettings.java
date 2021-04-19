package com.android.settings.nfc;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.UserHandle;
import android.os.UserManager;
import android.provider.Settings;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0017R$string;
import com.android.settings.C0019R$xml;
import com.android.settings.dashboard.DashboardFragment;
import com.android.settings.nfc.NfcUiccObserver;
import com.android.settings.search.BaseSearchIndexProvider;
import com.google.android.material.emptyview.EmptyPageView;
import com.oneplus.settings.utils.OPUtils;

public class PaymentSettings extends DashboardFragment implements NfcUiccObserver.OnNfcUiccChangeCallback {
    public static final BaseSearchIndexProvider SEARCH_INDEX_DATA_PROVIDER = new BaseSearchIndexProvider(C0019R$xml.nfc_payment_settings) {
        /* class com.android.settings.nfc.PaymentSettings.AnonymousClass1 */

        /* access modifiers changed from: protected */
        @Override // com.android.settings.search.BaseSearchIndexProvider
        public boolean isPageSearchEnabled(Context context) {
            if (((UserManager) context.getSystemService(UserManager.class)).getUserInfo(UserHandle.myUserId()).isGuest()) {
                return false;
            }
            return context.getPackageManager().hasSystemFeature("android.hardware.nfc");
        }
    };
    private NfcUiccObserver mNfcUiccObserver;
    private PaymentBackend mPaymentBackend;

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public String getLogTag() {
        return "PaymentSettings";
    }

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 70;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment
    public int getPreferenceScreenResId() {
        return C0019R$xml.nfc_payment_settings;
    }

    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onAttach(Context context) {
        super.onAttach(context);
        PaymentBackend paymentBackend = new PaymentBackend(getActivity());
        this.mPaymentBackend = paymentBackend;
        paymentBackend.setFragment(this);
        setHasOptionsMenu(true);
        ((NfcPaymentPreferenceController) use(NfcPaymentPreferenceController.class)).setPaymentBackend(this.mPaymentBackend);
        ((NfcForegroundPreferenceController) use(NfcForegroundPreferenceController.class)).setPaymentBackend(this.mPaymentBackend);
    }

    @Override // com.android.settings.SettingsPreferenceFragment, androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        EmptyPageView emptyPageView = (EmptyPageView) getActivity().findViewById(16908292);
        emptyPageView.getEmptyTextView().setText(C0017R$string.nfc_payment_no_apps);
        emptyPageView.getEmptyImageView().setImageResource(C0008R$drawable.op_empty);
        setEmptyView(emptyPageView);
    }

    @Override // androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onStart() {
        super.onStart();
        if (OPUtils.isSupportNfcUicc()) {
            NfcUiccObserver nfcUiccObserver = new NfcUiccObserver(this);
            this.mNfcUiccObserver = nfcUiccObserver;
            if (nfcUiccObserver != null) {
                getContentResolver().registerContentObserver(Settings.Global.getUriFor("nfc_multise_list"), true, this.mNfcUiccObserver);
            }
        }
    }

    @Override // androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onStop() {
        super.onStop();
        if (OPUtils.isSupportNfcUicc() && this.mNfcUiccObserver != null) {
            getContentResolver().unregisterContentObserver(this.mNfcUiccObserver);
            this.mNfcUiccObserver = null;
        }
    }

    @Override // com.android.settings.nfc.NfcUiccObserver.OnNfcUiccChangeCallback
    public void onDataChange() {
        PaymentBackend paymentBackend;
        if (OPUtils.isSupportNfcUicc() && (paymentBackend = this.mPaymentBackend) != null) {
            paymentBackend.refresh();
        }
    }

    @Override // com.android.settings.SettingsPreferenceFragment, com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onResume() {
        super.onResume();
        this.mPaymentBackend.onResume();
    }

    @Override // androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onPause() {
        super.onPause();
        this.mPaymentBackend.onPause();
    }

    @Override // androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater);
        MenuItem add = menu.add(C0017R$string.nfc_payment_how_it_works);
        add.setIntent(new Intent(getActivity(), HowItWorks.class));
        add.setShowAsActionFlags(0);
    }

    /* access modifiers changed from: package-private */
    public boolean isShowEmptyImage(PreferenceScreen preferenceScreen) {
        for (int i = 0; i < preferenceScreen.getPreferenceCount(); i++) {
            if (preferenceScreen.getPreference(i).isVisible()) {
                return false;
            }
        }
        return true;
    }
}
