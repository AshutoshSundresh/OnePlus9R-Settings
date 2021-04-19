.class public Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;
.super Lcom/android/settings/applications/AppInfoWithHeader;
.source "ExternalSourcesDetails.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mActivityManager:Landroid/app/ActivityManager;

.field private mAppBridge:Lcom/android/settings/applications/AppStateInstallAppsBridge;

.field private mAppOpsManager:Landroid/app/AppOpsManager;

.field private mInstallAppsState:Lcom/android/settings/applications/AppStateInstallAppsBridge$InstallAppsState;

.field private mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

.field private mUserManager:Landroid/os/UserManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/android/settings/applications/AppInfoWithHeader;-><init>()V

    return-void
.end method

.method public static getPreferenceSummary(Landroid/content/Context;Lcom/android/settingslib/applications/ApplicationsState$AppEntry;)Ljava/lang/CharSequence;
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    .line 93
    iget-object v1, p1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    if-nez v1, :cond_0

    goto :goto_1

    .line 97
    :cond_0
    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v1}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;

    move-result-object v1

    .line 98
    invoke-static {p0}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v2

    const-string v3, "no_install_unknown_sources"

    .line 99
    invoke-virtual {v2, v3, v1}, Landroid/os/UserManager;->getUserRestrictionSource(Ljava/lang/String;Landroid/os/UserHandle;)I

    move-result v3

    const-string v4, "no_install_unknown_sources_globally"

    .line 101
    invoke-virtual {v2, v4, v1}, Landroid/os/UserManager;->getUserRestrictionSource(Ljava/lang/String;Landroid/os/UserHandle;)I

    move-result v1

    or-int/2addr v1, v3

    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_1

    .line 105
    sget p1, Lcom/android/settings/R$string;->disabled_by_admin:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    if-eqz v1, :cond_2

    .line 107
    sget p1, Lcom/android/settings/R$string;->disabled:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 109
    :cond_2
    new-instance v1, Lcom/android/settings/applications/AppStateInstallAppsBridge;

    invoke-direct {v1, p0, v0, v0}, Lcom/android/settings/applications/AppStateInstallAppsBridge;-><init>(Landroid/content/Context;Lcom/android/settingslib/applications/ApplicationsState;Lcom/android/settings/applications/AppStateBaseBridge$Callback;)V

    iget-object p1, p1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget p1, p1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 110
    invoke-virtual {v1, v0, p1}, Lcom/android/settings/applications/AppStateInstallAppsBridge;->createInstallAppsStateFor(Ljava/lang/String;I)Lcom/android/settings/applications/AppStateInstallAppsBridge$InstallAppsState;

    move-result-object p1

    .line 111
    invoke-virtual {p1}, Lcom/android/settings/applications/AppStateInstallAppsBridge$InstallAppsState;->canInstallApps()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 112
    sget p1, Lcom/android/settings/R$string;->app_permission_summary_allowed:I

    goto :goto_0

    .line 113
    :cond_3
    sget p1, Lcom/android/settings/R$string;->app_permission_summary_not_allowed:I

    .line 111
    :goto_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    :goto_1
    return-object v0
.end method

