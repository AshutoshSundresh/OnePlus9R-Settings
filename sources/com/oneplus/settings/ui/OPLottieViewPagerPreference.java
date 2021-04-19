package com.oneplus.settings.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.preference.Preference;
import androidx.preference.PreferenceViewHolder;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;
import com.airbnb.lottie.LottieAnimationView;
import com.android.settings.C0003R$array;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.google.android.material.indicator.PageIndicator;
import java.util.ArrayList;

public class OPLottieViewPagerPreference extends Preference {
    private LottieAnimationView[] mAnimationViews;
    private Context mContext;
    private int mCurrIndex = 0;
    private PageIndicator mPageIndicator;
    private PagerAdapter mPagerAdapter;
    private ViewPager mViewPager;
    private final ArrayList<View> mViews = new ArrayList<>();

    public OPLottieViewPagerPreference(Context context) {
        super(context);
        initViews(context);
    }

    public OPLottieViewPagerPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initViews(context);
    }

    public OPLottieViewPagerPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initViews(context);
    }

    private void initViews(Context context) {
        this.mContext = context;
        setLayoutResource(C0012R$layout.op_lottie_view_pager);
    }

    @Override // androidx.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder preferenceViewHolder) {
        super.onBindViewHolder(preferenceViewHolder);
        this.mPageIndicator = (PageIndicator) preferenceViewHolder.findViewById(C0010R$id.page_indicator);
        ViewPager viewPager = (ViewPager) preferenceViewHolder.findViewById(C0010R$id.anim_viewpager);
        this.mViewPager = viewPager;
        viewPager.setOnPageChangeListener(new MyOnPageChangeListener());
        initViewPage();
        AnonymousClass1 r0 = new PagerAdapter() {
            /* class com.oneplus.settings.ui.OPLottieViewPagerPreference.AnonymousClass1 */

            @Override // androidx.viewpager.widget.PagerAdapter
            public int getItemPosition(Object obj) {
                return -2;
            }

            @Override // androidx.viewpager.widget.PagerAdapter
            public boolean isViewFromObject(View view, Object obj) {
                return view == obj;
            }

            @Override // androidx.viewpager.widget.PagerAdapter
            public int getCount() {
                return OPLottieViewPagerPreference.this.mViews.size();
            }

            @Override // androidx.viewpager.widget.PagerAdapter
            public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
                if (OPLottieViewPagerPreference.this.mViews.size() > i) {
                    viewGroup.removeView((View) OPLottieViewPagerPreference.this.mViews.get(i));
                } else {
                    viewGroup.removeAllViews();
                }
            }

            @Override // androidx.viewpager.widget.PagerAdapter
            public Object instantiateItem(ViewGroup viewGroup, int i) {
                viewGroup.addView((View) OPLottieViewPagerPreference.this.mViews.get(i));
                return OPLottieViewPagerPreference.this.mViews.get(i);
            }
        };
        this.mPagerAdapter = r0;
        this.mViewPager.setAdapter(r0);
        this.mViewPager.setCurrentItem(this.mCurrIndex);
        this.mViewPager.setOffscreenPageLimit(this.mPagerAdapter.getCount());
        this.mPageIndicator.setNumPages(this.mPagerAdapter.getCount());
        this.mPageIndicator.setLocation((float) this.mViewPager.getCurrentItem());
        preferenceViewHolder.setDividerAllowedBelow(false);
        startAnim();
    }

    private void initViewPage() {
        LayoutInflater from = LayoutInflater.from(this.mContext);
        String[] stringArray = this.mContext.getResources().getStringArray(C0003R$array.op_little_window_animation_titles);
        String[] stringArray2 = this.mContext.getResources().getStringArray(C0003R$array.op_little_window_animation_summaries);
        TypedArray obtainTypedArray = this.mContext.getResources().obtainTypedArray(C0003R$array.op_little_window_animations);
        int length = obtainTypedArray.length();
        int[] iArr = new int[length];
        for (int i = 0; i < length; i++) {
            iArr[i] = obtainTypedArray.getResourceId(i, 0);
        }
        obtainTypedArray.recycle();
        int length2 = stringArray.length;
        this.mAnimationViews = new LottieAnimationView[length2];
        for (int i2 = 0; i2 < length2; i2++) {
            View inflate = from.inflate(C0012R$layout.op_smart_side_bar_guide_lottie, (ViewGroup) null);
            ((TextView) inflate.findViewById(C0010R$id.side_bar_guide_title)).setText(stringArray[i2]);
            ((TextView) inflate.findViewById(C0010R$id.side_bar_guide_summary)).setText(stringArray2[i2]);
            this.mAnimationViews[i2] = (LottieAnimationView) inflate.findViewById(C0010R$id.side_bar_guide_anim);
            this.mAnimationViews[i2].setAnimation(iArr[i2]);
            this.mAnimationViews[i2].loop(true);
            this.mAnimationViews[i2].playAnimation();
            this.mViews.add(inflate);
        }
    }

    public void startAnim() {
        playCurrentPageAnim(this.mCurrIndex);
    }

    public void stopAnim() {
        for (LottieAnimationView lottieAnimationView : this.mAnimationViews) {
            lottieAnimationView.cancelAnimation();
        }
    }

    public void releaseAnim() {
        for (LottieAnimationView lottieAnimationView : this.mAnimationViews) {
            lottieAnimationView.cancelAnimation();
        }
    }

    public void playCurrentPageAnim(int i) {
        if (this.mAnimationViews != null) {
            int i2 = 0;
            while (true) {
                LottieAnimationView[] lottieAnimationViewArr = this.mAnimationViews;
                if (i2 < lottieAnimationViewArr.length) {
                    if (i2 == i) {
                        lottieAnimationViewArr[i2].playAnimation();
                    } else {
                        lottieAnimationViewArr[i2].cancelAnimation();
                    }
                    i2++;
                } else {
                    return;
                }
            }
        }
    }

    public class MyOnPageChangeListener implements ViewPager.OnPageChangeListener {
        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int i) {
        }

        public MyOnPageChangeListener() {
        }

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageSelected(int i) {
            OPLottieViewPagerPreference.this.playCurrentPageAnim(i);
            OPLottieViewPagerPreference.this.mCurrIndex = i;
        }

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public void onPageScrolled(int i, float f, int i2) {
            OPLottieViewPagerPreference.this.mPageIndicator.setLocation(((float) i) + f);
        }
    }
}
