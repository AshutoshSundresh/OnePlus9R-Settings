package com.android.settings.fuelgauge;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Html;
import android.text.Spanned;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import androidx.preference.PreferenceViewHolder;
import com.android.settings.C0006R$color;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.android.settingslib.Utils;
import com.android.settingslib.widget.apppreference.AppPreference;

public class PowerGaugePreference extends AppPreference {
    private View appendix;
    private CharSequence mContentDescription;
    private BatteryEntry mInfo;
    private View.OnClickListener mOnClickListener;
    private int mPowerState;
    private CharSequence mProgress;
    private boolean mShowAnomalyIcon;
    private View mSwitch;

    public PowerGaugePreference(Context context, Drawable drawable, CharSequence charSequence, BatteryEntry batteryEntry) {
        this(context, null, drawable, charSequence, batteryEntry);
    }

    public PowerGaugePreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, null, null, null);
    }

    private PowerGaugePreference(Context context, AttributeSet attributeSet, Drawable drawable, CharSequence charSequence, BatteryEntry batteryEntry) {
        super(context, attributeSet);
        this.mPowerState = -1;
        if (drawable != null) {
            setIcon(drawable);
        }
        setWidgetLayoutResource(C0012R$layout.preference_widget_summary);
        this.mInfo = batteryEntry;
        this.mContentDescription = charSequence;
        this.mShowAnomalyIcon = false;
    }

    public void setContentDescription(String str) {
        this.mContentDescription = str;
        notifyChanged();
    }

    public void setPercent(double d) {
        this.mProgress = Utils.formatPercentage(d, true);
        updatePowerState();
        notifyChanged();
    }

    public String getPercent() {
        return this.mProgress.toString();
    }

    public void setState(int i) {
        this.mPowerState = i;
        updatePowerState();
    }

    public void setOnButtonClickListener(View.OnClickListener onClickListener) {
        setOnClickListener(this.mSwitch, onClickListener);
    }

    private void setOnClickListener(View view, View.OnClickListener onClickListener) {
        String str;
        this.mOnClickListener = onClickListener;
        if (view != null) {
            view.setOnClickListener(onClickListener);
            BatteryEntry batteryEntry = this.mInfo;
            if (batteryEntry != null && (str = batteryEntry.defaultPackageName) != null) {
                view.setTag(str);
            }
        }
    }

    private void shadowView() {
        View view = this.appendix;
        if (view != null) {
            view.setVisibility(8);
        }
    }

    private void updatePowerState() {
        int i = this.mPowerState;
        if (1 == i) {
            setSummary(convertToSpanned(getContext().getResources().getString(C0017R$string.high_power_app_text_red, this.mProgress), "D94B41"));
        } else if (i == 0) {
            setSummary(getContext().getResources().getString(C0017R$string.high_power_app_text_nomal, this.mProgress));
            shadowView();
        } else {
            setSummary(this.mProgress.toString());
        }
        setButtonVisible();
    }

    private void setButtonVisible() {
        View view = this.mSwitch;
        if (view != null) {
            int i = this.mPowerState;
            if (i == 0 || 1 == i) {
                this.mSwitch.setVisibility(0);
                shadowView();
                return;
            }
            view.setVisibility(8);
        }
    }

    private Spanned convertToSpanned(String str, String str2) {
        String str3 = "<font color=\"#" + str2 + "\">" + str + "</font>";
        if (Build.VERSION.SDK_INT >= 24) {
            return Html.fromHtml(str3, 0);
        }
        return Html.fromHtml(str3);
    }

    public void shouldShowAnomalyIcon(boolean z) {
        this.mShowAnomalyIcon = z;
        notifyChanged();
    }

    /* access modifiers changed from: package-private */
    public BatteryEntry getInfo() {
        return this.mInfo;
    }

    @Override // com.android.settingslib.widget.apppreference.AppPreference, androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        TextView textView = (TextView) preferenceViewHolder.findViewById(C0010R$id.widget_summary);
        textView.setText(this.mProgress);
        if (this.mShowAnomalyIcon) {
            textView.setCompoundDrawablesRelativeWithIntrinsicBounds(C0008R$drawable.ic_warning_24dp, 0, 0, 0);
        } else {
            textView.setCompoundDrawablesRelativeWithIntrinsicBounds(0, 0, 0, 0);
        }
        View findViewById = preferenceViewHolder.findViewById(C0010R$id.widget_summary);
        this.mSwitch = findViewById;
        ((TextView) findViewById).setText(C0017R$string.oneplus_stop_run);
        ((TextView) this.mSwitch).setTextColor(getContext().getResources().getColor(C0006R$color.oneplus_accent_color));
        setOnClickListener(this.mSwitch, this.mOnClickListener);
        setButtonVisible();
        if (this.mContentDescription != null) {
            ((TextView) preferenceViewHolder.findViewById(16908310)).setContentDescription(this.mContentDescription);
        }
    }
}
