.class public Lcom/android/settings/DisplaySettings;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "DisplaySettings.java"

# interfaces
.implements Lcom/oneplus/settings/ui/ColorPickerPreference$CustomColorClickListener;
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;
.implements Landroidx/preference/Preference$OnPreferenceClickListener;
.implements Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/DisplaySettings$RefreshRateObserver;,
        Lcom/android/settings/DisplaySettings$BrightnessObserver;,
        Lcom/android/settings/DisplaySettings$DefaultHandler;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

.field private static isSupportReadingMode:Z


# instance fields
.field private mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

.field private mAdvancedSettingsPreference:Landroidx/preference/Preference;

.field private mAnimationDuration:J

.field private mAutoBrightnessPreference:Landroidx/preference/SwitchPreference;

.field private mAutomatic:Z

.field private mAutomaticAvailable:Z

.field private mBlackColors:[Ljava/lang/String;

.field private mBrightPreference:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;

.field private mBrightnessObserver:Lcom/android/settings/DisplaySettings$BrightnessObserver;

.field private mCameraDoubleTapPowerGesturePreference:Landroidx/preference/SwitchPreference;

.field private mCameraGesturePreference:Landroidx/preference/SwitchPreference;

.field private mContext:Landroid/content/Context;

.field private mCurrentTempColor:Ljava/lang/String;

.field private mDarkUiModePreference:Landroidx/preference/Preference;

.field private mDefaultBacklight:F

.field private mDefaultBacklightForVr:F

.field private mDisplayManager:Landroid/hardware/display/DisplayManager;

.field private mDoze801Preference:Landroidx/preference/Preference;

.field private mDozePreference:Landroidx/preference/Preference;

.field private mFontSizePref:Landroidx/preference/Preference;

.field private mGraphicsDynamicOptimization:Landroidx/preference/Preference;

.field private mHandler:Landroid/os/Handler;

.field private mIsSupportIrisSmooth:Z

.field private mLastSliderChangeTimeMillis:J

.field private mLedSettingsPreference:Landroidx/preference/Preference;

.field private mLockWallPaperPreference:Landroidx/preference/Preference;

.field private mMaximumBacklight:F

.field private mMaximumBacklightForVr:F

.field private mMinimumBacklight:F

.field private mMinimumBacklightForVr:F

.field private mMotionGraphicsCompensation:Landroidx/preference/Preference;

.field private mNetworkNameDisplayedPreference:Landroidx/preference/SwitchPreference;

.field private mNightModePreference:Landroidx/preference/Preference;

.field private mNotifyLightEnable:I

.field private mNotifyLightPreference:Landroidx/preference/SwitchPreference;

.field private mOSyncModePreference:Landroidx/preference/SwitchPreference;

.field private mReadingModePreference:Landroidx/preference/Preference;

.field mRefreshRateObserver:Lcom/android/settings/DisplaySettings$RefreshRateObserver;

.field private final mRotationPolicyListener:Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;

.field private mScreenBrightnessRootPreference:Landroidx/preference/PreferenceCategory;

.field private mScreenSaverPreference:Landroidx/preference/Preference;

.field private mScreenTimeoutPreference:Lcom/android/settings/display/TimeoutListPreference;

.field private mSliderAnimator:Landroid/animation/ValueAnimator;

.field private mTapToWakePreference:Landroidx/preference/SwitchPreference;

.field private mToggleLockScreenRotationPreference:Landroidx/preference/SwitchPreference;

.field private mTrueColorMode:Landroidx/preference/SwitchPreference;

.field private mVideoEnhancerPreference:Landroidx/preference/Preference;

.field private mVideoSuperCompensation:Landroidx/preference/Preference;

.field private mWhiteColors:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 127
    sget-boolean v0, Landroid/os/Build;->DEBUG_ONEPLUS:Z

    sput-boolean v0, Lcom/android/settings/DisplaySettings;->DEBUG:Z

    .line 1753
    new-instance v0, Lcom/android/settings/DisplaySettings$5;

    invoke-direct {v0}, Lcom/android/settings/DisplaySettings$5;-><init>()V

    sput-object v0, Lcom/android/settings/DisplaySettings;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 124
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    const/4 v0, 0x0

    .line 167
    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mNetworkNameDisplayedPreference:Landroidx/preference/SwitchPreference;

    const-wide/16 v0, -0x1

    .line 284
    iput-wide v0, p0, Lcom/android/settings/DisplaySettings;->mLastSliderChangeTimeMillis:J

    const-string v0, "OP_FEATURE_PIXELWORKS_BRIGHTNESS_SMOOTH"

    .line 288
    invoke-static {v0}, Lcom/oneplus/common/ReflectUtil;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/DisplaySettings;->mIsSupportIrisSmooth:Z

    const-wide/16 v0, 0x0

    .line 303
    iput-wide v0, p0, Lcom/android/settings/DisplaySettings;->mAnimationDuration:J

    .line 854
    new-instance v0, Lcom/android/settings/DisplaySettings$2;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/settings/DisplaySettings$2;-><init>(Lcom/android/settings/DisplaySettings;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    .line 1483
    new-instance v0, Lcom/android/settings/DisplaySettings$4;

    invoke-direct {v0, p0}, Lcom/android/settings/DisplaySettings$4;-><init>(Lcom/android/settings/DisplaySettings;)V

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mRotationPolicyListener:Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/DisplaySettings;)V
    .locals 0

    .line 124
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->setAccentColor()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/settings/DisplaySettings;)Landroidx/preference/Preference;
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mNightModePreference:Landroidx/preference/Preference;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/settings/DisplaySettings;)Landroidx/preference/SwitchPreference;
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mOSyncModePreference:Landroidx/preference/SwitchPreference;

    return-object p0
.end method

.method static synthetic access$1100(Landroid/content/res/Resources;)Z
    .locals 0

    .line 124
    invoke-static {p0}, Lcom/android/settings/DisplaySettings;->isAutomaticBrightnessAvailable(Landroid/content/res/Resources;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Landroid/content/Context;)Z
    .locals 0

    .line 124
    invoke-static {p0}, Lcom/android/settings/DisplaySettings;->isDozeAvailable(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1300(Landroid/content/res/Resources;)Z
    .locals 0

    .line 124
    invoke-static {p0}, Lcom/android/settings/DisplaySettings;->isTapToWakeAvailable(Landroid/content/res/Resources;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Landroid/content/res/Resources;)Z
    .locals 0

    .line 124
    invoke-static {p0}, Lcom/android/settings/DisplaySettings;->isCameraGestureAvailable(Landroid/content/res/Resources;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1500(Landroid/content/res/Resources;)Z
    .locals 0

    .line 124
    invoke-static {p0}, Lcom/android/settings/DisplaySettings;->isCameraDoubleTapPowerGestureAvailable(Landroid/content/res/Resources;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1600(Landroid/content/Context;)Z
    .locals 0

    .line 124
    invoke-static {p0}, Lcom/android/settings/DisplaySettings;->isVrDisplayModeAvailable(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1700()Z
    .locals 1

    .line 124
    sget-boolean v0, Lcom/android/settings/DisplaySettings;->isSupportReadingMode:Z

    return v0
.end method

.method static synthetic access$200(Lcom/android/settings/DisplaySettings;)Landroidx/preference/Preference;
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mReadingModePreference:Landroidx/preference/Preference;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/settings/DisplaySettings;)Landroid/content/Context;
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/settings/DisplaySettings;)V
    .locals 0

    .line 124
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->updateLockScreenRotation()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/settings/DisplaySettings;)V
    .locals 0

    .line 124
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->updateMode()V

    return-void
.end method

.method static synthetic access$602(Lcom/android/settings/DisplaySettings;J)J
    .locals 0

    .line 124
    iput-wide p1, p0, Lcom/android/settings/DisplaySettings;->mAnimationDuration:J

    return-wide p1
.end method

.method static synthetic access$700(Lcom/android/settings/DisplaySettings;)V
    .locals 0

    .line 124
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->updateSlider()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/settings/DisplaySettings;)Lcom/android/settings/display/TimeoutListPreference;
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mScreenTimeoutPreference:Lcom/android/settings/display/TimeoutListPreference;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/settings/DisplaySettings;J)V
    .locals 0

    .line 124
    invoke-direct {p0, p1, p2}, Lcom/android/settings/DisplaySettings;->updateTimeoutPreferenceDescription(J)V

    return-void
