.class public Lcom/android/settings/wifi/qrcode/QrCamera;
.super Landroid/os/Handler;
.source "QrCamera.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;,
        Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;
    }
.end annotation


# static fields
.field private static FORMATS:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static HARD_CODING_HEIGHT:I = 0x438

.field private static HARD_CODING_WIDTH:I = 0x5a0

.field private static HINTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "Ljava/util/List<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field mCamera:Landroid/hardware/Camera;

.field private mCameraOrientation:I

.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mDecodeTask:Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;

.field mParameters:Landroid/hardware/Camera$Parameters;

.field private mPreviewSize:Landroid/util/Size;

.field private mReader:Lcom/google/zxing/MultiFormatReader;

.field private mScannerCallback:Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 82
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    sput-object v0, Lcom/android/settings/wifi/qrcode/QrCamera;->HINTS:Ljava/util/Map;

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/settings/wifi/qrcode/QrCamera;->FORMATS:Ljava/util/List;

    .line 86
    sget-object v1, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    sget-object v0, Lcom/android/settings/wifi/qrcode/QrCamera;->HINTS:Ljava/util/Map;

    sget-object v1, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    sget-object v2, Lcom/android/settings/wifi/qrcode/QrCamera;->FORMATS:Ljava/util/List;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;)V
    .locals 1

    .line 101
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 102
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mContext:Ljava/lang/ref/WeakReference;

    .line 103
    iput-object p2, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mScannerCallback:Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;

    .line 104
    new-instance p1, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {p1}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object p1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mReader:Lcom/google/zxing/MultiFormatReader;

    .line 105
    sget-object p0, Lcom/android/settings/wifi/qrcode/QrCamera;->HINTS:Ljava/util/Map;

    invoke-virtual {p1, p0}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/settings/wifi/qrcode/QrCamera;)Lcom/google/zxing/MultiFormatReader;
    .locals 0

    .line 63
    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mReader:Lcom/google/zxing/MultiFormatReader;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/settings/wifi/qrcode/QrCamera;)Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;
    .locals 0

    .line 63
    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mScannerCallback:Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/settings/wifi/qrcode/QrCamera;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Lcom/android/settings/wifi/qrcode/QrCamera;->releaseCamera()V

    return-void
.end method

.method static synthetic access$402(Lcom/android/settings/wifi/qrcode/QrCamera;I)I
    .locals 0

    .line 63
    iput p1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCameraOrientation:I

    return p1
.end method

