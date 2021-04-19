.class public Lcom/oneplus/settings/better/OPNightMode;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "OPNightMode.java"

# interfaces
.implements Landroid/hardware/display/NightDisplayListener$Callback;
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;
.implements Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$OPNightModeLevelPreferenceChangeListener;


# static fields
.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;


# instance fields
.field private mAutoActivatePreference:Landroidx/preference/ListPreference;

.field private mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

.field private mContext:Landroid/content/Context;

.field private mEnterAutoOpenValue:I

.field private mEnterBrightnessValue:F

.field private mEnterScreenColorValue:I

.field private mNightDisplayListener:Landroid/hardware/display/NightDisplayListener;

.field private mNightModeEnabledPreference:Landroidx/preference/SwitchPreference;

.field private mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

.field private mNightModeSeekBarContentObserver:Landroid/database/ContentObserver;

.field private mTimeFormatter:Ljava/text/DateFormat;

.field private mTurnOffTimePreference:Landroidx/preference/Preference;

.field private mTurnOnTimePreference:Landroidx/preference/Preference;

.field private mVibratePattern:[J

.field private mVibrator:Landroid/os/Vibrator;

.field private mVibratorFlag:Z

.field private mVibratorSceneId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 599
    new-instance v0, Lcom/oneplus/settings/better/OPNightMode$7;

    invoke-direct {v0}, Lcom/oneplus/settings/better/OPNightMode$7;-><init>()V

    sput-object v0, Lcom/oneplus/settings/better/OPNightMode;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 53
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    const/4 v0, 0x1

    .line 75
    iput-boolean v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibratorFlag:Z

    const/16 v0, 0x3eb

    .line 96
    iput v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibratorSceneId:I

    .line 538
    new-instance v0, Lcom/oneplus/settings/better/OPNightMode$6;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/oneplus/settings/better/OPNightMode$6;-><init>(Lcom/oneplus/settings/better/OPNightMode;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeSeekBarContentObserver:Landroid/database/ContentObserver;

    return-void
.end method

.method static synthetic access$000(Lcom/oneplus/settings/better/OPNightMode;)Landroid/hardware/display/ColorDisplayManager;
    .locals 0

    .line 53
    iget-object p0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    return-object p0
.end method

.method static synthetic access$100(Lcom/oneplus/settings/better/OPNightMode;)Landroid/content/Context;
    .locals 0

    .line 53
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/oneplus/settings/better/OPNightMode;)Landroid/content/Context;
    .locals 0

    .line 53
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/oneplus/settings/better/OPNightMode;)Landroid/content/ContentResolver;
    .locals 0

    .line 53
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/oneplus/settings/better/OPNightMode;)V
    .locals 0

    .line 53
    invoke-direct {p0}, Lcom/oneplus/settings/better/OPNightMode;->disableEntryForWellbeingGrayscale()V

    return-void
.end method

.method public static convertAutoMode(I)I
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 v0, 0x1

    if-ne p0, v0, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    return v0
.end method

.method private disableEntryForWellbeingGrayscale()V
    .locals 6

    .line 244
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_grayscale_enabled"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 245
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v4, -0x2

    const-string v5, "night_display_activated"

    invoke-static {v3, v5, v1, v4}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v3

    if-ne v3, v2, :cond_1

    move v3, v2

    goto :goto_1

    :cond_1
    move v3, v1

    .line 246
    :goto_1
    iget-object v4, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeEnabledPreference:Landroidx/preference/SwitchPreference;

    if-eqz v4, :cond_2

    xor-int/lit8 v5, v0, 0x1

    .line 247
    invoke-virtual {v4, v5}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 249
    :cond_2
    iget-object v4, p0, Lcom/oneplus/settings/better/OPNightMode;->mAutoActivatePreference:Landroidx/preference/ListPreference;

    if-eqz v4, :cond_3

    xor-int/lit8 v5, v0, 0x1

    .line 250
    invoke-virtual {v4, v5}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 253
    :cond_3
    iget-object p0, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    if-eqz p0, :cond_5

    if-eqz v3, :cond_4

    if-nez v0, :cond_4

    goto :goto_2

    :cond_4
    move v2, v1

    .line 254
    :goto_2
    invoke-virtual {p0, v2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->setEnabled(Z)V

    :cond_5
    return-void
.end method

.method private getFormattedTimeString(Ljava/time/LocalTime;)Ljava/lang/String;
    .locals 3

    .line 361
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 362
    iget-object v1, p0, Lcom/oneplus/settings/better/OPNightMode;->mTimeFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1}, Ljava/text/DateFormat;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 363
    invoke-virtual {p1}, Ljava/time/LocalTime;->getHour()I

    move-result v1

    const/16 v2, 0xb

    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 364
    invoke-virtual {p1}, Ljava/time/LocalTime;->getMinute()I

    move-result p1

    const/16 v1, 0xc

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xd

    const/4 v1, 0x0

    .line 365
    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xe

    .line 366
    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    .line 367
    iget-object p0, p0, Lcom/oneplus/settings/better/OPNightMode;->mTimeFormatter:Ljava/text/DateFormat;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private saveBrightnessProgress(I)V
    .locals 2

    .line 579
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "oem_nightmode_brightness_progress"

    const/4 v1, -0x2

    invoke-static {p0, v0, p1, v1}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    return-void
