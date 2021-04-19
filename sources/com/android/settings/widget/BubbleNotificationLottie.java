package com.android.settings.widget;

import android.content.Context;
import android.util.AttributeSet;
import androidx.preference.Preference;
import androidx.preference.PreferenceViewHolder;
import com.airbnb.lottie.LottieAnimationView;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.oneplus.settings.utils.OPUtils;

public class BubbleNotificationLottie extends Preference {
    private LottieAnimationView mNotificationView;

    public BubbleNotificationLottie(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView();
    }

    public BubbleNotificationLottie(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public BubbleNotificationLottie(Context context) {
        super(context);
        initView();
    }

    private void initView() {
        setLayoutResource(C0012R$layout.op_bubble_lottie);
    }

    @Override // androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        this.mNotificationView = (LottieAnimationView) preferenceViewHolder.findViewById(C0010R$id.anim_notification_lottie);
        if (OPUtils.isBlackModeOn(getContext().getContentResolver())) {
            this.mNotificationView.setAnimation("op_bubble_notification_dark.json");
        } else {
            this.mNotificationView.setAnimation("op_bubble_notification_light.json");
        }
        this.mNotificationView.playAnimation();
    }
}
