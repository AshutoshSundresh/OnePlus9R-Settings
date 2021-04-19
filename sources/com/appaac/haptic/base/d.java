package com.appaac.haptic.base;

import android.content.Context;
import com.appaac.haptic.a.a;

public abstract class d {
    private static d a;

    public static d a(Context context) {
        if (a == null) {
            synchronized (d.class) {
                if (a == null) {
                    a = new a(context);
                }
            }
        }
        return a;
    }

    public abstract void b(String str, int i, int i2, int i3, int i4);
}
