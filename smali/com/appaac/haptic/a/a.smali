.class public Lcom/appaac/haptic/a/a;
.super Lcom/appaac/haptic/base/d;


# instance fields
.field private final b:Landroid/os/Vibrator;

.field private d:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    const-string v0, "PatternHeImpl"

    invoke-direct {p0}, Lcom/appaac/haptic/base/d;-><init>()V

    const-string/jumbo v1, "vibrator"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Vibrator;

    iput-object p1, p0, Lcom/appaac/haptic/a/a;->b:Landroid/os/Vibrator;

    :try_start_0
    const-string p1, "android.os.RichTapVibrationEffect"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Lcom/appaac/haptic/a/a;->d:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "failed to reflect class: \"android.os.RichTapVibrationEffect\"!"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iget-object p1, p0, Lcom/appaac/haptic/a/a;->d:Ljava/lang/Class;

    if-nez p1, :cond_0

    :try_start_1
    const-string p1, "android.os.VibrationEffect"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Lcom/appaac/haptic/a/a;->d:Ljava/lang/Class;
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


# virtual methods
.method public b(Ljava/lang/String;IIII)V
    .locals 23

    move-object/from16 v0, p0

    move/from16 v1, p4

    const-string v2, "Duration"

    iget-object v3, v0, Lcom/appaac/haptic/a/a;->b:Landroid/os/Vibrator;

    const-string v4, "PatternHeImpl"

    if-nez v3, :cond_0

    const-string v0, "Please call the init method"

    :goto_0
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const-string v3, "play new he api"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x1

    move/from16 v5, p2

    if-ge v5, v3, :cond_1

    const-string v0, "The minimum count of loop pattern is 1"

    goto :goto_0

    :cond_1
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    move-object/from16 v6, p1

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v6, "Pattern"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/16 v7, 0x10

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    mul-int/lit8 v7, v6, 0x2

    new-array v8, v7, [J

    new-array v9, v7, [I

    const/4 v10, 0x0

    invoke-static {v9, v10}, Ljava/util/Arrays;->fill([II)V

    move v11, v10

    move v12, v11

    move v13, v12

    :goto_1
    if-ge v11, v6, :cond_7

    invoke-virtual {v5, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "Event"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    const-string v15, "Type"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v3, "continuous"

    invoke-static {v3, v15}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v10, "Parameters"

    const-wide/16 v16, 0x32

    const-wide/16 v18, 0x0

    move-object/from16 p2, v5

    const-string v5, "Intensity"

    move/from16 v20, v6

    const-string v6, "RelativeTime"

    if-eqz v3, :cond_4

    mul-int/lit8 v3, v11, 0x2

    :try_start_1
    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    sub-int/2addr v15, v12

    sub-int/2addr v15, v13

    int-to-long v12, v15

    aput-wide v12, v8, v3

    aget-wide v12, v8, v3

    cmp-long v12, v12, v18

    if-gez v12, :cond_2

    aput-wide v16, v8, v3

    :cond_2
    const/4 v12, 0x0

    aput v12, v9, v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    int-to-long v12, v12

    aput-wide v12, v8, v3

    invoke-virtual {v14, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v12, "Curve"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    const/4 v12, 0x1

    invoke-virtual {v10, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v12

    const-wide v15, 0x406fe00000000000L    # 255.0

    mul-double/2addr v12, v15

    double-to-int v12, v12

    const/16 v13, 0xff

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v12

    const/4 v13, 0x2

    invoke-virtual {v10, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v17

    move/from16 v21, v7

    move-object/from16 v22, v8

    mul-double v7, v17, v15

    double-to-int v5, v7

    const/16 v7, 0xff

    invoke-static {v5, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v12, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-float v5, v5

    const/high16 v7, 0x3f800000    # 1.0f

    mul-float/2addr v5, v7

    int-to-float v7, v1

    mul-float/2addr v5, v7

    const/high16 v7, 0x437f0000    # 255.0f

    div-float/2addr v5, v7

    float-to-int v5, v5

    const/4 v7, 0x1

    invoke-static {v7, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    aput v5, v9, v3

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x3

    invoke-virtual {v10, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "Time"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    if-eq v6, v5, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Event "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ": the relative time of 4th point must be equal to duration"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    :cond_3
    move v12, v3

    move v13, v5

    const/4 v7, 0x1

    goto :goto_3

    :cond_4
    move/from16 v21, v7

    move-object/from16 v22, v8

    const-string v3, "transient"

    invoke-static {v3, v15}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    mul-int/lit8 v3, v11, 0x2

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    sub-int/2addr v7, v12

    sub-int/2addr v7, v13

    int-to-long v7, v7

    aput-wide v7, v22, v3

    aget-wide v7, v22, v3

    cmp-long v7, v7, v18

    if-gez v7, :cond_5

    aput-wide v16, v22, v3

    :cond_5
    const/4 v7, 0x0

    aput v7, v9, v3

    add-int/lit8 v3, v3, 0x1

    const-wide/16 v12, 0x41

    aput-wide v12, v22, v3

    invoke-virtual {v14, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    int-to-double v12, v1

    const-wide/high16 v15, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v12, v15

    int-to-double v7, v5

    mul-double/2addr v12, v7

    const-wide/high16 v7, 0x4059000000000000L    # 100.0

    div-double/2addr v12, v7

    double-to-int v5, v12

    const/16 v7, 0xff

    invoke-static {v5, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    const/4 v7, 0x1

    invoke-static {v7, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    aput v5, v9, v3

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const/16 v5, 0x41

    move v12, v3

    move v13, v5

    :goto_3
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v5, p2

    move v3, v7

    move/from16 v6, v20

    move/from16 v7, v21

    move-object/from16 v8, v22

    const/4 v10, 0x0

    goto/16 :goto_1

    :cond_6
    const-string v1, "haven\'t get type value"

    goto :goto_2

    :cond_7
    move/from16 v21, v7

    move-object/from16 v22, v8

    :goto_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "times:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {v22 .. v22}, Ljava/util/Arrays;->toString([J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move/from16 v6, v21

    const/4 v1, 0x0

    const/4 v10, 0x0

    :goto_5
    if-ge v10, v6, :cond_8

    aget-wide v2, v22, v10

    int-to-long v7, v1

    add-long/2addr v7, v2

    long-to-int v1, v7

    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    :cond_8
    const/16 v2, 0x7530

    if-le v1, v2, :cond_9

    const-string v0, "Pattern\'s duration is less than 30000"

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_9
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    const/4 v3, -0x1

    if-lt v1, v2, :cond_a

    iget-object v0, v0, Lcom/appaac/haptic/a/a;->b:Landroid/os/Vibrator;

    move-object/from16 v1, v22

    invoke-static {v1, v9, v3}, Landroid/os/VibrationEffect;->createWaveform([J[II)Landroid/os/VibrationEffect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_6

    :cond_a
    move-object/from16 v1, v22

    iget-object v0, v0, Lcom/appaac/haptic/a/a;->b:Landroid/os/Vibrator;

    invoke-virtual {v0, v1, v3}, Landroid/os/Vibrator;->vibrate([JI)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_6
    return-void
.end method
