.class public Lcom/android/settings/accessibility/BalanceSeekBar;
.super Landroid/widget/SeekBar;
.source "BalanceSeekBar.java"


# static fields
.field static final SNAP_TO_PERCENTAGE:F = 0.03f


# instance fields
.field private mCenter:I

.field private final mCenterMarkerPaint:Landroid/graphics/Paint;

.field private final mCenterMarkerRect:Landroid/graphics/Rect;

.field private final mContext:Landroid/content/Context;

.field private final mListenerLock:Ljava/lang/Object;

.field private mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private final mProxySeekBarListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mSnapThreshold:F

.field private mVibratePattern:[J

.field private mVibrator:Landroid/os/Vibrator;

.field private mVibratorFlag:Z

.field private mVibratorSceneId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x101007b

    .line 118
    invoke-direct {p0, p1, p2, v0}, Lcom/android/settings/accessibility/BalanceSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 122
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/settings/accessibility/BalanceSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    .line 126
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 44
    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mListenerLock:Ljava/lang/Object;

    const/16 p2, 0x3eb

    .line 48
    iput p2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibratorSceneId:I

    const/4 p2, 0x1

    .line 49
    iput-boolean p2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibratorFlag:Z

    .line 52
    new-instance p2, Lcom/android/settings/accessibility/BalanceSeekBar$1;

    invoke-direct {p2, p0}, Lcom/android/settings/accessibility/BalanceSeekBar$1;-><init>(Lcom/android/settings/accessibility/BalanceSeekBar;)V

    iput-object p2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mProxySeekBarListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 127
    iput-object p1, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mContext:Landroid/content/Context;

    .line 128
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    .line 129
    new-instance p3, Landroid/graphics/Rect;

    sget p4, Lcom/android/settings/R$dimen;->balance_seekbar_center_marker_width:I

    .line 130
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    sget v0, Lcom/android/settings/R$dimen;->balance_seekbar_center_marker_height:I

    .line 131
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    const/4 v0, 0x0

    invoke-direct {p3, v0, v0, p4, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p3, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenterMarkerRect:Landroid/graphics/Rect;

    .line 132
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenterMarkerPaint:Landroid/graphics/Paint;

    .line 135
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget p4, Lcom/android/settings/R$color;->op_control_icon_color_disable:I

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 137
    iget-object p2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenterMarkerPaint:Landroid/graphics/Paint;

    sget-object p3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 139
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    const-string/jumbo p2, "vibrator"

    .line 141
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Vibrator;

    iput-object p1, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibrator:Landroid/os/Vibrator;

    .line 143
    iget-object p1, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mProxySeekBarListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/accessibility/BalanceSeekBar;)Ljava/lang/Object;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mListenerLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/settings/accessibility/BalanceSeekBar;)I
    .locals 0

    .line 42
    iget p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenter:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/settings/accessibility/BalanceSeekBar;)F
    .locals 0

    .line 42
    iget p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mSnapThreshold:F

    return p0
.end method

.method static synthetic access$400(Lcom/android/settings/accessibility/BalanceSeekBar;)Z
    .locals 0

    .line 42
    iget-boolean p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibratorFlag:Z

    return p0
.end method

.method static synthetic access$402(Lcom/android/settings/accessibility/BalanceSeekBar;Z)Z
    .locals 0

    .line 42
    iput-boolean p1, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibratorFlag:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/content/Context;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mContext:Landroid/content/Context;

    return-object p0
.end method


# virtual methods
.method doVibrate()V
    .locals 3

    .line 182
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/oneplus/common/VibratorSceneUtils;->systemVibrateEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibrator:Landroid/os/Vibrator;

    iget v2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibratorSceneId:I

    invoke-static {v0, v1, v2}, Lcom/oneplus/common/VibratorSceneUtils;->getVibratorScenePattern(Landroid/content/Context;Landroid/os/Vibrator;I)[J

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibratePattern:[J

    .line 185
    iget-object p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mVibrator:Landroid/os/Vibrator;

    invoke-static {v0, p0}, Lcom/oneplus/common/VibratorSceneUtils;->vibrateIfNeeded([JLandroid/os/Vibrator;)V

    :cond_0
    return-void
.end method

.method getProxySeekBarListener()Landroid/widget/SeekBar$OnSeekBarChangeListener;
    .locals 0

    .line 177
    iget-object p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mProxySeekBarListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-object p0
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    monitor-enter p0

    .line 166
    :try_start_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/SeekBar;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    .line 167
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 168
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenterMarkerRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenterMarkerRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v0, v2

    int-to-float v0, v0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 170
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenterMarkerRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenterMarkerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 171
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 172
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setMax(I)V
    .locals 1

    monitor-enter p0

    .line 156
    :try_start_0
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 158
    div-int/lit8 v0, p1, 0x2

    iput v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mCenter:I

    int-to-float p1, p1

    const v0, 0x3cf5c28f    # 0.03f

    mul-float/2addr p1, v0

    .line 159
    iput p1, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mSnapThreshold:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mListenerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 149
    :try_start_0
    iput-object p1, p0, Lcom/android/settings/accessibility/BalanceSeekBar;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 150
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
