package com.oneplus.settings.widget;

import android.content.Context;
import android.util.AttributeSet;
import androidx.preference.Preference;
import androidx.preference.PreferenceViewHolder;
import com.airbnb.lottie.LottieAnimationView;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;

public class OPLottieAnimPreference extends Preference {
    private LottieAnimationView mLottieAnimationView;
    private int mLottieFileId;

    public OPLottieAnimPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView();
    }

    public OPLottieAnimPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public OPLottieAnimPreference(Context context) {
        super(context);
        initView();
    }

    private void initView() {
        setLayoutResource(C0012R$layout.op_lottie_anim_preference);
    }

    @Override // androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        this.mLottieAnimationView = (LottieAnimationView) preferenceViewHolder.findViewById(C0010R$id.anim_notification_lottie);
        startAnimation(this.mLottieFileId);
    }

    public void startAnimation(int i) {
        this.mLottieFileId = i;
        LottieAnimationView lottieAnimationView = this.mLottieAnimationView;
        if (lottieAnimationView != null) {
            lottieAnimationView.setAnimation(i);
            this.mLottieAnimationView.playAnimation();
        }
    }

    public void stopAnimation() {
        LottieAnimationView lottieAnimationView = this.mLottieAnimationView;
        if (lottieAnimationView != null) {
            lottieAnimationView.pauseAnimation();
        }
    }

    public void releaseAnimation() {
        LottieAnimationView lottieAnimationView = this.mLottieAnimationView;
        if (lottieAnimationView != null) {
            lottieAnimationView.cancelAnimation();
            this.mLottieAnimationView = null;
        }
    }
}
