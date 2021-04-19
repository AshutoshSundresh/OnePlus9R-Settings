.class public Lcom/appaac/haptic/AACHapticUtils;
.super Lcom/appaac/haptic/base/a;


# static fields
.field private static sInstance:Lcom/appaac/haptic/AACHapticUtils;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private clazzVibrationEffect:Ljava/lang/Class;

.field private mContext:Landroid/content/Context;

.field private mNonRichTapLoopThread:Lcom/appaac/haptic/base/c;

.field private mRichTapEnable:Z

.field private vibrator:Landroid/os/Vibrator;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    const-string v0, "AACHapticUtils"

    invoke-direct {p0}, Lcom/appaac/haptic/base/a;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/appaac/haptic/AACHapticUtils;->mRichTapEnable:Z

    :try_start_0
    const-string v1, "android.os.RichTapVibrationEffect"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lcom/appaac/haptic/AACHapticUtils;->clazzVibrationEffect:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v1, "failed to reflect class: \"android.os.RichTapVibrationEffect\"!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iget-object v1, p0, Lcom/appaac/haptic/AACHapticUtils;->clazzVibrationEffect:Ljava/lang/Class;

    if-nez v1, :cond_0

    :try_start_1
    const-string v1, "android.os.VibrationEffect"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lcom/appaac/haptic/AACHapticUtils;->clazzVibrationEffect:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    const-string p0, "failed to reflect class: \"android.os.VibrationEffect\"!"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_1
    return-void
.end method

.method public static getInstance()Lcom/appaac/haptic/AACHapticUtils;
    .locals 2

    sget-object v0, Lcom/appaac/haptic/AACHapticUtils;->sInstance:Lcom/appaac/haptic/AACHapticUtils;

    if-nez v0, :cond_1

    const-class v0, Lcom/appaac/haptic/AACHapticUtils;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/appaac/haptic/AACHapticUtils;->sInstance:Lcom/appaac/haptic/AACHapticUtils;

    if-nez v1, :cond_0

    new-instance v1, Lcom/appaac/haptic/AACHapticUtils;

    invoke-direct {v1}, Lcom/appaac/haptic/AACHapticUtils;-><init>()V

    sput-object v1, Lcom/appaac/haptic/AACHapticUtils;->sInstance:Lcom/appaac/haptic/AACHapticUtils;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/appaac/haptic/AACHapticUtils;->sInstance:Lcom/appaac/haptic/AACHapticUtils;

    return-object v0
.end method

