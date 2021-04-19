package androidx.animation;

import android.util.Property;

public abstract class FloatProperty<T> extends Property<T, Float> {
    public abstract void setValue(T t, float f);

    public FloatProperty() {
        super(Float.class, "");
    }

    public final void set(T t, Float f) {
        setValue(t, f.floatValue());
    }
}
