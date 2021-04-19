.class public Lcom/oneplus/settings/better/OPScreenColorMode;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "OPScreenColorMode.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;
.implements Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;
.implements Lcom/oneplus/settings/ui/OPSeekBarPreference$OPColorModeSeekBarChangeListener;
.implements Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;


# static fields
.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settingslib/search/Indexable$SearchIndexProvider;

.field private static isSupportAdaptive:Z

.field private static isSupportDcip3:Z

.field private static isSupportMMDisplayColor:Z

.field private static isSupportSoft:Z


# instance fields
.field private mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

.field private mChrominanceSeekBarPreference:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

.field private mChrominanceVibratorFlag:Z

.field private mContext:Landroid/content/Context;

.field private mDeviceProvision:Z

.field private mEnterAdvancedValue:I

.field private mEnterColorModeValue:I

.field private mEnterValue:I

.field private mOPScreenColorModeSummary:Lcom/oneplus/settings/ui/OPScreenColorModeSummary;

.field private mProgressVibratorFlag:Z

.field private mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeAdvancedSettingsDisplayP3:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeAdvancedSettingsNTSC:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeAdvancedSettingsSRGB:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeContentObserver:Landroid/database/ContentObserver;

.field private mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

.field private mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

.field private mScreenColorModeValue:I

.field private mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

.field private mVibratePattern:[J

.field private mVibrator:Landroid/os/Vibrator;

.field private mVibratorSceneId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 95
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportMMDisplayColorScreenMode()Z

    move-result v0

    sput-boolean v0, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportMMDisplayColor:Z

    .line 694
    new-instance v0, Lcom/oneplus/settings/better/OPScreenColorMode$3;

    invoke-direct {v0}, Lcom/oneplus/settings/better/OPScreenColorMode$3;-><init>()V

    sput-object v0, Lcom/oneplus/settings/better/OPScreenColorMode;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settingslib/search/Indexable$SearchIndexProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 45
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    const/4 v0, 0x1

    .line 94
    iput-boolean v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mDeviceProvision:Z

    const/16 v1, 0x3eb

    .line 103
    iput v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mVibratorSceneId:I

    .line 104
    iput-boolean v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mProgressVibratorFlag:Z

    .line 105
    iput-boolean v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceVibratorFlag:Z

    .line 222
    new-instance v0, Lcom/oneplus/settings/better/OPScreenColorMode$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/oneplus/settings/better/OPScreenColorMode$1;-><init>(Lcom/oneplus/settings/better/OPScreenColorMode;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeContentObserver:Landroid/database/ContentObserver;

    .line 260
    new-instance v0, Lcom/oneplus/settings/better/OPScreenColorMode$2;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/oneplus/settings/better/OPScreenColorMode$2;-><init>(Lcom/oneplus/settings/better/OPScreenColorMode;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    return-void
.end method

.method static synthetic access$000(Lcom/oneplus/settings/better/OPScreenColorMode;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->updatePreferenceStatus()V

    return-void
.end method

.method static synthetic access$100(Lcom/oneplus/settings/better/OPScreenColorMode;)Landroid/content/ContentResolver;
    .locals 0

    .line 45
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1000(Lcom/oneplus/settings/better/OPScreenColorMode;)Lcom/android/settings/widget/RadioButtonPreference;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/oneplus/settings/better/OPScreenColorMode;)Landroidx/preference/PreferenceCategory;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/oneplus/settings/better/OPScreenColorMode;)Lcom/oneplus/settings/ui/OPSeekBarPreference;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    return-object p0
.end method

.method static synthetic access$1300()Z
    .locals 1

    .line 45
    sget-boolean v0, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportDcip3:Z

    return v0
.end method

.method static synthetic access$1400()Z
    .locals 1

    .line 45
    sget-boolean v0, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportAdaptive:Z

    return v0
.end method

.method static synthetic access$1500()Z
    .locals 1

    .line 45
    sget-boolean v0, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportSoft:Z

    return v0
.end method

.method static synthetic access$1600()Z
    .locals 1

    .line 45
    sget-boolean v0, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportMMDisplayColor:Z

    return v0
.end method

.method static synthetic access$200(Lcom/oneplus/settings/better/OPScreenColorMode;)Landroid/content/ContentResolver;
    .locals 0

    .line 45
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/oneplus/settings/better/OPScreenColorMode;)Landroid/content/ContentResolver;
    .locals 0

    .line 45
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/oneplus/settings/better/OPScreenColorMode;)Lcom/android/settings/widget/RadioButtonPreference;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    return-object p0
.end method

