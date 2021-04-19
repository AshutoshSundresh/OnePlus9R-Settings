package com.appaac.haptic;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.util.Log;
import com.appaac.haptic.base.a;
import com.appaac.haptic.base.c;
import java.lang.reflect.Method;

public class AACHapticUtils extends a {
    @SuppressLint({"StaticFieldLeak"})
    private static AACHapticUtils sInstance;
    private Class clazzVibrationEffect;
    private Context mContext;
    private c mNonRichTapLoopThread;
    private boolean mRichTapEnable = true;
    private Vibrator vibrator;

    @SuppressLint({"PrivateApi"})
    private AACHapticUtils() {
        try {
            this.clazzVibrationEffect = Class.forName("android.os.RichTapVibrationEffect");
        } catch (ClassNotFoundException unused) {
            Log.i("AACHapticUtils", "failed to reflect class: \"android.os.RichTapVibrationEffect\"!");
        }
        if (this.clazzVibrationEffect == null) {
            try {
                this.clazzVibrationEffect = Class.forName("android.os.VibrationEffect");
            } catch (ClassNotFoundException unused2) {
                Log.i("AACHapticUtils", "failed to reflect class: \"android.os.VibrationEffect\"!");
            }
        }
    }

    public static AACHapticUtils getInstance() {
        if (sInstance == null) {
            synchronized (AACHapticUtils.class) {
                if (sInstance == null) {
                    sInstance = new AACHapticUtils();
                }
            }
        }
        return sInstance;
    }

    private void playExtPreBakedOnNonRichTap(int i, int i2) {
        Vibrator vibrator2 = this.vibrator;
        if (vibrator2 == null) {
            Log.e("AACHapticUtils", "Please call the init method");
            return;
        }
        if (!this.mRichTapEnable) {
            vibrator2.cancel();
            this.mNonRichTapLoopThread.a(20);
        }
        int i3 = Build.VERSION.SDK_INT;
        Vibrator vibrator3 = this.vibrator;
        if (i3 >= 26) {
            vibrator3.vibrate(VibrationEffect.createOneShot((long) i, Math.max(1, Math.min(i2, 255))));
        } else {
            vibrator3.vibrate((long) i);
        }
    }

    public AACHapticUtils init(Context context) {
        if (context != null) {
            Log.d("AACHapticUtils", "init ,version:" + a.VERSION_NAME + " versionCode:" + a.VERSION_CODE);
            this.vibrator = (Vibrator) context.getSystemService("vibrator");
            useNonRichTap(false);
            this.mContext = context;
            if (isNonRichTapMode()) {
                c cVar = new c(this.mContext);
                this.mNonRichTapLoopThread = cVar;
                cVar.start();
            }
            return sInstance;
        }
        throw new IllegalArgumentException("context shouldn't be null");
    }

    public boolean isNonRichTapMode() {
        return !supportRichTap() || !this.mRichTapEnable;
    }

    public void playExtPreBaked(int i, int i2) {
        if (this.vibrator == null) {
            Log.e("AACHapticUtils", "Please call the init method");
        } else if (i < 0) {
            throw new IllegalArgumentException("Wrong parameter effect is null!");
        } else if (i2 < 1 || i2 > 100) {
            throw new IllegalArgumentException("Wrong parameter {strength=" + i2 + "}, which should be between 1 and 100 included!");
        } else if (!this.mRichTapEnable) {
            playExtPreBakedOnNonRichTap(65, (i2 * 255) / 100);
        } else {
            try {
                if (Build.VERSION.SDK_INT >= 26) {
                    Method method = this.clazzVibrationEffect.getMethod("createExtPreBaked", Integer.TYPE, Integer.TYPE);
                    Object[] objArr = {Integer.valueOf(i), Integer.valueOf(i2)};
                    this.vibrator.vibrate((VibrationEffect) method.invoke(null, objArr));
                    return;
                }
                Log.e("AACHapticUtils", "The system is low than 26,does not support richTap!!");
            } catch (Exception e) {
                e.printStackTrace();
                Log.w("AACHapticUtils", "The system doesn't integrate richTap software");
            }
        }
    }

    public boolean supportRichTap() {
        Class cls;
        String str;
        boolean z = false;
        if (this.vibrator == null) {
            str = "Please call the init method first";
        } else if (Build.VERSION.SDK_INT < 26) {
            str = "android api is lower than o,can not support!!";
        } else {
            Class cls2 = this.clazzVibrationEffect;
            boolean z2 = true;
            if (cls2 != null) {
                try {
                    cls2.getMethod("createPatternHeWithParam", int[].class, Integer.TYPE, Integer.TYPE, Integer.TYPE, Integer.TYPE);
                } catch (NoSuchMethodException unused) {
                    Log.e("AACHapticUtils", "The system doesn't integrate richTap software");
                }
                if (!z2 && (cls = this.clazzVibrationEffect) != null) {
                    try {
                        int intValue = ((Integer) cls.getMethod("checkIfRichTapSupport", new Class[0]).invoke(null, new Object[0])).intValue();
                        Log.d("AACHapticUtils", "checkIfRichTapSupport result:" + intValue);
                        if (2 != intValue) {
                            z = z2;
                        }
                        return z;
                    } catch (Exception e) {
                        e.printStackTrace();
                        return z2;
                    }
                }
            }
            z2 = false;
            return !z2 ? z2 : z2;
        }
        Log.e("AACHapticUtils", str);
        return false;
    }

    public void useNonRichTap(boolean z) {
        boolean z2;
        StringBuilder sb = new StringBuilder();
        sb.append("useNonRichTap start nonRichTap = ");
        sb.append(!this.mRichTapEnable);
        Log.d("AACHapticUtils", sb.toString());
        if (supportRichTap()) {
            z2 = !z;
        } else {
            Log.w("AACHapticUtils", "the system doesn't integrate richTap software");
            z2 = false;
        }
        this.mRichTapEnable = z2;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("useNonRichTap end nonRichTap = ");
        sb2.append(!this.mRichTapEnable);
        Log.d("AACHapticUtils", sb2.toString());
    }
}
