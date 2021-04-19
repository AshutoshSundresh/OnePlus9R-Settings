.class public Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;
.super Lcom/android/settings/dashboard/DashboardFragment;
.source "OPVideoGraphicsDynamicOptimizationSettings.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# static fields
.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settingslib/search/Indexable$SearchIndexProvider;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mVideoEnhancerSwitch:Landroidx/preference/SwitchPreference;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 98
    new-instance v0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings$1;

    invoke-direct {v0}, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings$1;-><init>()V

    sput-object v0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settingslib/search/Indexable$SearchIndexProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/android/settings/dashboard/DashboardFragment;-><init>()V

    return-void
.end method

.method private static buildPreferenceControllers(Landroid/content/Context;Lcom/android/settingslib/core/lifecycle/Lifecycle;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/settingslib/core/lifecycle/Lifecycle;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/settingslib/core/AbstractPreferenceController;",
            ">;"
        }
    .end annotation

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    new-instance v1, Lcom/oneplus/settings/OPGraphicsOptimizationPreferenceController;

    invoke-direct {v1, p0, p1}, Lcom/oneplus/settings/OPGraphicsOptimizationPreferenceController;-><init>(Landroid/content/Context;Lcom/android/settingslib/core/lifecycle/Lifecycle;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method


# virtual methods
.method protected createPreferenceControllers(Landroid/content/Context;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/settingslib/core/AbstractPreferenceController;",
            ">;"
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->getSettingsLifecycle()Lcom/android/settingslib/core/lifecycle/Lifecycle;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->buildPreferenceControllers(Landroid/content/Context;Lcom/android/settingslib/core/lifecycle/Lifecycle;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method protected getLogTag()Ljava/lang/String;
    .locals 0

    const-string p0, "OPVideoGraphicsDynamicOptimizationSettings"

    return-object p0
.end method

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x270f

    return p0
.end method

.method protected getPreferenceScreenResId()I
    .locals 0

    .line 95
    sget p0, Lcom/android/settings/R$xml;->op_video_graphics_dynamic_optimization:I

    return p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 53
    invoke-super {p0, p1}, Lcom/android/settings/dashboard/DashboardFragment;->onCreate(Landroid/os/Bundle;)V

    .line 54
    sget-object p1, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    iput-object p1, p0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->mContext:Landroid/content/Context;

    const-string p1, "video_enhancer_switch"

    .line 56
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/SwitchPreference;

    iput-object p1, p0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->mVideoEnhancerSwitch:Landroidx/preference/SwitchPreference;

    .line 58
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 60
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportIRISHQV()Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p1, "persist.sys.oem.vendor.media.vpp.enable"

    .line 61
    invoke-static {p1, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 62
    iget-object p0, p0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->mVideoEnhancerSwitch:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, p1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_0

    .line 64
    :cond_0
    iget-object p1, p0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v1, "op_iris_video_sdr2hdr_status"

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    .line 65
    iget-object p0, p0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->mVideoEnhancerSwitch:Landroidx/preference/SwitchPreference;

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    move v0, v1

    :cond_1
    invoke-virtual {p0, v0}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    :goto_0
    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 1

    .line 113
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 114
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportIRISHQV()Z

    move-result p2

    if-nez p2, :cond_1

    if-eqz p1, :cond_0

    const-string p2, "true"

    goto :goto_0

    :cond_0
    const-string p2, "false"

    :goto_0
    const-string v0, "persist.sys.oem.vendor.media.vpp.enable"

    .line 115
    invoke-static {v0, p2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    iget-object p0, p0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string p2, "op_video_enhancer"

    invoke-static {p0, p2, p1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_2

    .line 118
    :cond_1
    iget-object p0, p0, Lcom/oneplus/settings/OPVideoGraphicsDynamicOptimizationSettings;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string p2, "op_iris_video_sdr2hdr_status"

    invoke-static {p0, p2, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    if-eqz p1, :cond_2

    const-string p0, "1"

    goto :goto_1

    :cond_2
    const-string p0, "0"

    :goto_1
    const-string p1, "video_enhancer"

    const-string p2, "status"

    .line 119
    invoke-static {p1, p2, p0}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    const/4 p0, 0x1

    return p0
.end method
