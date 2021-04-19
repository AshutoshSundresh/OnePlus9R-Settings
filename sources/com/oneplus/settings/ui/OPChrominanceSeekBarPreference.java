package com.oneplus.settings.ui;

import android.content.Context;
import android.provider.Settings;
import android.util.AttributeSet;
import android.widget.SeekBar;
import androidx.preference.Preference;
import androidx.preference.PreferenceViewHolder;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;

public class OPChrominanceSeekBarPreference extends Preference {
    private Context mContext;
    OPChrominanceSeekBarChangeListener mOPChrominanceSeekBarChangeListener;
    private OPVerticalSeekBar mSeekBar;

    public interface OPChrominanceSeekBarChangeListener {
        void onChrominanceProgressChanged(SeekBar seekBar, int i, boolean z);

        void onChrominanceStartTrackingTouch(SeekBar seekBar);

        void onChrominanceStopTrackingTouch(SeekBar seekBar);
    }

    public OPChrominanceSeekBarPreference(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.mContext = context;
        setLayoutResource(C0012R$layout.op_chrominance_seekpreference);
    }

    public OPChrominanceSeekBarPreference(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public OPChrominanceSeekBarPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public OPChrominanceSeekBarPreference(Context context) {
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
        OPVerticalSeekBar oPVerticalSeekBar = (OPVerticalSeekBar) preferenceViewHolder.findViewById(C0010R$id.chrominance_seekbar);
        this.mSeekBar = oPVerticalSeekBar;
        oPVerticalSeekBar.setMax(100);
        this.mSeekBar.setMarkerPosition(50);
        this.mSeekBar.setProgress(Settings.System.getInt(this.mContext.getContentResolver(), "oem_screen_chrominance_value", 50));
        this.mSeekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            /* class com.oneplus.settings.ui.OPChrominanceSeekBarPreference.AnonymousClass1 */

            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                OPChrominanceSeekBarChangeListener oPChrominanceSeekBarChangeListener = OPChrominanceSeekBarPreference.this.mOPChrominanceSeekBarChangeListener;
                if (oPChrominanceSeekBarChangeListener != null) {
                    oPChrominanceSeekBarChangeListener.onChrominanceProgressChanged(seekBar, i, z);
                }
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
                OPChrominanceSeekBarChangeListener oPChrominanceSeekBarChangeListener = OPChrominanceSeekBarPreference.this.mOPChrominanceSeekBarChangeListener;
                if (oPChrominanceSeekBarChangeListener != null) {
                    oPChrominanceSeekBarChangeListener.onChrominanceStartTrackingTouch(seekBar);
                }
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
                OPChrominanceSeekBarChangeListener oPChrominanceSeekBarChangeListener = OPChrominanceSeekBarPreference.this.mOPChrominanceSeekBarChangeListener;
                if (oPChrominanceSeekBarChangeListener != null) {
                    oPChrominanceSeekBarChangeListener.onChrominanceStopTrackingTouch(seekBar);
                }
            }
        });
    }

    public void setOPChrominanceSeekBarChangeListener(OPChrominanceSeekBarChangeListener oPChrominanceSeekBarChangeListener) {
        this.mOPChrominanceSeekBarChangeListener = oPChrominanceSeekBarChangeListener;
    }
}
