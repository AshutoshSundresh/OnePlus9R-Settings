.class public Lcom/oneplus/settings/utils/OpBitmojiAodHelper;
.super Ljava/lang/Object;
.source "OpBitmojiAodHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;
    }
.end annotation


# instance fields
.field private mAvatarListener:Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;

.field private mBitmojiObserver:Landroid/database/ContentObserver;

.field private mClickListener:Landroid/view/View$OnClickListener;

.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mRegistered:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 269
    new-instance v0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper$2;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper$2;-><init>(Lcom/oneplus/settings/utils/OpBitmojiAodHelper;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mBitmojiObserver:Landroid/database/ContentObserver;

    .line 278
    new-instance v0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper$3;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper$3;-><init>(Lcom/oneplus/settings/utils/OpBitmojiAodHelper;)V

    iput-object v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mClickListener:Landroid/view/View$OnClickListener;

    .line 55
    iput-object p1, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    const-string v0, "layout_inflater"

    .line 56
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    iput-object p1, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mInflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method static synthetic access$000(Lcom/oneplus/settings/utils/OpBitmojiAodHelper;[Ljava/lang/String;)Landroid/net/Uri;
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getUri([Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/oneplus/settings/utils/OpBitmojiAodHelper;)Landroid/content/Context;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200(Lcom/oneplus/settings/utils/OpBitmojiAodHelper;)Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mAvatarListener:Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/oneplus/settings/utils/OpBitmojiAodHelper;Landroid/content/Intent;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private getButtonReady(Landroid/view/View;I)V
    .locals 3

    .line 194
    sget p0, Lcom/android/settings/R$id;->bitmoji_button_text:I

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p2, :cond_3

    const/4 v1, 0x2

    if-eq p2, v1, :cond_2

    const/4 v1, 0x3

    if-eq p2, v1, :cond_2

    const/4 v1, 0x4

    if-eq p2, v1, :cond_1

    move v1, v0

    goto :goto_0

    .line 209
    :cond_1
    sget v1, Lcom/android/settings/R$string;->op_bitmoji_aod_guide_download:I

    goto :goto_0

    .line 206
    :cond_2
    sget v1, Lcom/android/settings/R$string;->op_bitmoji_aod_guide_connect:I

    goto :goto_0

    .line 202
    :cond_3
    sget v1, Lcom/android/settings/R$string;->op_bitmoji_aod_guide_button:I

    .line 212
    :goto_0
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 214
    sget p0, Lcom/android/settings/R$id;->bitmoji_button:I

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 215
    sget v1, Lcom/android/settings/R$id;->install_button:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 216
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isO2()Z

    move-result v1

    const/16 v2, 0x8

    if-eqz v1, :cond_4

    if-nez p2, :cond_4

    .line 218
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 219
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 221
    :cond_4
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 222
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method private getContentReady(Landroid/view/View;I)V
    .locals 1

    .line 227
    sget p0, Lcom/android/settings/R$id;->bitmoji_desp:I

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x0

    if-eqz p2, :cond_2

    const/4 v0, 0x2

    if-eq p2, v0, :cond_1

    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    const/4 v0, 0x4

    if-eq p2, v0, :cond_1

    goto :goto_0

    .line 240
    :cond_1
    sget p1, Lcom/android/settings/R$string;->op_bitmoji_aod_guide_content2:I

    goto :goto_0

    .line 235
    :cond_2
    sget p1, Lcom/android/settings/R$string;->op_bitmoji_aod_guide_content1:I

    .line 243
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method private varargs getUri([Ljava/lang/String;)Landroid/net/Uri;
    .locals 3

    .line 180
    new-instance p0, Landroid/net/Uri$Builder;

    invoke-direct {p0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v0, "content"

    .line 181
    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "com.oneplus.systemui.ContentProvider"

    .line 182
    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    .line 183
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 184
    invoke-virtual {p0, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 186
    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static isBitmojiAodSupported()Z
    .locals 1

    .line 65
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isMEARom()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isH2()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private startActivity(Landroid/content/Intent;)V
    .locals 0

    .line 265
    :try_start_0
    iget-object p0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method


# virtual methods
.method public getAvatar()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 87
    invoke-virtual {p0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getBitmojiStatus()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 88
    iget-object v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    .line 89
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getAvatarUri()Landroid/net/Uri;

    move-result-object v1

    .line 88
    invoke-static {v0, v1}, Landroid/graphics/ImageDecoder;->createSource(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/ImageDecoder$Source;

    move-result-object v0

    .line 91
    :try_start_0
    invoke-static {v0}, Landroid/graphics/ImageDecoder;->decodeDrawable(Landroid/graphics/ImageDecoder$Source;)Landroid/graphics/drawable/Drawable;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    const-string v1, "OpBitmojiAodHelper"

    const-string v2, "getAvatar occur error"

    .line 93
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 96
    :cond_0
    iget-object p0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/android/settings/R$drawable;->op_bitmoji_default_avatar:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public getAvatarUri()Landroid/net/Uri;
    .locals 1

    const-string v0, "bitmojiAvatar"

    .line 190
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getUri([Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public getBitmojiStatus()I
    .locals 4

    .line 69
    iget-object v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "bitmojiStatus"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    .line 70
    invoke-direct {p0, v1}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getUri([Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const/4 v1, 0x0

    .line 69
    invoke-virtual {v0, p0, v1, v1, v1}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 73
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "status"

    .line 74
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const-string v1, "OpBitmojiAodHelper"

    .line 75
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getBitmojiAodStatus "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return v0

    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 81
    throw v0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public handleStatus(Landroid/view/ViewGroup;Landroid/widget/Button;)V
    .locals 8

    if-eqz p1, :cond_4

    .line 101
    invoke-virtual {p0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getBitmojiStatus()I

    move-result v0

    .line 102
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lez v1, :cond_1

    .line 103
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-ne v0, v2, :cond_0

    .line 105
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    const/16 p0, 0x8

    .line 106
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setVisibility(I)V

    if-eqz p2, :cond_4

    .line 108
    invoke-virtual {p2, v2}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    .line 111
    :cond_0
    invoke-direct {p0, v1, v0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getButtonReady(Landroid/view/View;I)V

    .line 112
    invoke-direct {p0, v1, v0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getContentReady(Landroid/view/View;I)V

    if-eqz p2, :cond_4

    .line 114
    invoke-virtual {p2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    :cond_1
    if-ne v0, v2, :cond_2

    return-void

    .line 122
    :cond_2
    new-instance v1, Lcom/oneplus/settings/utils/OPDisplayDensityUtils;

    iget-object v2, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/oneplus/settings/utils/OPDisplayDensityUtils;-><init>(Landroid/content/Context;)V

    .line 124
    iget-object v2, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mInflater:Landroid/view/LayoutInflater;

    sget v4, Lcom/android/settings/R$layout;->op_bitmoji_clock_guide_layout:I

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 128
    sget v4, Lcom/android/settings/R$id;->info_image:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 129
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 130
    iget-object v6, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    sget v7, Lcom/android/settings/R$dimen;->op_bitmoji_aod_guide_image_width:I

    invoke-virtual {v1, v6, v7}, Lcom/oneplus/settings/utils/OPDisplayDensityUtils;->convertDpToFixedPx(Landroid/content/Context;I)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 131
    iget-object v6, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    sget v7, Lcom/android/settings/R$dimen;->op_bitmoji_aod_guide_image_height:I

    invoke-virtual {v1, v6, v7}, Lcom/oneplus/settings/utils/OPDisplayDensityUtils;->convertDpToFixedPx(Landroid/content/Context;I)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 132
    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    sget v4, Lcom/android/settings/R$id;->bitmoji_button:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 135
    iget-object v5, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    sget v4, Lcom/android/settings/R$id;->install_button:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 139
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isO2()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 140
    move-object v5, v4

    check-cast v5, Landroid/widget/ImageView;

    sget v6, Lcom/android/settings/R$drawable;->download_from_playstore:I

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 142
    :cond_3
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 143
    iget-object v6, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    sget v7, Lcom/android/settings/R$dimen;->op_bitmoji_aod_download_button_width:I

    invoke-virtual {v1, v6, v7}, Lcom/oneplus/settings/utils/OPDisplayDensityUtils;->convertDpToFixedPx(Landroid/content/Context;I)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 144
    iget-object v6, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    sget v7, Lcom/android/settings/R$dimen;->op_bitmoji_aod_download_button_height:I

    invoke-virtual {v1, v6, v7}, Lcom/oneplus/settings/utils/OPDisplayDensityUtils;->convertDpToFixedPx(Landroid/content/Context;I)I

    move-result v1

    iput v1, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 145
    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    iget-object v1, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    invoke-direct {p0, v2, v0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getButtonReady(Landroid/view/View;I)V

    .line 149
    invoke-direct {p0, v2, v0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getContentReady(Landroid/view/View;I)V

    .line 151
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 154
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 155
    invoke-virtual {p2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_4
    :goto_0
    return-void
.end method

.method public registerObserver(Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;)V
    .locals 4

    .line 161
    iget-boolean v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mRegistered:Z

    if-nez v0, :cond_0

    .line 163
    :try_start_0
    iget-object v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 164
    invoke-virtual {p0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->getAvatarUri()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mBitmojiObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x1

    .line 163
    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 165
    iput-object p1, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mAvatarListener:Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;

    .line 166
    iput-boolean v3, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mRegistered:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public unregisterObserver()V
    .locals 2

    .line 172
    iget-boolean v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mRegistered:Z

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mBitmojiObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    const/4 v0, 0x0

    .line 174
    iput-object v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mAvatarListener:Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;

    const/4 v0, 0x0

    .line 175
    iput-boolean v0, p0, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->mRegistered:Z

    :cond_0
    return-void
.end method
