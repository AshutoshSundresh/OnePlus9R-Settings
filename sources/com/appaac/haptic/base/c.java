package com.appaac.haptic.base;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class c extends Thread {
    final Object a = new Object();
    final Context b;
    boolean c = false;
    List<b> d = Collections.synchronizedList(new ArrayList());

    public c(Context context) {
        this.b = context;
    }

    /* access modifiers changed from: package-private */
    public long a() {
        return SystemClock.elapsedRealtime();
    }

    /* JADX WARNING: Removed duplicated region for block: B:8:0x0039 A[SYNTHETIC, Splitter:B:8:0x0039] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void a(int r8) {
        /*
            r7 = this;
            java.util.List<com.appaac.haptic.base.b> r0 = r7.d
            int r0 = r0.size()
            r1 = 5
            r3 = 0
            r4 = 1
            if (r0 <= r4) goto L_0x002b
            java.lang.String r0 = "NonRichTapThread"
            java.lang.String r5 = "vibrating ,so interrupt it,size > 1,remove one"
            android.util.Log.d(r0, r5)
            java.util.List<com.appaac.haptic.base.b> r0 = r7.d
            r0.remove(r4)
        L_0x0019:
            java.util.List<com.appaac.haptic.base.b> r0 = r7.d
            java.lang.Object r0 = r0.get(r3)
            com.appaac.haptic.base.b r0 = (com.appaac.haptic.base.b) r0
            long r3 = r7.a()
            long r5 = (long) r8
            long r3 = r3 + r5
            long r3 = r3 + r1
            r0.f = r3
            goto L_0x0036
        L_0x002b:
            if (r0 <= 0) goto L_0x0036
            java.lang.String r0 = "NonRichTapThread"
            java.lang.String r4 = "vibrating ,so interrupt it,size == 1,just set next time play"
            android.util.Log.d(r0, r4)
            goto L_0x0019
        L_0x0036:
            java.lang.Object r8 = r7.a
            monitor-enter(r8)
            java.lang.Object r7 = r7.a     // Catch:{ Exception -> 0x0041 }
            r7.notify()     // Catch:{ Exception -> 0x0041 }
            goto L_0x0045
        L_0x003f:
            r7 = move-exception
            goto L_0x0047
        L_0x0041:
            r7 = move-exception
            r7.printStackTrace()     // Catch:{ all -> 0x003f }
        L_0x0045:
            monitor-exit(r8)     // Catch:{ all -> 0x003f }
            return
        L_0x0047:
            monitor-exit(r8)     // Catch:{ all -> 0x003f }
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.appaac.haptic.base.c.a(int):void");
    }

    public void run() {
        Log.d("NonRichTapThread", "non richTap thread start!!");
        while (!this.c) {
            List<b> list = this.d;
            if (list == null || list.isEmpty()) {
                synchronized (this.a) {
                    try {
                        Log.d("NonRichTapThread", "nothing is in list,just wait!!");
                        this.a.wait();
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                    }
                }
            } else {
                long a2 = a();
                b bVar = this.d.get(0);
                if (bVar.g) {
                    long j = bVar.f;
                    if (j > a2) {
                        long j2 = j - a2;
                        synchronized (this.a) {
                            try {
                                Log.d("NonRichTapThread", "go to sleep :" + j2);
                                this.a.wait(j2);
                            } catch (Exception e2) {
                                e2.printStackTrace();
                            }
                        }
                        if (bVar.i > bVar.c()) {
                            Log.d("NonRichTapThread", " wake up vib looper is end ,remove it!!");
                            bVar.g = false;
                            if (this.d.isEmpty()) {
                            }
                        }
                    } else {
                        d.a(this.b).b(bVar.b(), bVar.c(), bVar.d(), bVar.e(), bVar.f());
                        bVar.i++;
                        Log.d("NonRichTapThread", " vib mHasVibNum:" + bVar.i);
                        if (bVar.i >= bVar.c()) {
                            Log.d("NonRichTapThread", " wake up vib looper is end ,remove it!!");
                            bVar.g = false;
                            if (this.d.isEmpty()) {
                            }
                        } else {
                            bVar.f = a() + ((long) bVar.a());
                            Log.d("NonRichTapThread", " vib now:" + a() + " mWhen:" + bVar.f + " lastTime:" + bVar.a());
                        }
                    }
                }
                this.d.remove(0);
            }
        }
    }
}