.end method

.method private disableEntryForAccessibilityDisplayDaltonizerAndInversion()V
    .locals 7

    .line 841
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_daltonizer_enabled"

    const/16 v2, 0xc

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 842
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "accessibility_display_inversion_enabled"

    invoke-static {v3, v4, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v2, :cond_1

    move v3, v2

    goto :goto_1

    :cond_1
    move v3, v1

    .line 843
    :goto_1
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "accessibility_display_grayscale_enabled"

    invoke-static {v4, v5, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-nez v4, :cond_2

    move v4, v2

    goto :goto_2

    :cond_2
    move v4, v1

    :goto_2
    if-nez v0, :cond_3

    if-nez v3, :cond_3

    if-eqz v4, :cond_7

    .line 845
    :cond_3
    iget-object v5, p0, Lcom/android/settings/DisplaySettings;->mNightModePreference:Landroidx/preference/Preference;

    if-eqz v5, :cond_5

    if-nez v0, :cond_4

    if-nez v3, :cond_4

    if-nez v4, :cond_4

    move v6, v2

    goto :goto_3

    :cond_4
    move v6, v1

    .line 846
    :goto_3
    invoke-virtual {v5, v6}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 848
    :cond_5
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mReadingModePreference:Landroidx/preference/Preference;

    if-eqz p0, :cond_7

    if-nez v0, :cond_6

    if-nez v3, :cond_6

    if-nez v4, :cond_6

    move v1, v2

    .line 849
    :cond_6
    invoke-virtual {p0, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    :cond_7
    return-void
.end method

.method private disablePreferenceIfManaged(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1680
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/android/settingslib/RestrictedPreference;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    .line 1682
    invoke-virtual {p1, v0}, Lcom/android/settingslib/RestrictedPreference;->setDisabledByAdmin(Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;)V

    .line 1683
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    .line 1684
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    .line 1683
    invoke-static {p0, p2, v0}, Lcom/android/settingslib/RestrictedLockUtilsInternal;->hasBaseUserRestriction(Landroid/content/Context;Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    .line 1685
    invoke-virtual {p1, p0}, Lcom/android/settingslib/RestrictedPreference;->setEnabled(Z)V

    goto :goto_0

    .line 1687
    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/settingslib/RestrictedPreference;->checkRestrictionAndSetDisabled(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private handleLockScreenRotationPreferenceClick()V
    .locals 1

    .line 1500
    sget-object v0, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    .line 1502
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mToggleLockScreenRotationPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-static {v0, p0}, Lcom/android/internal/view/RotationPolicy;->setRotationLockForAccessibility(Landroid/content/Context;Z)V

    return-void
.end method

.method private initAccentColors(Landroid/content/res/Resources;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/16 v2, 0xc

    new-array v3, v2, [Ljava/lang/String;

    .line 1353
    sget v4, Lcom/android/settings/R$color;->op_primary_default_light:I

    .line 1354
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    sget v4, Lcom/android/settings/R$color;->op_primary_golden_light:I

    .line 1355
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    sget v4, Lcom/android/settings/R$color;->op_primary_lemon_yellow_light:I

    .line 1356
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x2

    aput-object v4, v3, v7

    sget v4, Lcom/android/settings/R$color;->op_primary_grass_green_light:I

    .line 1357
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v8, 0x3

    aput-object v4, v3, v8

    sget v4, Lcom/android/settings/R$color;->op_primary_charm_purple_light:I

    .line 1358
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x4

    aput-object v4, v3, v9

    sget v4, Lcom/android/settings/R$color;->op_primary_sky_blue_light:I

    .line 1359
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v10, 0x5

    aput-object v4, v3, v10

    sget v4, Lcom/android/settings/R$color;->op_primary_vigour_red_light:I

    .line 1360
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v11, 0x6

    aput-object v4, v3, v11

    sget v4, Lcom/android/settings/R$color;->op_primary_fashion_pink_light:I

    .line 1361
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v12, 0x7

    aput-object v4, v3, v12

    sget v4, Lcom/android/settings/R$color;->op_primary_red_light:I

    .line 1362
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v13, 0x8

    aput-object v4, v3, v13

    sget v4, Lcom/android/settings/R$color;->op_primary_blue_light:I

    .line 1363
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v14, 0x9

    aput-object v4, v3, v14

    sget v4, Lcom/android/settings/R$color;->op_primary_green_light:I

    .line 1364
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v15, 0xa

    aput-object v4, v3, v15

    sget v4, Lcom/android/settings/R$color;->op_primary_green_custom:I

    .line 1365
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v16, 0xb

    aput-object v4, v3, v16

    iput-object v3, v0, Lcom/android/settings/DisplaySettings;->mWhiteColors:[Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/String;

    .line 1367
    sget v3, Lcom/android/settings/R$color;->op_primary_default_dark:I

    .line 1368
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    sget v3, Lcom/android/settings/R$color;->op_primary_golden_dark:I

    .line 1369
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    sget v3, Lcom/android/settings/R$color;->op_primary_lemon_yellow_dark:I

    .line 1370
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    sget v3, Lcom/android/settings/R$color;->op_primary_grass_green_dark:I

    .line 1371
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    sget v3, Lcom/android/settings/R$color;->op_primary_charm_purple_dark:I

    .line 1372
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v9

    sget v3, Lcom/android/settings/R$color;->op_primary_sky_blue_dark:I

    .line 1373
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v10

    sget v3, Lcom/android/settings/R$color;->op_primary_vigour_red_dark:I

    .line 1374
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v11

    sget v3, Lcom/android/settings/R$color;->op_primary_fashion_pink_dark:I

    .line 1375
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v12

    sget v3, Lcom/android/settings/R$color;->op_primary_red_dark:I

    .line 1376
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v13

    sget v3, Lcom/android/settings/R$color;->op_primary_blue_dark:I

    .line 1377
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v14

    sget v3, Lcom/android/settings/R$color;->op_primary_green_dark:I

    .line 1378
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v15

    sget v3, Lcom/android/settings/R$color;->op_primary_green_custom:I

    .line 1379
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v16

    iput-object v2, v0, Lcom/android/settings/DisplaySettings;->mBlackColors:[Ljava/lang/String;

    .line 1381
    iget-object v1, v0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1}, Lcom/oneplus/settings/utils/OPUtils;->isWhiteModeOn(Landroid/content/ContentResolver;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1383
    :cond_0
    iget-object v0, v0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Lcom/oneplus/settings/utils/OPUtils;->isBlackModeOn(Landroid/content/ContentResolver;)Z

    move-result v0

    :goto_0
    return-void
.end method

.method private static isAutomaticBrightnessAvailable(Landroid/content/res/Resources;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method private static isCameraDoubleTapPowerGestureAvailable(Landroid/content/res/Resources;)Z
    .locals 1

    const v0, 0x111003c

    .line 737
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method private static isCameraGestureAvailable(Landroid/content/res/Resources;)Z
    .locals 3

    const v0, 0x10e002c

    .line 730
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p0

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq p0, v2, :cond_0

    move p0, v0

    goto :goto_0

    :cond_0
    move p0, v1

    :goto_0
    if-eqz p0, :cond_1

    const-string p0, "gesture.disable_camera_launch"

    .line 733
    invoke-static {p0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    return v0
.end method

.method private static isDozeAvailable(Landroid/content/Context;)Z
    .locals 2

    .line 713
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_0

    const-string v0, "debug.doze.component"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 714
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 715
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x1040219

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 718
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private static isTapToWakeAvailable(Landroid/content/res/Resources;)Z
    .locals 1

    const v0, 0x11100dd

    .line 722
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method private static isVrDisplayModeAvailable(Landroid/content/Context;)Z
    .locals 0

    .line 742
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    const/4 p0, 0x0

    return p0
.end method

.method private synthetic lambda$updateSlider$0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1541
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mBrightPreference:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;

    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->setBrightness(I)V

    return-void
.end method

.method private setAccentColor()V
    .locals 3

    .line 1461
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Lcom/oneplus/settings/utils/OPUtils;->isWhiteModeOn(Landroid/content/ContentResolver;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1462
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_white_mode_accent_color"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1463
    :cond_0
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Lcom/oneplus/settings/utils/OPUtils;->isBlackModeOn(Landroid/content/ContentResolver;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1464
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_black_mode_accent_color"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1466
    :cond_1
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/android/settings/R$color;->op_primary_default_light:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1468
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "oneplus_accent_color"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 1469
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "#"

    const-string v2, ""

    .line 1470
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 1472
    :cond_2
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->setCustomAccentColor()V

    const-string p0, "persist.sys.theme.accentcolor"

    .line 1473
    invoke-static {p0, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setBrightness(I)V
    .locals 2

    .line 1149
    iget v0, p0, Lcom/android/settings/DisplaySettings;->mMinimumBacklight:F

    iget v1, p0, Lcom/android/settings/DisplaySettings;->mMaximumBacklight:F

    invoke-static {p1, v0, v1}, Lcom/android/settingslib/display/BrightnessUtils;->convertGammaToLinearFloat(IFF)F

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Landroid/util/MathUtils;->min(FF)F

    move-result p1

    .line 1152
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    invoke-virtual {p0, p1}, Landroid/hardware/display/DisplayManager;->setTemporaryBrightness(F)V

    return-void
.end method

.method private setCustomAccentColor()V
    .locals 4

    .line 1447
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oneplus_white_custom_accent_color"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1448
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, "#FF0000"

    if-eqz v1, :cond_0

    move-object v0, v2

    .line 1451
    :cond_0
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mWhiteColors:[Ljava/lang/String;

    const/16 v3, 0xb

    aput-object v0, v1, v3

    .line 1452
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oneplus_black_custom_accent_color"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1453
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    move-object v2, v0

    .line 1456
    :goto_0
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mBlackColors:[Ljava/lang/String;

    aput-object v2, p0, v3

    return-void
.end method

.method private updateFontSizeSummary()V
    .locals 4

    .line 994
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mFontSizePref:Landroidx/preference/Preference;

    invoke-virtual {v0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 995
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "font_scale"

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result v1

    .line 997
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 998
    sget v2, Lcom/android/settings/R$array;->entries_font_size:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    .line 999
    sget v3, Lcom/android/settings/R$array;->entryvalues_font_size:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 1000
    invoke-static {v1, v0}, Lcom/android/settings/display/ToggleFontSizePreferenceFragment;->fontSizeValueToIndex(F[Ljava/lang/String;)I

    move-result v0

    .line 1002
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mFontSizePref:Landroidx/preference/Preference;

    aget-object v0, v2, v0

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private updateLockScreenRotation()V
    .locals 1

    .line 1493
    sget-object v0, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 1495
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mToggleLockScreenRotationPreference:Landroidx/preference/SwitchPreference;

    invoke-static {v0}, Lcom/android/internal/view/RotationPolicy;->isRotationLocked(Landroid/content/Context;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    :cond_0
    return-void
.end method

.method private updateMode()V
    .locals 4

    .line 1566
    iget-boolean v0, p0, Lcom/android/settings/DisplaySettings;->mAutomaticAvailable:Z

    if-eqz v0, :cond_1

    .line 1568
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, -0x2

    const-string v2, "screen_brightness_mode"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3, v1}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v3, 0x1

    .line 1570
    :cond_0
    iput-boolean v3, p0, Lcom/android/settings/DisplaySettings;->mAutomatic:Z

    .line 1571
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mAutoBrightnessPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    :cond_1
    return-void
.end method

.method private updateNotifyLightStatus(I)V
    .locals 2

    .line 1507
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_acc_breath_light"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1508
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "notification_light_pulse"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1509
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "battery_led_low_power"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1510
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "battery_led_charging"

    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method

.method private updateScreenSaverSummary()V
    .locals 1

    .line 987
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mScreenSaverPreference:Landroidx/preference/Preference;

    if-eqz v0, :cond_0

    .line 989
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-static {p0}, Lcom/android/settings/dream/DreamSettings;->getSummaryTextWithDreamName(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object p0

    .line 988
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method private updateSlider()V
    .locals 8

    .line 1515
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    const-string v1, "DisplaySettings"

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "animateSliderTo: cancel anim."

    .line 1516
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1517
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1523
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/DisplaySettings;->isInVrMode()Z

    move-result v0

    const/4 v2, -0x2

    if-eqz v0, :cond_1

    .line 1524
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget v3, p0, Lcom/android/settings/DisplaySettings;->mDefaultBacklightForVr:F

    const-string v4, "screen_brightness_for_vr_float"

    invoke-static {v0, v4, v3, v2}, Landroid/provider/Settings$System;->getFloatForUser(Landroid/content/ContentResolver;Ljava/lang/String;FI)F

    move-result v0

    .line 1527
    iget v2, p0, Lcom/android/settings/DisplaySettings;->mMinimumBacklightForVr:F

    iget v3, p0, Lcom/android/settings/DisplaySettings;->mMaximumBacklightForVr:F

    invoke-static {v0, v2, v3}, Lcom/android/settingslib/display/BrightnessUtils;->convertLinearToGammaFloat(FFF)I

    move-result v0

    goto :goto_0

    .line 1529
    :cond_1
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget v3, p0, Lcom/android/settings/DisplaySettings;->mDefaultBacklight:F

    const-string v4, "screen_brightness_float"

    invoke-static {v0, v4, v3, v2}, Landroid/provider/Settings$System;->getFloatForUser(Landroid/content/ContentResolver;Ljava/lang/String;FI)F

    move-result v0

    .line 1531
    iget v2, p0, Lcom/android/settings/DisplaySettings;->mMinimumBacklight:F

    iget v3, p0, Lcom/android/settings/DisplaySettings;->mMaximumBacklight:F

    invoke-static {v0, v2, v3}, Lcom/android/settingslib/display/BrightnessUtils;->convertLinearToGammaFloat(FFF)I

    move-result v0

    .line 1534
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "screen_brightness_mode"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_5

    .line 1537
    new-instance v2, Landroid/animation/ValueAnimator;

    invoke-direct {v2}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v2, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    const/4 v3, 0x2

    new-array v3, v3, [I

    .line 1538
    iget-object v5, p0, Lcom/android/settings/DisplaySettings;->mBrightPreference:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;

    invoke-virtual {v5}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->getBrightness()I

    move-result v5

    aput v5, v3, v4

    const/4 v4, 0x1

    aput v0, v3, v4

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 1539
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "animateSliderTo: animating from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/settings/DisplaySettings;->mBrightPreference:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;

    invoke-virtual {v3}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->getBrightness()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1540
    iget-object v2, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    new-instance v3, Lcom/android/settings/-$$Lambda$DisplaySettings$qOh46548JQf3cUmLta2I9UEyRo4;

    invoke-direct {v3, p0}, Lcom/android/settings/-$$Lambda$DisplaySettings$qOh46548JQf3cUmLta2I9UEyRo4;-><init>(Lcom/android/settings/DisplaySettings;)V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1543
    iget-object v2, p0, Lcom/android/settings/DisplaySettings;->mBrightPreference:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;

    .line 1544
    invoke-virtual {v2}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->getBrightness()I

    move-result v2

    sub-int/2addr v2, v0

    .line 1543
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    mul-int/lit16 v0, v0, 0xbb8

    sget v2, Lcom/android/settingslib/display/BrightnessUtils;->GAMMA_SPACE_MAX:I

    div-int/2addr v0, v2

    int-to-long v2, v0

    .line 1548
    iget-boolean v0, p0, Lcom/android/settings/DisplaySettings;->mIsSupportIrisSmooth:Z

    if-eqz v0, :cond_3

    const-wide/16 v4, 0x3e8

    cmp-long v0, v2, v4

    if-ltz v0, :cond_2

    goto :goto_1

    :cond_2
    move-wide v2, v4

    .line 1551
    :cond_3
    :goto_1
    iget-wide v4, p0, Lcom/android/settings/DisplaySettings;->mAnimationDuration:J

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-lez v0, :cond_4

    move-wide v2, v4

    .line 1555
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AMD:"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1556
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 1558
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_2

    .line 1560
    :cond_5
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mBrightPreference:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;

    invoke-virtual {p0, v0}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->setBrightness(I)V

    :goto_2
    return-void
.end method

.method private updateState()V
    .locals 5

    .line 915
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->updateFontSizeSummary()V

    .line 916
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->updateScreenSaverSummary()V

    .line 919
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_acc_breath_light"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/settings/DisplaySettings;->mNotifyLightEnable:I

    .line 920
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mLedSettingsPreference:Landroidx/preference/Preference;

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    if-ne v0, v3, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v2

    .line 921
    :goto_0
    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 926
    :cond_1
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mAutoBrightnessPreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_3

    .line 927
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "screen_brightness_mode"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 929
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mAutoBrightnessPreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_2

    move v0, v3

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 932
    :cond_3
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mNetworkNameDisplayedPreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_5

    .line 933
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "show_network_name_mode"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 935
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mNetworkNameDisplayedPreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_4

    move v0, v3

    goto :goto_2

    :cond_4
    move v0, v2

    :goto_2
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 939
    :cond_5
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mTapToWakePreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_7

    .line 940
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "double_tap_to_wake"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 941
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mTapToWakePreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_6

    move v0, v3

    goto :goto_3

    :cond_6
    move v0, v2

    :goto_3
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 945
    :cond_7
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mCameraGesturePreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_9

    .line 946
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "camera_gesture_disabled"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 947
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mCameraGesturePreference:Landroidx/preference/SwitchPreference;

    if-nez v0, :cond_8

    move v0, v3

    goto :goto_4

    :cond_8
    move v0, v2

    :goto_4
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 951
    :cond_9
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mCameraDoubleTapPowerGesturePreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_b

    .line 953
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "camera_double_tap_power_gesture_disabled"

    .line 952
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 954
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mCameraDoubleTapPowerGesturePreference:Landroidx/preference/SwitchPreference;

    if-nez v0, :cond_a

    move v0, v3

    goto :goto_5

    :cond_a
    move v0, v2

    :goto_5
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 957
    :cond_b
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mVideoEnhancerPreference:Landroidx/preference/Preference;

    const-string v1, "persist.sys.oem.vendor.media.vpp.enable"

    if-eqz v0, :cond_d

    .line 958
    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 959
    iget-object v4, p0, Lcom/android/settings/DisplaySettings;->mVideoEnhancerPreference:Landroidx/preference/Preference;

    if-eqz v0, :cond_c

    sget v0, Lcom/android/settings/R$string;->switch_on_text:I

    goto :goto_6

    :cond_c
    sget v0, Lcom/android/settings/R$string;->switch_off_text:I

    :goto_6
    invoke-virtual {v4, v0}, Landroidx/preference/Preference;->setSummary(I)V

    .line 964
    :cond_d
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mGraphicsDynamicOptimization:Landroidx/preference/Preference;

    if-eqz v0, :cond_11

    .line 965
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportIRISHQV()Z

    move-result v0

    if-nez v0, :cond_f

    .line 966
    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 967
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mGraphicsDynamicOptimization:Landroidx/preference/Preference;

    if-eqz v0, :cond_e

    sget v0, Lcom/android/settings/R$string;->switch_on_text:I

    goto :goto_7

    :cond_e
    sget v0, Lcom/android/settings/R$string;->switch_off_text:I

    :goto_7
    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setSummary(I)V

    goto :goto_9

    .line 969
    :cond_f
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "op_iris_video_sdr2hdr_status"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 970
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mGraphicsDynamicOptimization:Landroidx/preference/Preference;

    if-ne v0, v3, :cond_10

    sget v0, Lcom/android/settings/R$string;->switch_on_text:I

    goto :goto_8

    :cond_10
    sget v0, Lcom/android/settings/R$string;->switch_off_text:I

    :goto_8
    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setSummary(I)V

    .line 973
    :cond_11
    :goto_9
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mMotionGraphicsCompensation:Landroidx/preference/Preference;

    if-eqz v0, :cond_13

    .line 974
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "op_iris_video_memc_status"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 975
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mMotionGraphicsCompensation:Landroidx/preference/Preference;

    if-ne v0, v3, :cond_12

    sget v0, Lcom/android/settings/R$string;->switch_on_text:I

    goto :goto_a

    :cond_12
    sget v0, Lcom/android/settings/R$string;->switch_off_text:I

    :goto_a
    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setSummary(I)V

    .line 979
    :cond_13
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mVideoSuperCompensation:Landroidx/preference/Preference;

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Landroidx/preference/Preference;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 980
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oplus.software.video.sr_support"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 981
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mVideoSuperCompensation:Landroidx/preference/Preference;

    if-ne v0, v3, :cond_14

    sget v0, Lcom/android/settings/R$string;->switch_on_text:I

    goto :goto_b

    :cond_14
    sget v0, Lcom/android/settings/R$string;->switch_off_text:I

    :goto_b
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setSummary(I)V

    :cond_15
    return-void
.end method

.method private updateTimeoutPreferenceDescription(J)V
    .locals 8

    .line 750
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 754
    :cond_0
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mScreenTimeoutPreference:Lcom/android/settings/display/TimeoutListPreference;

    .line 756
    invoke-virtual {v0}, Lcom/android/settings/RestrictedListPreference;->isDisabledByAdmin()Z

    move-result v1

    const-string v2, ""

    if-eqz v1, :cond_1

    .line 757
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget p1, Lcom/android/settings/R$string;->disabled_by_policy_title:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_1
    const-wide/16 v3, 0x0

    cmp-long v1, p1, v3

    if-gez v1, :cond_2

    goto :goto_1

    .line 762
    :cond_2
    invoke-virtual {v0}, Landroidx/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 763
    invoke-virtual {v0}, Landroidx/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v1, :cond_6

    .line 764
    array-length v4, v1

    if-nez v4, :cond_3

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    move v4, v2

    move v5, v4

    .line 768
    :goto_0
    array-length v6, v3

    if-ge v4, v6, :cond_5

    .line 769
    aget-object v6, v3, v4

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v6, p1, v6

    if-ltz v6, :cond_4

    move v5, v4

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 774
    :cond_5
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget p1, Lcom/android/settings/R$string;->screen_timeout_summary:I

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    aget-object v1, v1, v5

    aput-object v1, p2, v2

    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 777
    :cond_6
    :goto_1
    invoke-virtual {v0, v2}, Landroidx/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public getHelpResource()I
    .locals 0

    .line 1676
    sget p0, Lcom/android/settings/R$string;->help_uri_display:I

    return p0
.end method

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x2e

    return p0
.end method

.method isInVrMode()Z
    .locals 2

    .line 1137
    invoke-virtual {p0}, Lcom/android/settings/DisplaySettings;->safeGetVrManager()Landroid/service/vr/IVrManager;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 1140
    :try_start_0
    invoke-interface {p0}, Landroid/service/vr/IVrManager;->getVrModeState()Z

    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const-string v0, "DisplaySettings"

    const-string v1, "Failed to check vr mode!"

    .line 1142
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public synthetic lambda$updateSlider$0$DisplaySettings(Landroid/animation/ValueAnimator;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/settings/DisplaySettings;->lambda$updateSlider$0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1284
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x64

    if-ne v0, p1, :cond_1

    const/4 p1, -0x1

    if-ne p2, p1, :cond_1

    if-eqz p3, :cond_1

    const-string p1, "current_temp_color"

    .line 1287
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mCurrentTempColor:Ljava/lang/String;

    .line 1288
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {p1}, Lcom/oneplus/settings/utils/OPUtils;->isWhiteModeOn(Landroid/content/ContentResolver;)Z

    move-result p1

    const/16 p2, 0xb

    if-eqz p1, :cond_0

    .line 1289
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mWhiteColors:[Ljava/lang/String;

    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mCurrentTempColor:Ljava/lang/String;

    aput-object p0, p1, p2

    goto :goto_0

    .line 1290
    :cond_0
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {p1}, Lcom/oneplus/settings/utils/OPUtils;->isBlackModeOn(Landroid/content/ContentResolver;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1291
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mBlackColors:[Ljava/lang/String;

    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mCurrentTempColor:Ljava/lang/String;

    aput-object p0, p1, p2

    :cond_1
    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 383
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 384
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 385
    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 387
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    .line 388
    new-instance v0, Lcom/android/settings/DisplaySettings$DefaultHandler;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/settings/DisplaySettings$DefaultHandler;-><init>(Lcom/android/settings/DisplaySettings;Landroid/content/Context;)V

    .line 389
    sget v0, Lcom/android/settings/R$xml;->display_settings:I

    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    .line 390
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 391
    invoke-direct {p0, v0}, Lcom/android/settings/DisplaySettings;->initAccentColors(Landroid/content/res/Resources;)V

    const-string v0, "screen_brightness"

    .line 392
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/PreferenceCategory;

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mScreenBrightnessRootPreference:Landroidx/preference/PreferenceCategory;

    const-string v0, "display_system"

    .line 393
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/PreferenceCategory;

    const-string v0, "header_category_custom"

    .line 394
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/PreferenceCategory;

    const-string v0, "screensaver"

    .line 396
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mScreenSaverPreference:Landroidx/preference/Preference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 398
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x1110067

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 400
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mScreenSaverPreference:Landroidx/preference/Preference;

    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    :cond_0
    const-string v0, "screen_timeout"

    .line 403
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/settings/display/TimeoutListPreference;

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mScreenTimeoutPreference:Lcom/android/settings/display/TimeoutListPreference;

    const-string v0, "font_size"

    .line 405
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mFontSizePref:Landroidx/preference/Preference;

    .line 407
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0}, Lcom/android/settings/DisplaySettings;->isAutomaticBrightnessAvailable(Landroid/content/res/Resources;)Z

    move-result v0

    const-string v2, "auto_brightness"

    if-eqz v0, :cond_1

    .line 408
    invoke-virtual {p0, v2}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/SwitchPreference;

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mAutoBrightnessPreference:Landroidx/preference/SwitchPreference;

    .line 409
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_0

    .line 411
    :cond_1
    invoke-virtual {p0, v2}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/SwitchPreference;

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mAutoBrightnessPreference:Landroidx/preference/SwitchPreference;

    .line 412
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    :goto_0
    const-string v0, "doze"

    .line 426
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mDozePreference:Landroidx/preference/Preference;

    const-string v0, "doze_801"

    .line 427
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mDoze801Preference:Landroidx/preference/Preference;

    .line 428
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mDozePreference:Landroidx/preference/Preference;

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 429
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mDoze801Preference:Landroidx/preference/Preference;

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 430
    invoke-static {p1}, Lcom/android/settings/DisplaySettings;->isDozeAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 432
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 433
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mDozePreference:Landroidx/preference/Preference;

    if-eqz v0, :cond_6

    .line 434
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    goto :goto_1

    .line 437
    :cond_2
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mDoze801Preference:Landroidx/preference/Preference;

    if-eqz v0, :cond_3

    .line 438
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 440
    :cond_3
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportAlwaysOnDisplay()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mDozePreference:Landroidx/preference/Preference;

    if-eqz v0, :cond_6

    .line 441
    sget v2, Lcom/android/settings/R$string;->oneplus_hand_up_proximity_title:I

    invoke-virtual {v0, v2}, Landroidx/preference/Preference;->setSummary(I)V

    goto :goto_1

    .line 446
    :cond_4
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mDoze801Preference:Landroidx/preference/Preference;

    if-eqz v0, :cond_5

    .line 447
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 449
    :cond_5
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mDozePreference:Landroidx/preference/Preference;

    if-eqz v0, :cond_6

    .line 450
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 518
    :cond_6
    :goto_1
    invoke-static {p1}, Lcom/android/settings/DisplaySettings;->isVrDisplayModeAvailable(Landroid/content/Context;)Z

    move-result v0

    const-string/jumbo v2, "vr_display_pref"

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v0, :cond_7

    .line 520
    invoke-virtual {p0, v2}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/DropDownPreference;

    new-array v2, v3, [Ljava/lang/CharSequence;

    .line 521
    sget v5, Lcom/android/settings/R$string;->display_vr_pref_low_persistence:I

    .line 522
    invoke-virtual {p1, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v1

    sget v5, Lcom/android/settings/R$string;->display_vr_pref_off:I

    .line 523
    invoke-virtual {p1, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 521
    invoke-virtual {v0, v2}, Landroidx/preference/DropDownPreference;->setEntries([Ljava/lang/CharSequence;)V

    new-array v2, v3, [Ljava/lang/CharSequence;

    const-string v5, "0"

    aput-object v5, v2, v1

    const-string v5, "1"

    aput-object v5, v2, v4

    .line 525
    invoke-virtual {v0, v2}, Landroidx/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 528
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v2

    .line 529
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string/jumbo v6, "vr_display_mode"

    invoke-static {v5, v6, v1, v2}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    .line 533
    invoke-virtual {v0, v2}, Landroidx/preference/DropDownPreference;->setValueIndex(I)V

    .line 534
    new-instance v2, Lcom/android/settings/DisplaySettings$1;

    invoke-direct {v2, p0, p1}, Lcom/android/settings/DisplaySettings$1;-><init>(Lcom/android/settings/DisplaySettings;Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_2

    .line 550
    :cond_7
    invoke-virtual {p0, v2}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/DropDownPreference;

    .line 551
    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 555
    :goto_2
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mHandler:Landroid/os/Handler;

    const-string p1, "toggle_lock_screen_rotation_preference"

    .line 558
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Landroidx/preference/SwitchPreference;

    iput-object v0, p0, Lcom/android/settings/DisplaySettings;->mToggleLockScreenRotationPreference:Landroidx/preference/SwitchPreference;

    .line 559
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/view/RotationPolicy;->isRotationSupported(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 560
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 563
    :cond_8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "oem_acc_breath_light"

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/android/settings/DisplaySettings;->mNotifyLightEnable:I

    const-string p1, "notify_light_enable"

    .line 564
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/SwitchPreference;

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mNotifyLightPreference:Landroidx/preference/SwitchPreference;

    .line 565
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 566
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mNotifyLightPreference:Landroidx/preference/SwitchPreference;

    iget v0, p0, Lcom/android/settings/DisplaySettings;->mNotifyLightEnable:I

    if-nez v0, :cond_9

    move v0, v1

    goto :goto_3

    :cond_9
    move v0, v4

    :goto_3
    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    const-string p1, "lockguard_wallpaper_settings"

    .line 568
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mLockWallPaperPreference:Landroidx/preference/Preference;

    .line 569
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 570
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mLockWallPaperPreference:Landroidx/preference/Preference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 577
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const-class v0, Landroid/os/PowerManager;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    .line 578
    invoke-virtual {p1, v1}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/android/settings/DisplaySettings;->mMinimumBacklight:F

    .line 579
    invoke-virtual {p1, v4}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/android/settings/DisplaySettings;->mMaximumBacklight:F

    .line 580
    invoke-virtual {p1, v3}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/android/settings/DisplaySettings;->mDefaultBacklight:F

    const/4 v0, 0x5

    .line 581
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/android/settings/DisplaySettings;->mMinimumBacklightForVr:F

    const/4 v0, 0x6

    .line 582
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result v0

    iput v0, p0, Lcom/android/settings/DisplaySettings;->mMaximumBacklightForVr:F

    const/4 v0, 0x7

    .line 583
    invoke-virtual {p1, v0}, Landroid/os/PowerManager;->getBrightnessConstraint(I)F

    move-result p1

    iput p1, p0, Lcom/android/settings/DisplaySettings;->mDefaultBacklightForVr:F

    .line 584
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    const-class v0, Landroid/hardware/display/DisplayManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/display/DisplayManager;

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 585
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x1110029

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/settings/DisplaySettings;->mAutomaticAvailable:Z

    const-string p1, "power"

    .line 586
    invoke-static {p1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    .line 588
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "oem.autobrightctl.animation.support"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    const-string p1, "manual_brightness_displays"

    .line 591
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mBrightPreference:Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;

    .line 592
    invoke-virtual {p1, p0}, Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory;->setCallback(Lcom/oneplus/settings/ui/OPBrightnessSeekbarPreferenceCategory$OPCallbackBrightness;)V

    .line 593
    new-instance p1, Lcom/android/settings/DisplaySettings$BrightnessObserver;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mHandler:Landroid/os/Handler;

    invoke-direct {p1, p0, v0}, Lcom/android/settings/DisplaySettings$BrightnessObserver;-><init>(Lcom/android/settings/DisplaySettings;Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mBrightnessObserver:Lcom/android/settings/DisplaySettings$BrightnessObserver;

    .line 594
    invoke-virtual {p1}, Lcom/android/settings/DisplaySettings$BrightnessObserver;->startObserving()V

    .line 597
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->setCustomAccentColor()V

    const-string p1, "led_settings"

    .line 598
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mLedSettingsPreference:Landroidx/preference/Preference;

    .line 599
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->updateState()V

    .line 602
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mNotifyLightPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 604
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mLedSettingsPreference:Landroidx/preference/Preference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 609
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "oem.read_mode.support"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    sput-boolean p1, Lcom/android/settings/DisplaySettings;->isSupportReadingMode:Z

    const-string p1, "oneplus_night_mode"

    .line 610
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mNightModePreference:Landroidx/preference/Preference;

    const-string p1, "oneplus_reading_mode"

    .line 611
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mReadingModePreference:Landroidx/preference/Preference;

    if-eqz p1, :cond_a

    .line 612
    sget-boolean v0, Lcom/android/settings/DisplaySettings;->isSupportReadingMode:Z

    if-nez v0, :cond_a

    .line 613
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mScreenBrightnessRootPreference:Landroidx/preference/PreferenceCategory;

    invoke-virtual {v0, p1}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 618
    :cond_a
    new-instance p1, Lcom/android/settings/DisplaySettings$RefreshRateObserver;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mHandler:Landroid/os/Handler;

    invoke-direct {p1, p0, v0}, Lcom/android/settings/DisplaySettings$RefreshRateObserver;-><init>(Lcom/android/settings/DisplaySettings;Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mRefreshRateObserver:Lcom/android/settings/DisplaySettings$RefreshRateObserver;

    .line 619
    invoke-virtual {p1}, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->startObserving()V

    const-string p1, "oplus_o_sync_mode"

    .line 620
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/SwitchPreference;

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mOSyncModePreference:Landroidx/preference/SwitchPreference;

    .line 621
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "osync_feature_switch"

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    .line 622
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "oneplus_screen_refresh_rate"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v4, :cond_b

    move v0, v4

    goto :goto_4

    :cond_b
    move v0, v1

    .line 624
    :goto_4
    iget-object v2, p0, Lcom/android/settings/DisplaySettings;->mOSyncModePreference:Landroidx/preference/SwitchPreference;

    if-ne p1, v4, :cond_c

    move p1, v4

    goto :goto_5

    :cond_c
    move p1, v1

    :goto_5
    invoke-virtual {v2, p1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 625
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mOSyncModePreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 626
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mOSyncModePreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 627
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportADFR()Z

    move-result p1

    if-nez p1, :cond_d

    .line 628
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mOSyncModePreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    :cond_d
    const-string/jumbo p1, "video_enhancer"

    .line 635
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mVideoEnhancerPreference:Landroidx/preference/Preference;

    .line 636
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportVideoEnhancer()Z

    move-result p1

    if-nez p1, :cond_e

    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mVideoEnhancerPreference:Landroidx/preference/Preference;

    if-eqz p1, :cond_e

    .line 637
    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 640
    :cond_e
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_f

    .line 641
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 645
    :cond_f
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p1

    if-eqz p1, :cond_10

    const-string p1, "status_bar_custom"

    .line 646
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    :cond_10
    const-string p1, "op_true_color_mode"

    .line 650
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/SwitchPreference;

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mTrueColorMode:Landroidx/preference/SwitchPreference;

    .line 651
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "display_white_balance_enabled"

    invoke-static {p1, v0, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    .line 652
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mTrueColorMode:Landroidx/preference/SwitchPreference;

    if-ne p1, v4, :cond_11

    move p1, v4

    goto :goto_6

    :cond_11
    move p1, v1

    :goto_6
    invoke-virtual {v0, p1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 653
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mTrueColorMode:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 654
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/oneplus/settings/utils/OPUtils;->isSupportTrueColorMode(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_12

    .line 655
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mTrueColorMode:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    :cond_12
    const-string p1, "graphics_dynamic_optimization"

    .line 658
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mGraphicsDynamicOptimization:Landroidx/preference/Preference;

    const-string p1, "motion_graphics_compensation"

    .line 659
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mMotionGraphicsCompensation:Landroidx/preference/Preference;

    const-string p1, "graphics_enhancement_engine"

    .line 660
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 661
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportMotionGraphicsCompensation()Z

    move-result p1

    if-nez p1, :cond_13

    .line 662
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mGraphicsDynamicOptimization:Landroidx/preference/Preference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 663
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mMotionGraphicsCompensation:Landroidx/preference/Preference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 665
    :cond_13
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportMotionGraphicsCompensation()Z

    move-result p1

    if-eqz p1, :cond_14

    .line 666
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mVideoEnhancerPreference:Landroidx/preference/Preference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    :cond_14
    const-string/jumbo p1, "video_super_compensation"

    .line 669
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mVideoSuperCompensation:Landroidx/preference/Preference;

    .line 670
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportViewSR()Z

    move-result p1

    if-nez p1, :cond_15

    .line 671
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mVideoSuperCompensation:Landroidx/preference/Preference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    :cond_15
    const-string p1, "op_advanced_settings"

    .line 675
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mAdvancedSettingsPreference:Landroidx/preference/Preference;

    .line 677
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/oneplus/settings/utils/OPUtils;->isSupportMultiScreenResolution(Landroid/content/Context;)Z

    move-result p1

    .line 678
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportScreenRefreshRate()Z

    move-result v0

    .line 679
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportScreenCutting()Z

    move-result v2

    if-nez v2, :cond_17

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportScreenDisplayAdaption()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportAppsDisplayInFullscreen()Z

    move-result v2

    if-eqz v2, :cond_16

    goto :goto_7

    :cond_16
    move v4, v1

    .line 681
    :cond_17
    :goto_7
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isGuestMode()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 682
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mAdvancedSettingsPreference:Landroidx/preference/Preference;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_display_advanced_settings_summary_5:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_8

    :cond_18
    if-eqz p1, :cond_1a

    if-eqz v0, :cond_1a

    if-eqz v4, :cond_1a

    .line 684
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportHolePunchFrontCam()Z

    move-result p1

    if-eqz p1, :cond_19

    .line 685
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mAdvancedSettingsPreference:Landroidx/preference/Preference;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_display_advanced_settings_summary_6:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_8

    .line 687
    :cond_19
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mAdvancedSettingsPreference:Landroidx/preference/Preference;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_display_advanced_settings_summary_1:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_8

    :cond_1a
    if-eqz v0, :cond_1c

    if-eqz v4, :cond_1c

    .line 690
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportHolePunchFrontCam()Z

    move-result p1

    if-eqz p1, :cond_1b

    .line 691
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mAdvancedSettingsPreference:Landroidx/preference/Preference;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_display_advanced_settings_summary_7:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_8

    .line 693
    :cond_1b
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mAdvancedSettingsPreference:Landroidx/preference/Preference;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_display_advanced_settings_summary_2:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_8

    :cond_1c
    if-eqz p1, :cond_1d

    if-eqz v0, :cond_1d

    .line 696
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mAdvancedSettingsPreference:Landroidx/preference/Preference;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_display_advanced_settings_summary_3:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_8

    :cond_1d
    if-eqz v4, :cond_1e

    .line 698
    iget-object p1, p0, Lcom/android/settings/DisplaySettings;->mAdvancedSettingsPreference:Landroidx/preference/Preference;

    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_display_advanced_settings_summary_4:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_1e
    :goto_8
    const-string p1, "dark_ui_mode"

    .line 701
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings;->mDarkUiModePreference:Landroidx/preference/Preference;

    .line 702
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isGuestMode()Z

    move-result p1

    if-eqz p1, :cond_1f

    .line 703
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mDarkUiModePreference:Landroidx/preference/Preference;

    invoke-virtual {p0, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    :cond_1f
    return-void
.end method

.method public onCustomColorClick()V
    .locals 3

    .line 1298
    new-instance v0, Landroid/content/Intent;

    const-string v1, "oneplus.intent.action.ONEPLUS_COLOR_PICKER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1300
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1}, Lcom/oneplus/settings/utils/OPUtils;->isWhiteModeOn(Landroid/content/ContentResolver;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1301
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "oneplus_white_custom_accent_color"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/DisplaySettings;->mCurrentTempColor:Ljava/lang/String;

    goto :goto_0

    .line 1302
    :cond_0
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1}, Lcom/oneplus/settings/utils/OPUtils;->isBlackModeOn(Landroid/content/ContentResolver;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1303
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "oneplus_black_custom_accent_color"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/DisplaySettings;->mCurrentTempColor:Ljava/lang/String;

    .line 1305
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mCurrentTempColor:Ljava/lang/String;

    const-string v2, "current_color"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 v1, 0x64

    .line 1306
    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 901
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onDestroy()V

    .line 902
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mBrightnessObserver:Lcom/android/settings/DisplaySettings$BrightnessObserver;

    if-eqz v0, :cond_0

    .line 903
    invoke-virtual {v0}, Lcom/android/settings/DisplaySettings$BrightnessObserver;->stopObserving()V

    .line 907
    :cond_0
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mRefreshRateObserver:Lcom/android/settings/DisplaySettings$RefreshRateObserver;

    if-eqz p0, :cond_1

    .line 908
    invoke-virtual {p0}, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->stopObserving()V

    :cond_1
    return-void
.end method

.method public onOPBrightValueChanged(Landroid/widget/SeekBar;II)V
    .locals 6

    .line 1163
    iget-object p2, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_0

    .line 1164
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1166
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/DisplaySettings;->isInVrMode()Z

    move-result p2

    .line 1176
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1177
    iget-wide v2, p0, Lcom/android/settings/DisplaySettings;->mLastSliderChangeTimeMillis:J

    const-wide/16 v4, 0x0

    cmp-long p2, v2, v4

    const-string v4, "DisplaySettings"

    if-gtz p2, :cond_2

    .line 1178
    sget-boolean p1, Lcom/android/settings/DisplaySettings;->DEBUG:Z

    if-eqz p1, :cond_1

    const-string p1, "Slider.onChanged denoise init."

    .line 1179
    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1181
    :cond_1
    iput-wide v0, p0, Lcom/android/settings/DisplaySettings;->mLastSliderChangeTimeMillis:J

    return-void

    :cond_2
    sub-long/2addr v0, v2

    const-wide/16 v2, 0xa

    cmp-long p2, v0, v2

    if-gez p2, :cond_4

    .line 1184
    sget-boolean p0, Lcom/android/settings/DisplaySettings;->DEBUG:Z

    if-eqz p0, :cond_3

    const-string p0, "Slider.onChanged denoise consecutive change."

    .line 1185
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return-void

    .line 1189
    :cond_4
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object p2

    invoke-virtual {p2, p1, p3}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->doSeekBarVibrate(Landroid/widget/SeekBar;I)V

    .line 1190
    invoke-direct {p0, p3}, Lcom/android/settings/DisplaySettings;->setBrightness(I)V

    return-void
.end method

.method public onOPBrightValueStartTrackingTouch(I)V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 882
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onPause()V

    .line 884
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/view/RotationPolicy;->isRotationSupported(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 885
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mRotationPolicyListener:Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;

    invoke-static {v0, p0}, Lcom/android/internal/view/RotationPolicy;->unregisterRotationPolicyListener(Landroid/content/Context;Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;)V

    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 7

    .line 1007
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "op_true_color_mode"

    .line 1008
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1009
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1010
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "display_white_balance_enabled"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1012
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->sendAppTrackerForTrueColor()V

    goto :goto_0

    :cond_0
    const-string v1, "screen_timeout"

    .line 1013
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1015
    :try_start_0
    move-object v1, p2

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1016
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "screen_off_timeout"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    int-to-long v1, v1

    .line 1017
    invoke-direct {p0, v1, v2}, Lcom/android/settings/DisplaySettings;->updateTimeoutPreferenceDescription(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "DisplaySettings"

    const-string v3, "could not persist screen timeout setting"

    .line 1019
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1022
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mAutoBrightnessPreference:Landroidx/preference/SwitchPreference;

    if-ne p1, v1, :cond_2

    .line 1023
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1024
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "screen_brightness_mode"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1027
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->sendAppTrackerForAutoBrightness()V

    .line 1030
    :cond_2
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mNetworkNameDisplayedPreference:Landroidx/preference/SwitchPreference;

    if-ne p1, v1, :cond_3

    .line 1031
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1032
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "show_network_name_mode"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1036
    :cond_3
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mTapToWakePreference:Landroidx/preference/SwitchPreference;

    if-ne p1, v1, :cond_4

    .line 1037
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1038
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "double_tap_to_wake"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1040
    :cond_4
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mCameraGesturePreference:Landroidx/preference/SwitchPreference;

    const/4 v2, 0x1

    if-ne p1, v1, :cond_5

    .line 1041
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1042
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    xor-int/2addr v1, v2

    const-string v4, "camera_gesture_disabled"

    invoke-static {v3, v4, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1045
    :cond_5
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mCameraDoubleTapPowerGesturePreference:Landroidx/preference/SwitchPreference;

    if-ne p1, v1, :cond_6

    .line 1046
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1047
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    xor-int/2addr v1, v2

    const-string v4, "camera_double_tap_power_gesture_disabled"

    invoke-static {v3, v4, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1051
    :cond_6
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mNotifyLightPreference:Landroidx/preference/SwitchPreference;

    if-ne p1, v1, :cond_8

    .line 1052
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 1053
    invoke-direct {p0, p1}, Lcom/android/settings/DisplaySettings;->updateNotifyLightStatus(I)V

    .line 1054
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mLedSettingsPreference:Landroidx/preference/Preference;

    if-eqz p0, :cond_7

    .line 1055
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    :cond_7
    return v2

    :cond_8
    const-string/jumbo p1, "video_enhancer"

    .line 1062
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v3, "1"

    const-string v4, "0"

    if-eqz v1, :cond_b

    .line 1063
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_9

    const-string v5, "true"

    goto :goto_1

    :cond_9
    const-string v5, "false"

    :goto_1
    const-string v6, "persist.sys.oem.vendor.media.vpp.enable"

    .line 1064
    invoke-static {v6, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v1, :cond_a

    move-object v1, v3

    goto :goto_2

    :cond_a
    move-object v1, v4

    .line 1065
    :goto_2
    invoke-static {p1, v1}, Lcom/oneplus/settings/utils/OPUtils;->sendAppTracker(Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    const-string p1, "oplus_o_sync_mode"

    .line 1071
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    .line 1072
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 1073
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string p2, "osync_feature_switch"

    invoke-static {p0, p2, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    if-eqz p1, :cond_c

    goto :goto_3

    :cond_c
    move-object v3, v4

    :goto_3
    const-string p0, "o_sync"

    .line 1075
    invoke-static {p0, v3}, Lcom/oneplus/settings/utils/OPUtils;->sendAppTracker(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d
    return v2
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 2

    .line 1104
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "doze"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "doze_801"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 1115
    :cond_0
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string v0, "lockguard_wallpaper_settings"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1116
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.SET_WALLPAPER"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "net.oneplus.launcher"

    .line 1117
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1118
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-static {v1, p1, v0}, Lcom/oneplus/settings/utils/OPUtils;->isActionExist(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1120
    :try_start_0
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 1122
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0

    .line 1106
    :cond_2
    :goto_1
    :try_start_1
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.oneplus.aod"

    const-string v1, "com.oneplus.settings.SettingsActivity"

    .line 1107
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1108
    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p0

    .line 1110
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    const/4 p0, 0x1

    return p0
.end method

.method public onPreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 1

    .line 1084
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mToggleLockScreenRotationPreference:Landroidx/preference/SwitchPreference;

    if-ne v0, p1, :cond_0

    .line 1085
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->handleLockScreenRotationPreferenceClick()V

    .line 1087
    :cond_0
    invoke-super {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->onPreferenceTreeClick(Landroidx/preference/Preference;)Z

    move-result p0

    return p0
.end method

.method public onResume()V
    .locals 6

    .line 795
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 796
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->init(Landroid/content/Context;)V

    .line 797
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->updateState()V

    .line 799
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "screen_off_timeout"

    const-wide/16 v2, 0x7530

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 801
    iget-object v2, p0, Lcom/android/settings/DisplaySettings;->mScreenTimeoutPreference:Lcom/android/settings/display/TimeoutListPreference;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 802
    iget-object v2, p0, Lcom/android/settings/DisplaySettings;->mScreenTimeoutPreference:Lcom/android/settings/display/TimeoutListPreference;

    invoke-virtual {v2, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 803
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    const-string v3, "device_policy"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/admin/DevicePolicyManager;

    if-eqz v2, :cond_0

    .line 807
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    .line 806
    invoke-static {v3}, Lcom/android/settingslib/RestrictedLockUtilsInternal;->checkIfMaximumTimeToLockIsSet(Landroid/content/Context;)Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    move-result-object v3

    const/4 v4, 0x0

    .line 810
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/app/admin/DevicePolicyManager;->getMaximumTimeToLock(Landroid/content/ComponentName;I)J

    move-result-wide v4

    .line 812
    iget-object v2, p0, Lcom/android/settings/DisplaySettings;->mScreenTimeoutPreference:Lcom/android/settings/display/TimeoutListPreference;

    invoke-virtual {v2, v4, v5, v3}, Lcom/android/settings/display/TimeoutListPreference;->removeUnusableTimeouts(JLcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;)V

    .line 814
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/android/settings/DisplaySettings;->updateTimeoutPreferenceDescription(J)V

    .line 818
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mContext:Landroid/content/Context;

    .line 820
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    const-string v2, "no_config_screen_timeout"

    .line 818
    invoke-static {v0, v2, v1}, Lcom/android/settingslib/RestrictedLockUtilsInternal;->checkIfRestrictionEnforced(Landroid/content/Context;Ljava/lang/String;I)Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 822
    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mScreenTimeoutPreference:Lcom/android/settings/display/TimeoutListPreference;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3, v0}, Lcom/android/settings/display/TimeoutListPreference;->removeUnusableTimeouts(JLcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;)V

    :cond_1
    const-string/jumbo v0, "wallpaper"

    const-string v1, "no_set_wallpaper"

    .line 826
    invoke-direct {p0, v0, v1}, Lcom/android/settings/DisplaySettings;->disablePreferenceIfManaged(Ljava/lang/String;Ljava/lang/String;)V

    .line 829
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->updateLockScreenRotation()V

    .line 830
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/view/RotationPolicy;->isRotationSupported(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 831
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/DisplaySettings;->mRotationPolicyListener:Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;

    invoke-static {v0, v1}, Lcom/android/internal/view/RotationPolicy;->registerRotationPolicyListener(Landroid/content/Context;Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;)V

    .line 835
    :cond_2
    invoke-direct {p0}, Lcom/android/settings/DisplaySettings;->disableEntryForAccessibilityDisplayDaltonizerAndInversion()V

    return-void
.end method

.method public onStart()V
    .locals 5

    .line 782
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onStart()V

    .line 784
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_daltonizer_enabled"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/DisplaySettings;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x1

    const/4 v4, -0x1

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 786
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_inversion_enabled"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/DisplaySettings;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 788
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_grayscale_enabled"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, p0, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 892
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onStop()V

    .line 894
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lcom/android/settings/DisplaySettings;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method

.method safeGetVrManager()Landroid/service/vr/IVrManager;
    .locals 0

    const-string/jumbo p0, "vrmanager"

    .line 1131
    invoke-static {p0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p0

    invoke-static {p0}, Landroid/service/vr/IVrManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/service/vr/IVrManager;

    move-result-object p0

    return-object p0
.end method

.method public saveBrightnessDataBase(I)V
    .locals 2

    .line 1199
    iget-object v0, p0, Lcom/android/settings/DisplaySettings;->mSliderAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 1200
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1202
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/DisplaySettings;->isInVrMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1203
    iget v0, p0, Lcom/android/settings/DisplaySettings;->mMinimumBacklightForVr:F

    .line 1204
    iget v1, p0, Lcom/android/settings/DisplaySettings;->mMaximumBacklightForVr:F

    goto :goto_0

    .line 1207
    :cond_1
    iget v0, p0, Lcom/android/settings/DisplaySettings;->mMinimumBacklight:F

    .line 1208
    iget v1, p0, Lcom/android/settings/DisplaySettings;->mMaximumBacklight:F

    .line 1211
    :goto_0
    invoke-static {p1, v0, v1}, Lcom/android/settingslib/display/BrightnessUtils;->convertGammaToLinearFloat(IFF)F

    move-result p1

    .line 1212
    new-instance v0, Lcom/android/settings/DisplaySettings$3;

    invoke-direct {v0, p0, p1}, Lcom/android/settings/DisplaySettings$3;-><init>(Lcom/android/settings/DisplaySettings;F)V

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
