.class public Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;
.super Landroidx/preference/Preference;
.source "OPNightModeLevelPreferenceCategory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$OPNightModeLevelPreferenceChangeListener;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mEnabled:Z

.field mOPNightModeLevelPreferenceChangeListener:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$OPNightModeLevelPreferenceChangeListener;

.field private mRLBrightness:Landroid/widget/RelativeLayout;

.field private mRLColor:Landroid/widget/RelativeLayout;

.field private mRLSaturation:Landroid/widget/RelativeLayout;

.field private mSeekBarBrightness:Landroid/widget/SeekBar;

.field private mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

.field private mSeekBarSaturation:Landroid/widget/SeekBar;

.field private mToastTip:Landroid/widget/Toast;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, p1, v0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 49
    invoke-direct {p0, p1, p2, v0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p2, 0x0

    .line 28
    iput-boolean p2, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mEnabled:Z

    .line 38
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mContext:Landroid/content/Context;

    .line 39
    sget p1, Lcom/android/settings/R$layout;->op_night_mode_level_preference_category:I

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setLayoutResource(I)V

    return-void
.end method

.method private initView(Landroidx/preference/PreferenceViewHolder;)V
    .locals 7

    .line 66
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_nightmode_progress_status"

    const/16 v2, 0x2e

    const/4 v3, -0x2

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    .line 68
    iget-object v1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "oem_nightmode_brightness_progress"

    const/4 v5, 0x0

    invoke-static {v1, v4, v5, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    .line 70
    iget-object v4, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v6, "oem_screen_saturation_value"

    invoke-static {v4, v6, v5, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v3

    .line 73
    sget v4, Lcom/android/settings/R$id;->tr_color_temperature:I

    invoke-virtual {p1, v4}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mRLColor:Landroid/widget/RelativeLayout;

    .line 74
    sget v4, Lcom/android/settings/R$id;->tr_brightness:I

    invoke-virtual {p1, v4}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mRLBrightness:Landroid/widget/RelativeLayout;

    const/16 v6, 0x8

    .line 76
    invoke-virtual {v4, v6}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 78
    sget v4, Lcom/android/settings/R$id;->tr_saturation:I

    invoke-virtual {p1, v4}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mRLSaturation:Landroid/widget/RelativeLayout;

    .line 79
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportColorSaturationAdjustment()Z

    move-result v4

    if-nez v4, :cond_0

    .line 80
    iget-object v4, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mRLSaturation:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v6}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 83
    :cond_0
    sget v4, Lcom/android/settings/R$id;->seekbar_color_temperature:I

    invoke-virtual {p1, v4}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    iput-object v4, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    const/16 v6, 0x64

    .line 84
    invoke-virtual {v4, v6}, Landroid/widget/SeekBar;->setMax(I)V

    .line 85
    iget-object v4, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    invoke-virtual {v4, v2}, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->setMarkerPosition(I)V

    .line 86
    iget-object v2, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    invoke-virtual {v2, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 88
    sget v0, Lcom/android/settings/R$id;->seekbar_brightness:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarBrightness:Landroid/widget/SeekBar;

    .line 89
    invoke-virtual {v0, v6}, Landroid/widget/SeekBar;->setMax(I)V

    .line 90
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarBrightness:Landroid/widget/SeekBar;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 92
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    new-instance v1, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$1;

    invoke-direct {v1, p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$1;-><init>(Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 115
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarBrightness:Landroid/widget/SeekBar;

    new-instance v1, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$2;

    invoke-direct {v1, p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$2;-><init>(Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 139
    sget v0, Lcom/android/settings/R$id;->seekbar_saturation:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarSaturation:Landroid/widget/SeekBar;

    .line 140
    invoke-virtual {p1, v6}, Landroid/widget/SeekBar;->setMax(I)V

    .line 141
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarSaturation:Landroid/widget/SeekBar;

    invoke-virtual {p1, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 143
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarSaturation:Landroid/widget/SeekBar;

    new-instance v0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$3;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$3;-><init>(Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;)V

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 167
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mRLColor:Landroid/widget/RelativeLayout;

    new-instance v0, Lcom/oneplus/settings/ui/-$$Lambda$OPNightModeLevelPreferenceCategory$AJbSS0doH-xFVa-rMVeyp40DQVA;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/ui/-$$Lambda$OPNightModeLevelPreferenceCategory$AJbSS0doH-xFVa-rMVeyp40DQVA;-><init>(Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;)V

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 174
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mRLBrightness:Landroid/widget/RelativeLayout;

    new-instance v0, Lcom/oneplus/settings/ui/-$$Lambda$OPNightModeLevelPreferenceCategory$1BCHIWEUrGQw8a_X2Omzpk5EIQ0;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/ui/-$$Lambda$OPNightModeLevelPreferenceCategory$1BCHIWEUrGQw8a_X2Omzpk5EIQ0;-><init>(Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;)V

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 182
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mRLSaturation:Landroid/widget/RelativeLayout;

    new-instance v0, Lcom/oneplus/settings/ui/-$$Lambda$OPNightModeLevelPreferenceCategory$D8MqW8Rv3LzBdHzeiwrEdiG1niI;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/ui/-$$Lambda$OPNightModeLevelPreferenceCategory$D8MqW8Rv3LzBdHzeiwrEdiG1niI;-><init>(Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;)V

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 190
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->isNightDisplayActivated()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->isWellbeingGrayscaleActivated()Z

    move-result p1

    if-nez p1, :cond_1

    const/4 v5, 0x1

    :cond_1
    invoke-virtual {p0, v5}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->setEnabled(Z)V

    .line 192
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportMMDisplayColorScreenMode()Z

    move-result p1

    if-nez p1, :cond_2

    .line 193
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mRLBrightness:Landroid/widget/RelativeLayout;

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :cond_2
    return-void
.end method

.method private isNightDisplayActivated()Z
    .locals 3

    .line 264
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "night_display_activated"

    const/4 v1, 0x0

    const/4 v2, -0x2

    invoke-static {p0, v0, v1, v2}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    move v1, v0

    :cond_0
    return v1
.end method

.method private isWellbeingGrayscaleActivated()Z
    .locals 2

    .line 270
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "accessibility_display_grayscale_enabled"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private synthetic lambda$initView$0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 168
    iget-boolean p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mEnabled:Z

    if-nez p1, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    .line 169
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->showTurnOnTip()V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private synthetic lambda$initView$1(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 175
    iget-boolean p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mEnabled:Z

    if-nez p1, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    .line 176
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->showTurnOnTip()V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private synthetic lambda$initView$2(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 183
    iget-boolean p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mEnabled:Z

    if-nez p1, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    .line 184
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->showTurnOnTip()V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private showTurnOnTip()V
    .locals 3

    .line 198
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mToastTip:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 199
    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 201
    :cond_0
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->isWellbeingGrayscaleActivated()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 202
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->oneplus_wellbeing_grayscale_open_tip:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mToastTip:Landroid/widget/Toast;

    goto :goto_0

    .line 204
    :cond_1
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->oneplus_night_mode_open_tip:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mToastTip:Landroid/widget/Toast;

    .line 206
    :goto_0
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mToastTip:Landroid/widget/Toast;

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method


# virtual methods
.method public getBrightnessProgress()I
    .locals 0

    .line 218
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarBrightness:Landroid/widget/SeekBar;

    if-eqz p0, :cond_0

    .line 219
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public getBrightnessProgressMax()I
    .locals 0

    .line 299
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarBrightness:Landroid/widget/SeekBar;

    if-eqz p0, :cond_0

    .line 300
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getMax()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public getColorProgress()I
    .locals 0

    .line 210
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    if-eqz p0, :cond_0

    .line 211
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public getColorProgressMax()I
    .locals 0

    .line 292
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    if-eqz p0, :cond_0

    .line 293
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getMax()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public getSaturationProgress()I
    .locals 0

    .line 226
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarSaturation:Landroid/widget/SeekBar;

    if-eqz p0, :cond_0

    .line 227
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public synthetic lambda$initView$0$OPNightModeLevelPreferenceCategory(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->lambda$initView$0(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public synthetic lambda$initView$1$OPNightModeLevelPreferenceCategory(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->lambda$initView$1(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public synthetic lambda$initView$2$OPNightModeLevelPreferenceCategory(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->lambda$initView$2(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 2

    .line 58
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    const/4 v0, 0x0

    .line 59
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->setDividerAllowedBelow(Z)V

    .line 60
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->setDividerAllowedAbove(Z)V

    .line 61
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 62
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->initView(Landroidx/preference/PreferenceViewHolder;)V

    return-void
.end method

.method public setEnabled(Z)V
    .locals 1

    .line 245
    iput-boolean p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mEnabled:Z

    .line 246
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    if-eqz v0, :cond_0

    .line 247
    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setActivated(Z)V

    .line 248
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarColor:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 251
    :cond_0
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarBrightness:Landroid/widget/SeekBar;

    if-eqz v0, :cond_1

    .line 252
    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setActivated(Z)V

    .line 253
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarBrightness:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 256
    :cond_1
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarSaturation:Landroid/widget/SeekBar;

    if-eqz v0, :cond_2

    .line 257
    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setActivated(Z)V

    .line 258
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mSeekBarSaturation:Landroid/widget/SeekBar;

    invoke-virtual {p0, p1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    :cond_2
    return-void
.end method

.method public setOPNightModeLevelSeekBarChangeListener(Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$OPNightModeLevelPreferenceChangeListener;)V
    .locals 0

    .line 275
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->mOPNightModeLevelPreferenceChangeListener:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$OPNightModeLevelPreferenceChangeListener;

    return-void
.end method
