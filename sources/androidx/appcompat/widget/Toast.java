package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.appcompat.R$attr;
import androidx.appcompat.R$layout;
import androidx.appcompat.R$style;
import androidx.appcompat.R$styleable;

public class Toast extends android.widget.Toast {
    public Toast(Context context) {
        super(context);
    }

    public static Toast makeText(Context context, CharSequence charSequence, int i) {
        Toast toast = new Toast(context);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(null, R$styleable.Toast, R$attr.toastStyle, R$style.Widget_Toast_Light);
        int resourceId = obtainStyledAttributes.getResourceId(R$styleable.Toast_android_layout, R$layout.transient_notification_light);
        obtainStyledAttributes.recycle();
        View inflate = ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(resourceId, (ViewGroup) null);
        TextView textView = (TextView) inflate.findViewById(16908299);
        textView.setText(charSequence);
        setViewAndDuation(toast, inflate, i);
        try {
            float textSize = textView.getTextSize();
            float scaledTextSize = getScaledTextSize(textView);
            Log.v("Toast", context.getPackageName() + " / textSize:" + textSize + ", scaledTextSize:" + scaledTextSize + ", text:" + ((Object) charSequence));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toast;
    }

    public static Toast makeText(Context context, int i, int i2) throws Resources.NotFoundException {
        return makeText(context, context.getResources().getText(i), i2);
    }

    private static void setViewAndDuation(Toast toast, View view, int i) {
        toast.setView(view);
        toast.setDuration(i);
    }

    private static float getScaledTextSize(TextView textView) {
        return textView.getTextSize() / textView.getResources().getDisplayMetrics().density;
    }
}
