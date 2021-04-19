package com.oneplus.settings.ui;

import android.content.Context;
import android.provider.Settings;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.SeekBar;
import android.widget.Toast;
import androidx.preference.Preference;
import androidx.preference.PreferenceViewHolder;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.oneplus.settings.utils.OPUtils;

public class OPNightModeLevelPreferenceCategory extends Preference {
    private Context mContext;
    private boolean mEnabled;
    OPNightModeLevelPreferenceChangeListener mOPNightModeLevelPreferenceChangeListener;
    private RelativeLayout mRLBrightness;
    private RelativeLayout mRLColor;
    private RelativeLayout mRLSaturation;
    private SeekBar mSeekBarBrightness;
    private OPVerticalSeekBar mSeekBarColor;
    private SeekBar mSeekBarSaturation;
    private Toast mToastTip;

    public interface OPNightModeLevelPreferenceChangeListener {
        void onBrightnessProgressChanged(int i, boolean z);

        void onBrightnessStartTrackingTouch(int i);

        void onBrightnessStopTrackingTouch(int i);

        void onColorProgressChanged(SeekBar seekBar, int i, boolean z);

        void onColorStartTrackingTouch(int i);

        void onColorStopTrackingTouch(int i);

        void onSaturationProgressChanged(SeekBar seekBar, int i, boolean z);

        void onSaturationStartTrackingTouch(int i);

        void onSaturationStopTrackingTouch(int i);
    }

    public OPNightModeLevelPreferenceCategory(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.mEnabled = false;
        this.mContext = context;
        setLayoutResource(C0012R$layout.op_night_mode_level_preference_category);
    }

