.class public Lcom/oneplus/settings/ui/OPVerticalSeekBar;
.super Landroid/widget/SeekBar;
.source "OPVerticalSeekBar.java"


# instance fields
.field private final mMarkerPaint:Landroid/graphics/Paint;

.field private mMarkerPosition:I

.field private final mMarkerRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x101007b

    .line 19
    invoke-direct {p0, p1, p2, v0}, Lcom/oneplus/settings/ui/OPVerticalSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/oneplus/settings/ui/OPVerticalSeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 29
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 30
    new-instance p2, Landroid/graphics/Rect;

    sget p3, Lcom/android/settings/R$dimen;->balance_seekbar_center_marker_width:I

    .line 31
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    sget p4, Lcom/android/settings/R$dimen;->balance_seekbar_center_marker_height:I

    .line 32
    invoke-virtual {p1, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    const/4 p4, 0x0

    invoke-direct {p2, p4, p4, p3, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p2, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerRect:Landroid/graphics/Rect;

    .line 33
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerPaint:Landroid/graphics/Paint;

    .line 34
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Lcom/android/settings/R$color;->op_control_icon_color_disable:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 35
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerPaint:Landroid/graphics/Paint;

    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method


# virtual methods
.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    monitor-enter p0

    .line 44
    :try_start_0
    iget v0, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerPosition:I

    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/appaac/haptic/AACHapticUtils;->getInstance()Lcom/appaac/haptic/AACHapticUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appaac/haptic/AACHapticUtils;->supportRichTap()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/SeekBar;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    .line 46
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 47
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerPosition:I

    mul-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x64

    int-to-float v1, v1

    iget-object v2, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v0, v2

    int-to-float v0, v0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 49
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 50
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 52
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setMarkerPosition(I)V
    .locals 0

    .line 39
    iput p1, p0, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->mMarkerPosition:I

    return-void
.end method
