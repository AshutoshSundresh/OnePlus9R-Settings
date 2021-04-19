.class public abstract Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;
.super Lcom/android/settingslib/core/AbstractPreferenceController;
.source "DefaultAppPreferenceController.java"

# interfaces
.implements Lcom/android/settings/core/PreferenceControllerMixin;


# instance fields
.field protected final mPackageManager:Landroid/content/pm/PackageManager;

.field protected mUserId:I

.field protected final mUserManager:Landroid/os/UserManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 50
    invoke-direct {p0, p1}, Lcom/android/settingslib/core/AbstractPreferenceController;-><init>(Landroid/content/Context;)V

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string/jumbo v0, "user"

    .line 52
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/UserManager;

    iput-object p1, p0, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->mUserManager:Landroid/os/UserManager;

    .line 53
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p1

    iput p1, p0, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->mUserId:I

    return-void
.end method

.method private synthetic lambda$mayUpdateGearIcon$0(Landroid/content/Intent;Lcom/android/settings/widget/GearPreference;)V
    .locals 0

    .line 92
    iget-object p0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private mayUpdateGearIcon(Lcom/android/settingslib/applications/DefaultAppInfo;Landroidx/preference/Preference;)V
    .locals 3

    .line 81
    instance-of v0, p2, Lcom/android/settings/widget/GearPreference;

    if-nez v0, :cond_0

    return-void

    .line 85
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->getSettingIntent(Lcom/android/settingslib/applications/DefaultAppInfo;)Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 87
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-nez v1, :cond_1

    return-void

    .line 89
    :cond_1
    iget-object v2, p0, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 91
    check-cast p2, Lcom/android/settings/widget/GearPreference;

    new-instance v0, Lcom/android/settings/applications/defaultapps/-$$Lambda$DefaultAppPreferenceController$P93yGe3NhKzPqeqQwHkMaXpVB1M;

    invoke-direct {v0, p0, p1}, Lcom/android/settings/applications/defaultapps/-$$Lambda$DefaultAppPreferenceController$P93yGe3NhKzPqeqQwHkMaXpVB1M;-><init>(Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;Landroid/content/Intent;)V

    invoke-virtual {p2, v0}, Lcom/android/settings/widget/GearPreference;->setOnGearClickListener(Lcom/android/settings/widget/GearPreference$OnGearClickListener;)V

    goto :goto_0

    .line 94
    :cond_2
    check-cast p2, Lcom/android/settings/widget/GearPreference;

    invoke-virtual {p2, v0}, Lcom/android/settings/widget/GearPreference;->setOnGearClickListener(Lcom/android/settings/widget/GearPreference$OnGearClickListener;)V

    goto :goto_0

    .line 97
    :cond_3
    check-cast p2, Lcom/android/settings/widget/GearPreference;

    invoke-virtual {p2, v0}, Lcom/android/settings/widget/GearPreference;->setOnGearClickListener(Lcom/android/settings/widget/GearPreference$OnGearClickListener;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getDefaultAppIcon()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 117
    invoke-virtual {p0}, Lcom/android/settingslib/core/AbstractPreferenceController;->isAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 120
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->getDefaultAppInfo()Lcom/android/settingslib/applications/DefaultAppInfo;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 122
    invoke-virtual {p0}, Lcom/android/settingslib/applications/DefaultAppInfo;->loadIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_1
    return-object v1
.end method

.method protected abstract getDefaultAppInfo()Lcom/android/settingslib/applications/DefaultAppInfo;
.end method

.method public getDefaultAppLabel()Ljava/lang/CharSequence;
    .locals 2

    .line 128
    invoke-virtual {p0}, Lcom/android/settingslib/core/AbstractPreferenceController;->isAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 131
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->getDefaultAppInfo()Lcom/android/settingslib/applications/DefaultAppInfo;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 133
    invoke-virtual {p0}, Lcom/android/settingslib/applications/DefaultAppInfo;->loadLabel()Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :cond_1
    return-object v1
.end method

.method protected getSettingIntent(Lcom/android/settingslib/applications/DefaultAppInfo;)Landroid/content/Intent;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public synthetic lambda$mayUpdateGearIcon$0$DefaultAppPreferenceController(Landroid/content/Intent;Lcom/android/settings/widget/GearPreference;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->lambda$mayUpdateGearIcon$0(Landroid/content/Intent;Lcom/android/settings/widget/GearPreference;)V

    return-void
.end method

.method public updateState(Landroidx/preference/Preference;)V
    .locals 4

    .line 58
    invoke-virtual {p0}, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->getDefaultAppInfo()Lcom/android/settingslib/applications/DefaultAppInfo;

    move-result-object v0

    .line 59
    invoke-virtual {p0}, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->getDefaultAppLabel()Ljava/lang/CharSequence;

    move-result-object v1

    .line 60
    instance-of v2, p1, Lcom/android/settingslib/TwoTargetPreference;

    if-eqz v2, :cond_0

    .line 64
    move-object v2, p1

    check-cast v2, Lcom/android/settingslib/TwoTargetPreference;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/settingslib/TwoTargetPreference;->setIconSize(I)V

    .line 66
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 67
    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 68
    invoke-virtual {p0}, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->getDefaultAppIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/android/settings/Utils;->setSafeIcon(Landroidx/preference/Preference;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_1
    const-string v1, "DefaultAppPrefControl"

    const-string v2, "No default app"

    .line 70
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    sget v1, Lcom/android/settings/R$string;->app_list_preference_none:I

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setSummary(I)V

    .line 74
    sget v1, Lcom/android/settings/R$drawable;->ic_remove_circle:I

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setIcon(I)V

    .line 77
    :goto_0
    invoke-direct {p0, v0, p1}, Lcom/android/settings/applications/defaultapps/DefaultAppPreferenceController;->mayUpdateGearIcon(Lcom/android/settingslib/applications/DefaultAppInfo;Landroidx/preference/Preference;)V

    return-void
.end method
