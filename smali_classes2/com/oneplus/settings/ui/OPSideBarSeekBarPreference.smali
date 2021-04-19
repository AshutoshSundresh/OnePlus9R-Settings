.class public Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;
.super Landroidx/preference/Preference;
.source "OPSideBarSeekBarPreference.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mCurrentProgress:I

.field private mEnd:Landroid/widget/TextView;

.field private mStart:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, p2, v0}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    .line 49
    sget p1, Lcom/android/settings/R$layout;->op_side_bar_seekpreference:I

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setLayoutResource(I)V

    return-void
.end method

.method static synthetic access$000(Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;)I
    .locals 0

    .line 32
    iget p0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mCurrentProgress:I

    return p0
.end method

.method static synthetic access$002(Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;I)I
    .locals 0

    .line 32
    iput p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mCurrentProgress:I

    return p1
.end method

.method static synthetic access$100(Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;)Landroid/content/Context;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method private initSeekBar(Landroidx/preference/PreferenceViewHolder;)V
    .locals 6

    .line 72
    sget v0, Lcom/android/settings/R$id;->side_bar_transparent_seekbar:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    const/4 v1, 0x0

    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMin(I)V

    const/16 v2, 0x50

    .line 74
    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 76
    iget-object v2, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "edge_panel_float_bar_alpha"

    const/16 v4, 0x28

    const/4 v5, -0x2

    invoke-static {v2, v3, v4, v5}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    iput v2, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mCurrentProgress:I

    .line 78
    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 79
    new-instance v2, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference$1;

    invoke-direct {v2, p0}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference$1;-><init>(Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;)V

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 99
    sget v0, Lcom/android/settings/R$id;->title:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mTitle:Landroid/widget/TextView;

    .line 100
    sget v0, Lcom/android/settings/R$id;->header:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mStart:Landroid/widget/TextView;

    .line 101
    sget v0, Lcom/android/settings/R$id;->end:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mEnd:Landroid/widget/TextView;

    .line 102
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "edge_panel_toggle"

    invoke-static {p1, v0, v1, v5}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    move v1, v0

    :cond_0
    invoke-virtual {p0, v1}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->setEnabled(Z)V

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
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->initSeekBar(Landroidx/preference/PreferenceViewHolder;)V

    return-void
.end method

.method public setEnabled(Z)V
    .locals 2

    .line 108
    invoke-super {p0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    if-eqz p1, :cond_2

    .line 110
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mTitle:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    .line 111
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    sget v1, Lcom/android/settings/R$color;->op_control_text_color_primary:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 113
    :cond_0
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mStart:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    .line 114
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    sget v1, Lcom/android/settings/R$color;->op_control_text_color_secondary:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 116
    :cond_1
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mEnd:Landroid/widget/TextView;

    if-eqz p1, :cond_5

    .line 117
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    sget v0, Lcom/android/settings/R$color;->op_control_text_color_secondary:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 120
    :cond_2
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mTitle:Landroid/widget/TextView;

    if-eqz p1, :cond_3

    .line 121
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    sget v1, Lcom/android/settings/R$color;->op_control_text_color_disable_default:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    :cond_3
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mStart:Landroid/widget/TextView;

    if-eqz p1, :cond_4

    .line 124
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    sget v1, Lcom/android/settings/R$color;->op_control_text_color_disable_default:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 126
    :cond_4
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mEnd:Landroid/widget/TextView;

    if-eqz p1, :cond_5

    .line 127
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->mContext:Landroid/content/Context;

    sget v0, Lcom/android/settings/R$color;->op_control_text_color_disable_default:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_5
    :goto_0
    return-void
.end method
