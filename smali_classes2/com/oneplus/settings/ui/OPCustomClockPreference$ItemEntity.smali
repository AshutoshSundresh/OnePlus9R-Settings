.class Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;
.super Ljava/lang/Object;
.source "OPCustomClockPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/oneplus/settings/ui/OPCustomClockPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ItemEntity"
.end annotation


# instance fields
.field hasInfo:Z

.field key_pref:Ljava/lang/String;

.field name:Ljava/lang/String;

.field resId:I

.field selected:Z

.field type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1

    .line 693
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 708
    iput-boolean v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    .line 709
    iput-boolean v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->hasInfo:Z

    .line 694
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->name:Ljava/lang/String;

    .line 695
    iput p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->resId:I

    .line 696
    iput p3, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->type:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIZLjava/lang/String;)V
    .locals 0

    .line 700
    invoke-direct {p0, p1, p2, p3}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 701
    iput-boolean p4, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->hasInfo:Z

    .line 702
    iput-object p5, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->key_pref:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getMdmEventName()Ljava/lang/String;
    .locals 1

    .line 715
    iget p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->type:I

    const/16 v0, 0xb

    if-eq p0, v0, :cond_1

    const/16 v0, 0xc

    if-eq p0, v0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    const-string p0, "bitmoji"

    goto :goto_0

    :cond_1
    const-string p0, "insight"

    :goto_0
    return-object p0
.end method

.method public getMdmLabel()Ljava/lang/String;
    .locals 1

    .line 728
    iget p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->type:I

    const/16 v0, 0xb

    if-eq p0, v0, :cond_1

    const/16 v0, 0xc

    if-eq p0, v0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    const-string p0, "bitmoji_amount"

    goto :goto_0

    :cond_1
    const-string p0, "insight_amount"

    :goto_0
    return-object p0
.end method
