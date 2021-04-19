package com.android.settingslib.display;

import android.util.MathUtils;
import android.util.OpFeatures;

public class BrightnessUtils {
    public static final int GAMMA_SPACE_MAX;

    static {
        int i;
        if (OpFeatures.isSupport(new int[]{235})) {
            i = 65535;
        } else {
            i = OpFeatures.isSupport(new int[]{319}) ? 2047 : 1023;
        }
        GAMMA_SPACE_MAX = i;
    }

    public static final float convertGammaToLinearFloat(int i, float f, float f2) {
        float f3;
        float f4;
        float f5;
        float f6;
        int i2 = GAMMA_SPACE_MAX;
        if (i2 == 65535) {
            return MathUtils.lerp(f, f2, MathUtils.norm(0.0f, (float) i2, (float) i));
        }
        if (i2 == 2047) {
            if (i <= 1024) {
                f5 = MathUtils.norm(0.0f, 1177.0f, (float) i);
            } else {
                f5 = MathUtils.norm(0.0f, (float) i2, ((((float) (i - 1024)) * (((float) i2) - 1781.0f)) / ((float) (i2 - 1024))) + 1781.0f);
            }
            if (f5 <= 0.5f) {
                f6 = MathUtils.sq(f5 / 0.5f);
            } else {
                f6 = MathUtils.exp((f5 - 0.5599107f) / 0.17883277f) + 0.28466892f;
            }
            return MathUtils.lerp(f, f2, f6 / 12.0f);
        }
        if (i <= 512) {
            f3 = MathUtils.norm(0.0f, 590.0f, (float) i);
        } else {
            f3 = MathUtils.norm(0.0f, (float) i2, (float) ((((i - 512) * (i2 - 890)) / (i2 - 512)) + 890));
        }
        if (f3 <= 0.5f) {
            f4 = MathUtils.sq(f3 / 0.5f);
        } else {
            f4 = MathUtils.exp((f3 - 0.5599107f) / 0.17883277f) + 0.28466892f;
        }
        return MathUtils.lerp(f, f2, f4 / 12.0f);
    }

    public static final int convertLinearToGammaFloat(float f, float f2, float f3) {
        float f4;
        float f5;
        int i = GAMMA_SPACE_MAX;
        if (i == 65535) {
            return Math.round(MathUtils.lerp(0.0f, (float) GAMMA_SPACE_MAX, MathUtils.norm(f2, f3, f)));
        } else if (i == 2047) {
            float norm = MathUtils.norm(f2, f3, f) * 12.0f;
            if (norm <= 1.0f) {
                f5 = MathUtils.sqrt(norm) * 0.5f;
            } else {
                f5 = (MathUtils.log(norm - 0.28466892f) * 0.17883277f) + 0.5599107f;
            }
            int round = Math.round(MathUtils.lerp(0.0f, (float) GAMMA_SPACE_MAX, f5));
            int i2 = GAMMA_SPACE_MAX;
            if (f5 <= 1781.0f / ((float) i2)) {
                return Math.round((((float) round) * 1024.0f) / 1781.0f);
            }
            return Math.round(((((float) (round - 1781)) * (((float) i2) - 1024.0f)) / ((float) (i2 - 1781))) + 1024.0f);
        } else {
            float norm2 = MathUtils.norm(f2, f3, f) * 12.0f;
            if (norm2 <= 1.0f) {
                f4 = MathUtils.sqrt(norm2) * 0.5f;
            } else {
                f4 = (MathUtils.log(norm2 - 0.28466892f) * 0.17883277f) + 0.5599107f;
            }
            int round2 = Math.round(MathUtils.lerp(0.0f, (float) GAMMA_SPACE_MAX, f4));
            int i3 = GAMMA_SPACE_MAX;
            if (f4 <= 890.0f / ((float) i3)) {
                return Math.round((float) ((round2 * 512) / 890));
            }
            return Math.round((float) ((((round2 - 890) * (i3 - 512)) / (i3 - 890)) + 512));
        }
    }
}
