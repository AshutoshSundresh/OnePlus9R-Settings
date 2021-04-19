.class public abstract Lcom/appaac/haptic/base/d;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/appaac/haptic/base/d;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/appaac/haptic/base/d;
    .locals 2

    sget-object v0, Lcom/appaac/haptic/base/d;->a:Lcom/appaac/haptic/base/d;

    if-nez v0, :cond_1

    const-class v0, Lcom/appaac/haptic/base/d;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/appaac/haptic/base/d;->a:Lcom/appaac/haptic/base/d;

    if-nez v1, :cond_0

    new-instance v1, Lcom/appaac/haptic/a/a;

    invoke-direct {v1, p0}, Lcom/appaac/haptic/a/a;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/appaac/haptic/base/d;->a:Lcom/appaac/haptic/base/d;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/appaac/haptic/base/d;->a:Lcom/appaac/haptic/base/d;

    return-object p0
.end method


# virtual methods
.method public abstract b(Ljava/lang/String;IIII)V
.end method
