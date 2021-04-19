package com.oneplus.settings.ui;

import android.view.MotionEvent;
import android.view.View;

/* renamed from: com.oneplus.settings.ui.-$$Lambda$OPCustomClockPreference$6fBmvm3uWkXSVnpWfiewCItP0b0  reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$OPCustomClockPreference$6fBmvm3uWkXSVnpWfiewCItP0b0 implements View.OnTouchListener {
    public static final /* synthetic */ $$Lambda$OPCustomClockPreference$6fBmvm3uWkXSVnpWfiewCItP0b0 INSTANCE = new $$Lambda$OPCustomClockPreference$6fBmvm3uWkXSVnpWfiewCItP0b0();

    private /* synthetic */ $$Lambda$OPCustomClockPreference$6fBmvm3uWkXSVnpWfiewCItP0b0() {
    }

    public final boolean onTouch(View view, MotionEvent motionEvent) {
        return view.getParent().requestDisallowInterceptTouchEvent(true);
    }
}
