package com.appaac.haptic.a;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.text.TextUtils;
import android.util.Log;
import com.appaac.haptic.base.d;
import java.util.Arrays;
import org.json.JSONArray;
import org.json.JSONObject;

public class a extends d {
    private final Vibrator b;
    private Class<?> d;

    @SuppressLint({"PrivateApi"})
    public a(Context context) {
        this.b = (Vibrator) context.getSystemService("vibrator");
        try {
            this.d = Class.forName("android.os.RichTapVibrationEffect");
        } catch (ClassNotFoundException unused) {
            Log.i("PatternHeImpl", "failed to reflect class: \"android.os.RichTapVibrationEffect\"!");
        }
        if (this.d == null) {
            try {
                this.d = Class.forName("android.os.VibrationEffect");
            } catch (ClassNotFoundException unused2) {
                Log.i("PatternHeImpl", "failed to reflect class: \"android.os.VibrationEffect\"!");
            }
        }
    }

    @Override // com.appaac.haptic.base.d
    public void b(String str, int i, int i2, int i3, int i4) {
        int i5;
        long[] jArr;
        boolean z;
        String str2;
        String str3;
        if (this.b == null) {
            str3 = "Please call the init method";
        } else {
            Log.d("PatternHeImpl", "play new he api");
            if (i < 1) {
                str3 = "The minimum count of loop pattern is 1";
            } else {
                try {
                    JSONArray jSONArray = new JSONObject(str).getJSONArray("Pattern");
                    int min = Math.min(jSONArray.length(), 16);
                    int i6 = min * 2;
                    long[] jArr2 = new long[i6];
                    int[] iArr = new int[i6];
                    Arrays.fill(iArr, 0);
                    int i7 = 0;
                    int i8 = 0;
                    int i9 = 0;
                    while (i7 < min) {
                        JSONObject jSONObject = jSONArray.getJSONObject(i7).getJSONObject("Event");
                        String string = jSONObject.getString("Type");
                        if (TextUtils.equals("continuous", string)) {
                            int i10 = i7 * 2;
                            jArr2[i10] = (long) ((jSONObject.getInt("RelativeTime") - i8) - i9);
                            if (jArr2[i10] < 0) {
                                jArr2[i10] = 50;
                            }
                            iArr[i10] = 0;
                            int i11 = i10 + 1;
                            jArr2[i11] = (long) jSONObject.getInt("Duration");
                            JSONArray jSONArray2 = jSONObject.getJSONObject("Parameters").getJSONArray("Curve");
                            i5 = i6;
                            jArr = jArr2;
                            iArr[i11] = Math.max(1, (int) (((((float) Math.max(Math.min((int) (jSONArray2.getJSONObject(1).getDouble("Intensity") * 255.0d), 255), Math.min((int) (jSONArray2.getJSONObject(2).getDouble("Intensity") * 255.0d), 255))) * 1.0f) * ((float) i3)) / 255.0f));
                            int i12 = jSONObject.getInt("RelativeTime");
                            int i13 = jSONObject.getInt("Duration");
                            if (jSONArray2.getJSONObject(3).getInt("Time") != i13) {
                                str2 = "Event " + i7 + ": the relative time of 4th point must be equal to duration";
                            } else {
                                i8 = i12;
                                i9 = i13;
                                z = true;
                                i7++;
                                jSONArray = jSONArray;
                                min = min;
                                i6 = i5;
                                jArr2 = jArr;
                            }
                        } else {
                            i5 = i6;
                            jArr = jArr2;
                            if (TextUtils.equals("transient", string)) {
                                int i14 = i7 * 2;
                                jArr[i14] = (long) ((jSONObject.getInt("RelativeTime") - i8) - i9);
                                if (jArr[i14] < 0) {
                                    jArr[i14] = 50;
                                }
                                iArr[i14] = 0;
                                int i15 = i14 + 1;
                                jArr[i15] = 65;
                                z = true;
                                iArr[i15] = Math.max(1, Math.min((int) (((((double) i3) * 1.0d) * ((double) jSONObject.getJSONObject("Parameters").getInt("Intensity"))) / 100.0d), 255));
                                i8 = jSONObject.getInt("RelativeTime");
                                i9 = 65;
                                i7++;
                                jSONArray = jSONArray;
                                min = min;
                                i6 = i5;
                                jArr2 = jArr;
                            } else {
                                str2 = "haven't get type value";
                            }
                        }
                        Log.e("PatternHeImpl", str2);
                        break;
                    }
                    i5 = i6;
                    jArr = jArr2;
                    Log.d("PatternHeImpl", "times:" + Arrays.toString(jArr));
                    int i16 = 0;
                    for (int i17 = 0; i17 < i5; i17++) {
                        i16 = (int) (((long) i16) + jArr[i17]);
                    }
                    if (i16 > 30000) {
                        Log.e("PatternHeImpl", "Pattern's duration is less than 30000");
                        return;
                    } else if (Build.VERSION.SDK_INT >= 26) {
                        this.b.vibrate(VibrationEffect.createWaveform(jArr, iArr, -1));
                        return;
                    } else {
                        this.b.vibrate(jArr, -1);
                        return;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    return;
                }
            }
        }
        Log.e("PatternHeImpl", str3);
    }
}
