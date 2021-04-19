package com.oneplus.settings.ui;

import android.content.Context;
import android.provider.Settings;
import android.util.AttributeSet;
import android.widget.SeekBar;
import android.widget.TextView;
import androidx.preference.Preference;
import androidx.preference.PreferenceViewHolder;
import com.android.settings.C0006R$color;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;

public class OPSideBarSeekBarPreference extends Preference {
    private final Context mContext;
    private int mCurrentProgress;
    private TextView mEnd;
    private TextView mStart;
    private TextView mTitle;

    public OPSideBarSeekBarPreference(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.mContext = context;
        setLayoutResource(C0012R$layout.op_side_bar_seekpreference);
    }

    public OPSideBarSeekBarPreference(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public OPSideBarSeekBarPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public OPSideBarSeekBarPreference(Context context) {
        this(context, null);
    }

    @Override // androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        preferenceViewHolder.setDividerAllowedBelow(false);
        preferenceViewHolder.setDividerAllowedAbove(false);
        initSeekBar(preferenceViewHolder);
    }

    private void initSeekBar(PreferenceViewHolder preferenceViewHolder) {
        SeekBar seekBar = (SeekBar) preferenceViewHolder.findViewById(C0010R$id.side_bar_transparent_seekbar);
        boolean z = false;
        seekBar.setMin(0);
        seekBar.setMax(80);
        int intForUser = Settings.Secure.getIntForUser(this.mContext.getContentResolver(), "edge_panel_float_bar_alpha", 40, -2);
        this.mCurrentProgress = intForUser;
        seekBar.setProgress(intForUser);
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            /* class com.oneplus.settings.ui.OPSideBarSeekBarPreference.AnonymousClass1 */

            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
            }

            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                OPSideBarSeekBarPreference.this.mCurrentProgress = i;
                Settings.Secure.putIntForUser(OPSideBarSeekBarPreference.this.mContext.getContentResolver(), "edge_panel_float_bar_alpha", OPSideBarSeekBarPreference.this.mCurrentProgress, -2);
            }
        });
        this.mTitle = (TextView) preferenceViewHolder.findViewById(C0010R$id.title);
        this.mStart = (TextView) preferenceViewHolder.findViewById(C0010R$id.header);
        this.mEnd = (TextView) preferenceViewHolder.findViewById(C0010R$id.end);
        if (Settings.Secure.getIntForUser(getContext().getContentResolver(), "edge_panel_toggle", 0, -2) == 1) {
            z = true;
        }
        setEnabled(z);
    }

    @Override // androidx.preference.Preference
    public void setEnabled(boolean z) {
        super.setEnabled(z);
        if (z) {
            TextView textView = this.mTitle;
            if (textView != null) {
                textView.setTextColor(this.mContext.getColor(C0006R$color.op_control_text_color_primary));
            }
            TextView textView2 = this.mStart;
            if (textView2 != null) {
                textView2.setTextColor(this.mContext.getColor(C0006R$color.op_control_text_color_secondary));
            }
            TextView textView3 = this.mEnd;
            if (textView3 != null) {
                textView3.setTextColor(this.mContext.getColor(C0006R$color.op_control_text_color_secondary));
                return;
            }
            return;
        }
        TextView textView4 = this.mTitle;
        if (textView4 != null) {
            textView4.setTextColor(this.mContext.getColor(C0006R$color.op_control_text_color_disable_default));
        }
        TextView textView5 = this.mStart;
        if (textView5 != null) {
            textView5.setTextColor(this.mContext.getColor(C0006R$color.op_control_text_color_disable_default));
        }
        TextView textView6 = this.mEnd;
        if (textView6 != null) {
            textView6.setTextColor(this.mContext.getColor(C0006R$color.op_control_text_color_disable_default));
        }
    }
}
