.class public Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;
.super Lcom/android/settingslib/RestrictedPreference;
.source "OPBrightnessSeekbarPreferenceCategory.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;
    }
.end annotation


# instance fields
.field private isManuallyTouchingSeekbar:Z

.field private mBrightness:I

.field private mCallback:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;

.field private mContext:Landroid/content/Context;

.field private mDefaultBacklight:F

.field private mDefaultBacklightForVr:F

.field private mMaximumBacklight:F

.field private mMaximumBacklightForVr:F

.field private mMinimumBacklight:F

.field private mMinimumBacklightForVr:F

.field private mSeekBar:Landroid/widget/SeekBar;

.field private max:F

.field private min:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lcom/android/settingslib/RestrictedPreference;-><init>(Landroid/content/Context;)V

    .line 47
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/android/settingslib/RestrictedPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 54
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 59
    invoke-direct {p0, p1, p2, p3}, Lcom/android/settingslib/RestrictedPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->initView(Landroid/content/Context;)V

    return-void
.end method

.method private initView(Landroid/content/Context;)V
    .locals 5

    .line 83
    sget v0, Lcom/android/settings/R$layout;->op_brightness_seekbar_preference:I

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setLayoutResource(I)V

    .line 85
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mContext:Landroid/content/Context;

    .line 86
    const-class v0, Landroid/os/PowerManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    const/4 v0, 0x0

    .line 87
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mMinimumBacklight:F

    const/4 v0, 0x1

    .line 88
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mMaximumBacklight:F

    const/4 v0, 0x2

    .line 89
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mDefaultBacklight:F

    const/4 v0, 0x5

    .line 90
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mMinimumBacklightForVr:F

    const/4 v0, 0x6

    .line 91
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mMaximumBacklightForVr:F

    const/4 v0, 0x7

    .line 92
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result p1

    iput p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mDefaultBacklightForVr:F

    .line 93
    invoke-virtual {p0}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->isInVrMode()Z

    move-result p1

    const/4 v0, -0x2

    const-string v1, "screen_brightness_float"

    if-eqz p1, :cond_0

    .line 96
    iget-object v2, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget v3, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mDefaultBacklightForVr:F

    const-string v4, "screen_brightness_for_vr_float"

    invoke-static {v2, v4, v3, v0}, Landroid/provider/Settings$System;->getFloatForUser(Landroid/content/ContentResolver;Ljava/lang/String;FI)F

    goto :goto_0

    .line 100
    :cond_0
    iget-object v2, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget v3, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mDefaultBacklight:F

    invoke-static {v2, v1, v3, v0}, Landroid/provider/Settings$System;->getFloatForUser(Landroid/content/ContentResolver;Ljava/lang/String;FI)F

    :goto_0
    if-eqz p1, :cond_1

    .line 105
    iget p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mMinimumBacklightForVr:F

    iput p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->min:F

    .line 106
    iget p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mMaximumBacklightForVr:F

    iput p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->max:F

    goto :goto_1

    .line 108
    :cond_1
    iget p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mMinimumBacklight:F

    iput p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->min:F

    .line 109
    iget p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mMaximumBacklight:F

    iput p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->max:F

    .line 111
    :goto_1
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->min:F

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result p1

    iget v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->min:F

    iget v1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->max:F

    invoke-static {p1, v0, v1}, Lcom/android/settingslib/display/BrightnessUtils;->convertLinearToGammaFloat(FFF)I

    move-result p1

    iput p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mBrightness:I

    return-void
.end method

.method public static synthetic lambda$TLKzjtXAQpNW-kURZY9-YtOX--k(Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;)V
    .locals 0

    invoke-virtual {p0}, Landroidx/preference/Preference;->notifyChanged()V

    return-void
.end method


# virtual methods
.method public getBrightness()I
    .locals 0

    .line 143
    iget p0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mBrightness:I

    return p0
.end method

.method isInVrMode()Z
    .locals 2

    .line 71
    invoke-virtual {p0}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->safeGetVrManager()Landroid/service/vr/IVrManager;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 74
    :try_start_0
    invoke-interface {p0}, Landroid/service/vr/IVrManager;->getVrModeState()Z

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const-string v0, "OPBrightnessSeekbarPreferenceCategory"

    const-string v1, "Failed to check vr mode!"

    .line 76
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 2

    .line 121
    invoke-super {p0, p1}, Lcom/android/settingslib/RestrictedPreference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    .line 123
    sget v0, Lcom/android/settings/R$id;->opseekbar:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    .line 124
    sget v1, Lcom/android/settingslib/display/BrightnessUtils;->GAMMA_SPACE_MAX:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 125
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mBrightness:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 126
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    const/4 p0, 0x0

    .line 127
    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceViewHolder;->setDividerAllowedAbove(Z)V

    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    .line 148
    iget-boolean p2, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->isManuallyTouchingSeekbar:Z

    if-eqz p2, :cond_0

    .line 149
    iget-object p2, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mCallback:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;

    const/4 p3, 0x0

    iget-object v0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    .line 150
    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    .line 149
    invoke-interface {p2, p1, p3, v0}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;->onOPBrightValueChanged(Landroid/widget/SeekBar;II)V

    .line 151
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    iput p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mBrightness:I

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    const/4 p1, 0x1

    .line 160
    iput-boolean p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->isManuallyTouchingSeekbar:Z

    .line 161
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mCallback:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    if-eqz p0, :cond_0

    .line 162
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p0

    invoke-interface {p1, p0}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;->onOPBrightValueStartTrackingTouch(I)V

    :cond_0
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    const/4 p1, 0x0

    .line 169
    iput-boolean p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->isManuallyTouchingSeekbar:Z

    .line 170
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mCallback:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    if-eqz p0, :cond_0

    .line 171
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result p0

    invoke-interface {p1, p0}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;->saveBrightnessDataBase(I)V

    :cond_0
    return-void
.end method

.method safeGetVrManager()Landroid/service/vr/IVrManager;
    .locals 0

    const-string p0, "vrmanager"

    .line 65
    invoke-static {p0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p0

    invoke-static {p0}, Landroid/service/vr/IVrManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/service/vr/IVrManager;

    move-result-object p0

    return-object p0
.end method

.method public setBrightness(I)V
    .locals 1

    .line 133
    :try_start_0
    iput p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mBrightness:I

    .line 134
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    if-eqz p1, :cond_0

    .line 135
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mSeekBar:Landroid/widget/SeekBar;

    new-instance v0, Lcom/oneplus/settings/ui/-$$Lambda$OPBrightnessSeekbarPreferenceCategory$TLKzjtXAQpNW-kURZY9-YtOX--k;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/ui/-$$Lambda$OPBrightnessSeekbarPreferenceCategory$TLKzjtXAQpNW-kURZY9-YtOX--k;-><init>(Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;)V

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 138
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public setCallback(Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;)V
    .locals 0

    .line 116
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->mCallback:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;

    return-void
.end method
