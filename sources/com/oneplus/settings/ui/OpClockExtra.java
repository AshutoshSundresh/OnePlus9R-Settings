package com.oneplus.settings.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.oneplus.settings.utils.OpBitmojiAodHelper;

public class OpClockExtra extends ImageView implements OpBitmojiAodHelper.OnBitmojiAvatarChangedListener {
    private int mClockStyle;
    private OpBitmojiAodHelper mHelper;

    public OpClockExtra(Context context) {
        this(context, null);
    }

    public OpClockExtra(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public OpClockExtra(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mClockStyle = -1;
        this.mHelper = new OpBitmojiAodHelper(context);
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mHelper.unregisterObserver();
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        updateInner();
    }

    @Override // com.oneplus.settings.utils.OpBitmojiAodHelper.OnBitmojiAvatarChangedListener
    public void onBitmojiAvatarChanged() {
        updateInner();
    }

    public void update(int i) {
        this.mClockStyle = i;
        updateInner();
    }

    private void updateInner() {
        if (this.mClockStyle == 12) {
            setImageDrawable(this.mHelper.getAvatar());
            setVisibility(0);
            this.mHelper.registerObserver(this);
            return;
        }
        setImageDrawable(null);
        setVisibility(8);
        this.mHelper.unregisterObserver();
    }
}
