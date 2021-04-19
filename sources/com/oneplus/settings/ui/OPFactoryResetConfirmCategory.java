package com.oneplus.settings.ui;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import androidx.preference.Preference;
import androidx.preference.PreferenceViewHolder;
import com.android.settings.C0012R$layout;

public class OPFactoryResetConfirmCategory extends Preference {
    public OnFactoryResetConfirmListener mOnFactoryResetConfirmListener;
    private View.OnClickListener onClickListener = new View.OnClickListener() {
        /* class com.oneplus.settings.ui.OPFactoryResetConfirmCategory.AnonymousClass1 */

        @SuppressLint({"RestrictedApi"})
        public void onClick(View view) {
            OnFactoryResetConfirmListener onFactoryResetConfirmListener = OPFactoryResetConfirmCategory.this.mOnFactoryResetConfirmListener;
            if (onFactoryResetConfirmListener != null) {
                onFactoryResetConfirmListener.onFactoryResetConfirmClick();
            }
        }
    };

    public interface OnFactoryResetConfirmListener {
        void onFactoryResetConfirmClick();
    }

    public OPFactoryResetConfirmCategory(Context context) {
        super(context);
        initViews();
    }

    public OPFactoryResetConfirmCategory(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initViews();
    }

    public OPFactoryResetConfirmCategory(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initViews();
    }

    private void initViews() {
        setLayoutResource(C0012R$layout.op_boderless_button_preference);
    }

    @Override // androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        ((TextView) preferenceViewHolder.findViewById(16908310)).setOnClickListener(this.onClickListener);
        preferenceViewHolder.itemView.setOnClickListener(null);
    }

    public void setOnFactoryResetConfirmListener(OnFactoryResetConfirmListener onFactoryResetConfirmListener) {
        this.mOnFactoryResetConfirmListener = onFactoryResetConfirmListener;
    }

    public void setConfirmButtonText(int i) {
        setTitle(i);
        notifyChanged();
    }
}