.method private playExtPreBakedOnNonRichTap(II)V
    .locals 3

    iget-object v0, p0, Lcom/appaac/haptic/AACHapticUtils;->vibrator:Landroid/os/Vibrator;

    if-nez v0, :cond_0

    const-string p0, "AACHapticUtils"

    const-string p1, "Please call the init method"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-boolean v1, p0, Lcom/appaac/haptic/AACHapticUtils;->mRichTapEnable:Z

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    iget-object v0, p0, Lcom/appaac/haptic/AACHapticUtils;->mNonRichTapLoopThread:Lcom/appaac/haptic/base/c;

    const/16 v1, 0x14

    invoke-virtual {v0, v1}, Lcom/appaac/haptic/base/c;->a(I)V

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    iget-object p0, p0, Lcom/appaac/haptic/AACHapticUtils;->vibrator:Landroid/os/Vibrator;

    if-lt v0, v1, :cond_2

    int-to-long v0, p1

    const/4 p1, 0x1

    const/16 v2, 0xff

    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v0, v1, p1}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_0

    :cond_2
    int-to-long p1, p1

    invoke-virtual {p0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    :goto_0
    return-void
.end method


# virtual methods
.method public init(Landroid/content/Context;)Lcom/appaac/haptic/AACHapticUtils;
    .locals 2

    if-eqz p1, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "init ,version:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/appaac/haptic/base/a;->VERSION_NAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " versionCode:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/appaac/haptic/base/a;->VERSION_CODE:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AACHapticUtils"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo v0, "vibrator"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lcom/appaac/haptic/AACHapticUtils;->vibrator:Landroid/os/Vibrator;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/appaac/haptic/AACHapticUtils;->useNonRichTap(Z)V

    iput-object p1, p0, Lcom/appaac/haptic/AACHapticUtils;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/appaac/haptic/AACHapticUtils;->isNonRichTapMode()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/appaac/haptic/base/c;

    iget-object v0, p0, Lcom/appaac/haptic/AACHapticUtils;->mContext:Landroid/content/Context;

    invoke-direct {p1, v0}, Lcom/appaac/haptic/base/c;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/appaac/haptic/AACHapticUtils;->mNonRichTapLoopThread:Lcom/appaac/haptic/base/c;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_0
    sget-object p0, Lcom/appaac/haptic/AACHapticUtils;->sInstance:Lcom/appaac/haptic/AACHapticUtils;

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "context shouldn\'t be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public isNonRichTapMode()Z
    .locals 1

    invoke-virtual {p0}, Lcom/appaac/haptic/AACHapticUtils;->supportRichTap()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean p0, p0, Lcom/appaac/haptic/AACHapticUtils;->mRichTapEnable:Z

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public playExtPreBaked(II)V
    .locals 8

    iget-object v0, p0, Lcom/appaac/haptic/AACHapticUtils;->vibrator:Landroid/os/Vibrator;

    const-string v1, "AACHapticUtils"

    if-nez v0, :cond_0

    const-string p0, "Please call the init method"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    if-ltz p1, :cond_4

    const/4 v0, 0x1

    if-lt p2, v0, :cond_3

    const/16 v2, 0x64

    if-gt p2, v2, :cond_3

    iget-boolean v3, p0, Lcom/appaac/haptic/AACHapticUtils;->mRichTapEnable:Z

    if-nez v3, :cond_1

    const/16 p1, 0x41

    mul-int/lit16 p2, p2, 0xff

    div-int/2addr p2, v2

    invoke-direct {p0, p1, p2}, Lcom/appaac/haptic/AACHapticUtils;->playExtPreBakedOnNonRichTap(II)V

    goto :goto_0

    :cond_1
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_2

    iget-object v2, p0, Lcom/appaac/haptic/AACHapticUtils;->clazzVibrationEffect:Ljava/lang/Class;

    const-string v3, "createExtPreBaked"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v0

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v7

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/VibrationEffect;

    iget-object p0, p0, Lcom/appaac/haptic/AACHapticUtils;->vibrator:Landroid/os/Vibrator;

    invoke-virtual {p0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_0

    :cond_2
    const-string p0, "The system is low than 26,does not support richTap!!"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const-string p0, "The system doesn\'t integrate richTap software"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Wrong parameter {strength="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo p2, "}, which should be between 1 and 100 included!"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Wrong parameter effect is null!"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public supportRichTap()Z
    .locals 9

    iget-object v0, p0, Lcom/appaac/haptic/AACHapticUtils;->vibrator:Landroid/os/Vibrator;

    const-string v1, "AACHapticUtils"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const-string p0, "Please call the init method first"

    :goto_0
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-ge v0, v3, :cond_1

    const-string p0, "android api is lower than o,can not support!!"

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/appaac/haptic/AACHapticUtils;->clazzVibrationEffect:Ljava/lang/Class;

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v0, :cond_2

    :try_start_0
    const-string v5, "createPatternHeWithParam"

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/Class;

    const-class v7, [I

    aput-object v7, v6, v2

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v4

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v3

    const/4 v7, 0x3

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string v0, "The system doesn\'t integrate richTap software"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    move v4, v2

    :goto_1
    if-eqz v4, :cond_4

    iget-object p0, p0, Lcom/appaac/haptic/AACHapticUtils;->clazzVibrationEffect:Ljava/lang/Class;

    if-eqz p0, :cond_4

    :try_start_1
    const-string v0, "checkIfRichTapSupport"

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {p0, v0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 v0, 0x0

    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "checkIfRichTapSupport result:"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-ne v3, p0, :cond_3

    goto :goto_2

    :cond_3
    move v2, v4

    :goto_2
    move v4, v2

    goto :goto_3

    :catch_1
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_4
    :goto_3
    return v4
.end method

.method public useNonRichTap(Z)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "useNonRichTap start nonRichTap = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/appaac/haptic/AACHapticUtils;->mRichTapEnable:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AACHapticUtils"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/appaac/haptic/AACHapticUtils;->supportRichTap()Z

    move-result v0

    if-eqz v0, :cond_0

    xor-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    const-string p1, "the system doesn\'t integrate richTap software"

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/appaac/haptic/AACHapticUtils;->mRichTapEnable:Z

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v0, "useNonRichTap end nonRichTap = "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lcom/appaac/haptic/AACHapticUtils;->mRichTapEnable:Z

    xor-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
