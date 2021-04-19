.class public Lcom/oneplus/security/firewall/NetworkRestrictManager;
.super Ljava/lang/Object;
.source "NetworkRestrictManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/security/firewall/NetworkRestrictManager$IAppsNetworkRestrictTaskCallBack;,
        Lcom/oneplus/security/firewall/NetworkRestrictManager$UpdateRulesFromQRunnable;,
        Lcom/oneplus/security/firewall/NetworkRestrictManager$BatchUpdateRulesRunnable;,
        Lcom/oneplus/security/firewall/NetworkRestrictManager$RefreshTaskRunnable;
    }
.end annotation


# static fields
.field private static instance:Lcom/oneplus/security/firewall/NetworkRestrictManager;

.field private static final instanceLock:Ljava/lang/Object;


# instance fields
.field private mCallBack:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/oneplus/security/firewall/NetworkRestrictManager$IAppsNetworkRestrictTaskCallBack;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mPackageManager:Landroid/content/pm/PackageManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [B

    .line 44
    sput-object v0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->instanceLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 310
    new-instance v0, Lcom/oneplus/security/firewall/NetworkRestrictManager$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/oneplus/security/firewall/NetworkRestrictManager$2;-><init>(Lcom/oneplus/security/firewall/NetworkRestrictManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mHandler:Landroid/os/Handler;

    .line 52
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    .line 53
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    return-void
.end method

.method static synthetic access$000(Lcom/oneplus/security/firewall/NetworkRestrictManager;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/oneplus/security/firewall/NetworkRestrictManager;->handleUpgradeTrafficState()V

    return-void
.end method

.method static synthetic access$100(Lcom/oneplus/security/firewall/NetworkRestrictManager;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mCallBack:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$200(Lcom/oneplus/security/firewall/NetworkRestrictManager;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Lcom/oneplus/security/firewall/NetworkRestrictManager;->getAppsUidItemsMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/oneplus/security/firewall/NetworkRestrictManager;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Lcom/oneplus/security/firewall/NetworkRestrictManager;->getAllAppsUidItemsMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/oneplus/security/firewall/NetworkRestrictManager;)Landroid/os/Handler;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$500(Lcom/oneplus/security/firewall/NetworkRestrictManager;)Landroid/content/Context;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method private getAllAppsUidItemsMap()Ljava/util/Map;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/oneplus/security/firewall/AppUidItem;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 181
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 182
    iget-object v1, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/oneplus/security/firewall/FirewallRule;->selectAllFirewallRulesAsMap(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    .line 183
    iget-object v2, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v2

    .line 184
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c

    .line 185
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/16 v6, 0x3e8

    const-string v7, "android.permission.INTERNET"

    const/4 v8, 0x1

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/PackageInfo;

    .line 187
    iget-object v9, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v10, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v10, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    .line 188
    iget-object v10, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v10, v7, v5}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    move v8, v3

    :goto_1
    if-eqz v9, :cond_0

    .line 189
    iget v5, v9, Landroid/content/pm/ApplicationInfo;->uid:I

    if-le v5, v6, :cond_0

    if-nez v8, :cond_2

    goto :goto_0

    .line 192
    :cond_2
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3

    goto :goto_0

    .line 195
    :cond_3
    new-instance v5, Lcom/oneplus/security/firewall/AppUidItem;

    invoke-direct {v5}, Lcom/oneplus/security/firewall/AppUidItem;-><init>()V

    .line 196
    iget v6, v9, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v5, v6}, Lcom/oneplus/security/firewall/AppUidItem;->setAppUid(I)V

    .line 197
    iget v6, v9, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 199
    :cond_4
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/PackageInfo;

    .line 201
    iget-object v5, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v9, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v9, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    .line 202
    iget-object v9, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v10, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v7, v10}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_6

    move v9, v8

    goto :goto_3

    :cond_6
    move v9, v3

    :goto_3
    if-eqz v5, :cond_5

    .line 203
    iget v5, v5, Landroid/content/pm/ApplicationInfo;->uid:I

    if-le v5, v6, :cond_5

    if-nez v9, :cond_7

    goto :goto_2

    .line 206
    :cond_7
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/oneplus/security/firewall/AppUidItem;

    if-nez v1, :cond_8

    .line 208
    invoke-virtual {v5, v8}, Lcom/oneplus/security/firewall/AppUidItem;->setDataEnable(Z)V

    .line 209
    invoke-virtual {v5, v8}, Lcom/oneplus/security/firewall/AppUidItem;->setWlanEnable(Z)V

    goto :goto_6

    .line 211
    :cond_8
    iget-object v9, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v1, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/oneplus/security/firewall/FirewallRule;

    if-eqz v9, :cond_b

    .line 213
    invoke-virtual {v9}, Lcom/oneplus/security/firewall/FirewallRule;->getMobile()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-eq v10, v8, :cond_9

    move v10, v8

    goto :goto_4

    :cond_9
    move v10, v3

    :goto_4
    invoke-virtual {v5, v10}, Lcom/oneplus/security/firewall/AppUidItem;->setDataEnable(Z)V

    .line 214
    invoke-virtual {v9}, Lcom/oneplus/security/firewall/FirewallRule;->getWlan()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-eq v9, v8, :cond_a

    move v9, v8

    goto :goto_5

    :cond_a
    move v9, v3

    :goto_5
    invoke-virtual {v5, v9}, Lcom/oneplus/security/firewall/AppUidItem;->setWlanEnable(Z)V

    goto :goto_6

    .line 216
    :cond_b
    invoke-virtual {v5, v8}, Lcom/oneplus/security/firewall/AppUidItem;->setDataEnable(Z)V

    .line 217
    invoke-virtual {v5, v8}, Lcom/oneplus/security/firewall/AppUidItem;->setWlanEnable(Z)V

    .line 220
    :goto_6
    new-instance v9, Lcom/oneplus/security/firewall/AppPkgItem;

    invoke-direct {v9}, Lcom/oneplus/security/firewall/AppPkgItem;-><init>()V

    .line 221
    iget-object v10, v4, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v11, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v10, v11}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    .line 222
    invoke-static {v4}, Lcom/oneplus/security/utils/Utils;->isSystemApp(Landroid/content/pm/PackageInfo;)Z

    move-result v11

    invoke-virtual {v9, v11}, Lcom/oneplus/security/firewall/AppPkgItem;->setSystemApp(Z)V

    .line 223
    iget-object v11, v4, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v11}, Lcom/oneplus/security/firewall/AppPkgItem;->setPkgName(Ljava/lang/String;)V

    .line 224
    invoke-virtual {v9, v10}, Lcom/oneplus/security/firewall/AppPkgItem;->setAppName(Ljava/lang/String;)V

    .line 225
    invoke-static {v10}, Lcom/oneplus/security/utils/HanziToPinyin;->getSpell(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/oneplus/security/firewall/AppPkgItem;->setAppSortKey(Ljava/lang/String;)V

    .line 231
    iget-object v4, v4, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v10, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v4, v10}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v9, v4}, Lcom/oneplus/security/firewall/AppPkgItem;->setAppIcon(Landroid/graphics/drawable/Drawable;)V

    .line 232
    invoke-virtual {v5}, Lcom/oneplus/security/firewall/AppUidItem;->getApps()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    :cond_c
    return-object v0
