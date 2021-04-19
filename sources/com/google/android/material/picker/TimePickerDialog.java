package com.google.android.material.picker;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Rect;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.SoftKeyBoardListener;
import com.google.android.material.R$color;
import com.google.android.material.R$drawable;
import com.google.android.material.R$id;
import com.google.android.material.R$layout;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.picker.TimePicker;

public class TimePickerDialog extends AlertDialog implements DialogInterface.OnClickListener, TimePicker.OnTimeChangedListener {
    private boolean mHasTitle;
    private final int mInitialHourOfDay;
    private final int mInitialMinute;
    private final boolean mIs24HourView;
    private final TimePicker mTimePicker;
    private final OnTimeSetListener mTimeSetListener;

    public interface OnTimeSetListener {
        void onTimeSet(TimePicker timePicker, int i, int i2);
    }

    @Override // com.google.android.material.picker.TimePicker.OnTimeChangedListener
    public void onTimeChanged(TimePicker timePicker, int i, int i2) {
    }

    public TimePickerDialog(Context context, OnTimeSetListener onTimeSetListener, int i, int i2, boolean z) {
        this(context, 0, onTimeSetListener, i, i2, z);
    }

    static int resolveDialogTheme(Context context, int i) {
        if (i != 0) {
            return i;
        }
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(16843934, typedValue, true);
        return typedValue.resourceId;
    }

    public TimePickerDialog(Context context, int i, OnTimeSetListener onTimeSetListener, int i2, int i3, boolean z) {
        super(context, resolveDialogTheme(context, i));
        this.mHasTitle = false;
        this.mTimeSetListener = onTimeSetListener;
        this.mInitialHourOfDay = i2;
        this.mInitialMinute = i3;
        this.mIs24HourView = z;
        Context context2 = getContext();
        View inflate = LayoutInflater.from(context2).inflate(R$layout.op_time_picker_dialog, (ViewGroup) null);
        setShowInBottom(true);
        setView(inflate);
        setButton(-1, context2.getString(17039370), this);
        setButton(-2, context2.getString(17039360), this);
        TimePicker timePicker = (TimePicker) inflate.findViewById(R$id.timePicker);
        this.mTimePicker = timePicker;
        timePicker.setWindow(getWindow());
        this.mTimePicker.setIs24HourView(Boolean.valueOf(this.mIs24HourView));
        this.mTimePicker.setCurrentHour(Integer.valueOf(this.mInitialHourOfDay));
        this.mTimePicker.setCurrentMinute(Integer.valueOf(this.mInitialMinute));
        this.mTimePicker.setOnTimeChangedListener(this);
    }

    @Override // android.app.Dialog, androidx.appcompat.app.AppCompatDialog
    public void setTitle(int i) {
        super.setTitle(i);
        if (!TextUtils.isEmpty(getContext().getString(i))) {
            this.mTimePicker.setHasTitle(true);
            this.mHasTitle = true;
        }
    }