.method static synthetic access$500(Lcom/oneplus/settings/better/OPScreenColorMode;)Lcom/android/settings/widget/RadioButtonPreference;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    return-object p0
.end method

.method static synthetic access$600(Lcom/oneplus/settings/better/OPScreenColorMode;)Lcom/android/settings/widget/RadioButtonPreference;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    return-object p0
.end method

.method static synthetic access$700(Lcom/oneplus/settings/better/OPScreenColorMode;)Lcom/android/settings/widget/RadioButtonPreference;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    return-object p0
.end method

.method static synthetic access$800(Lcom/oneplus/settings/better/OPScreenColorMode;)Lcom/android/settings/widget/RadioButtonPreference;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    return-object p0
.end method

.method static synthetic access$900(Lcom/oneplus/settings/better/OPScreenColorMode;)Lcom/android/settings/widget/RadioButtonPreference;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    return-object p0
.end method

.method private updateAdvancedSettingsRadioButtons()V
    .locals 5

    .line 345
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "screen_color_mode_advanced_settings_value"

    const/4 v2, 0x0

    const/4 v3, -0x2

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    .line 346
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsNTSC:Lcom/android/settings/widget/RadioButtonPreference;

    const/4 v3, 0x1

    if-nez v0, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    invoke-virtual {v1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 347
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsSRGB:Lcom/android/settings/widget/RadioButtonPreference;

    if-ne v0, v3, :cond_1

    move v4, v3

    goto :goto_1

    :cond_1
    move v4, v2

    :goto_1
    invoke-virtual {v1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 348
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsDisplayP3:Lcom/android/settings/widget/RadioButtonPreference;

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    move v2, v3

    :cond_2
    invoke-virtual {p0, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    return-void
.end method

.method private updatePreferenceStatus()V
    .locals 5

    .line 232
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "night_display_activated"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 233
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "reading_mode_status_manual"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    if-eqz v0, :cond_2

    if-nez v3, :cond_2

    move v2, v1

    .line 235
    :cond_2
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 236
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 237
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 238
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 239
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 240
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 241
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 242
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 243
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 244
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceSeekBarPreference:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 245
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mOPScreenColorModeSummary:Lcom/oneplus/settings/ui/OPScreenColorModeSummary;

    if-eqz v1, :cond_6

    if-nez v0, :cond_3

    .line 247
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    sget v4, Lcom/android/settings/R$string;->oneplus_screen_color_mode_title_summary:I

    invoke-virtual {v0, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/oneplus/settings/ui/OPScreenColorModeSummary;->setSummary(Ljava/lang/CharSequence;)V

    :cond_3
    if-eqz v3, :cond_4

    .line 250
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mOPScreenColorModeSummary:Lcom/oneplus/settings/ui/OPScreenColorModeSummary;

    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    sget v3, Lcom/android/settings/R$string;->oneplus_screen_color_mode_reading_mode_on_summary:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/ui/OPScreenColorModeSummary;->setSummary(Ljava/lang/CharSequence;)V

    :cond_4
    if-nez v2, :cond_5

    .line 253
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mOPScreenColorModeSummary:Lcom/oneplus/settings/ui/OPScreenColorModeSummary;

    invoke-virtual {v0, p0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    goto :goto_2

    .line 255
    :cond_5
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mOPScreenColorModeSummary:Lcom/oneplus/settings/ui/OPScreenColorModeSummary;

    invoke-virtual {v0, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    :cond_6
    :goto_2
    return-void
.end method

.method private updateRadioButtons(I)V
    .locals 5

    const-string v0, "chrominance_seekbar"

    const-string v1, "screen_color_mode_seekbar"

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v2, p1, :cond_0

    .line 353
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 354
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 355
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 356
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 357
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 358
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 359
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 360
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 361
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 362
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_6

    .line 363
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    :cond_0
    const/4 v4, 0x2

    if-ne v4, p1, :cond_1

    .line 366
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 367
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 368
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 369
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 370
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 371
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 372
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 373
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 374
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 375
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_6

    .line 376
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    :cond_1
    const/4 v4, 0x3

    if-ne v4, p1, :cond_2

    .line 379
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 380
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 381
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 382
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 383
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 384
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 385
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    .line 386
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceSeekBarPreference:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    .line 387
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_6

    sget-boolean p1, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportMMDisplayColor:Z

    if-eqz p1, :cond_6

    .line 388
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    :cond_2
    const/4 v4, 0x4

    if-ne v4, p1, :cond_3

    .line 391
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 392
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 393
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 394
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 395
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 396
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 397
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 398
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_6

    .line 399
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    :cond_3
    const/4 v4, 0x5

    if-ne v4, p1, :cond_4

    .line 402
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 403
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 404
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 405
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 406
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 407
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 408
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 409
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 410
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 411
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_6

    .line 412
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto :goto_0

    :cond_4
    const/4 v4, 0x6

    if-ne v4, p1, :cond_5

    .line 415
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 416
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 417
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 418
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 419
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 420
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 421
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 422
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 423
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 424
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_6

    .line 425
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto :goto_0

    :cond_5
    const/16 v4, 0xa

    if-ne v4, p1, :cond_6

    .line 428
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 429
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 430
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 431
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 432
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 433
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 434
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 435
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 436
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 437
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_6

    .line 438
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    :cond_6
    :goto_0
    return-void
.end method


# virtual methods
.method doVibrate()V
    .locals 3

    .line 684
    invoke-static {}, Lcom/appaac/haptic/AACHapticUtils;->getInstance()Lcom/appaac/haptic/AACHapticUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appaac/haptic/AACHapticUtils;->supportRichTap()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 687
    :cond_0
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/oneplus/common/VibratorSceneUtils;->systemVibrateEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 688
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mVibrator:Landroid/os/Vibrator;

    iget v2, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mVibratorSceneId:I

    invoke-static {v0, v1, v2}, Lcom/oneplus/common/VibratorSceneUtils;->getVibratorScenePattern(Landroid/content/Context;Landroid/os/Vibrator;I)[J

    move-result-object v0

    iput-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mVibratePattern:[J

    .line 690
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mVibrator:Landroid/os/Vibrator;

    invoke-static {v0, p0}, Lcom/oneplus/common/VibratorSceneUtils;->vibrateIfNeeded([JLandroid/os/Vibrator;)V

    :cond_1
    return-void
.end method

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x270f

    return p0
.end method

.method public getScreenColorModeSettingsValue()I
    .locals 3

    .line 668
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "screen_color_mode_settings_value"

    const/4 v1, 0x1

    const/4 v2, -0x2

    invoke-static {p0, v0, v1, v2}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result p0

    return p0
.end method

.method public onChrominanceProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    if-nez p3, :cond_0

    return-void

    :cond_0
    const/16 p3, 0x32

    if-eq p2, p3, :cond_2

    const/16 v0, 0x2f

    if-le p2, v0, :cond_2

    const/16 v0, 0x35

    if-ge p2, v0, :cond_2

    .line 645
    invoke-virtual {p1, p3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 646
    iget-boolean p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceVibratorFlag:Z

    if-eqz p1, :cond_1

    .line 647
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->doVibrate()V

    const/4 p1, 0x0

    .line 648
    iput-boolean p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceVibratorFlag:Z

    :cond_1
    move p2, p3

    goto :goto_0

    :cond_2
    if-ne p2, p3, :cond_3

    .line 651
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->doVibrate()V

    goto :goto_0

    :cond_3
    const/4 p1, 0x1

    .line 653
    iput-boolean p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceVibratorFlag:Z

    .line 656
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string p1, "oem_screen_chrominance_value"

    invoke-static {p0, p1, p2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method

.method public onChrominanceStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onChrominanceStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 111
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 112
    sget p1, Lcom/android/settings/R$xml;->op_screen_color_mode:I

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    .line 113
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    const-string v0, "vibrator"

    .line 114
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Vibrator;

    iput-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mVibrator:Landroid/os/Vibrator;

    .line 115
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "oem.read_mode.support"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    const-string p1, "screen_color_mode_default_settings"

    .line 116
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    const-string p1, "screen_color_mode_basic_settings"

    .line 117
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v0, "screen_color_mode_defined_settings"

    .line 118
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v0, "screen_color_mode_dci_p3_settings"

    .line 119
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v1, "screen_color_mode_adaptive_model_settings"

    .line 120
    invoke-virtual {p0, v1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v2, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v2, "screen_color_mode_soft_settings"

    .line 121
    invoke-virtual {p0, v2}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v3, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v3, "screen_color_mode_auto_settings"

    .line 122
    invoke-virtual {p0, v3}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v4, "screen_color_mode_advanced_settings_ntsc"

    .line 123
    invoke-virtual {p0, v4}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsNTSC:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v4, "screen_color_mode_advanced_settings_srgb"

    .line 124
    invoke-virtual {p0, v4}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsSRGB:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v4, "screen_color_mode_advanced_settings_display_p3"

    .line 125
    invoke-virtual {p0, v4}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/android/settings/widget/RadioButtonPreference;

    iput-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsDisplayP3:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v4, "screen_color_mode_advanced_settings"

    .line 126
    invoke-virtual {p0, v4}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Landroidx/preference/PreferenceCategory;

    iput-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    const-string v4, "oneplus_screen_color_mode_title_summary"

    .line 127
    invoke-virtual {p0, v4}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/oneplus/settings/ui/OPScreenColorModeSummary;

    iput-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mOPScreenColorModeSummary:Lcom/oneplus/settings/ui/OPScreenColorModeSummary;

    const-string v4, "screen_color_mode_seekbar"

    .line 128
    invoke-virtual {p0, v4}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/oneplus/settings/ui/OPSeekBarPreference;

    iput-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    .line 129
    invoke-virtual {v4, p0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;->setOPColorModeSeekBarChangeListener(Lcom/oneplus/settings/ui/OPSeekBarPreference$OPColorModeSeekBarChangeListener;)V

    const-string v4, "chrominance_seekbar"

    .line 130
    invoke-virtual {p0, v4}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    iput-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceSeekBarPreference:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    .line 131
    invoke-virtual {v4, p0}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->setOPChrominanceSeekBarChangeListener(Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;)V

    .line 132
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportColorToneAdjustment()Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_0

    .line 133
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceSeekBarPreference:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    invoke-virtual {v4, v5}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 135
    :cond_0
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 136
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 137
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 138
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 139
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 140
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 141
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 142
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsNTSC:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 143
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsSRGB:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 144
    iget-object v4, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsDisplayP3:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {v4, p0}, Lcom/android/settings/widget/RadioButtonPreference;->setOnClickListener(Lcom/android/settings/widget/RadioButtonPreference$OnClickListener;)V

    .line 145
    sget-boolean v4, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportMMDisplayColor:Z

    if-eqz v4, :cond_1

    .line 146
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 147
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 148
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    goto :goto_0

    .line 150
    :cond_1
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    sget v4, Lcom/android/settings/R$string;->oneplus_screen_color_mode_default:I

    invoke-virtual {p1, v4}, Landroidx/preference/Preference;->setTitle(I)V

    .line 151
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    sget v4, Lcom/android/settings/R$string;->oneplus_screen_color_mode_defined:I

    invoke-virtual {p1, v4}, Landroidx/preference/Preference;->setTitle(I)V

    .line 152
    invoke-virtual {p0, v3}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 153
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v3, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, v3}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 155
    :goto_0
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v3, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mOPScreenColorModeSummary:Lcom/oneplus/settings/ui/OPScreenColorModeSummary;

    invoke-virtual {p1, v3}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 156
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v3, "oem.dcip3.support"

    invoke-virtual {p1, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    sput-boolean p1, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportDcip3:Z

    if-nez p1, :cond_2

    .line 158
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 160
    :cond_2
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "oem.display.adaptive.mode.support"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    sput-boolean p1, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportAdaptive:Z

    if-nez p1, :cond_3

    .line 162
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 164
    :cond_3
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "oem.display.soft.support"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    sput-boolean p1, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportSoft:Z

    if-nez p1, :cond_4

    .line 166
    invoke-virtual {p0, v2}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 168
    :cond_4
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "device_provisioned"

    invoke-static {p1, v0, v5}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_5

    move v5, v0

    :cond_5
    iput-boolean v5, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mDeviceProvision:Z

    .line 169
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "mDeviceProvision = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mDeviceProvision:Z

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OPScreenColorMode"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 332
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onPause()V

    .line 333
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 334
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    if-nez p3, :cond_0

    return-void

    .line 607
    :cond_0
    iput p2, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeValue:I

    const/16 p3, 0x32

    if-eq p2, p3, :cond_2

    const/16 v0, 0x2f

    if-le p2, v0, :cond_2

    const/16 v0, 0x35

    if-ge p2, v0, :cond_2

    .line 613
    invoke-virtual {p1, p3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 614
    iget-boolean p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mProgressVibratorFlag:Z

    if-eqz p1, :cond_1

    .line 615
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->doVibrate()V

    const/4 p1, 0x0

    .line 616
    iput-boolean p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mProgressVibratorFlag:Z

    :cond_1
    move p2, p3

    goto :goto_0

    :cond_2
    if-ne p2, p3, :cond_3

    .line 619
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->doVibrate()V

    goto :goto_0

    :cond_3
    const/4 p1, 0x1

    .line 621
    iput-boolean p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mProgressVibratorFlag:Z

    .line 624
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string p1, "oem_screen_better_value"

    invoke-static {p0, p1, p2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method

.method public onRadioButtonClicked(Lcom/android/settings/widget/RadioButtonPreference;)V
    .locals 7

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 446
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 447
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 448
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 449
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 450
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 451
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 452
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto/16 :goto_0

    .line 453
    :cond_0
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefaultSettings:Lcom/android/settings/widget/RadioButtonPreference;

    const-string v2, "chrominance_seekbar"

    const-string v3, "screen_color_mode_seekbar"

    const/4 v4, 0x1

    if-ne p1, v1, :cond_2

    .line 454
    invoke-virtual {v1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 455
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 456
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 457
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 458
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 459
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 460
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 461
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result p1

    if-eq p1, v4, :cond_1

    .line 475
    invoke-virtual {p0, v4}, Lcom/oneplus/settings/better/OPScreenColorMode;->onSaveScreenColorModeSettingsValue(I)V

    .line 477
    :cond_1
    invoke-virtual {p0, v3}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 478
    invoke-virtual {p0, v2}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 479
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_11

    .line 480
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    .line 482
    :cond_2
    iget-object v5, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    const/4 v6, 0x2

    if-ne p1, v5, :cond_4

    .line 483
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 484
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 485
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 486
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 487
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 488
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 489
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 490
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result p1

    if-eq p1, v6, :cond_3

    .line 491
    invoke-virtual {p0, v6}, Lcom/oneplus/settings/better/OPScreenColorMode;->onSaveScreenColorModeSettingsValue(I)V

    .line 493
    :cond_3
    invoke-virtual {p0, v3}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 494
    invoke-virtual {p0, v2}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 495
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_11

    .line 496
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    .line 498
    :cond_4
    iget-object v5, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    if-ne p1, v5, :cond_6

    .line 499
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 500
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 501
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 502
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 503
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 504
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 505
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 506
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_5

    .line 507
    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPScreenColorMode;->onSaveScreenColorModeSettingsValue(I)V

    .line 509
    :cond_5
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    .line 510
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mChrominanceSeekBarPreference:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    .line 511
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_11

    sget-boolean p1, Lcom/oneplus/settings/better/OPScreenColorMode;->isSupportMMDisplayColor:Z

    if-eqz p1, :cond_11

    .line 512
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    .line 514
    :cond_6
    iget-object v5, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    if-ne p1, v5, :cond_8

    .line 515
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 516
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 517
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 518
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 519
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 520
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 521
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 522
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result p1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_7

    .line 523
    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPScreenColorMode;->onSaveScreenColorModeSettingsValue(I)V

    .line 525
    :cond_7
    invoke-virtual {p0, v3}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 526
    invoke-virtual {p0, v2}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 527
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_11

    .line 528
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    .line 530
    :cond_8
    iget-object v5, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    if-ne p1, v5, :cond_a

    .line 531
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 532
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 533
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 534
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 535
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 536
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 537
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 538
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result p1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_9

    .line 539
    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPScreenColorMode;->onSaveScreenColorModeSettingsValue(I)V

    .line 541
    :cond_9
    invoke-virtual {p0, v3}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 542
    invoke-virtual {p0, v2}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 543
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_11

    .line 544
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    .line 546
    :cond_a
    iget-object v5, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    if-ne p1, v5, :cond_c

    .line 547
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 548
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 549
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 550
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 551
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 552
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 553
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 554
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result p1

    const/4 v0, 0x6

    if-eq p1, v0, :cond_b

    .line 555
    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPScreenColorMode;->onSaveScreenColorModeSettingsValue(I)V

    .line 557
    :cond_b
    invoke-virtual {p0, v3}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 558
    invoke-virtual {p0, v2}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 559
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_11

    .line 560
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto/16 :goto_0

    .line 562
    :cond_c
    iget-object v5, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    if-ne p1, v5, :cond_e

    .line 563
    invoke-virtual {v1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 564
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeBasicSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 565
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDefinedSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 566
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeDciP3Settings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 567
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdaptiveModelSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 568
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeSoftSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 569
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAutoSettings:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 570
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result p1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_d

    .line 571
    invoke-virtual {p0, v0}, Lcom/oneplus/settings/better/OPScreenColorMode;->onSaveScreenColorModeSettingsValue(I)V

    .line 573
    :cond_d
    invoke-virtual {p0, v3}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 574
    invoke-virtual {p0, v2}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    .line 575
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    if-eqz p1, :cond_11

    .line 576
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeCustomPreferenceCategory:Landroidx/preference/PreferenceCategory;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto :goto_0

    .line 578
    :cond_e
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsNTSC:Lcom/android/settings/widget/RadioButtonPreference;

    const/4 v2, -0x2

    const-string v3, "screen_color_mode_advanced_settings_value"

    if-ne p1, v1, :cond_f

    .line 579
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {p1, v3, v0, v2}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 580
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsNTSC:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 581
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsSRGB:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 582
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsDisplayP3:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_0

    .line 583
    :cond_f
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsSRGB:Lcom/android/settings/widget/RadioButtonPreference;

    if-ne p1, v1, :cond_10

    .line 584
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {p1, v3, v4, v2}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 585
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsNTSC:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 586
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsSRGB:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 587
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsDisplayP3:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_0

    .line 588
    :cond_10
    iget-object v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsDisplayP3:Lcom/android/settings/widget/RadioButtonPreference;

    if-ne p1, v1, :cond_11

    .line 589
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-static {p1, v3, v6, v2}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 590
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsNTSC:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 591
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsSRGB:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 592
    iget-object p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeAdvancedSettingsDisplayP3:Lcom/android/settings/widget/RadioButtonPreference;

    invoke-virtual {p1, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 594
    :cond_11
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "the screen color mode settings value = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "ScreenColorMode"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onResume()V
    .locals 5

    .line 290
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 291
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result v0

    .line 292
    invoke-direct {p0, v0}, Lcom/oneplus/settings/better/OPScreenColorMode;->updateRadioButtons(I)V

    .line 293
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "night_display_activated"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeContentObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x1

    const/4 v4, -0x1

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 295
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "reading_mode_status_manual"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 296
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_daltonizer_enabled"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 298
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_inversion_enabled"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 300
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accessibility_display_grayscale_enabled"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mAccessibilityDisplayDaltonizerAndInversionContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 302
    invoke-direct {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->updatePreferenceStatus()V

    .line 303
    invoke-direct {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->updateAdvancedSettingsRadioButtons()V

    .line 304
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_screen_better_value"

    const/16 v2, 0x32

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeValue:I

    .line 305
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mEnterValue:I

    .line 306
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "screen_color_mode_advanced_settings_value"

    const/4 v3, 0x0

    const/4 v4, -0x2

    invoke-static {v0, v2, v3, v4}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mEnterAdvancedValue:I

    .line 307
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mEnterColorModeValue:I

    return-void
.end method

.method public onSaveScreenColorModeSettingsValue(I)V
    .locals 2

    .line 673
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "screen_color_mode_settings_value"

    const/4 v1, -0x2

    invoke-static {p0, v0, p1, v1}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    return-void
.end method

.method public onSaveScreenColorModeValue(I)V
    .locals 1

    .line 677
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "oem_screen_better_value"

    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 679
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->sendAppTrackerForScreenCustomColorMode()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStop()V
    .locals 15

    .line 177
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onStop()V

    .line 178
    invoke-virtual {p0}, Lcom/oneplus/settings/better/OPScreenColorMode;->getScreenColorModeSettingsValue()I

    move-result v0

    .line 179
    iget v1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mEnterValue:I

    const/4 v2, 0x1

    const/4 v3, 0x3

    const-string v4, "3"

    const-string v5, "2"

    const-string v6, "1"

    const-string v7, "screen_calibration"

    if-eq v0, v1, :cond_2

    const-string v1, "status"

    if-ne v0, v2, :cond_0

    .line 181
    invoke-static {v7, v1, v6}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/16 v8, 0xa

    if-ne v0, v8, :cond_1

    .line 183
    invoke-static {v7, v1, v5}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    if-ne v0, v3, :cond_2

    .line 185
    invoke-static {v7, v1, v4}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/16 v8, 0x32

    const-string v9, "oem_screen_better_value"

    invoke-static {v1, v9, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    const-wide v8, 0x3fe51eb851eb851fL    # 0.66

    const-wide v10, 0x3fd51eb851eb851fL    # 0.33

    const-string v12, "custom"

    if-ne v0, v3, :cond_8

    .line 190
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v13, -0x2

    const-string v14, "screen_color_mode_advanced_settings_value"

    invoke-static {v0, v14, v3, v13}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    .line 191
    iget v3, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mEnterAdvancedValue:I

    if-eq v0, v3, :cond_5

    const-string v3, "advanced"

    if-nez v0, :cond_3

    .line 193
    invoke-static {v7, v3, v6}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    if-ne v0, v2, :cond_4

    .line 195
    invoke-static {v7, v3, v5}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    const/4 v2, 0x2

    if-ne v0, v2, :cond_5

    .line 197
    invoke-static {v7, v3, v4}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    :cond_5
    :goto_1
    iget v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeValue:I

    if-eq v1, v0, :cond_8

    int-to-double v2, v1

    .line 201
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {v0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;->getSeekBarMax()I

    move-result v0

    int-to-double v13, v0

    mul-double/2addr v13, v10

    cmpg-double v0, v2, v13

    if-gtz v0, :cond_6

    .line 202
    invoke-static {v7, v12, v6}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 203
    :cond_6
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {v0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;->getSeekBarMax()I

    move-result v0

    int-to-double v13, v0

    mul-double/2addr v13, v8

    cmpg-double v0, v2, v13

    if-gtz v0, :cond_7

    .line 204
    invoke-static {v7, v12, v5}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 205
    :cond_7
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {v0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;->getSeekBarMax()I

    move-result v0

    if-gt v1, v0, :cond_8

    .line 206
    invoke-static {v7, v12, v4}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    :cond_8
    :goto_2
    iget v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mEnterColorModeValue:I

    if-eq v0, v1, :cond_b

    int-to-double v2, v1

    .line 211
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {v0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;->getSeekBarMax()I

    move-result v0

    int-to-double v13, v0

    mul-double/2addr v13, v10

    cmpg-double v0, v2, v13

    if-gtz v0, :cond_9

    .line 212
    invoke-static {v7, v12, v6}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 213
    :cond_9
    iget-object v0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {v0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;->getSeekBarMax()I

    move-result v0

    int-to-double v10, v0

    mul-double/2addr v10, v8

    cmpg-double v0, v2, v10

    if-gtz v0, :cond_a

    .line 214
    invoke-static {v7, v12, v5}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 215
    :cond_a
    iget-object p0, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mSeekBarpreference:Lcom/oneplus/settings/ui/OPSeekBarPreference;

    invoke-virtual {p0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;->getSeekBarMax()I

    move-result p0

    if-gt v1, p0, :cond_b

    .line 216
    invoke-static {v7, v12, v4}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    :goto_3
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 633
    iget p1, p0, Lcom/oneplus/settings/better/OPScreenColorMode;->mScreenColorModeValue:I

    invoke-virtual {p0, p1}, Lcom/oneplus/settings/better/OPScreenColorMode;->onSaveScreenColorModeValue(I)V

    return-void
.end method