.end method

.method private getAppsUidItemsMap()Ljava/util/Map;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/oneplus/security/firewall/AppUidItem;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 247
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 248
    iget-object v1, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/oneplus/security/firewall/FirewallRule;->selectAllFirewallRulesAsMap(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    .line 249
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.MAIN"

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v3, "android.intent.category.LAUNCHER"

    .line 250
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 251
    iget-object v3, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 252
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_c

    .line 253
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/16 v6, 0x3e8

    const-string v7, "android.permission.INTERNET"

    const/4 v8, 0x1

    if-eqz v5, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    .line 255
    iget-object v9, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v10, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v10, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v10, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    .line 256
    iget-object v10, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v5, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v10, v7, v5}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    move v8, v4

    :goto_1
    if-eqz v9, :cond_0

    .line 257
    iget v5, v9, Landroid/content/pm/ApplicationInfo;->uid:I

    if-le v5, v6, :cond_0

    if-nez v8, :cond_2

    goto :goto_0

    .line 260
    :cond_2
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3

    goto :goto_0

    .line 263
    :cond_3
    new-instance v5, Lcom/oneplus/security/firewall/AppUidItem;

    invoke-direct {v5}, Lcom/oneplus/security/firewall/AppUidItem;-><init>()V

    .line 264
    iget v6, v9, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-virtual {v5, v6}, Lcom/oneplus/security/firewall/AppUidItem;->setAppUid(I)V

    .line 265
    iget v6, v9, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 267
    :cond_4
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 269
    iget-object v5, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v9, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v9, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    .line 270
    iget-object v9, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v10, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v10, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v7, v10}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_6

    move v9, v8

    goto :goto_3

    :cond_6
    move v9, v4

    :goto_3
    if-eqz v5, :cond_5

    .line 271
    iget v5, v5, Landroid/content/pm/ApplicationInfo;->uid:I

    if-le v5, v6, :cond_5

    if-nez v9, :cond_7

    goto :goto_2

    .line 274
    :cond_7
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/oneplus/security/firewall/AppUidItem;

    if-nez v1, :cond_8

    .line 276
    invoke-virtual {v5, v8}, Lcom/oneplus/security/firewall/AppUidItem;->setDataEnable(Z)V

    .line 277
    invoke-virtual {v5, v8}, Lcom/oneplus/security/firewall/AppUidItem;->setWlanEnable(Z)V

    goto :goto_6

    .line 279
    :cond_8
    iget-object v9, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-interface {v1, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/oneplus/security/firewall/FirewallRule;

    if-eqz v9, :cond_b

    .line 281
    invoke-virtual {v9}, Lcom/oneplus/security/firewall/FirewallRule;->getMobile()Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-eq v10, v8, :cond_9

    move v10, v8

    goto :goto_4

    :cond_9
    move v10, v4

    :goto_4
    invoke-virtual {v5, v10}, Lcom/oneplus/security/firewall/AppUidItem;->setDataEnable(Z)V

    .line 282
    invoke-virtual {v9}, Lcom/oneplus/security/firewall/FirewallRule;->getWlan()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-eq v9, v8, :cond_a

    move v9, v8

    goto :goto_5

    :cond_a
    move v9, v4

    :goto_5
    invoke-virtual {v5, v9}, Lcom/oneplus/security/firewall/AppUidItem;->setWlanEnable(Z)V

    goto :goto_6

    .line 284
    :cond_b
    invoke-virtual {v5, v8}, Lcom/oneplus/security/firewall/AppUidItem;->setDataEnable(Z)V

    .line 285
    invoke-virtual {v5, v8}, Lcom/oneplus/security/firewall/AppUidItem;->setWlanEnable(Z)V

    .line 288
    :goto_6
    new-instance v9, Lcom/oneplus/security/firewall/AppPkgItem;

    invoke-direct {v9}, Lcom/oneplus/security/firewall/AppPkgItem;-><init>()V

    .line 289
    iget-object v10, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v10, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v11, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v10, v11}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    .line 290
    invoke-static {v3}, Lcom/oneplus/security/utils/Utils;->isSystemApp(Landroid/content/pm/ResolveInfo;)Z

    move-result v11

    invoke-virtual {v9, v11}, Lcom/oneplus/security/firewall/AppPkgItem;->setSystemApp(Z)V

    .line 291
    iget-object v11, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v11, v11, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v11}, Lcom/oneplus/security/firewall/AppPkgItem;->setPkgName(Ljava/lang/String;)V

    .line 292
    invoke-virtual {v9, v10}, Lcom/oneplus/security/firewall/AppPkgItem;->setAppName(Ljava/lang/String;)V

    .line 293
    invoke-static {v10}, Lcom/oneplus/security/utils/HanziToPinyin;->getSpell(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/oneplus/security/firewall/AppPkgItem;->setAppSortKey(Ljava/lang/String;)V

    .line 299
    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v10, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v3, v10}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v9, v3}, Lcom/oneplus/security/firewall/AppPkgItem;->setAppIcon(Landroid/graphics/drawable/Drawable;)V

    .line 300
    invoke-virtual {v5}, Lcom/oneplus/security/firewall/AppUidItem;->getApps()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    :cond_c
    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/oneplus/security/firewall/NetworkRestrictManager;
    .locals 2

    .line 57
    sget-object v0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->instanceLock:Ljava/lang/Object;

    monitor-enter v0

    .line 58
    :try_start_0
    sget-object v1, Lcom/oneplus/security/firewall/NetworkRestrictManager;->instance:Lcom/oneplus/security/firewall/NetworkRestrictManager;

    if-nez v1, :cond_0

    .line 59
    new-instance v1, Lcom/oneplus/security/firewall/NetworkRestrictManager;

    invoke-direct {v1, p0}, Lcom/oneplus/security/firewall/NetworkRestrictManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/oneplus/security/firewall/NetworkRestrictManager;->instance:Lcom/oneplus/security/firewall/NetworkRestrictManager;

    .line 61
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    sget-object p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->instance:Lcom/oneplus/security/firewall/NetworkRestrictManager;

    return-object p0

    :catchall_0
    move-exception p0

    .line 61
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private handleUpgradeTrafficState()V
    .locals 9

    .line 88
    iget-object v0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/oneplus/security/network/simcard/SimcardDataModel;->getInstance(Landroid/content/Context;)Lcom/oneplus/security/network/simcard/SimcardDataModel;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x1

    if-gt v1, v2, :cond_1

    .line 90
    invoke-virtual {v0}, Lcom/oneplus/security/network/simcard/SimcardDataModel;->getCurrentTrafficRunningSlotId()I

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-virtual {v0, v1}, Lcom/oneplus/security/network/simcard/SimcardDataModel;->isSlotSimInserted(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 92
    :try_start_0
    iget-object v2, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/android/settings/datausage/OPDataUsageUtils;->getOneplusDataUsage(Landroid/content/Context;I)Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v3, "oneplus_datausage_error_code"

    .line 94
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "oneplus_datausage_limit_state"

    .line 96
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const-string v4, "oneplus_datausage_total"

    .line 97
    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-string v6, "oneplus_datausage_warn_state"

    .line 98
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    const-string v7, "oneplus_datausage_warn_value"

    .line 99
    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    .line 100
    iget-object v2, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v2, v3, v1}, Lcom/oneplus/security/network/trafficalarm/TrafficUsageAlarmUtils;->setDataTotalState(Landroid/content/Context;ZI)V

    .line 101
    iget-object v2, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v2, v4, v5, v1}, Lcom/oneplus/security/network/trafficalarm/TrafficUsageAlarmUtils;->setDataLimitValue(Landroid/content/Context;JI)V

    .line 102
    iget-object v2, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v2, v6, v1}, Lcom/oneplus/security/network/trafficalarm/TrafficUsageAlarmUtils;->setDataWarnState(Landroid/content/Context;ZI)V

    .line 103
    iget-object v2, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v2, v7, v8, v1}, Lcom/oneplus/security/network/trafficalarm/TrafficUsageAlarmUtils;->setDataWarnValue(Landroid/content/Context;JI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 107
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public batchUpdateRules(Ljava/util/List;IILcom/oneplus/security/firewall/NetworkRestrictManager$IAppsNetworkRestrictTaskCallBack;Ljava/util/concurrent/Executor;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/oneplus/security/firewall/AppUidItem;",
            ">;II",
            "Lcom/oneplus/security/firewall/NetworkRestrictManager$IAppsNetworkRestrictTaskCallBack;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 140
    invoke-static {p1}, Lcom/oneplus/security/utils/Utils;->isCollectionEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 143
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "batchUpdateRules data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",wlan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NetworkRestrictManager"

    invoke-static {v1, v0}, Lcom/oneplus/security/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mCallBack:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 151
    invoke-interface {p4, v0, v1}, Lcom/oneplus/security/firewall/NetworkRestrictManager$IAppsNetworkRestrictTaskCallBack;->onTaskStart(IZ)V

    .line 152
    new-instance p4, Lcom/oneplus/security/firewall/NetworkRestrictManager$BatchUpdateRulesRunnable;

    invoke-direct {p4, p0, p1, p2, p3}, Lcom/oneplus/security/firewall/NetworkRestrictManager$BatchUpdateRulesRunnable;-><init>(Lcom/oneplus/security/firewall/NetworkRestrictManager;Ljava/util/List;II)V

    invoke-interface {p5, p4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public init()V
    .locals 4

    .line 73
    iget-object v0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "update_rules_from_Q"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 75
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/oneplus/security/firewall/NetworkRestrictManager$UpdateRulesFromQRunnable;

    invoke-direct {v1, p0}, Lcom/oneplus/security/firewall/NetworkRestrictManager$UpdateRulesFromQRunnable;-><init>(Lcom/oneplus/security/firewall/NetworkRestrictManager;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 76
    invoke-static {}, Lcom/oneplus/settings/SettingsBaseApplication;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/oneplus/security/firewall/NetworkRestrictManager$1;

    invoke-direct {v1, p0}, Lcom/oneplus/security/firewall/NetworkRestrictManager$1;-><init>(Lcom/oneplus/security/firewall/NetworkRestrictManager;)V

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 83
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/oneplus/security/firewall/NetworkRestrictManager$RefreshTaskRunnable;

    invoke-direct {v1, p0, v2}, Lcom/oneplus/security/firewall/NetworkRestrictManager$RefreshTaskRunnable;-><init>(Lcom/oneplus/security/firewall/NetworkRestrictManager;Z)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :goto_0
    return-void
.end method

.method public refreshAppsNetworkRestrict(Lcom/oneplus/security/firewall/NetworkRestrictManager$IAppsNetworkRestrictTaskCallBack;ZLjava/util/concurrent/Executor;)V
    .locals 2

    if-nez p3, :cond_0

    .line 124
    sget-object p3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 126
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mCallBack:Ljava/lang/ref/WeakReference;

    .line 127
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/oneplus/security/firewall/NetworkRestrictManager$IAppsNetworkRestrictTaskCallBack;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Lcom/oneplus/security/firewall/NetworkRestrictManager$IAppsNetworkRestrictTaskCallBack;->onTaskStart(IZ)V

    .line 128
    new-instance p1, Lcom/oneplus/security/firewall/NetworkRestrictManager$RefreshTaskRunnable;

    invoke-direct {p1, p0, p2}, Lcom/oneplus/security/firewall/NetworkRestrictManager$RefreshTaskRunnable;-><init>(Lcom/oneplus/security/firewall/NetworkRestrictManager;Z)V

    invoke-interface {p3, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public updateRules(Lcom/oneplus/security/firewall/AppUidItem;II)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    .line 166
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateRules appUidItem="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",wlan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NetworkRestrictManager"

    invoke-static {v1, v0}, Lcom/oneplus/security/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    invoke-virtual {p1}, Lcom/oneplus/security/firewall/AppUidItem;->getApps()Ljava/util/List;

    move-result-object p1

    .line 168
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/oneplus/security/firewall/AppPkgItem;

    .line 169
    new-instance v1, Lcom/oneplus/security/firewall/FirewallRule;

    invoke-virtual {v0}, Lcom/oneplus/security/firewall/AppPkgItem;->getPkgName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/oneplus/security/firewall/FirewallRule;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 170
    iget-object v0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager;->mContext:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/oneplus/security/firewall/FirewallRule;->addOrUpdateRole(Landroid/content/Context;Lcom/oneplus/security/firewall/FirewallRule;)Z

    goto :goto_0

    :cond_1
    return-void
.end method
