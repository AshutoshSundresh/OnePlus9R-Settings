.class public Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;
.super Lcom/android/settings/core/BasePreferenceController;
.source "AppButtonsPreferenceController.java"

# interfaces
.implements Lcom/android/settings/core/PreferenceControllerMixin;
.implements Lcom/android/settingslib/core/lifecycle/LifecycleObserver;
.implements Lcom/android/settingslib/core/lifecycle/events/OnResume;
.implements Lcom/android/settingslib/core/lifecycle/events/OnDestroy;
.implements Lcom/android/settingslib/applications/ApplicationsState$Callbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$DisableChangerRunnable;,
        Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$ForceStopButtonListener;,
        Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$UninstallAndDisableButtonListener;
    }
.end annotation


# static fields
.field private static final ACTION_QUICK_SETTING_TILE:Ljava/lang/String; = "com.oneplus.systemui.qs.hide_tile"

.field public static final APP_CHG:Ljava/lang/String; = "chg"

.field private static final BRICK_MODE_SERVICE_TILE:Ljava/lang/String; = "custom(com.oneplus.brickmode/.service.BreathModeTileService)"

.field private static final KEY_ACTION_BUTTONS:Ljava/lang/String; = "action_buttons"

.field private static final KEY_GOOGLE__INPUTMETHOD:Ljava/lang/String; = "com.google.android.inputmethod.latin"

.field private static final KEY_LATIN_INPUTMETHOD:Ljava/lang/String; = "com.android.inputmethod.latin"

.field private static final KEY_MARKET:Ljava/lang/String; = "com.heytap.market"

.field public static final KEY_REMOVE_TASK_WHEN_FINISHING:Ljava/lang/String; = "remove_task_when_finishing"

.field private static final LOCAL_LOGV:Z = false

.field private static final PACKAGENAME_BRICKMODE:Ljava/lang/String; = "com.oneplus.brickmode"

.field private static final PACKAGENAME_ECHOLOCATE:Ljava/lang/String; = "com.tmobile.echolocate"

.field private static final PACKAGENAME_FAST_APPLICATION:Ljava/lang/String; = "com.nearme.instant.platform"

.field private static final PACKAGENAME_HEYTAP_CLOUD:Ljava/lang/String; = "com.heytap.cloud"

.field private static final PACKAGENAME_MOBILE_INSTALLER:Ljava/lang/String; = "com.sprint.ce.updater"

.field private static final PACKAGENAME_WALLPAPERRESOURCES:Ljava/lang/String; = "net.oneplus.wallpaperresources"

.field private static final TAG:Ljava/lang/String; = "AppButtonsPrefCtl"

.field private static final TILE_LOCATION:I = 0x10


# instance fields
.field private mAccessedFromAutoRevoke:Z

.field private final mActivity:Lcom/android/settings/SettingsActivity;

.field mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

.field private mAppLaunchIntent:Landroid/content/Intent;

.field private final mApplicationFeatureProvider:Lcom/android/settings/applications/ApplicationFeatureProvider;

.field private mAppsControlDisallowedAdmin:Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

.field private mAppsControlDisallowedBySystem:Z

.field mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

.field private final mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

.field mDisableAfterUninstall:Z

.field private final mDpm:Landroid/app/admin/DevicePolicyManager;

.field private mFinishing:Z

.field private final mFragment:Lcom/android/settings/core/InstrumentedPreferenceFragment;

.field final mHomePackages:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mListeningToPackageRemove:Z

.field private final mMetricsFeatureProvider:Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;

.field private final mOverlayManager:Landroid/content/om/OverlayManager;

.field mPackageInfo:Landroid/content/pm/PackageInfo;

.field mPackageName:Ljava/lang/String;

.field private final mPackageRemovedReceiver:Landroid/content/BroadcastReceiver;

.field private final mPm:Landroid/content/pm/PackageManager;

.field private final mRequestRemoveDeviceAdmin:I

.field private final mRequestUninstall:I

.field private mScreen:Landroidx/preference/PreferenceScreen;

.field private mSession:Lcom/android/settingslib/applications/ApplicationsState$Session;

.field private mSessionId:J

.field mState:Lcom/android/settingslib/applications/ApplicationsState;

.field private mUpdatedSysApp:Z

.field private final mUserId:I

.field private final mUserManager:Landroid/os/UserManager;


