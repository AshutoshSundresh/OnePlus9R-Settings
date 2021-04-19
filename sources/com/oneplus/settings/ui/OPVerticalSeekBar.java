package com.oneplus.settings.ui;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.widget.SeekBar;
import com.android.settings.C0006R$color;
import com.android.settings.C0007R$dimen;
import com.appaac.haptic.AACHapticUtils;

public class OPVerticalSeekBar extends SeekBar {
    private final Paint mMarkerPaint;
    private int mMarkerPosition;
    private final Rect mMarkerRect;

    public OPVerticalSeekBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 16842875);
    }

    public OPVerticalSeekBar(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public OPVerticalSeekBar(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        Resources resources = getResources();
        this.mMarkerRect = new Rect(0, 0, resources.getDimensionPixelSize(C0007R$dimen.balance_seekbar_center_marker_width), resources.getDimensionPixelSize(C0007R$dimen.balance_seekbar_center_marker_height));
        Paint paint = new Paint();
        this.mMarkerPaint = paint;
        paint.setColor(getResources().getColor(C0006R$color.op_control_icon_color_disable));
        this.mMarkerPaint.setStyle(Paint.Style.FILL);
    }

    public void setMarkerPosition(int i) {
        this.mMarkerPosition = i;
    }

    /* access modifiers changed from: protected */
    public synchronized void onDraw(Canvas canvas) {
        if (this.mMarkerPosition != getProgress() && AACHapticUtils.getInstance().supportRichTap()) {
            canvas.save();
            canvas.translate((float) (((canvas.getWidth() - this.mMarkerRect.right) * this.mMarkerPosition) / 100), (float) (((canvas.getHeight() - getPaddingBottom()) / 2) - (this.mMarkerRect.bottom / 2)));
            canvas.drawRect(this.mMarkerRect, this.mMarkerPaint);
            canvas.restore();
        }
        super.onDraw(canvas);
    }
}
