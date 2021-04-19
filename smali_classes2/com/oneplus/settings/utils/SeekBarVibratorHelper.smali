.class public Lcom/oneplus/settings/utils/SeekBarVibratorHelper;
.super Ljava/lang/Object;
.source "SeekBarVibratorHelper.java"


# static fields
.field private static mInstance:Lcom/oneplus/settings/utils/SeekBarVibratorHelper;


# instance fields
.field private mContext:Landroid/content/Context;

.field private recent:I

.field private sliderAmount:I

.field private sliderEnd:I

.field private sliderStart:I

.field private time:J


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xa

    .line 9
    iput v0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderStart:I

    const/16 v0, 0x3c

    .line 10
    iput v0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderEnd:I

    const/16 v0, 0x64

    .line 11
    iput v0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderAmount:I

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;
    .locals 2

    const-class v0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    monitor-enter v0

    .line 23
    :try_start_0
    sget-object v1, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->mInstance:Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    if-nez v1, :cond_0

    .line 24
    new-instance v1, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    invoke-direct {v1}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;-><init>()V

    sput-object v1, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->mInstance:Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    .line 26
    :cond_0
    sget-object v1, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->mInstance:Lcom/oneplus/settings/utils/SeekBarVibratorHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public doSeekBarVibrate(Landroid/widget/SeekBar;I)V
    .locals 5

    .line 42
    iget-object v0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/oneplus/settings/utils/VibratorSceneUtils;->systemVibrateEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 45
    :cond_0
    invoke-static {}, Lcom/appaac/haptic/AACHapticUtils;->getInstance()Lcom/appaac/haptic/AACHapticUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appaac/haptic/AACHapticUtils;->supportRichTap()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 48
    :cond_1
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    const/4 v1, 0x2

    const/16 v2, 0x64

    if-ne p2, v0, :cond_2

    .line 49
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p2

    iget v0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->recent:I

    if-eq p2, v0, :cond_7

    .line 50
    invoke-static {}, Lcom/appaac/haptic/AACHapticUtils;->getInstance()Lcom/appaac/haptic/AACHapticUtils;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Lcom/appaac/haptic/AACHapticUtils;->playExtPreBaked(II)V

    .line 57
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p1

    iput p1, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->recent:I

    goto/16 :goto_1

    .line 60
    :cond_2
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMin()I

    move-result v0

    if-ne p2, v0, :cond_3

    .line 61
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMin()I

    move-result p2

    iget v0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->recent:I

    if-eq p2, v0, :cond_7

    .line 62
    invoke-static {}, Lcom/appaac/haptic/AACHapticUtils;->getInstance()Lcom/appaac/haptic/AACHapticUtils;

    move-result-object p2

    invoke-virtual {p2, v1, v2}, Lcom/appaac/haptic/AACHapticUtils;->playExtPreBaked(II)V

    .line 69
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMin()I

    move-result p1

    iput p1, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->recent:I

    goto :goto_1

    .line 72
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v3, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->time:J

    sub-long/2addr v0, v3

    const-wide/16 v3, 0x14

    cmp-long v0, v0, v3

    if-lez v0, :cond_7

    .line 73
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    if-lt v0, v2, :cond_4

    .line 74
    iput v2, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderAmount:I

    goto :goto_0

    .line 76
    :cond_4
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    iput v0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderAmount:I

    .line 78
    :goto_0
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderAmount:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 79
    div-int v1, p2, v0

    mul-int/2addr v1, v0

    .line 81
    iget v3, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderAmount:I

    if-ne v3, v2, :cond_6

    mul-int/lit8 v2, v0, 0x2

    if-le p2, v2, :cond_5

    mul-int/lit8 v0, v0, 0x62

    if-lt p2, v0, :cond_6

    :cond_5
    return-void

    .line 84
    :cond_6
    iget p2, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->recent:I

    if-eq v1, p2, :cond_7

    if-lez v1, :cond_7

    int-to-float p2, v1

    .line 85
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p2, p1

    iget p1, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderEnd:I

    iget v0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderStart:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    mul-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    iget p2, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->sliderStart:I

    add-int/2addr p1, p2

    .line 86
    invoke-static {}, Lcom/appaac/haptic/AACHapticUtils;->getInstance()Lcom/appaac/haptic/AACHapticUtils;

    move-result-object p2

    const/16 v0, 0xa

    invoke-virtual {p2, v0, p1}, Lcom/appaac/haptic/AACHapticUtils;->playExtPreBaked(II)V

    .line 87
    iput v1, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->recent:I

    .line 88
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->time:J

    :cond_7
    :goto_1
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->mContext:Landroid/content/Context;

    .line 31
    invoke-static {}, Lcom/appaac/haptic/AACHapticUtils;->getInstance()Lcom/appaac/haptic/AACHapticUtils;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p0}, Lcom/appaac/haptic/AACHapticUtils;->init(Landroid/content/Context;)Lcom/appaac/haptic/AACHapticUtils;

    return-void
.end method