# direct methods
.method public constructor <init>(Lcom/android/settings/SettingsActivity;Lcom/android/settings/core/InstrumentedPreferenceFragment;Lcom/android/settingslib/core/lifecycle/Lifecycle;Ljava/lang/String;Lcom/android/settingslib/applications/ApplicationsState;II)V
    .locals 3

    const-string v0, "action_buttons"

    .line 175
    invoke-direct {p0, p1, v0}, Lcom/android/settings/core/BasePreferenceController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 108
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mHomePackages:Ljava/util/HashSet;

    const/4 v0, 0x0

    .line 118
    iput-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDisableAfterUninstall:Z

    .line 141
    iput-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUpdatedSysApp:Z

    .line 142
    iput-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mListeningToPackageRemove:Z

    .line 143
    iput-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFinishing:Z

    .line 736
    new-instance v1, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$1;

    invoke-direct {v1, p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$1;-><init>(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)V

    iput-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

    .line 950
    new-instance v1, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$2;

    invoke-direct {v1, p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$2;-><init>(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)V

    iput-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageRemovedReceiver:Landroid/content/BroadcastReceiver;

    .line 177
    instance-of v1, p2, Lcom/android/settings/applications/appinfo/ButtonActionDialogFragment$AppButtonsDialogListener;

    if-eqz v1, :cond_2

    .line 182
    invoke-static {p1}, Lcom/android/settings/overlay/FeatureFactory;->getFactory(Landroid/content/Context;)Lcom/android/settings/overlay/FeatureFactory;

    move-result-object v1

    .line 183
    invoke-virtual {v1}, Lcom/android/settings/overlay/FeatureFactory;->getMetricsFeatureProvider()Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;

    move-result-object v2

    iput-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mMetricsFeatureProvider:Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;

    .line 184
    invoke-virtual {v1, p1}, Lcom/android/settings/overlay/FeatureFactory;->getApplicationFeatureProvider(Landroid/content/Context;)Lcom/android/settings/applications/ApplicationFeatureProvider;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mApplicationFeatureProvider:Lcom/android/settings/applications/ApplicationFeatureProvider;

    .line 185
    iput-object p5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mState:Lcom/android/settingslib/applications/ApplicationsState;

    const-string p5, "device_policy"

    .line 186
    invoke-virtual {p1, p5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Landroid/app/admin/DevicePolicyManager;

    iput-object p5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDpm:Landroid/app/admin/DevicePolicyManager;

    const-string/jumbo p5, "user"

    .line 187
    invoke-virtual {p1, p5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Landroid/os/UserManager;

    iput-object p5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserManager:Landroid/os/UserManager;

    .line 188
    invoke-virtual {p1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p5

    iput-object p5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    .line 189
    const-class p5, Landroid/content/om/OverlayManager;

    invoke-virtual {p1, p5}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Landroid/content/om/OverlayManager;

    iput-object p5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mOverlayManager:Landroid/content/om/OverlayManager;

    .line 190
    iput-object p4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;

    .line 191
    iput-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    .line 192
    iput-object p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFragment:Lcom/android/settings/core/InstrumentedPreferenceFragment;

    .line 193
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p2

    iput p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserId:I

    .line 194
    iput p6, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mRequestUninstall:I

    .line 195
    iput p7, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mRequestRemoveDeviceAdmin:I

    .line 196
    iget-object p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    iget-object p5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;

    invoke-virtual {p2, p5}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    iput-object p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppLaunchIntent:Landroid/content/Intent;

    .line 197
    invoke-virtual {p1}, Lcom/android/settings/SettingsActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string p2, "android.intent.action.AUTO_REVOKE_PERMISSIONS"

    const-wide/16 p5, 0x0

    invoke-virtual {p1, p2, p5, p6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mSessionId:J

    cmp-long p1, p1, p5

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    move v0, p2

    .line 198
    :cond_0
    iput-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAccessedFromAutoRevoke:Z

    if-eqz p4, :cond_1

    .line 201
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mState:Lcom/android/settingslib/applications/ApplicationsState;

    iget p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserId:I

    invoke-virtual {p1, p4, p2}, Lcom/android/settingslib/applications/ApplicationsState;->getEntry(Ljava/lang/String;I)Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    .line 202
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mState:Lcom/android/settingslib/applications/ApplicationsState;

    invoke-virtual {p1, p0, p3}, Lcom/android/settingslib/applications/ApplicationsState;->newSession(Lcom/android/settingslib/applications/ApplicationsState$Callbacks;Landroidx/lifecycle/Lifecycle;)Lcom/android/settingslib/applications/ApplicationsState$Session;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mSession:Lcom/android/settingslib/applications/ApplicationsState$Session;

    .line 203
    invoke-virtual {p3, p0}, Lcom/android/settingslib/core/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    goto :goto_0

    .line 205
    :cond_1
    iput-boolean p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFinishing:Z

    :goto_0
    return-void

    .line 178
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Fragment should implement AppButtonsDialogListener"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic access$000(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Z
    .locals 0

    .line 98
    iget-boolean p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAccessedFromAutoRevoke:Z

    return p0
.end method

.method static synthetic access$100(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)J
    .locals 2

    .line 98
    iget-wide v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mSessionId:J

    return-wide v0
.end method

.method static synthetic access$1000(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Z
    .locals 0

    .line 98
    iget-boolean p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppsControlDisallowedBySystem:Z

    return p0
.end method

.method static synthetic access$1100(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Z
    .locals 0

    .line 98
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isDisabledUntilUsed()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Z
    .locals 0

    .line 98
    iget-boolean p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUpdatedSysApp:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Z
    .locals 0

    .line 98
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isSingleUser()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;I)V
    .locals 0

    .line 98
    invoke-direct {p0, p1}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->showDialogInner(I)V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Landroid/content/pm/PackageManager;
    .locals 0

    .line 98
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;
    .locals 0

    .line 98
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppsControlDisallowedAdmin:Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;Z)V
    .locals 0

    .line 98
    invoke-direct {p0, p1}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->hideBrickModeInSystemUI(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)I
    .locals 0

    .line 98
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->getUid()I

    move-result p0

    return p0
.end method

.method static synthetic access$2000(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Z
    .locals 0

    .line 98
    iget-boolean p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFinishing:Z

    return p0
.end method

.method static synthetic access$300(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Landroid/app/admin/DevicePolicyManager;
    .locals 0

    .line 98
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDpm:Landroid/app/admin/DevicePolicyManager;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)V
    .locals 0

    .line 98
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->stopListeningToPackageRemove()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Lcom/android/settings/SettingsActivity;
    .locals 0

    .line 98
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;
    .locals 0

    .line 98
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mMetricsFeatureProvider:Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)I
    .locals 0

    .line 98
    iget p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mRequestRemoveDeviceAdmin:I

    return p0
.end method

.method static synthetic access$800(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)Lcom/android/settings/core/InstrumentedPreferenceFragment;
    .locals 0

    .line 98
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFragment:Lcom/android/settings/core/InstrumentedPreferenceFragment;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)I
    .locals 0

    .line 98
    iget p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserId:I

    return p0
.end method

.method private getUid()I
    .locals 1

    .line 855
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-nez v0, :cond_0

    .line 856
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->retrieveAppEntry()V

    .line 858
    :cond_0
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-eqz p0, :cond_1

    .line 859
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->uid:I

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method private hideBrickModeInSystemUI(Z)V
    .locals 3

    .line 913
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.oneplus.systemui.qs.hide_tile"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "tile"

    const-string v2, "custom(com.oneplus.brickmode/.service.BreathModeTileService)"

    .line 914
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "hide"

    .line 915
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz p1, :cond_0

    .line 918
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->saveBrickModeLocation()V

    goto :goto_0

    .line 920
    :cond_0
    iget-object p1, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const/16 v1, 0x10

    const-string v2, "sysui_qs_tiles_brickmode_location"

    invoke-static {p1, v2, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    .line 921
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "get location : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "BrickModeLocation"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "position"

    .line 922
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 925
    :goto_0
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private initButtonPreference()V
    .locals 3

    .line 802
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mScreen:Landroidx/preference/PreferenceScreen;

    const-string v1, "action_buttons"

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v1, Lcom/android/settings/R$string;->launch_instant_app:I

    .line 804
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton1Text(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v1, Lcom/android/settings/R$drawable;->ic_settings_open:I

    .line 805
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton1Icon(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    new-instance v1, Lcom/android/settings/applications/appinfo/-$$Lambda$AppButtonsPreferenceController$enw5jpYO1cJrg3i8F_CFkg0AY6w;

    invoke-direct {v1, p0}, Lcom/android/settings/applications/appinfo/-$$Lambda$AppButtonsPreferenceController$enw5jpYO1cJrg3i8F_CFkg0AY6w;-><init>(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;)V

    .line 806
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton1OnClickListener(Landroid/view/View$OnClickListener;)Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v1, Lcom/android/settings/R$string;->uninstall_text:I

    .line 807
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Text(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v1, Lcom/android/settings/R$drawable;->ic_settings_delete:I

    .line 808
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Icon(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    new-instance v1, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$UninstallAndDisableButtonListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$UninstallAndDisableButtonListener;-><init>(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$1;)V

    .line 809
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2OnClickListener(Landroid/view/View$OnClickListener;)Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v1, Lcom/android/settings/R$string;->force_stop:I

    .line 810
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton3Text(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v1, Lcom/android/settings/R$drawable;->ic_settings_force_stop:I

    .line 811
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton3Icon(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    new-instance v1, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$ForceStopButtonListener;

    invoke-direct {v1, p0, v2}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$ForceStopButtonListener;-><init>(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$1;)V

    .line 812
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton3OnClickListener(Landroid/view/View$OnClickListener;)Lcom/android/settingslib/widget/ActionButtonsPreference;

    const/4 v1, 0x0

    .line 813
    invoke-virtual {v0, v1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton3Enabled(Z)Lcom/android/settingslib/widget/ActionButtonsPreference;

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    return-void
.end method

.method private isDisabledUntilUsed()Z
    .locals 1

    .line 719
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object p0, p0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->enabledSetting:I

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isFilterPackage(Ljava/lang/String;)Z
    .locals 0

    const-string p0, "com.oneplus.brickmode"

    .line 714
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private isInstantApp()Z
    .locals 0

    .line 865
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    invoke-static {p0}, Lcom/android/settingslib/applications/AppUtils;->isInstant(Landroid/content/pm/ApplicationInfo;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isSingleUser()Z
    .locals 2

    .line 731
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {p0}, Landroid/os/UserManager;->getUserCount()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    .line 733
    invoke-static {}, Landroid/os/UserManager;->isSplitSystemUser()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    return v0
.end method

.method private isSystemModule()Z
    .locals 1

    .line 869
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/android/settingslib/applications/AppUtils;->isSystemModule(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isSystemPersistApp()Z
    .locals 2

    .line 877
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 878
    invoke-static {v1, v0}, Lcom/android/settingslib/applications/AppUtils;->isSystemModule(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 879
    invoke-static {v0, v1}, Lcom/android/settingslib/applications/AppUtils;->isMainlineModule(Landroid/content/pm/PackageManager;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isFilterPackage(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private synthetic lambda$initButtonPreference$0(Landroid/view/View;)V
    .locals 0

    .line 806
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->launchApplication()V

    return-void
.end method

.method private launchApplication()V
    .locals 8

    .line 835
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppLaunchIntent:Landroid/content/Intent;

    if-eqz v0, :cond_1

    .line 836
    iget-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAccessedFromAutoRevoke:Z

    if-eqz v0, :cond_0

    .line 838
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sessionId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mSessionId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " uninstalling "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " with uid "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 839
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->getUid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", reached from auto revoke"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppButtonsPrefCtl"

    .line 838
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v2, 0x110

    .line 840
    iget-wide v3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mSessionId:J

    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->getUid()I

    move-result v5

    iget-object v6, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;

    const/4 v7, 0x6

    invoke-static/range {v2 .. v7}, Lcom/android/settings/core/instrumentation/SettingsStatsLog;->write(IJILjava/lang/String;I)V

    .line 845
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppLaunchIntent:Landroid/content/Intent;

    new-instance v2, Landroid/os/UserHandle;

    iget p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserId:I

    invoke-direct {v2, p0}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 847
    invoke-virtual {p0}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method private refreshAndFinishIfPossible(Z)V
    .locals 1

    .line 573
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->refreshUi()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 574
    invoke-direct {p0, v0, p1}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->setIntentAndFinish(ZZ)V

    goto :goto_0

    .line 576
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->startListeningToPackageRemove()V

    :goto_0
    return-void
.end method

.method private saveBrickModeLocation()V
    .locals 6

    .line 930
    iget-object v0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "sysui_qs_tiles"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v1, "custom(com.oneplus.brickmode/.service.BreathModeTileService)"

    .line 933
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    const-string v2, ","

    .line 934
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v2, v0

    move v4, v3

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v5, v0, v3

    .line 935
    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    move v3, v4

    .line 941
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "save location : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BrickModeLocation"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 942
    iget-object p0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "sysui_qs_tiles_brickmode_location"

    invoke-static {p0, v0, v3}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :cond_3
    return-void
.end method

.method private setIntentAndFinish(ZZ)V
    .locals 2

    .line 565
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "chg"

    .line 566
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "remove_task_when_finishing"

    .line 567
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 568
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    const/4 p2, -0x1

    invoke-virtual {p1, p2, v0}, Lcom/android/settings/SettingsActivity;->finishPreferencePanel(ILandroid/content/Intent;)V

    const/4 p1, 0x1

    .line 569
    iput-boolean p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFinishing:Z

    return-void
.end method

.method private showDialogInner(I)V
    .locals 3

    .line 724
    invoke-static {p1}, Lcom/android/settings/applications/appinfo/ButtonActionDialogFragment;->newInstance(I)Lcom/android/settings/applications/appinfo/ButtonActionDialogFragment;

    move-result-object v0

    .line 725
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFragment:Lcom/android/settings/core/InstrumentedPreferenceFragment;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 726
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dialog "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private signaturesMatch(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 749
    :try_start_0
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {p0, p1, p2}, Landroid/content/pm/PackageManager;->checkSignatures(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :catch_0
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private startListeningToPackageRemove()V
    .locals 2

    .line 817
    iget-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mListeningToPackageRemove:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 820
    iput-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mListeningToPackageRemove:Z

    .line 821
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "package"

    .line 822
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 823
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageRemovedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, p0, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private stopListeningToPackageRemove()V
    .locals 1

    .line 827
    iget-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mListeningToPackageRemove:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 830
    iput-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mListeningToPackageRemove:Z

    .line 831
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageRemovedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, p0}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic copy()V
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->copy()V

    return-void
.end method

.method public displayPreference(Landroidx/preference/PreferenceScreen;)V
    .locals 0

    .line 217
    invoke-super {p0, p1}, Lcom/android/settings/core/BasePreferenceController;->displayPreference(Landroidx/preference/PreferenceScreen;)V

    .line 218
    iput-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mScreen:Landroidx/preference/PreferenceScreen;

    .line 219
    invoke-virtual {p0}, Lcom/android/settings/core/BasePreferenceController;->isAvailable()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 220
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->initButtonPreference()V

    :cond_0
    return-void
.end method

.method forceStopPackage(Ljava/lang/String;)V
    .locals 6

    .line 653
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mMetricsFeatureProvider:Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    .line 654
    invoke-virtual {v0, v1}, Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;->getAttribution(Landroid/app/Activity;)I

    move-result v1

    iget-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFragment:Lcom/android/settings/core/InstrumentedPreferenceFragment;

    .line 656
    invoke-interface {v2}, Lcom/android/settingslib/core/instrumentation/Instrumentable;->getMetricsCategory()I

    move-result v3

    const/16 v2, 0x327

    const/4 v5, 0x0

    move-object v4, p1

    .line 653
    invoke-virtual/range {v0 .. v5}, Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;->action(IIILjava/lang/String;I)V

    .line 659
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 661
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Stopping package "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "AppButtonsPrefCtl"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 662
    invoke-virtual {v0, p1}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V

    .line 663
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v0}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v0

    .line 664
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mState:Lcom/android/settingslib/applications/ApplicationsState;

    invoke-virtual {v1, p1, v0}, Lcom/android/settingslib/applications/ApplicationsState;->invalidatePackage(Ljava/lang/String;I)V

    .line 665
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mState:Lcom/android/settingslib/applications/ApplicationsState;

    invoke-virtual {v1, p1, v0}, Lcom/android/settingslib/applications/ApplicationsState;->getEntry(Ljava/lang/String;I)Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 667
    iput-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    .line 669
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->updateForceStopButton()V

    return-void
.end method

.method public getAvailabilityStatus()I
    .locals 1

    .line 212
    iget-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFinishing:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isInstantApp()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isSystemModule()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x4

    :goto_1
    return p0
.end method

.method public bridge synthetic getBackgroundWorkerClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/android/settings/slices/SliceBackgroundWorker;",
            ">;"
        }
    .end annotation

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->getBackgroundWorkerClass()Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getIntentFilter()Landroid/content/IntentFilter;
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->getIntentFilter()Landroid/content/IntentFilter;

    move-result-object p0

    return-object p0
.end method

.method public getPreferenceKey()Ljava/lang/String;
    .locals 0

    const-string p0, "action_buttons"

    return-object p0
.end method

.method public handleActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 326
    iget p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mRequestUninstall:I

    const/4 p3, 0x0

    if-ne p1, p2, :cond_1

    .line 327
    iget-boolean p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDisableAfterUninstall:Z

    if-eqz p1, :cond_0

    .line 328
    iput-boolean p3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDisableAfterUninstall:Z

    .line 329
    new-instance p1, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$DisableChangerRunnable;

    iget-object p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    iget-object p3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object p3, p3, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object p3, p3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/4 v0, 0x3

    invoke-direct {p1, p0, p2, p3, v0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$DisableChangerRunnable;-><init>(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;Landroid/content/pm/PackageManager;Ljava/lang/String;I)V

    invoke-static {p1}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    :cond_0
    const/4 p1, 0x1

    .line 332
    invoke-direct {p0, p1}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->refreshAndFinishIfPossible(Z)V

    goto :goto_0

    .line 333
    :cond_1
    iget p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mRequestRemoveDeviceAdmin:I

    if-ne p1, p2, :cond_2

    .line 334
    invoke-direct {p0, p3}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->refreshAndFinishIfPossible(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public handleDialogClick(I)V
    .locals 5

    const/16 v0, 0x36a

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    const/4 v2, 0x1

    if-eq p1, v2, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 352
    :cond_0
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object p1, p1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object p1, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->forceStopPackage(Ljava/lang/String;)V

    goto :goto_0

    .line 347
    :cond_1
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mMetricsFeatureProvider:Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;

    iget-object v3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    new-array v4, v1, [Landroid/util/Pair;

    invoke-virtual {p1, v3, v0, v4}, Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;->action(Landroid/content/Context;I[Landroid/util/Pair;)V

    .line 349
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object p1, p1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object p1, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0, p1, v1, v2}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->uninstallPkg(Ljava/lang/String;ZZ)V

    goto :goto_0

    .line 341
    :cond_2
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mMetricsFeatureProvider:Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;

    iget-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    new-array v1, v1, [Landroid/util/Pair;

    invoke-virtual {p1, v2, v0, v1}, Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;->action(Landroid/content/Context;I[Landroid/util/Pair;)V

    .line 343
    new-instance p1, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$DisableChangerRunnable;

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/4 v2, 0x3

    invoke-direct {p1, p0, v0, v1, v2}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController$DisableChangerRunnable;-><init>(Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;Landroid/content/pm/PackageManager;Ljava/lang/String;I)V

    invoke-static {p1}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method handleDisableable()Z
    .locals 4

    .line 679
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mHomePackages:Ljava/util/HashSet;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    .line 680
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    iget-object v3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    invoke-virtual {p0, v0, v2, v3}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isSystemPackage(Landroid/content/res/Resources;Landroid/content/pm/PackageManager;Landroid/content/pm/PackageInfo;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const-string v2, "com.android.inputmethod.latin"

    .line 681
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const-string v2, "com.google.android.inputmethod.latin"

    .line 682
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const-string v2, "com.heytap.market"

    .line 684
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const-string v2, "net.oneplus.wallpaperresources"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 690
    :cond_0
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-boolean v0, v0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isDisabledUntilUsed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 691
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v2, Lcom/android/settings/R$string;->disable_text:I

    invoke-virtual {v0, v2}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Text(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v2, Lcom/android/settings/R$drawable;->ic_settings_disable:I

    .line 692
    invoke-virtual {v0, v2}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Icon(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    .line 693
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mApplicationFeatureProvider:Lcom/android/settings/applications/ApplicationFeatureProvider;

    invoke-interface {v0}, Lcom/android/settings/applications/ApplicationFeatureProvider;->getKeepEnabledPackages()Ljava/util/Set;

    move-result-object v0

    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object p0, p0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 694
    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr v1, p0

    goto :goto_1

    .line 696
    :cond_1
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v0, Lcom/android/settings/R$string;->enable_text:I

    invoke-virtual {p0, v0}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Text(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v0, Lcom/android/settings/R$drawable;->ic_settings_enable:I

    .line 697
    invoke-virtual {p0, v0}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Icon(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    goto :goto_1

    .line 688
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v0, Lcom/android/settings/R$string;->disable_text:I

    invoke-virtual {p0, v0}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Text(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    sget v0, Lcom/android/settings/R$drawable;->ic_settings_disable:I

    .line 689
    invoke-virtual {p0, v0}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Icon(I)Lcom/android/settingslib/widget/ActionButtonsPreference;

    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public bridge synthetic hasAsyncUpdate()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->hasAsyncUpdate()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isCopyableSlice()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isCopyableSlice()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isPublicSlice()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isPublicSlice()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isSliceable()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isSliceable()Z

    move-result p0

    return p0
.end method

.method isSystemPackage(Landroid/content/res/Resources;Landroid/content/pm/PackageManager;Landroid/content/pm/PackageInfo;)Z
    .locals 0

    .line 708
    invoke-static {p1, p2, p3}, Lcom/android/settingslib/Utils;->isSystemPackage(Landroid/content/res/Resources;Landroid/content/pm/PackageManager;Landroid/content/pm/PackageInfo;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object p1, p1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object p1, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isFilterPackage(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public synthetic lambda$initButtonPreference$0$AppButtonsPreferenceController(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->lambda$initButtonPreference$0(Landroid/view/View;)V

    return-void
.end method

.method public onAllSizesComputed()V
    .locals 0

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 245
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->stopListeningToPackageRemove()V

    .line 247
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mSession:Lcom/android/settingslib/applications/ApplicationsState$Session;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 248
    iput-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mSession:Lcom/android/settingslib/applications/ApplicationsState$Session;

    :cond_0
    return-void
.end method

.method public onLauncherInfoChanged()V
    .locals 0

    return-void
.end method

.method public onLoadEntriesCompleted()V
    .locals 0

    return-void
.end method

.method public onPackageIconChanged()V
    .locals 0

    return-void
.end method

.method public onPackageListChanged()V
    .locals 1

    .line 364
    invoke-virtual {p0}, Lcom/android/settings/core/BasePreferenceController;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 365
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->refreshUi()Z

    :cond_0
    return-void
.end method

.method public onPackageSizeChanged(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onRebuildComplete(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/settingslib/applications/ApplicationsState$AppEntry;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onResume()V
    .locals 3

    .line 231
    invoke-virtual {p0}, Lcom/android/settings/core/BasePreferenceController;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    iget v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserId:I

    const-string v2, "no_control_apps"

    invoke-static {v0, v2, v1}, Lcom/android/settingslib/RestrictedLockUtilsInternal;->hasBaseUserRestriction(Landroid/content/Context;Ljava/lang/String;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppsControlDisallowedBySystem:Z

    .line 234
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    iget v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserId:I

    invoke-static {v0, v2, v1}, Lcom/android/settingslib/RestrictedLockUtilsInternal;->checkIfRestrictionEnforced(Landroid/content/Context;Ljava/lang/String;I)Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppsControlDisallowedAdmin:Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    .line 237
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->refreshUi()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 238
    invoke-direct {p0, v0, v1}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->setIntentAndFinish(ZZ)V

    :cond_0
    return-void
.end method

.method public onRunningStateChanged(Z)V
    .locals 0

    return-void
.end method

.method refreshUi()Z
    .locals 6

    .line 763
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 766
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->retrieveAppEntry()V

    .line 767
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-nez v0, :cond_1

    goto :goto_1

    .line 771
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 772
    iget-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getHomeActivities(Ljava/util/List;)Landroid/content/ComponentName;

    .line 773
    iget-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mHomePackages:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 774
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_3

    .line 775
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 776
    iget-object v4, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 777
    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mHomePackages:Ljava/util/HashSet;

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 780
    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    if-eqz v3, :cond_2

    const-string v5, "android.app.home.alternate"

    .line 782
    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 783
    invoke-direct {p0, v3, v4}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->signaturesMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 784
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mHomePackages:Ljava/util/HashSet;

    invoke-virtual {v4, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 790
    :cond_3
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    const/4 v1, 0x1

    if-nez v0, :cond_4

    .line 791
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->initButtonPreference()V

    .line 792
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setVisible(Z)V

    .line 794
    :cond_4
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->updateOpenButton()V

    .line 795
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->updateUninstallButton()V

    .line 796
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->updateForceStopButton()V

    :cond_5
    :goto_1
    return v1
.end method

.method retrieveAppEntry()V
    .locals 4

    .line 401
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mState:Lcom/android/settingslib/applications/ApplicationsState;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;

    iget v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserId:I

    invoke-virtual {v0, v1, v2}, Lcom/android/settingslib/applications/ApplicationsState;->getEntry(Ljava/lang/String;I)Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 404
    :try_start_0
    iget-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const v3, 0x401240

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    .line 410
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 412
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception when retrieving package:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "AppButtonsPrefCtl"

    invoke-static {v3, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 413
    iput-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    goto :goto_0

    .line 416
    :cond_0
    iput-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    :goto_0
    return-void
.end method

.method uninstallPkg(Ljava/lang/String;ZZ)V
    .locals 3

    .line 634
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->stopListeningToPackageRemove()V

    .line 636
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "package:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 637
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.UNINSTALL_PACKAGE"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 639
    iget-object v0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/oneplus/settings/utils/OPUtils;->hasMultiApp(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "oneplus.intent.action.DELETE"

    .line 640
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    const-string p1, "android.intent.extra.UNINSTALL_ALL_USERS"

    .line 643
    invoke-virtual {v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 645
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mMetricsFeatureProvider:Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;

    iget-object p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    const/16 v0, 0x368

    const/4 v2, 0x0

    new-array v2, v2, [Landroid/util/Pair;

    invoke-virtual {p1, p2, v0, v2}, Lcom/android/settingslib/core/instrumentation/MetricsFeatureProvider;->action(Landroid/content/Context;I[Landroid/util/Pair;)V

    .line 647
    iget-object p1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mFragment:Lcom/android/settings/core/InstrumentedPreferenceFragment;

    iget p2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mRequestUninstall:I

    invoke-virtual {p1, v1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 648
    iput-boolean p3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDisableAfterUninstall:Z

    return-void
.end method

.method updateForceStopButton()V
    .locals 10

    .line 582
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "AppButtonsPrefCtl"

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const-string v0, "User can\'t force stop device admin"

    .line 584
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    invoke-virtual {p0, v2}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->updateForceStopButtonInner(Z)V

    goto/16 :goto_0

    .line 586
    :cond_0
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v3, 0x200000

    and-int/2addr v0, v3

    const/4 v3, 0x1

    if-nez v0, :cond_4

    .line 593
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUstUnify()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v4, "com.sprint.ce.updater"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 594
    invoke-virtual {p0, v2}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->updateForceStopButtonInner(Z)V

    goto/16 :goto_0

    .line 595
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUstMode()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    const-string v4, "com.tmobile.echolocate"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 596
    invoke-virtual {p0, v2}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->updateForceStopButtonInner(Z)V

    goto/16 :goto_0

    .line 598
    :cond_3
    invoke-direct {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isSystemPersistApp()Z

    move-result v0

    .line 599
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "App is not explicitly stopped and isSystemPersistApp:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    xor-int/2addr v0, v3

    .line 600
    invoke-virtual {p0, v0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->updateForceStopButtonInner(Z)V

    goto/16 :goto_0

    .line 605
    :cond_4
    new-instance v0, Landroid/content/Intent;

    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "package"

    .line 606
    invoke-static {v6, v4, v5}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    const-string v5, "android.intent.action.QUERY_PACKAGE_RESTART"

    invoke-direct {v0, v5, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    new-array v3, v3, [Ljava/lang/String;

    .line 607
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    aput-object v4, v3, v2

    const-string v2, "android.intent.extra.PACKAGES"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 608
    iget-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->uid:I

    const-string v3, "android.intent.extra.UID"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 609
    iget-object v2, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v2, v2, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v2}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v2

    const-string v3, "android.intent.extra.user_handle"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 610
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sending broadcast to query restart status for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v3, v3, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v1}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v1

    const/16 v2, 0x3e7

    if-ne v1, v2, :cond_5

    .line 614
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    new-instance v3, Landroid/os/UserHandle;

    invoke-direct {v3, v2}, Landroid/os/UserHandle;-><init>(I)V

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v2, v0

    invoke-virtual/range {v1 .. v9}, Landroid/app/Activity;->sendOrderedBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0

    .line 617
    :cond_5
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    sget-object v3, Landroid/os/UserHandle;->CURRENT:Landroid/os/UserHandle;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mCheckKillProcessesReceiver:Landroid/content/BroadcastReceiver;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v2, v0

    invoke-virtual/range {v1 .. v9}, Landroid/app/Activity;->sendOrderedBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    :goto_0
    return-void
.end method

.method updateForceStopButtonInner(Z)V
    .locals 1

    .line 625
    iget-boolean v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppsControlDisallowedBySystem:Z

    if-eqz v0, :cond_0

    .line 626
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton3Enabled(Z)Lcom/android/settingslib/widget/ActionButtonsPreference;

    goto :goto_0

    .line 628
    :cond_0
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    invoke-virtual {p0, p1}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton3Enabled(Z)Lcom/android/settingslib/widget/ActionButtonsPreference;

    :goto_0
    return-void
.end method

.method updateOpenButton()V
    .locals 2

    .line 422
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppLaunchIntent:Landroid/content/Intent;

    .line 423
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton1Visible(Z)Lcom/android/settingslib/widget/ActionButtonsPreference;

    return-void
.end method

.method updateUninstallButton()V
    .locals 8

    .line 430
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-eqz v0, :cond_1

    .line 434
    invoke-virtual {p0}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->handleDisableable()Z

    move-result v3

    goto :goto_1

    .line 436
    :cond_1
    iget-object v3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v4, 0x800000

    and-int/2addr v3, v4

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserManager:Landroid/os/UserManager;

    .line 437
    invoke-virtual {v3}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_2

    move v3, v2

    goto :goto_1

    :cond_2
    move v3, v1

    :goto_1
    if-eqz v0, :cond_3

    .line 445
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/admin/DevicePolicyManager;->packageHasActiveAdmins(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    move v3, v2

    .line 452
    :cond_3
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mActivity:Lcom/android/settings/SettingsActivity;

    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    iget-object v6, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    invoke-virtual {p0, v4, v5, v6}, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->isSystemPackage(Landroid/content/res/Resources;Landroid/content/pm/PackageManager;Landroid/content/pm/PackageInfo;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 453
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserManager:Landroid/os/UserManager;

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v6, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v4, v5, v6}, Lcom/android/settings/Utils;->isProfileOrDeviceOwner(Landroid/os/UserManager;Landroid/app/admin/DevicePolicyManager;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_2

    .line 459
    :cond_4
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    iget v6, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mUserId:I

    invoke-static {v4, v5, v6}, Lcom/android/settings/Utils;->isProfileOrDeviceOwner(Landroid/app/admin/DevicePolicyManager;Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_5

    :goto_2
    move v3, v2

    .line 465
    :cond_5
    iget-object v4, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v5, v5, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/android/settingslib/Utils;->isDeviceProvisioningPackage(Landroid/content/res/Resources;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    move v3, v2

    .line 471
    :cond_6
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mDpm:Landroid/app/admin/DevicePolicyManager;

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/admin/DevicePolicyManager;->isUninstallInQueue(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    move v3, v2

    :cond_7
    if-eqz v3, :cond_b

    .line 481
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mHomePackages:Ljava/util/HashSet;

    iget-object v5, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    if-eqz v0, :cond_8

    move v3, v2

    goto :goto_4

    .line 485
    :cond_8
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 486
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v4, v3}, Landroid/content/pm/PackageManager;->getHomeActivities(Ljava/util/List;)Landroid/content/ComponentName;

    move-result-object v3

    if-nez v3, :cond_a

    .line 490
    iget-object v3, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mHomePackages:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v3

    if-le v3, v1, :cond_9

    goto :goto_3

    :cond_9
    move v1, v2

    :goto_3
    move v3, v1

    goto :goto_4

    .line 494
    :cond_a
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mPackageInfo:Landroid/content/pm/PackageInfo;

    iget-object v4, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    xor-int/2addr v3, v1

    .line 500
    :cond_b
    :goto_4
    iget-object v1, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_10

    .line 501
    sget v4, Lcom/android/settings/R$string;->oneplus_cannot_disable_package_1:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_c

    iget-object v1, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    sget v4, Lcom/android/settings/R$string;->oneplus_cannot_disable_package_2:I

    .line 502
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_c

    iget-object v1, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    sget v4, Lcom/android/settings/R$string;->oneplus_cannot_disable_package_3:I

    .line 503
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_d

    :cond_c
    move v3, v2

    .line 508
    :cond_d
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v1

    if-nez v1, :cond_e

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUstUnify()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 509
    :cond_e
    iget-object v1, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v4, Lcom/android/settings/R$array;->oneplus_cannot_disable_package:I

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 510
    array-length v4, v1

    if-lez v4, :cond_10

    .line 511
    array-length v4, v1

    move v5, v2

    :goto_5
    if-ge v5, v4, :cond_10

    aget-object v6, v1, v5

    .line 512
    iget-object v7, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v7, v7, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_f

    move v3, v2

    :cond_f
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 522
    :cond_10
    iget-boolean v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppsControlDisallowedBySystem:Z

    if-eqz v1, :cond_11

    move v3, v2

    .line 530
    :cond_11
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v1, v1, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v1}, Landroid/content/pm/ApplicationInfo;->isResourceOverlay()Z

    move-result v1

    if-eqz v1, :cond_13

    if-eqz v0, :cond_12

    :goto_6
    move v3, v2

    goto :goto_7

    .line 534
    :cond_12
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 535
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v0}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;

    move-result-object v0

    .line 536
    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mOverlayManager:Landroid/content/om/OverlayManager;

    invoke-virtual {v4, v1, v0}, Landroid/content/om/OverlayManager;->getOverlayInfo(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/om/OverlayInfo;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 537
    invoke-virtual {v0}, Landroid/content/om/OverlayInfo;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 538
    iget-object v1, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mState:Lcom/android/settingslib/applications/ApplicationsState;

    iget-object v0, v0, Landroid/content/om/OverlayInfo;->targetPackageName:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v4, v4, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 540
    invoke-static {v4}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v4

    .line 539
    invoke-virtual {v1, v0, v4}, Lcom/android/settingslib/applications/ApplicationsState;->getEntry(Ljava/lang/String;I)Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    move-result-object v0

    if-eqz v0, :cond_13

    goto :goto_6

    .line 549
    :cond_13
    :goto_7
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isUsvMode()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 550
    iget-object v0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mAppEntry:Lcom/android/settingslib/applications/ApplicationsState$AppEntry;

    iget-object v0, v0, Lcom/android/settingslib/applications/ApplicationsState$AppEntry;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const-string v1, "com.verizon.mips.services"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    goto :goto_8

    :cond_14
    move v2, v3

    .line 555
    :goto_8
    iget-object p0, p0, Lcom/android/settings/applications/appinfo/AppButtonsPreferenceController;->mButtonsPref:Lcom/android/settingslib/widget/ActionButtonsPreference;

    invoke-virtual {p0, v2}, Lcom/android/settingslib/widget/ActionButtonsPreference;->setButton2Enabled(Z)Lcom/android/settingslib/widget/ActionButtonsPreference;

    return-void
.end method

.method public bridge synthetic useDynamicSliceSummary()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->useDynamicSliceSummary()Z

    move-result p0

    return p0
.end method
