.class Lcom/oneplus/settings/better/OPScreenColorMode$3;
.super Lcom/android/settings/search/BaseSearchIndexProvider;
.source "OPScreenColorMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/oneplus/settings/better/OPScreenColorMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 694
    invoke-direct {p0}, Lcom/android/settings/search/BaseSearchIndexProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getNonIndexableKeys(Landroid/content/Context;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 708
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 709
    invoke-static {}, Lcom/oneplus/settings/better/OPScreenColorMode;->access$1300()Z

    move-result p1

    const-string v0, "screen_color_mode_dci_p3_settings"

    if-nez p1, :cond_0

    .line 710
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 712
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/better/OPScreenColorMode;->access$1400()Z

    move-result p1

    const-string v1, "screen_color_mode_adaptive_model_settings"

    if-nez p1, :cond_1

    .line 713
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 715
    :cond_1
    invoke-static {}, Lcom/oneplus/settings/better/OPScreenColorMode;->access$1500()Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "screen_color_mode_soft_settings"

    .line 716
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 718
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/better/OPScreenColorMode;->access$1600()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 719
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string p1, "screen_color_mode_basic_settings"

    .line 720
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 721
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    return-object p0
.end method

.method public getXmlResourcesToIndex(Landroid/content/Context;Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z)",
            "Ljava/util/List<",
            "Landroid/provider/SearchIndexableResource;",
            ">;"
        }
    .end annotation

    .line 697
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 699
    new-instance p2, Landroid/provider/SearchIndexableResource;

    invoke-direct {p2, p1}, Landroid/provider/SearchIndexableResource;-><init>(Landroid/content/Context;)V

    .line 700
    sget p1, Lcom/android/settings/R$xml;->op_screen_color_mode:I

    iput p1, p2, Landroid/provider/SearchIndexableResource;->xmlResId:I

    .line 701
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method
