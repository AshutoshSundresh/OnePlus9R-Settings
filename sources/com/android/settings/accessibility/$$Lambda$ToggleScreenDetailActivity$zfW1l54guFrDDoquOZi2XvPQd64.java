package com.android.settings.accessibility;

import java.util.function.Predicate;

/* renamed from: com.android.settings.accessibility.-$$Lambda$ToggleScreenDetailActivity$zfW1l54guFrDDoquOZi2XvPQd64  reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$ToggleScreenDetailActivity$zfW1l54guFrDDoquOZi2XvPQd64 implements Predicate {
    public static final /* synthetic */ $$Lambda$ToggleScreenDetailActivity$zfW1l54guFrDDoquOZi2XvPQd64 INSTANCE = new $$Lambda$ToggleScreenDetailActivity$zfW1l54guFrDDoquOZi2XvPQd64();

    private /* synthetic */ $$Lambda$ToggleScreenDetailActivity$zfW1l54guFrDDoquOZi2XvPQd64() {
    }

    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        return ((String) obj).contains("com.android.server.accessibility.MagnificationController");
    }
}