    @Override // androidx.appcompat.app.AlertDialog, android.app.Dialog, androidx.appcompat.app.AppCompatDialog
    public void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        if (!TextUtils.isEmpty(charSequence)) {
            this.mTimePicker.setHasTitle(true);
            this.mHasTitle = true;
        }
    }

    @Override // androidx.appcompat.app.AlertDialog
    public void onAttachedToWindow() {
        if (Build.VERSION.SDK_INT > 29) {
            getWindow().setSoftInputMode(16);
            InsetDrawable insetDrawable = new InsetDrawable(this.mContext.getResources().getDrawable(R$drawable.op_dialog_material_background_bottom), 0);
            insetDrawable.setTint(this.mContext.getColor(R$color.op_control_bg_color_popup_default));
            getWindow().setBackgroundDrawable(insetDrawable);
            Context context = this.mContext;
            if (context instanceof Activity) {
                SoftKeyBoardListener.setListener((Activity) context, new SoftKeyBoardListener.OnSoftKeyBoardChangeListener() {
                    /* class com.google.android.material.picker.TimePickerDialog.AnonymousClass1 */

                    @Override // androidx.appcompat.app.SoftKeyBoardListener.OnSoftKeyBoardChangeListener
                    public void keyBoardShow(int i) {
                        TimePickerDialog.this.getWindow().setSoftInputMode(16);
                        if (TimePickerDialog.this.mTimePicker != null && TimePickerDialog.this.mTimePicker.isPickerModeClockEnabled()) {
                            TimePickerDialog.this.mTimePicker.post(new Runnable() {
                                /* class com.google.android.material.picker.TimePickerDialog.AnonymousClass1.AnonymousClass1 */

                                public void run() {
                                    Rect rect = new Rect();
                                    TimePickerDialog.this.getWindow().getDecorView().getWindowVisibleDisplayFrame(rect);
                                    InsetDrawable insetDrawable = new InsetDrawable(((AlertDialog) TimePickerDialog.this).mContext.getResources().getDrawable(R$drawable.op_picker_dialog_material_background_bottom), 0, (int) (((float) rect.bottom) - ViewUtils.dpToPx(((AlertDialog) TimePickerDialog.this).mContext, TimePickerDialog.this.mHasTitle ? 374 : 354)), 0, 0);
                                    insetDrawable.setTint(((AlertDialog) TimePickerDialog.this).mContext.getColor(R$color.op_control_bg_color_popup_default));
                                    TimePickerDialog.this.getWindow().setBackgroundDrawable(insetDrawable);
                                    TimePickerDialog.this.mTimePicker.post(new Runnable() {
                                        /* class com.google.android.material.picker.TimePickerDialog.AnonymousClass1.AnonymousClass1.AnonymousClass1 */

                                        public void run() {
                                            TimePickerDialog.this.mTimePicker.setSoftInputFocus();
                                        }
                                    });
                                }
                            });
                        }
                    }

                    @Override // androidx.appcompat.app.SoftKeyBoardListener.OnSoftKeyBoardChangeListener
                    public void keyBoardHide() {
                        if (TimePickerDialog.this.mTimePicker != null && TimePickerDialog.this.mTimePicker.isPickerModeClockEnabled()) {
                            InsetDrawable insetDrawable = new InsetDrawable(((AlertDialog) TimePickerDialog.this).mContext.getResources().getDrawable(R$drawable.op_dialog_material_background_bottom), 0, (int) (((float) ((AlertDialog) TimePickerDialog.this).mContext.getResources().getDisplayMetrics().heightPixels) - ViewUtils.dpToPx(((AlertDialog) TimePickerDialog.this).mContext, TimePickerDialog.this.mHasTitle ? 340 : 320)), 0, 0);
                            insetDrawable.setTint(((AlertDialog) TimePickerDialog.this).mContext.getColor(R$color.op_control_bg_color_popup_default));
                            TimePickerDialog.this.getWindow().setBackgroundDrawable(insetDrawable);
                        }
                    }
                });
            }
        }
    }

    public void show() {
        super.show();
        getButton(-1).setOnClickListener(new View.OnClickListener() {
            /* class com.google.android.material.picker.TimePickerDialog.AnonymousClass2 */

            public void onClick(View view) {
                if (TimePickerDialog.this.mTimePicker.validateInput()) {
                    TimePickerDialog timePickerDialog = TimePickerDialog.this;
                    timePickerDialog.onClick(timePickerDialog, -1);
                    TimePickerDialog.this.dismiss();
                }
            }
        });
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        OnTimeSetListener onTimeSetListener;
        if (i == -2) {
            cancel();
        } else if (i == -1 && (onTimeSetListener = this.mTimeSetListener) != null) {
            TimePicker timePicker = this.mTimePicker;
            onTimeSetListener.onTimeSet(timePicker, timePicker.getCurrentHour().intValue(), this.mTimePicker.getCurrentMinute().intValue());
        }
    }

    public Bundle onSaveInstanceState() {
        Bundle onSaveInstanceState = super.onSaveInstanceState();
        onSaveInstanceState.putInt("hour", this.mTimePicker.getCurrentHour().intValue());
        onSaveInstanceState.putInt("minute", this.mTimePicker.getCurrentMinute().intValue());
        onSaveInstanceState.putBoolean("is24hour", this.mTimePicker.is24HourView());
        return onSaveInstanceState;
    }

    public void onRestoreInstanceState(Bundle bundle) {
        super.onRestoreInstanceState(bundle);
        int i = bundle.getInt("hour");
        int i2 = bundle.getInt("minute");
        this.mTimePicker.setIs24HourView(Boolean.valueOf(bundle.getBoolean("is24hour")));
        this.mTimePicker.setCurrentHour(Integer.valueOf(i));
        this.mTimePicker.setCurrentMinute(Integer.valueOf(i2));
    }
}
