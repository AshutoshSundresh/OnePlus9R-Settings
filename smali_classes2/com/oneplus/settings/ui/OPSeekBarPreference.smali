.class public Lcom/oneplus/settings/ui/OPSeekBarPreference;
.super Landroidx/preference/Preference;
.source "OPSeekBarPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/settings/ui/OPSeekBarPreference$OPColorModeSeekBarChangeListener;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field mOPColorModeSeekBarChangeListener:Lcom/oneplus/settings/ui/OPSeekBarPreference$OPColorModeSeekBarChangeListener;

.field private mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, p2, v0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/oneplus/settings/ui/OPSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPSeekBarPreference;->mContext:Landroid/content/Context;

    .line 49
    sget p1, Lcom/android/settings/R$layout;->op_seekpreference:I

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setLayoutResource(I)V

    return-void
.end method

.method private initSeekBar(Landroidx/preference/PreferenceViewHolder;)V
    .locals 2

    .line 71
    sget v0, Lcom/android/settings/R$id;->screen_color_mode_seekbar:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    iput-object p1, p0, Lcom/oneplus/settings/ui/OPSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    const/16 v0, 0x64

    .line 72
    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setMax(I)V

    .line 73
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    const/16 v0, 0x32

    invoke-virtual {p1, v0}, Lcom/oneplus/settings/ui/OPVerticalSeekBar;->setMarkerPosition(I)V

    .line 75
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSeekBarPreference;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v1, "oem_screen_better_value"

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    .line 77
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 78
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    new-instance v0, Lcom/oneplus/settings/ui/OPSeekBarPreference$1;

    invoke-direct {v0, p0}, Lcom/oneplus/settings/ui/OPSeekBarPreference$1;-><init>(Lcom/oneplus/settings/ui/OPSeekBarPreference;)V

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method


# virtual methods
.method public getSeekBarMax()I
    .locals 0

    .line 118
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPSeekBarPreference;->mSeekBar:Lcom/oneplus/settings/ui/OPVerticalSeekBar;

    invoke-virtual {p0}, Landroid/widget/SeekBar;->getMax()I

    move-result p0

    return p0
.end method

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
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPSeekBarPreference;->initSeekBar(Landroidx/preference/PreferenceViewHolder;)V

    return-void
.end method

.method public setOPColorModeSeekBarChangeListener(Lcom/oneplus/settings/ui/OPSeekBarPreference$OPColorModeSeekBarChangeListener;)V
    .locals 0

    .line 109
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPSeekBarPreference;->mOPColorModeSeekBarChangeListener:Lcom/oneplus/settings/ui/OPSeekBarPreference$OPColorModeSeekBarChangeListener;

    return-void
.end method