.end method

.method private saveColorTemperatureProgress(I)V
    .locals 2

    .line 573
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "oem_nightmode_progress_status"

    const/4 v1, -0x2

    invoke-static {p0, v0, p1, v1}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    return-void
.end method

.method private saveSaturationProgress(I)V
    .locals 2

    .line 457
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "oem_screen_saturation_value"

    const/4 v1, -0x2

    invoke-static {p0, v0, p1, v1}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    return-void
.end method

.method private updateAutoActivateModePreferenceDescription(I)V
    .locals 1

    .line 236
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mAutoActivatePreference:Landroidx/preference/ListPreference;

    if-eqz v0, :cond_0

    .line 237
    invoke-virtual {v0}, Landroidx/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 238
    iget-object p0, p0, Lcom/oneplus/settings/better/OPNightMode;->mAutoActivatePreference:Landroidx/preference/ListPreference;

    aget-object p1, v0, p1

    invoke-virtual {p0, p1}, Landroidx/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method


# virtual methods
.method doVibrate()V
    .locals 3

    .line 588
    invoke-static {}, Lcom/appaac/haptic/AACHapticUtils;->getInstance()Lcom/appaac/haptic/AACHapticUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appaac/haptic/AACHapticUtils;->supportRichTap()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 591
    :cond_0
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/oneplus/common/VibratorSceneUtils;->systemVibrateEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 592
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibrator:Landroid/os/Vibrator;

    iget v2, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibratorSceneId:I

    invoke-static {v0, v1, v2}, Lcom/oneplus/common/VibratorSceneUtils;->getVibratorScenePattern(Landroid/content/Context;Landroid/os/Vibrator;I)[J

    move-result-object v0

    iput-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibratePattern:[J

    .line 594
    iget-object p0, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibrator:Landroid/os/Vibrator;

    invoke-static {v0, p0}, Lcom/oneplus/common/VibratorSceneUtils;->vibrateIfNeeded([JLandroid/os/Vibrator;)V

    :cond_1
    return-void
.end method

.method public getDialogMetricsCategory(I)I
    .locals 0

    const/16 p0, 0x270f

    return p0
.end method

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x270f

    return p0
.end method

.method public onActivated(Z)V
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeEnabledPreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, p1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 223
    invoke-direct {p0}, Lcom/oneplus/settings/better/OPNightMode;->disableEntryForWellbeingGrayscale()V

    return-void
.end method

.method public onAutoModeChanged(I)V
    .locals 2

    .line 228
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mAutoActivatePreference:Landroidx/preference/ListPreference;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/preference/ListPreference;->setValue(Ljava/lang/String;)V

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 231
    :goto_0
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mTurnOnTimePreference:Landroidx/preference/Preference;

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 232
    iget-object p0, p0, Lcom/oneplus/settings/better/OPNightMode;->mTurnOffTimePreference:Landroidx/preference/Preference;

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setVisible(Z)V

    return-void
.end method

.method public onBrightnessProgressChanged(IZ)V
    .locals 0

    if-nez p2, :cond_0

    return-void

    .line 420
    :cond_0
    invoke-direct {p0, p1}, Lcom/oneplus/settings/better/OPNightMode;->saveBrightnessProgress(I)V

    return-void
.end method

.method public onBrightnessStartTrackingTouch(I)V
    .locals 0

    return-void
.end method

.method public onBrightnessStopTrackingTouch(I)V
    .locals 1

    const/4 v0, 0x1

    .line 430
    invoke-virtual {p0, p1, v0}, Lcom/oneplus/settings/better/OPNightMode;->onBrightnessProgressChanged(IZ)V

    return-void
.end method

.method public onColorProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    if-nez p3, :cond_0

    return-void

    :cond_0
    const/16 p3, 0x2e

    if-eq p2, p3, :cond_2

    const/16 v0, 0x2b

    if-le p2, v0, :cond_2

    const/16 v0, 0x31

    if-ge p2, v0, :cond_2

    .line 391
    invoke-virtual {p1, p3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 392
    iget-boolean p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibratorFlag:Z

    if-eqz p1, :cond_1

    .line 393
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPNightMode;->doVibrate()V

    const/4 p1, 0x0

    .line 394
    iput-boolean p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibratorFlag:Z

    :cond_1
    move p2, p3

    goto :goto_0

    :cond_2
    if-ne p2, p3, :cond_3

    .line 397
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPNightMode;->doVibrate()V

    goto :goto_0

    :cond_3
    const/4 p1, 0x1

    .line 399
    iput-boolean p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibratorFlag:Z

    .line 402
    :goto_0
    invoke-direct {p0, p2}, Lcom/oneplus/settings/better/OPNightMode;->saveColorTemperatureProgress(I)V

    return-void
.end method

.method public onColorStartTrackingTouch(I)V
    .locals 0

    return-void
.end method

.method public onColorStopTrackingTouch(I)V
    .locals 0

    .line 412
    invoke-direct {p0, p1}, Lcom/oneplus/settings/better/OPNightMode;->saveColorTemperatureProgress(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 100
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 101
    sget p1, Lcom/android/settings/R$xml;->op_night_mode:I

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    .line 102
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    .line 103
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->init(Landroid/content/Context;)V

    .line 104
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "oem.read_mode.support"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 105
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    const-class v0, Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/display/ColorDisplayManager;

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    .line 106
    new-instance p1, Landroid/hardware/display/NightDisplayListener;

    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    invoke-direct {p1, v0}, Landroid/hardware/display/NightDisplayListener;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightDisplayListener:Landroid/hardware/display/NightDisplayListener;

    const-string p1, "night_mode_enabled"

    .line 107
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/SwitchPreference;

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeEnabledPreference:Landroidx/preference/SwitchPreference;

    const-string p1, "auto_activate"

    .line 108
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/ListPreference;

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mAutoActivatePreference:Landroidx/preference/ListPreference;

    const-string p1, "turn_on_time"

    .line 109
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mTurnOnTimePreference:Landroidx/preference/Preference;

    const-string p1, "turn_off_time"

    .line 110
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mTurnOffTimePreference:Landroidx/preference/Preference;

    const-string p1, "night_mode_level_op"

    .line 111
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    .line 112
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeEnabledPreference:Landroidx/preference/SwitchPreference;

    if-eqz p1, :cond_0

    .line 113
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 115
    :cond_0
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    if-eqz p1, :cond_1

    .line 116
    invoke-virtual {p1, p0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->setOPNightModeLevelSeekBarChangeListener(Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory$OPNightModeLevelPreferenceChangeListener;)V

    .line 119
    :cond_1
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mAutoActivatePreference:Landroidx/preference/ListPreference;

    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    .line 120
    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayAutoMode()I

    move-result v0

    .line 119
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 121
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mAutoActivatePreference:Landroidx/preference/ListPreference;

    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 122
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mTimeFormatter:Ljava/text/DateFormat;

    const-string v0, "UTC"

    .line 123
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 124
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    .line 125
    invoke-virtual {p1}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayAutoMode()I

    move-result p1

    .line 124
    invoke-static {p1}, Lcom/oneplus/settings/better/OPNightMode;->convertAutoMode(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/oneplus/settings/better/OPNightMode;->updateAutoActivateModePreferenceDescription(I)V

    .line 126
    new-instance p1, Lcom/oneplus/settings/OneplusColorManager;

    sget-object v0, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    invoke-direct {p1, v0}, Lcom/oneplus/settings/OneplusColorManager;-><init>(Landroid/content/Context;)V

    const-string p1, "display"

    .line 127
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/display/DisplayManager;

    .line 129
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, -0x2

    const-string v2, "reading_mode_status"

    invoke-static {p1, v2, v0, v1}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result p1

    .line 132
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->init(Landroid/content/Context;)V

    .line 133
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mContext:Landroid/content/Context;

    const-string v0, "vibrator"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Vibrator;

    iput-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mVibrator:Landroid/os/Vibrator;

    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 8

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 352
    :cond_0
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    if-nez p1, :cond_2

    .line 312
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayCustomStartTime()Ljava/time/LocalTime;

    move-result-object v0

    goto :goto_1

    .line 314
    :cond_2
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayCustomEndTime()Ljava/time/LocalTime;

    move-result-object v0

    .line 317
    :goto_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 319
    invoke-static {v2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v6

    .line 320
    new-instance v7, Lcom/google/android/material/picker/TimePickerDialog;

    new-instance v3, Lcom/oneplus/settings/better/OPNightMode$1;

    invoke-direct {v3, p0, p1}, Lcom/oneplus/settings/better/OPNightMode$1;-><init>(Lcom/oneplus/settings/better/OPNightMode;I)V

    .line 349
    invoke-virtual {v0}, Ljava/time/LocalTime;->getHour()I

    move-result v4

    invoke-virtual {v0}, Ljava/time/LocalTime;->getMinute()I

    move-result v5

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/google/android/material/picker/TimePickerDialog;-><init>(Landroid/content/Context;Lcom/google/android/material/picker/TimePickerDialog$OnTimeSetListener;IIZ)V

    return-object v7
.end method

.method public onCustomEndTimeChanged(Ljava/time/LocalTime;)V
    .locals 1

    .line 378
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mTurnOffTimePreference:Landroidx/preference/Preference;

    invoke-direct {p0, p1}, Lcom/oneplus/settings/better/OPNightMode;->getFormattedTimeString(Ljava/time/LocalTime;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onCustomStartTimeChanged(Ljava/time/LocalTime;)V
    .locals 1

    .line 373
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mTurnOnTimePreference:Landroidx/preference/Preference;

    invoke-direct {p0, p1}, Lcom/oneplus/settings/better/OPNightMode;->getFormattedTimeString(Ljava/time/LocalTime;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 4

    .line 260
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string v0, "night_mode_enabled"

    .line 261
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 262
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 264
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->sendAppTrackerForNightMode()V

    .line 267
    iget-object p2, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {p2, p1}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->setEnabled(Z)V

    .line 269
    iget-object p2, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {p2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getColorProgress()I

    move-result p2

    .line 270
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {v0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getBrightnessProgress()I

    move-result v0

    .line 271
    iget-object v2, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {v2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getSaturationProgress()I

    move-result v2

    if-eqz p1, :cond_0

    .line 273
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPreferenceChange colorProgress:"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " brightnessProgress:"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v3, "OPNightMode"

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {p1, v1}, Landroid/hardware/display/ColorDisplayManager;->setNightDisplayActivated(Z)Z

    .line 277
    invoke-direct {p0, p2}, Lcom/oneplus/settings/better/OPNightMode;->saveColorTemperatureProgress(I)V

    .line 278
    invoke-direct {p0, v0}, Lcom/oneplus/settings/better/OPNightMode;->saveBrightnessProgress(I)V

    .line 279
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportColorSaturationAdjustment()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 280
    invoke-direct {p0, v2}, Lcom/oneplus/settings/better/OPNightMode;->saveSaturationProgress(I)V

    goto :goto_0

    .line 283
    :cond_0
    iget-object p0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/hardware/display/ColorDisplayManager;->setNightDisplayActivated(Z)Z

    goto :goto_0

    :cond_1
    const-string v0, "auto_activate"

    .line 285
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 286
    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    .line 287
    iget-object p2, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {p2, p1}, Landroid/hardware/display/ColorDisplayManager;->setNightDisplayAutoMode(I)Z

    .line 288
    iget-object p1, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    .line 289
    invoke-virtual {p1}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayAutoMode()I

    move-result p1

    .line 288
    invoke-static {p1}, Lcom/oneplus/settings/better/OPNightMode;->convertAutoMode(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/oneplus/settings/better/OPNightMode;->updateAutoActivateModePreferenceDescription(I)V

    :cond_2
    :goto_0
    return v1
.end method

.method public onPreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 3

    .line 296
    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "turn_on_time"

    .line 297
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    const/4 p1, 0x0

    .line 298
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->showDialog(I)V

    return v2

    :cond_0
    const-string v1, "turn_off_time"

    .line 300
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 301
    invoke-virtual {p0, v2}, Lcom/android/settings/SettingsPreferenceFragment;->showDialog(I)V

    return v2

    .line 304
    :cond_1
    invoke-super {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->onPreferenceTreeClick(Landroidx/preference/Preference;)Z

    move-result p0

    return p0
.end method

.method public onResume()V
    .locals 4

    .line 210
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 211
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->isNightDisplayActivated()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPNightMode;->onActivated(Z)V

    .line 212
    invoke-direct {p0}, Lcom/oneplus/settings/better/OPNightMode;->disableEntryForWellbeingGrayscale()V

    .line 213
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayAutoMode()I

    move-result v0

    invoke-static {v0}, Lcom/oneplus/settings/better/OPNightMode;->convertAutoMode(I)I

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mEnterAutoOpenValue:I

    .line 214
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_nightmode_progress_status"

    const/16 v2, 0x2e

    const/4 v3, -0x2

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mEnterScreenColorValue:I

    .line 216
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_nightmode_brightness_progress"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->getFloatForUser(Landroid/content/ContentResolver;Ljava/lang/String;FI)F

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mEnterBrightnessValue:F

    return-void
.end method

.method public onSaturationProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-nez p3, :cond_0

    return-void

    .line 442
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->doSeekBarVibrate(Landroid/widget/SeekBar;I)V

    .line 443
    invoke-direct {p0, p2}, Lcom/oneplus/settings/better/OPNightMode;->saveSaturationProgress(I)V

    return-void
.end method

.method public onSaturationStartTrackingTouch(I)V
    .locals 0

    return-void
.end method

.method public onSaturationStopTrackingTouch(I)V
    .locals 0

    return-void
.end method

.method public onStart()V
    .locals 5

    .line 148
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onStart()V

    .line 152
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightDisplayListener:Landroid/hardware/display/NightDisplayListener;

    invoke-virtual {v0, p0}, Landroid/hardware/display/NightDisplayListener;->setCallback(Landroid/hardware/display/NightDisplayListener$Callback;)V

    .line 155
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->isNightDisplayActivated()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPNightMode;->onActivated(Z)V

    .line 156
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayAutoMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPNightMode;->onAutoModeChanged(I)V

    .line 157
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayCustomStartTime()Ljava/time/LocalTime;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPNightMode;->onCustomStartTimeChanged(Ljava/time/LocalTime;)V

    .line 158
    iget-object v0, p0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayCustomEndTime()Ljava/time/LocalTime;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPNightMode;->onCustomEndTimeChanged(Ljava/time/LocalTime;)V

    .line 159
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "reading_mode_status"

    .line 160
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeSeekBarContentObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x1

    const/4 v4, -0x2

    .line 159
    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 162
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "night_display_activated"

    .line 163
    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeSeekBarContentObserver:Landroid/database/ContentObserver;

    .line 162
    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 165
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_grayscale_enabled"

    .line 166
    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object p0, p0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeSeekBarContentObserver:Landroid/database/ContentObserver;

    .line 165
    invoke-virtual {v0, v1, v3, p0, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    return-void
.end method

.method public onStop()V
    .locals 16

    move-object/from16 v0, p0

    .line 172
    invoke-super/range {p0 .. p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onStop()V

    .line 175
    iget-object v1, v0, Lcom/oneplus/settings/better/OPNightMode;->mNightDisplayListener:Landroid/hardware/display/NightDisplayListener;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/hardware/display/NightDisplayListener;->setCallback(Landroid/hardware/display/NightDisplayListener$Callback;)V

    .line 176
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeSeekBarContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 178
    iget-object v1, v0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v1}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayAutoMode()I

    move-result v1

    invoke-static {v1}, Lcom/oneplus/settings/better/OPNightMode;->convertAutoMode(I)I

    move-result v1

    .line 179
    iget v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mEnterAutoOpenValue:I

    const-string v3, "night_mode"

    if-eq v2, v1, :cond_0

    .line 180
    iget-object v1, v0, Lcom/oneplus/settings/better/OPNightMode;->mColorDisplayManager:Landroid/hardware/display/ColorDisplayManager;

    invoke-virtual {v1}, Landroid/hardware/display/ColorDisplayManager;->getNightDisplayAutoMode()I

    move-result v1

    invoke-static {v1}, Lcom/oneplus/settings/better/OPNightMode;->convertAutoMode(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "auto_open"

    invoke-static {v3, v2, v1}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/16 v2, 0x2e

    const-string v4, "oem_nightmode_progress_status"

    const/4 v5, -0x2

    invoke-static {v1, v4, v2, v5}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    .line 185
    iget v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mEnterScreenColorValue:I

    const-string v4, "3"

    const-string v6, "2"

    const-string v7, "1"

    const-wide v8, 0x3fe51eb851eb851fL    # 0.66

    const-wide v10, 0x3fd51eb851eb851fL    # 0.33

    if-eq v2, v1, :cond_3

    int-to-double v12, v1

    .line 186
    iget-object v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {v2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getColorProgressMax()I

    move-result v2

    int-to-double v14, v2

    mul-double/2addr v14, v10

    cmpg-double v2, v12, v14

    const-string v14, "screen_color"

    if-gtz v2, :cond_1

    .line 187
    invoke-static {v3, v14, v7}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 188
    :cond_1
    iget-object v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {v2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getColorProgressMax()I

    move-result v2

    int-to-double v10, v2

    mul-double/2addr v10, v8

    cmpg-double v2, v12, v10

    if-gtz v2, :cond_2

    .line 189
    invoke-static {v3, v14, v6}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 190
    :cond_2
    iget-object v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {v2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getColorProgressMax()I

    move-result v2

    if-gt v1, v2, :cond_3

    .line 191
    invoke-static {v3, v14, v4}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    :cond_3
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x0

    const-string v10, "oem_nightmode_brightness_progress"

    invoke-static {v1, v10, v2, v5}, Landroid/provider/Settings$System;->getFloatForUser(Landroid/content/ContentResolver;Ljava/lang/String;FI)F

    move-result v1

    .line 196
    iget v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mEnterBrightnessValue:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_6

    float-to-double v10, v1

    .line 197
    iget-object v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {v2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getBrightnessProgressMax()I

    move-result v2

    int-to-double v12, v2

    const-wide v14, 0x3fd51eb851eb851fL    # 0.33

    mul-double/2addr v12, v14

    cmpg-double v2, v10, v12

    const-string v5, "brightness"

    if-gtz v2, :cond_4

    .line 198
    invoke-static {v3, v5, v7}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 199
    :cond_4
    iget-object v2, v0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {v2}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getBrightnessProgressMax()I

    move-result v2

    int-to-double v12, v2

    mul-double/2addr v12, v8

    cmpg-double v2, v10, v12

    if-gtz v2, :cond_5

    .line 200
    invoke-static {v3, v5, v6}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 201
    :cond_5
    iget-object v0, v0, Lcom/oneplus/settings/better/OPNightMode;->mNightModeLevelPreferenceCategory:Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;

    invoke-virtual {v0}, Lcom/oneplus/settings/ui/OPNightModeLevelPreferenceCategory;->getBrightnessProgressMax()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v1, v0

    if-gtz v0, :cond_6

    .line 202
    invoke-static {v3, v5, v4}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    :goto_1
    return-void
.end method
