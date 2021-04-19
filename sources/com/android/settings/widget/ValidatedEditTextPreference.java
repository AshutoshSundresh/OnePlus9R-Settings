package com.android.settings.widget;

import android.content.Context;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import androidx.preference.PreferenceViewHolder;
import com.android.settings.C0017R$string;
import com.android.settingslib.CustomEditTextPreferenceCompat;
import com.oneplus.settings.utils.ProductUtils;

public class ValidatedEditTextPreference extends CustomEditTextPreferenceCompat {
    private EditText dialogEditText;
    private boolean mIsPassword;
    private boolean mIsSummaryPassword;
    private final EditTextWatcher mTextWatcher = new EditTextWatcher();
    private Validator mValidator;

    public interface Validator {
        boolean isTextValid(String str);
    }

    public ValidatedEditTextPreference(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
    }

    public ValidatedEditTextPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public ValidatedEditTextPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public ValidatedEditTextPreference(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settingslib.CustomEditTextPreferenceCompat
    public void onBindDialogView(View view) {
        super.onBindDialogView(view);
        EditText editText = (EditText) view.findViewById(16908291);
        this.dialogEditText = editText;
        if (editText != null && !TextUtils.isEmpty(editText.getText())) {
            editText.setSelection(editText.getText().length());
        }
        if (this.mValidator != null && editText != null) {
            editText.removeTextChangedListener(this.mTextWatcher);
            if (this.mIsPassword) {
                editText.setInputType(145);
                editText.setMaxLines(1);
            }
            editText.addTextChangedListener(this.mTextWatcher);
        }
    }

    @Override // androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        TextView textView = (TextView) preferenceViewHolder.findViewById(16908304);
        if (textView != null) {
            if (this.mIsSummaryPassword) {
                textView.setInputType(129);
            } else {
                textView.setInputType(524289);
            }
        }
    }

    public void setIsPassword(boolean z) {
        this.mIsPassword = z;
    }

    public void setIsSummaryPassword(boolean z) {
        this.mIsSummaryPassword = z;
    }

    public boolean isPassword() {
        return this.mIsPassword;
    }

    public void setValidator(Validator validator) {
        this.mValidator = validator;
    }

    private class EditTextWatcher implements TextWatcher {
        public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        private EditTextWatcher() {
        }

        public void afterTextChanged(Editable editable) {
            EditText editText = ValidatedEditTextPreference.this.dialogEditText;
            if (ValidatedEditTextPreference.this.mValidator != null && editText != null) {
                AlertDialog alertDialog = (AlertDialog) ValidatedEditTextPreference.this.getDialog();
                boolean isTextValid = ValidatedEditTextPreference.this.mValidator.isTextValid(editText.getText().toString());
                LinearLayout linearLayout = (LinearLayout) ((View) editText.getParent());
                if (ProductUtils.isUsvMode() && !isTextValid && ValidatedEditTextPreference.this.mIsSummaryPassword) {
                    if (linearLayout.findViewById(1234) != null) {
                        linearLayout.removeView(linearLayout.findViewById(1234));
                    }
                    TextView textView = new TextView(editText.getContext());
                    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
                    layoutParams.setMarginStart(50);
                    layoutParams.setMarginEnd(50);
                    textView.setLayoutParams(layoutParams);
                    textView.setId(1234);
                    textView.setTextSize(10.0f);
                    textView.setTypeface(Typeface.defaultFromStyle(1));
                    textView.setText(editText.getContext().getResources().getString(C0017R$string.wifi_tether_passphrase_warning));
                    linearLayout.addView(textView);
                } else if (linearLayout.findViewById(1234) != null) {
                    linearLayout.removeView(linearLayout.findViewById(1234));
                }
                if (alertDialog != null) {
                    alertDialog.getButton(-1).setEnabled(isTextValid);
                }
            }
        }
    }
}
