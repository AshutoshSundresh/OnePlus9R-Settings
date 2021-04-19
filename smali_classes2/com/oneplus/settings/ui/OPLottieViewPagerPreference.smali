.class public Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;
.super Landroidx/preference/Preference;
.source "OPLottieViewPagerPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$MyOnPageChangeListener;
    }
.end annotation


# instance fields
.field private mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

.field private mContext:Landroid/content/Context;

.field private mCurrIndex:I

.field private mPageIndicator:Lcom/google/android/material/indicator/PageIndicator;

.field private mPagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

.field private mViewPager:Landroidx/viewpager/widget/ViewPager;

.field private final mViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 36
    invoke-direct {p0, p1}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViews:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mCurrIndex:I

    .line 37
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->initViews(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViews:Ljava/util/ArrayList;

    const/4 p2, 0x0

    .line 32
    iput p2, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mCurrIndex:I

    .line 42
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->initViews(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViews:Ljava/util/ArrayList;

    const/4 p2, 0x0

    .line 32
    iput p2, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mCurrIndex:I

    .line 48
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->initViews(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)Ljava/util/ArrayList;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViews:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$102(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;I)I
    .locals 0

    .line 25
    iput p1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mCurrIndex:I

    return p1
.end method

.method static synthetic access$200(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)Lcom/google/android/material/indicator/PageIndicator;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mPageIndicator:Lcom/google/android/material/indicator/PageIndicator;

    return-object p0
.end method

.method private initViewPage()V
    .locals 9

    .line 106
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 107
    iget-object v1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/android/settings/R$array;->op_little_window_animation_titles:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 108
    iget-object v2, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/android/settings/R$array;->op_little_window_animation_summaries:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    .line 109
    iget-object v3, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/android/settings/R$array;->op_little_window_animations:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 110
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->length()I

    move-result v4

    .line 111
    new-array v5, v4, [I

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    if-ge v7, v4, :cond_0

    .line 113
    invoke-virtual {v3, v7, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v8

    aput v8, v5, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 115
    :cond_0
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 116
    array-length v3, v1

    .line 117
    new-array v4, v3, [Lcom/airbnb/lottie/LottieAnimationView;

    iput-object v4, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    :goto_1
    if-ge v6, v3, :cond_1

    .line 119
    sget v4, Lcom/android/settings/R$layout;->op_smart_side_bar_guide_lottie:I

    const/4 v7, 0x0

    invoke-virtual {v0, v4, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 120
    sget v7, Lcom/android/settings/R$id;->side_bar_guide_title:I

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 121
    aget-object v8, v1, v6

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    sget v7, Lcom/android/settings/R$id;->side_bar_guide_summary:I

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 123
    aget-object v8, v2, v6

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v7, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    sget v8, Lcom/android/settings/R$id;->side_bar_guide_anim:I

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/airbnb/lottie/LottieAnimationView;

    aput-object v8, v7, v6

    .line 126
    iget-object v7, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    aget-object v7, v7, v6

    aget v8, v5, v6

    invoke-virtual {v7, v8}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 128
    iget-object v7, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    aget-object v7, v7, v6

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/airbnb/lottie/LottieAnimationView;->loop(Z)V

    .line 129
    iget-object v7, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    aget-object v7, v7, v6

    invoke-virtual {v7}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    .line 130
    iget-object v7, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method private initViews(Landroid/content/Context;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mContext:Landroid/content/Context;

    .line 53
    sget p1, Lcom/android/settings/R$layout;->op_lottie_view_pager:I

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setLayoutResource(I)V

    return-void
.end method


# virtual methods
.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 2

    .line 57
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    .line 58
    sget v0, Lcom/android/settings/R$id;->page_indicator:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/indicator/PageIndicator;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mPageIndicator:Lcom/google/android/material/indicator/PageIndicator;

    .line 60
    sget v0, Lcom/android/settings/R$id;->anim_viewpager:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 61
    new-instance v1, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$MyOnPageChangeListener;

    invoke-direct {v1, p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$MyOnPageChangeListener;-><init>(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)V

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 62
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->initViewPage()V

    .line 63
    new-instance v0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;-><init>(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)V

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mPagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

    .line 96
    iget-object v1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 97
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    iget v1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mCurrIndex:I

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 98
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    iget-object v1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mPagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 99
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mPageIndicator:Lcom/google/android/material/indicator/PageIndicator;

    iget-object v1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mPagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/indicator/PageIndicator;->setNumPages(I)V

    .line 100
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mPageIndicator:Lcom/google/android/material/indicator/PageIndicator;

    iget-object v1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/indicator/PageIndicator;->setLocation(F)V

    const/4 v0, 0x0

    .line 101
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->setDividerAllowedBelow(Z)V

    .line 102
    invoke-virtual {p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->startAnim()V

    return-void
.end method

.method public playCurrentPageAnim(I)V
    .locals 3

    .line 152
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 153
    :goto_0
    iget-object v1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    if-ne v0, p1, :cond_0

    .line 155
    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    goto :goto_1

    .line 157
    :cond_0
    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/airbnb/lottie/LottieAnimationView;->cancelAnimation()V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public releaseAnim()V
    .locals 3

    .line 146
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p0, v1

    .line 147
    invoke-virtual {v2}, Lcom/airbnb/lottie/LottieAnimationView;->cancelAnimation()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public startAnim()V
    .locals 1

    .line 135
    iget v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mCurrIndex:I

    invoke-virtual {p0, v0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->playCurrentPageAnim(I)V

    return-void
.end method

.method public stopAnim()V
    .locals 3

    .line 140
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->mAnimationViews:[Lcom/airbnb/lottie/LottieAnimationView;

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p0, v1

    .line 141
    invoke-virtual {v2}, Lcom/airbnb/lottie/LottieAnimationView;->cancelAnimation()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
