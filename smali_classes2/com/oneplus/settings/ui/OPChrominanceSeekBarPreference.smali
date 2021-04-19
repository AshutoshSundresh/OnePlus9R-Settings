.class public Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;
.super Landroidx/preference/Preference;
.source "OPChrominanceSeekBarPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field mOPChrominanceSeekBarChangeListener:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;

.field private mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, p2, v0}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mContext:Landroid/content/Context;

    .line 49
    sget p1, Lcom/android/settings/R$layout;->op_chrominance_seekpreference:I

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setLayoutResource(I)V

    return-void
.end method

.method private initSeekBar(Landroidx/preference/PreferenceViewHolder;)V
    .locals 2

    .line 72
    sget v0, Lcom/android/settings/R$id;->chrominance_seekbar:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    iput-object p1, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    const/16 v0, 0x64

    .line 73
    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setMax(I)V

    .line 74
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    const/16 v0, 0x32

    invoke-virtual {p1, v0}, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->setMarkerPosition(I)V

    .line 76
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v1, "oem_screen_chrominance_value"

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    .line 78
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 79
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    new-instance v0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$1;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$1;-><init>(Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;)V

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method


# virtual methods
.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 1

    .line 65
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    const/4 v0, 0x0

    .line 66
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->setDividerAllowedBelow(Z)V

    .line 67
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->setDividerAllowedAbove(Z)V

    .line 68
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->initSeekBar(Landroidx/preference/PreferenceViewHolder;)V

    return-void
.end method

.method public setOPChrominanceSeekBarChangeListener(Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mOPChrominanceSeekBarChangeListener:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;

    return-void
.end method