.method private killApp(I)V
    .locals 1

    .line 156
    invoke-static {p1}, Landroid/os/UserHandle;->isCore(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 159
    :cond_0
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mActivityManager:Landroid/app/ActivityManager;

    const-string v0, "User denied OP_REQUEST_INSTALL_PACKAGES"

    invoke-virtual {p0, p1, v0}, Landroid/app/ActivityManager;->killUid(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected createDialog(II)Landroidx/appcompat/app/AlertDialog;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x328

    return p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 61
    invoke-super {p0, p1}, Lcom/android/settings/applications/AppInfoBase;->onCreate(Landroid/os/Bundle;)V

    .line 63
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 64
    new-instance v0, Lcom/android/settings/applications/AppStateInstallAppsBridge;

    iget-object v1, p0, Lcom/android/settings/applications/AppInfoBase;->mState:Lcom/android/settingslib/applications/ApplicationsState;

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lcom/android/settings/applications/AppStateInstallAppsBridge;-><init>(Landroid/content/Context;Lcom/android/settingslib/applications/ApplicationsState;Lcom/android/settings/applications/AppStateBaseBridge$Callback;)V

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mAppBridge:Lcom/android/settings/applications/AppStateInstallAppsBridge;

    const-string v0, "appops"

    .line 65
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mAppOpsManager:Landroid/app/AppOpsManager;

    .line 66
    const-class v0, Landroid/app/ActivityManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mActivityManager:Landroid/app/ActivityManager;

    .line 67
    invoke-static {p1}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mUserManager:Landroid/os/UserManager;

    .line 69
    sget p1, Lcom/android/settings/R$xml;->external_sources_details:I

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    const-string p1, "external_sources_settings_switch"

    .line 70
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/android/settingslib/RestrictedSwitchPreference;

    iput-object p1, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    .line 71
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    .line 76
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    .line 77
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_3

    .line 78
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mInstallAppsState:Lcom/android/settings/applications/AppStateInstallAppsBridge$InstallAppsState;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/android/settings/applications/AppStateInstallAppsBridge$InstallAppsState;->canInstallApps()Z

    move-result p1

    if-eq p2, p1, :cond_2

    .line 79
    const-class p1, Lcom/android/settings/Settings$ManageAppExternalSourcesActivity;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    .line 80
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    const/4 v1, -0x1

    .line 81
    :cond_0
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->setResult(I)V

    .line 83
    :cond_1
    invoke-virtual {p0, p2}, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->setCanInstallApps(Z)V

    .line 84
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->refreshUi()Z

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    return v1
.end method

.method protected refreshUi()Z
    .locals 4

    .line 164
    iget-object v0, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-nez v0, :cond_0

    goto :goto_0

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mUserManager:Landroid/os/UserManager;

    .line 168
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v2

    invoke-static {v2}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v2

    const-string v3, "no_install_unknown_sources"

    .line 167
    invoke-virtual {v0, v3, v2}, Landroid/os/UserManager;->hasBaseUserRestriction(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 169
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    invoke-virtual {v0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 170
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    sget v3, Lcom/android/settings/R$string;->disabled:I

    invoke-virtual {v0, v3}, Landroidx/preference/Preference;->setSummary(I)V

    .line 171
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    invoke-virtual {p0, v1}, Lcom/android/settingslib/RestrictedSwitchPreference;->setEnabled(Z)V

    return v2

    .line 174
    :cond_1
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    invoke-virtual {v0, v3}, Lcom/android/settingslib/RestrictedSwitchPreference;->checkRestrictionAndSetDisabled(Ljava/lang/String;)V

    .line 175
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    invoke-virtual {v0}, Lcom/android/settingslib/RestrictedSwitchPreference;->isDisabledByAdmin()Z

    move-result v0

    if-nez v0, :cond_2

    .line 176
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    const-string v1, "no_install_unknown_sources_globally"

    invoke-virtual {v0, v1}, Lcom/android/settingslib/RestrictedSwitchPreference;->checkRestrictionAndSetDisabled(Ljava/lang/String;)V

    .line 179
    :cond_2
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    invoke-virtual {v0}, Lcom/android/settingslib/RestrictedSwitchPreference;->isDisabledByAdmin()Z

    move-result v0

    if-eqz v0, :cond_3

    return v2

    .line 182
    :cond_3
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mAppBridge:Lcom/android/settings/applications/AppStateInstallAppsBridge;

    iget-object v1, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v0, v1, v3}, Lcom/android/settings/applications/AppStateInstallAppsBridge;->createInstallAppsStateFor(Ljava/lang/String;I)Lcom/android/settings/applications/AppStateInstallAppsBridge$InstallAppsState;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mInstallAppsState:Lcom/android/settings/applications/AppStateInstallAppsBridge$InstallAppsState;

    .line 191
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mSwitchPref:Lcom/android/settingslib/RestrictedSwitchPreference;

    invoke-virtual {v0}, Lcom/android/settings/applications/AppStateInstallAppsBridge$InstallAppsState;->canInstallApps()Z

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    return v2

    :cond_4
    :goto_0
    return v1
.end method

.method setCanInstallApps(Z)V
    .locals 8
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .line 118
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mAppOpsManager:Landroid/app/AppOpsManager;

    iget-object v1, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    iget-object v2, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageName:Ljava/lang/String;

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    move v5, v3

    :goto_0
    const/16 v6, 0x42

    invoke-virtual {v0, v6, v1, v2, v5}, Landroid/app/AppOpsManager;->setMode(IILjava/lang/String;I)V

    .line 125
    iget-object v0, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v0}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    const/16 v1, 0x3e7

    if-nez v0, :cond_3

    .line 127
    sget-object v0, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    iget-object v2, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageName:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/oneplus/settings/utils/OPUtils;->hasMultiApp(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 128
    iget-object v0, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 129
    invoke-static {v0}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v0

    .line 128
    invoke-static {v1, v0}, Landroid/os/UserHandle;->getUid(II)I

    move-result v0

    .line 130
    iget-object v2, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mAppOpsManager:Landroid/app/AppOpsManager;

    iget-object v5, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageName:Ljava/lang/String;

    if-eqz p1, :cond_1

    move v7, v4

    goto :goto_1

    :cond_1
    move v7, v3

    :goto_1
    invoke-virtual {v2, v6, v0, v5, v7}, Landroid/app/AppOpsManager;->setMode(IILjava/lang/String;I)V

    :cond_2
    if-nez p1, :cond_3

    .line 136
    iget-object v0, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-direct {p0, v0}, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->killApp(I)V

    .line 140
    :cond_3
    iget-object v0, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v0}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    if-ne v0, v1, :cond_5

    .line 141
    iget-object v0, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 142
    invoke-static {v0}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v0

    .line 141
    invoke-static {v4, v0}, Landroid/os/UserHandle;->getUid(II)I

    move-result v0

    .line 143
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mAppOpsManager:Landroid/app/AppOpsManager;

    iget-object v2, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageName:Ljava/lang/String;

    if-eqz p1, :cond_4

    move v5, v4

    goto :goto_2

    :cond_4
    move v5, v3

    :goto_2
    invoke-virtual {v1, v6, v0, v2, v5}, Landroid/app/AppOpsManager;->setMode(IILjava/lang/String;I)V

    .line 148
    :cond_5
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/ExternalSourcesDetails;->mAppOpsManager:Landroid/app/AppOpsManager;

    iget-object v1, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    iget-object p0, p0, Lcom/android/settings/applications/AppInfoBase;->mPackageName:Ljava/lang/String;

    if-eqz p1, :cond_6

    move v3, v4

    :cond_6
    invoke-virtual {v0, v6, v1, p0, v3}, Landroid/app/AppOpsManager;->setMode(IILjava/lang/String;I)V

    return-void
.end method
