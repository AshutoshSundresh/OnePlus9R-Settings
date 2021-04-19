package com.oneplus.settings.utils;

import android.content.Context;
import android.widget.SeekBar;
import com.appaac.haptic.AACHapticUtils;

public class SeekBarVibratorHelper {
    private static SeekBarVibratorHelper mInstance;
    private Context mContext;
    private int recent;
    private int sliderAmount = 100;
    private int sliderEnd = 60;
    private int sliderStart = 10;
    private long time;

    private SeekBarVibratorHelper() {
    }

    public static synchronized SeekBarVibratorHelper getInstance() {
        SeekBarVibratorHelper seekBarVibratorHelper;
        synchronized (SeekBarVibratorHelper.class) {
            if (mInstance == null) {
                mInstance = new SeekBarVibratorHelper();
            }
            seekBarVibratorHelper = mInstance;
        }
        return seekBarVibratorHelper;
    }

    public void init(Context context) {
        this.mContext = context.getApplicationContext();
        AACHapticUtils.getInstance().init(this.mContext);
    }

    public void doSeekBarVibrate(SeekBar seekBar, int i) {
        if (!VibratorSceneUtils.systemVibrateEnabled(this.mContext) || !AACHapticUtils.getInstance().supportRichTap()) {
            return;
        }
        if (i == seekBar.getMax()) {
            if (seekBar.getMax() != this.recent) {
                AACHapticUtils.getInstance().playExtPreBaked(2, 100);
                this.recent = seekBar.getMax();
            }
        } else if (i == seekBar.getMin()) {
            if (seekBar.getMin() != this.recent) {
                AACHapticUtils.getInstance().playExtPreBaked(2, 100);
                this.recent = seekBar.getMin();
            }
        } else if (System.currentTimeMillis() - this.time > 20) {
            if (seekBar.getMax() >= 100) {
                this.sliderAmount = 100;
            } else {
                this.sliderAmount = seekBar.getMax();
            }
            int round = Math.round(((float) seekBar.getMax()) / ((float) this.sliderAmount));
            int i2 = (i / round) * round;
            if ((this.sliderAmount != 100 || (i > round * 2 && i < round * 98)) && i2 != this.recent && i2 > 0) {
                AACHapticUtils.getInstance().playExtPreBaked(10, Math.round((((float) i2) / ((float) seekBar.getMax())) * ((float) (this.sliderEnd - this.sliderStart))) + this.sliderStart);
                this.recent = i2;
                this.time = System.currentTimeMillis();
            }
        }
    }
}
