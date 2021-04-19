.class Lcom/android/settings/DisplaySettings$RefreshRateObserver;
.super Landroid/database/ContentObserver;
.source "DisplaySettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/DisplaySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RefreshRateObserver"
.end annotation


# instance fields
.field private final mScreenRefreshRate:Landroid/net/Uri;

.field final synthetic this$0:Lcom/android/settings/DisplaySettings;


# direct methods
.method public constructor <init>(Lcom/android/settings/DisplaySettings;Landroid/os/Handler;)V
    .locals 0

    .line 1648
    iput-object p1, p0, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->this$0:Lcom/android/settings/DisplaySettings;

    .line 1649
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    const-string p1, "oneplus_screen_refresh_rate"

    .line 1647
    invoke-static {p1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->mScreenRefreshRate:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 1

    .line 1654
    iget-object p1, p0, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->mScreenRefreshRate:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1655
    iget-object p1, p0, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->this$0:Lcom/android/settings/DisplaySettings;

    invoke-static {p1}, Lcom/android/settings/DisplaySettings;->access$300(Lcom/android/settings/DisplaySettings;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string p2, "oneplus_screen_refresh_rate"

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_0

    move v0, p2

    .line 1657
    :cond_0
    iget-object p0, p0, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->this$0:Lcom/android/settings/DisplaySettings;

    invoke-static {p0}, Lcom/android/settings/DisplaySettings;->access$1000(Lcom/android/settings/DisplaySettings;)Landroidx/preference/SwitchPreference;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    :cond_1
    return-void
.end method

.method public startObserving()V
    .locals 4

    .line 1662
    iget-object v0, p0, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->this$0:Lcom/android/settings/DisplaySettings;

    invoke-static {v0}, Lcom/android/settings/DisplaySettings;->access$300(Lcom/android/settings/DisplaySettings;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1663
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1664
    iget-object v1, p0, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->mScreenRefreshRate:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v2, p0, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    return-void
.end method

.method public stopObserving()V
    .locals 1

    .line 1668
    iget-object v0, p0, Lcom/android/settings/DisplaySettings$RefreshRateObserver;->this$0:Lcom/android/settings/DisplaySettings;

    invoke-static {v0}, Lcom/android/settings/DisplaySettings;->access$300(Lcom/android/settings/DisplaySettings;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1669
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method