    public OPNightModeLevelPreferenceCategory(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public OPNightModeLevelPreferenceCategory(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public OPNightModeLevelPreferenceCategory(Context context) {
        this(context, null);
    }

    @Override // androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        preferenceViewHolder.setDividerAllowedBelow(false);
        preferenceViewHolder.setDividerAllowedAbove(false);
        preferenceViewHolder.itemView.setBackgroundColor(0);
        initView(preferenceViewHolder);
    }

    private void initView(PreferenceViewHolder preferenceViewHolder) {
        int intForUser = Settings.System.getIntForUser(this.mContext.getContentResolver(), "oem_nightmode_progress_status", 46, -2);
        boolean z = false;
        int intForUser2 = Settings.System.getIntForUser(this.mContext.getContentResolver(), "oem_nightmode_brightness_progress", 0, -2);
        int intForUser3 = Settings.System.getIntForUser(this.mContext.getContentResolver(), "oem_screen_saturation_value", 0, -2);
        this.mRLColor = (RelativeLayout) preferenceViewHolder.findViewById(C0010R$id.tr_color_temperature);
        RelativeLayout relativeLayout = (RelativeLayout) preferenceViewHolder.findViewById(C0010R$id.tr_brightness);
        this.mRLBrightness = relativeLayout;
        relativeLayout.setVisibility(8);
        this.mRLSaturation = (RelativeLayout) preferenceViewHolder.findViewById(C0010R$id.tr_saturation);
        if (!OPUtils.isSupportColorSaturationAdjustment()) {
            this.mRLSaturation.setVisibility(8);
        }
        OPVerticalSeekBar oPVerticalSeekBar = (OPVerticalSeekBar) preferenceViewHolder.findViewById(C0010R$id.seekbar_color_temperature);
        this.mSeekBarColor = oPVerticalSeekBar;
        oPVerticalSeekBar.setMax(100);
        this.mSeekBarColor.setMarkerPosition(46);
        this.mSeekBarColor.setProgress(intForUser);
        SeekBar seekBar = (SeekBar) preferenceViewHolder.findViewById(C0010R$id.seekbar_brightness);
        this.mSeekBarBrightness = seekBar;
        seekBar.setMax(100);
        this.mSeekBarBrightness.setProgress(intForUser2);
        this.mSeekBarColor.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            /* class com.oneplus.settings.ui.OPNightModeLevelPreferenceCategory.AnonymousClass1 */

            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onColorProgressChanged(seekBar, i, z);
                }
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onColorStartTrackingTouch(seekBar.getProgress());
                }
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onColorStopTrackingTouch(seekBar.getProgress());
                }
            }
        });
        this.mSeekBarBrightness.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            /* class com.oneplus.settings.ui.OPNightModeLevelPreferenceCategory.AnonymousClass2 */

            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onBrightnessProgressChanged(i, z);
                }
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onBrightnessStartTrackingTouch(seekBar.getProgress());
                }
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onBrightnessStopTrackingTouch(seekBar.getProgress());
                }
            }
        });
        SeekBar seekBar2 = (SeekBar) preferenceViewHolder.findViewById(C0010R$id.seekbar_saturation);
        this.mSeekBarSaturation = seekBar2;
        seekBar2.setMax(100);
        this.mSeekBarSaturation.setProgress(intForUser3);
        this.mSeekBarSaturation.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            /* class com.oneplus.settings.ui.OPNightModeLevelPreferenceCategory.AnonymousClass3 */

            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onSaturationProgressChanged(seekBar, i, z);
                }
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onSaturationStartTrackingTouch(seekBar.getProgress());
                }
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
                OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener = OPNightModeLevelPreferenceCategory.this.mOPNightModeLevelPreferenceChangeListener;
                if (oPNightModeLevelPreferenceChangeListener != null) {
                    oPNightModeLevelPreferenceChangeListener.onSaturationStopTrackingTouch(seekBar.getProgress());
                }
            }
        });
        this.mRLColor.setOnTouchListener(new View.OnTouchListener() {
            /* class com.oneplus.settings.ui.$$Lambda$OPNightModeLevelPreferenceCategory$AJbSS0doHxFVarMVeyp40DQVA */

            public final boolean onTouch(View view, MotionEvent motionEvent) {
                return OPNightModeLevelPreferenceCategory.this.lambda$initView$0$OPNightModeLevelPreferenceCategory(view, motionEvent);
            }
        });
        this.mRLBrightness.setOnTouchListener(new View.OnTouchListener() {
            /* class com.oneplus.settings.ui.$$Lambda$OPNightModeLevelPreferenceCategory$1BCHIWEUrGQw8a_X2Omzpk5EIQ0 */

            public final boolean onTouch(View view, MotionEvent motionEvent) {
                return OPNightModeLevelPreferenceCategory.this.lambda$initView$1$OPNightModeLevelPreferenceCategory(view, motionEvent);
            }
        });
        this.mRLSaturation.setOnTouchListener(new View.OnTouchListener() {
            /* class com.oneplus.settings.ui.$$Lambda$OPNightModeLevelPreferenceCategory$D8MqW8Rv3LzBdHzeiwrEdiG1niI */

            public final boolean onTouch(View view, MotionEvent motionEvent) {
                return OPNightModeLevelPreferenceCategory.this.lambda$initView$2$OPNightModeLevelPreferenceCategory(view, motionEvent);
            }
        });
        if (isNightDisplayActivated() && !isWellbeingGrayscaleActivated()) {
            z = true;
        }
        setEnabled(z);
        if (!OPUtils.isSupportMMDisplayColorScreenMode()) {
            this.mRLBrightness.setVisibility(4);
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$initView$0 */
    public /* synthetic */ boolean lambda$initView$0$OPNightModeLevelPreferenceCategory(View view, MotionEvent motionEvent) {
        if (this.mEnabled || motionEvent.getAction() != 0) {
            return false;
        }
        showTurnOnTip();
        return true;
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$initView$1 */
    public /* synthetic */ boolean lambda$initView$1$OPNightModeLevelPreferenceCategory(View view, MotionEvent motionEvent) {
        if (this.mEnabled || motionEvent.getAction() != 0) {
            return false;
        }
        showTurnOnTip();
        return true;
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$initView$2 */
    public /* synthetic */ boolean lambda$initView$2$OPNightModeLevelPreferenceCategory(View view, MotionEvent motionEvent) {
        if (this.mEnabled || motionEvent.getAction() != 0) {
            return false;
        }
        showTurnOnTip();
        return true;
    }

    private void showTurnOnTip() {
        Toast toast = this.mToastTip;
        if (toast != null) {
            toast.cancel();
        }
        if (isWellbeingGrayscaleActivated()) {
            Context context = this.mContext;
            this.mToastTip = Toast.makeText(context, context.getString(C0017R$string.oneplus_wellbeing_grayscale_open_tip), 0);
        } else {
            Context context2 = this.mContext;
            this.mToastTip = Toast.makeText(context2, context2.getString(C0017R$string.oneplus_night_mode_open_tip), 0);
        }
        this.mToastTip.show();
    }

    public int getColorProgress() {
        OPVerticalSeekBar oPVerticalSeekBar = this.mSeekBarColor;
        if (oPVerticalSeekBar != null) {
            return oPVerticalSeekBar.getProgress();
        }
        return -1;
    }

    public int getBrightnessProgress() {
        SeekBar seekBar = this.mSeekBarBrightness;
        if (seekBar != null) {
            return seekBar.getProgress();
        }
        return -1;
    }

    public int getSaturationProgress() {
        SeekBar seekBar = this.mSeekBarSaturation;
        if (seekBar != null) {
            return seekBar.getProgress();
        }
        return -1;
    }

    @Override // androidx.preference.Preference
    public void setEnabled(boolean z) {
        this.mEnabled = z;
        OPVerticalSeekBar oPVerticalSeekBar = this.mSeekBarColor;
        if (oPVerticalSeekBar != null) {
            oPVerticalSeekBar.setActivated(z);
            this.mSeekBarColor.setEnabled(z);
        }
        SeekBar seekBar = this.mSeekBarBrightness;
        if (seekBar != null) {
            seekBar.setActivated(z);
            this.mSeekBarBrightness.setEnabled(z);
        }
        SeekBar seekBar2 = this.mSeekBarSaturation;
        if (seekBar2 != null) {
            seekBar2.setActivated(z);
            this.mSeekBarSaturation.setEnabled(z);
        }
    }

    private boolean isNightDisplayActivated() {
        return Settings.Secure.getIntForUser(this.mContext.getContentResolver(), "night_display_activated", 0, -2) == 1;
    }

    private boolean isWellbeingGrayscaleActivated() {
        return Settings.System.getInt(this.mContext.getContentResolver(), "accessibility_display_grayscale_enabled", 1) == 0;
    }

    public void setOPNightModeLevelSeekBarChangeListener(OPNightModeLevelPreferenceChangeListener oPNightModeLevelPreferenceChangeListener) {
        this.mOPNightModeLevelPreferenceChangeListener = oPNightModeLevelPreferenceChangeListener;
    }

    public int getColorProgressMax() {
        OPVerticalSeekBar oPVerticalSeekBar = this.mSeekBarColor;
        if (oPVerticalSeekBar != null) {
            return oPVerticalSeekBar.getMax();
        }
        return -1;
    }

    public int getBrightnessProgressMax() {
        SeekBar seekBar = this.mSeekBarBrightness;
        if (seekBar != null) {
            return seekBar.getMax();
        }
        return -1;
    }
}
