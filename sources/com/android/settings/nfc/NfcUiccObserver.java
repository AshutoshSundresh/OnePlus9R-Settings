package com.android.settings.nfc;

import android.database.ContentObserver;
import android.os.Handler;

public class NfcUiccObserver extends ContentObserver {
    private OnNfcUiccChangeCallback mCallback;

    public interface OnNfcUiccChangeCallback {
        void onDataChange();
    }

    public NfcUiccObserver(OnNfcUiccChangeCallback onNfcUiccChangeCallback) {
        super(new Handler());
        this.mCallback = onNfcUiccChangeCallback;
    }

    public void onChange(boolean z) {
        super.onChange(z);
        this.mCallback.onDataChange();
    }
}