.method static synthetic access$500(Lcom/android/settings/wifi/qrcode/QrCamera;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Lcom/android/settings/wifi/qrcode/QrCamera;->setTransformationMatrix()V

    return-void
.end method

.method static synthetic access$600(Lcom/android/settings/wifi/qrcode/QrCamera;)Z
    .locals 0

    .line 63
    invoke-direct {p0}, Lcom/android/settings/wifi/qrcode/QrCamera;->startPreview()Z

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/android/settings/wifi/qrcode/QrCamera;[B)Lcom/android/settings/wifi/qrcode/QrYuvLuminanceSource;
    .locals 0

    .line 63
    invoke-direct {p0, p1}, Lcom/android/settings/wifi/qrcode/QrCamera;->getFrameImage([B)Lcom/android/settings/wifi/qrcode/QrYuvLuminanceSource;

    move-result-object p0

    return-object p0
.end method

.method private getBestPictureSize(Landroid/hardware/Camera$Parameters;)Landroid/util/Size;
    .locals 11

    .line 443
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 444
    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    int-to-double v1, v1

    iget v3, v0, Landroid/hardware/Camera$Size;->height:I

    int-to-double v3, v3

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/android/settings/wifi/qrcode/QrCamera;->getRatio(DD)D

    move-result-wide v1

    .line 445
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 446
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 449
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/hardware/Camera$Size;

    .line 450
    iget v7, v6, Landroid/hardware/Camera$Size;->width:I

    int-to-double v7, v7

    iget v9, v6, Landroid/hardware/Camera$Size;->height:I

    int-to-double v9, v9

    invoke-direct {p0, v7, v8, v9, v10}, Lcom/android/settings/wifi/qrcode/QrCamera;->getRatio(DD)D

    move-result-wide v7

    cmpl-double v9, v7, v1

    if-nez v9, :cond_1

    .line 452
    new-instance v7, Landroid/util/Size;

    iget v8, v6, Landroid/hardware/Camera$Size;->width:I

    iget v6, v6, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v7, v8, v6}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    sub-double/2addr v7, v1

    .line 453
    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    const-wide v9, 0x3fb999999999999aL    # 0.1

    cmpg-double v7, v7, v9

    if-gez v7, :cond_0

    .line 454
    new-instance v7, Landroid/util/Size;

    iget v8, v6, Landroid/hardware/Camera$Size;->width:I

    iget v6, v6, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v7, v8, v6}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 458
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result p0

    if-nez p0, :cond_3

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result p0

    if-nez p0, :cond_3

    const-string p0, "QrCamera"

    const-string v0, "No proper picture size, return default picture size"

    .line 459
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getPictureSize()Landroid/hardware/Camera$Size;

    move-result-object p0

    .line 461
    new-instance p1, Landroid/util/Size;

    iget v0, p0, Landroid/hardware/Camera$Size;->width:I

    iget p0, p0, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {p1, v0, p0}, Landroid/util/Size;-><init>(II)V

    return-object p1

    .line 464
    :cond_3
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result p0

    if-nez p0, :cond_4

    move-object v3, v4

    :cond_4
    const p0, 0x7fffffff

    const/4 p1, 0x0

    .line 471
    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    mul-int/2addr v1, v0

    .line 472
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 473
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v4

    mul-int/2addr v3, v4

    sub-int/2addr v3, v1

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-ge v3, p0, :cond_5

    move-object p1, v2

    move p0, v3

    goto :goto_1

    :cond_6
    return-object p1
.end method

.method private getBestPreviewSize(Landroid/hardware/Camera$Parameters;)Landroid/util/Size;
    .locals 12

    .line 424
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mScannerCallback:Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;

    invoke-interface {v0}, Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;->getViewSize()Landroid/util/Size;

    move-result-object v0

    .line 425
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-double v1, v1

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    int-to-double v3, v0

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/android/settings/wifi/qrcode/QrCamera;->getRatio(DD)D

    move-result-wide v0

    .line 427
    new-instance v2, Landroid/util/Size;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v3}, Landroid/util/Size;-><init>(II)V

    .line 428
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const-wide/16 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/Camera$Size;

    .line 429
    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    int-to-double v6, v6

    iget v8, v5, Landroid/hardware/Camera$Size;->height:I

    int-to-double v8, v8

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/android/settings/wifi/qrcode/QrCamera;->getRatio(DD)D

    move-result-wide v6

    .line 430
    iget v8, v5, Landroid/hardware/Camera$Size;->height:I

    iget v9, v5, Landroid/hardware/Camera$Size;->width:I

    mul-int/2addr v8, v9

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v9

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v10

    mul-int/2addr v9, v10

    if-le v8, v9, :cond_0

    sub-double v8, v3, v0

    .line 431
    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    move-result-wide v8

    div-double/2addr v8, v0

    const-wide v10, 0x3fb999999999999aL    # 0.1

    cmpl-double v8, v8, v10

    if-gtz v8, :cond_1

    sub-double/2addr v6, v0

    .line 432
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    div-double/2addr v6, v0

    cmpg-double v6, v6, v10

    if-gtz v6, :cond_0

    .line 433
    :cond_1
    new-instance v2, Landroid/util/Size;

    iget v3, v5, Landroid/hardware/Camera$Size;->width:I

    iget v4, v5, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    .line 434
    iget v3, v5, Landroid/hardware/Camera$Size;->width:I

    int-to-double v3, v3

    iget v5, v5, Landroid/hardware/Camera$Size;->height:I

    int-to-double v5, v5

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/android/settings/wifi/qrcode/QrCamera;->getRatio(DD)D

    move-result-wide v3

    goto :goto_0

    :cond_2
    return-object v2
