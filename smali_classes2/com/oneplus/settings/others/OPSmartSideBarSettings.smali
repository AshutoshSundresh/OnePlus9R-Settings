.class public Lcom/oneplus/settings/others/OPSmartSideBarSettings;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "OPSmartSideBarSettings.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# static fields
.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;


# instance fields
.field private isSideBarSwitchOn:Z

.field private mFullscreenGoneSwitch:Landroidx/preference/SwitchPreference;

.field private mLottieViewPagerPreference:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

.field private mSideBarSeekBarPreference:Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;

.field private mSmartSideBarSwitch:Landroidx/preference/SwitchPreference;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 109
    new-instance v0, Lcom/oneplus/settings/others/OPSmartSideBarSettings$1;

    invoke-direct {v0}, Lcom/oneplus/settings/others/OPSmartSideBarSettings$1;-><init>()V

    sput-object v0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    return-void
.end method

.method private updateUI()V
    .locals 2

    .line 77
    iget-object v0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mSideBarSeekBarPreference:Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;

    iget-boolean v1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->isSideBarSwitchOn:Z

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->setEnabled(Z)V

    .line 78
    iget-object v0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mFullscreenGoneSwitch:Landroidx/preference/SwitchPreference;

    iget-boolean p0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->isSideBarSwitchOn:Z

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setEnabled(Z)V

    return-void
.end method


# virtual methods
.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x270f

    return p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 44
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 45
    sget p1, Lcom/android/settings/R$xml;->op_smart_side_bar_settings:I

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    const-string p1, "lottie_view_pager_preference"

    .line 46
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    iput-object p1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mLottieViewPagerPreference:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    const-string p1, "side_bar_switch"

    .line 47
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/SwitchPreference;

    iput-object p1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mSmartSideBarSwitch:Landroidx/preference/SwitchPreference;

    const-string p1, "side_bar_fullscreen_gone_switch"

    .line 48
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/SwitchPreference;

    iput-object p1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mFullscreenGoneSwitch:Landroidx/preference/SwitchPreference;

    const-string p1, "side_bar_transparent_seekbar"

    .line 49
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;

    iput-object p1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mSideBarSeekBarPreference:Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;

    .line 50
    iget-object p1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mSmartSideBarSwitch:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 51
    iget-object p1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mFullscreenGoneSwitch:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 84
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onDestroy()V

    .line 85
    iget-object p0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mLottieViewPagerPreference:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    if-eqz p0, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->releaseAnim()V

    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 3

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPreferenceChange newValue"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OPLittleWindowSettings"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mSmartSideBarSwitch:Landroidx/preference/SwitchPreference;

    const/4 v1, 0x1

    const/4 v2, -0x2

    if-ne p1, v0, :cond_0

    .line 94
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->isSideBarSwitchOn:Z

    .line 95
    iget-object p1, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mSmartSideBarSwitch:Landroidx/preference/SwitchPreference;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 96
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 97
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    const-string v0, "edge_panel_toggle"

    .line 96
    invoke-static {p1, v0, p2, v2}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 98
    invoke-direct {p0}, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->updateUI()V

    return v1

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mFullscreenGoneSwitch:Landroidx/preference/SwitchPreference;

    if-ne p1, v0, :cond_1

    .line 101
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 102
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    .line 103
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const-string p2, "edge_panel_hide_float_bar"

    .line 102
    invoke-static {p0, p2, p1, v2}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public onResume()V
    .locals 6

    .line 56
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 57
    iget-object v0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mLottieViewPagerPreference:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {v0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->startAnim()V

    .line 60
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "edge_panel_toggle"

    const/4 v2, 0x0

    const/4 v3, -0x2

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->isSideBarSwitchOn:Z

    .line 62
    iget-object v4, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mSmartSideBarSwitch:Landroidx/preference/SwitchPreference;

    invoke-virtual {v4, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 63
    iget-object v0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mFullscreenGoneSwitch:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "edge_panel_hide_float_bar"

    invoke-static {v4, v5, v2, v3}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v3

    if-ne v3, v1, :cond_2

    move v2, v1

    :cond_2
    invoke-virtual {v0, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 65
    invoke-direct {p0}, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->updateUI()V

    return-void
.end method

.method public onStop()V
    .locals 0

    .line 70
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onStop()V

    .line 71
    iget-object p0, p0, Lcom/oneplus/settings/others/OPSmartSideBarSettings;->mLottieViewPagerPreference:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    if-eqz p0, :cond_0

    .line 72
    invoke-virtual {p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->stopAnim()V

    :cond_0
    return-void
.end method
