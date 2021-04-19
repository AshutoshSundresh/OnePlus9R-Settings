package com.google.android.setupcompat.util;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

public final class SystemBarHelper {

    /* access modifiers changed from: package-private */
    /* renamed from: com.google.android.setupcompat.util.SystemBarHelper$1  reason: invalid class name */
    public class AnonymousClass1 implements OnDecorViewInstalledListener {
    }

    /* access modifiers changed from: private */
    public interface OnDecorViewInstalledListener {
        void onDecorViewInstalled(View view);
    }

    public static void removeVisibilityFlag(View view, int i) {
        view.setSystemUiVisibility((~i) & view.getSystemUiVisibility());
    }

    public static void removeVisibilityFlag(Window window, int i) {
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.systemUiVisibility = (~i) & attributes.systemUiVisibility;
        window.setAttributes(attributes);
    }

    public static void removeImmersiveFlagsFromDecorView(Window window, final int i) {
        getDecorView(window, new OnDecorViewInstalledListener() {
            /* class com.google.android.setupcompat.util.SystemBarHelper.AnonymousClass2 */

            @Override // com.google.android.setupcompat.util.SystemBarHelper.OnDecorViewInstalledListener
            public void onDecorViewInstalled(View view) {
                SystemBarHelper.removeVisibilityFlag(view, i);
            }
        });
    }

    @Deprecated
    public static void showSystemBars(Window window, Context context) {
        if (Build.VERSION.SDK_INT >= 21) {
            removeVisibilityFlag(window, 5634);
            removeImmersiveFlagsFromDecorView(window, 5634);
            if (context != null) {
                TypedArray obtainStyledAttributes = context.obtainStyledAttributes(new int[]{16843857, 16843858});
                int color = obtainStyledAttributes.getColor(0, 0);
                int color2 = obtainStyledAttributes.getColor(1, 0);
                window.setStatusBarColor(color);
                window.setNavigationBarColor(color2);
                obtainStyledAttributes.recycle();
            }
        }
    }

    private static void getDecorView(Window window, OnDecorViewInstalledListener onDecorViewInstalledListener) {
        new DecorViewFinder(null).getDecorView(window, onDecorViewInstalledListener, 3);
    }

    /* access modifiers changed from: private */
    public static class DecorViewFinder {
        private OnDecorViewInstalledListener callback;
        private final Runnable checkDecorViewRunnable;
        private final Handler handler;
        private int retries;
        private Window window;

        private DecorViewFinder() {
            this.handler = new Handler();
            this.checkDecorViewRunnable = new Runnable() {
                /* class com.google.android.setupcompat.util.SystemBarHelper.DecorViewFinder.AnonymousClass1 */

                public void run() {
                    View peekDecorView = DecorViewFinder.this.window.peekDecorView();
                    if (peekDecorView != null) {
                        DecorViewFinder.this.callback.onDecorViewInstalled(peekDecorView);
                        return;
                    }
                    DecorViewFinder.access$510(DecorViewFinder.this);
                    if (DecorViewFinder.this.retries >= 0) {
                        DecorViewFinder.this.handler.post(DecorViewFinder.this.checkDecorViewRunnable);
                        return;
                    }
                    Log.w("SystemBarHelper", "Cannot get decor view of window: " + DecorViewFinder.this.window);
                }
            };
        }

        /* synthetic */ DecorViewFinder(AnonymousClass1 r1) {
            this();
        }

        static /* synthetic */ int access$510(DecorViewFinder decorViewFinder) {
            int i = decorViewFinder.retries;
            decorViewFinder.retries = i - 1;
            return i;
        }

        public void getDecorView(Window window2, OnDecorViewInstalledListener onDecorViewInstalledListener, int i) {
            this.window = window2;
            this.retries = i;
            this.callback = onDecorViewInstalledListener;
            this.checkDecorViewRunnable.run();
        }
    }
}