.end method

.method private getFrameImage([B)Lcom/android/settings/wifi/qrcode/QrYuvLuminanceSource;
    .locals 3

    .line 398
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mScannerCallback:Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;

    iget-object v1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    iget v2, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCameraOrientation:I

    invoke-interface {v0, v1, v2}, Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;->getFramePosition(Landroid/util/Size;I)Landroid/graphics/Rect;

    move-result-object v0

    .line 399
    new-instance v1, Lcom/android/settings/wifi/qrcode/QrYuvLuminanceSource;

    iget-object v2, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    .line 400
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    invoke-direct {v1, p1, v2, p0}, Lcom/android/settings/wifi/qrcode/QrYuvLuminanceSource;-><init>([BII)V

    .line 401
    iget p0, v0, Landroid/graphics/Rect;->left:I

    iget p1, v0, Landroid/graphics/Rect;->top:I

    .line 402
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {v1, p0, p1, v2, v0}, Lcom/android/settings/wifi/qrcode/QrYuvLuminanceSource;->crop(IIII)Lcom/google/zxing/LuminanceSource;

    move-result-object p0

    check-cast p0, Lcom/android/settings/wifi/qrcode/QrYuvLuminanceSource;

    return-object p0
.end method

.method private getRatio(DD)D
    .locals 0

    cmpg-double p0, p1, p3

    if-gez p0, :cond_0

    div-double/2addr p1, p3

    goto :goto_0

    :cond_0
    div-double p1, p3, p1

    :goto_0
    return-wide p1
.end method

.method private isSupportMultiScreenResolution()Z
    .locals 2

    .line 190
    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    const-string v0, "display"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/hardware/display/DisplayManager;

    const/4 v0, 0x0

    .line 191
    invoke-virtual {p0, v0}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object p0

    .line 192
    invoke-virtual {p0}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 193
    array-length p0, p0

    const/4 v1, 0x2

    if-le p0, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private releaseCamera()V
    .locals 1

    .line 367
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 368
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    const/4 v0, 0x0

    .line 369
    iput-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    :cond_0
    return-void
.end method

.method private setTransformationMatrix()V
    .locals 7

    .line 375
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 378
    :goto_0
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    :goto_1
    if-eqz v1, :cond_2

    .line 379
    iget-object v1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    :goto_2
    int-to-double v2, v0

    int-to-double v4, v1

    .line 380
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/android/settings/wifi/qrcode/QrCamera;->getRatio(DD)D

    move-result-wide v2

    double-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    if-le v0, v1, :cond_3

    div-float v0, v3, v2

    goto :goto_3

    :cond_3
    div-float v0, v3, v2

    move v6, v3

    move v3, v0

    move v0, v6

    .line 392
    :goto_3
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 393
    invoke-virtual {v1, v3, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 394
    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mScannerCallback:Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;

    invoke-interface {p0, v1}, Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;->setTransform(Landroid/graphics/Matrix;)V

    return-void
.end method

.method private startPreview()Z
    .locals 5

    .line 230
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mContext:Ljava/lang/ref/WeakReference;

    .line 235
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    const-string/jumbo v2, "window"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 236
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    if-eq v0, v2, :cond_3

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    const/4 v3, 0x3

    if-eq v0, v3, :cond_1

    goto :goto_0

    :cond_1
    const/16 v1, 0x10e

    goto :goto_0

    :cond_2
    const/16 v1, 0xb4

    goto :goto_0

    :cond_3
    const/16 v1, 0x5a

    .line 252
    :cond_4
    :goto_0
    iget v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCameraOrientation:I

    sub-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    .line 253
    iget-object v1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 254
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 255
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    const-string v1, "auto"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 256
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 257
    invoke-virtual {p0, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    const-wide/16 v3, 0x5dc

    invoke-virtual {p0, v0, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_5
    return v2
.end method


# virtual methods
.method protected decodeImage(Lcom/google/zxing/BinaryBitmap;)V
    .locals 1

    .line 491
    :try_start_0
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v0, p1}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;

    move-result-object p1
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 494
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v0}, Lcom/google/zxing/MultiFormatReader;->reset()V

    goto :goto_0

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p0}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 495
    throw p1

    .line 494
    :catch_0
    iget-object p1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p1}, Lcom/google/zxing/MultiFormatReader;->reset()V

    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_0

    .line 498
    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mScannerCallback:Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/android/settings/wifi/qrcode/QrCamera$ScannerCallback;->handleSuccessfulResult(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 407
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 416
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unexpected Message: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "QrCamera"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 412
    :cond_0
    iget-object p1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 413
    invoke-virtual {p0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    const-wide/16 v0, 0x5dc

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :goto_0
    return-void
.end method

.method public isDecodeTaskAlive()Z
    .locals 0

    .line 509
    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mDecodeTask:Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method setCameraParameter()V
    .locals 3

    .line 202
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    .line 204
    invoke-direct {p0}, Lcom/android/settings/wifi/qrcode/QrCamera;->isSupportMultiScreenResolution()Z

    move-result v0

    if-nez v0, :cond_0

    .line 205
    new-instance v0, Landroid/util/Size;

    sget v1, Lcom/android/settings/wifi/qrcode/QrCamera;->HARD_CODING_WIDTH:I

    sget v2, Lcom/android/settings/wifi/qrcode/QrCamera;->HARD_CODING_HEIGHT:I

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    goto :goto_0

    .line 207
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-direct {p0, v0}, Lcom/android/settings/wifi/qrcode/QrCamera;->getBestPreviewSize(Landroid/hardware/Camera$Parameters;)Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    .line 210
    :goto_0
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    iget-object v1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 211
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-direct {p0, v0}, Lcom/android/settings/wifi/qrcode/QrCamera;->getBestPictureSize(Landroid/hardware/Camera$Parameters;)Landroid/util/Size;

    move-result-object v0

    .line 212
    iget-object v1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 214
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "off"

    .line 216
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 217
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 220
    :cond_1
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v0

    const-string v1, "continuous-picture"

    .line 221
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 222
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    const-string v1, "auto"

    .line 223
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 224
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 226
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    iget-object p0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v0, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    return-void
.end method

.method public start(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 115
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mDecodeTask:Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;

    if-nez v0, :cond_0

    .line 116
    new-instance v0, Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;-><init>(Lcom/android/settings/wifi/qrcode/QrCamera;Landroid/graphics/SurfaceTexture;Lcom/android/settings/wifi/qrcode/QrCamera$1;)V

    iput-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mDecodeTask:Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;

    .line 118
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p0, p1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    return-void
.end method

.method public declared-synchronized stop()V
    .locals 2

    monitor-enter p0

    const/4 v0, 0x1

    .line 128
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 129
    iget-object v1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mDecodeTask:Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;

    if-eqz v1, :cond_0

    .line 130
    iget-object v1, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mDecodeTask:Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;

    invoke-virtual {v1, v0}, Landroid/os/AsyncTask;->cancel(Z)Z

    const/4 v0, 0x0

    .line 131
    iput-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mDecodeTask:Lcom/android/settings/wifi/qrcode/QrCamera$DecodingTask;

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    .line 134
    iget-object v0, p0, Lcom/android/settings/wifi/qrcode/QrCamera;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 136
    invoke-direct {p0}, Lcom/android/settings/wifi/qrcode/QrCamera;->releaseCamera()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
