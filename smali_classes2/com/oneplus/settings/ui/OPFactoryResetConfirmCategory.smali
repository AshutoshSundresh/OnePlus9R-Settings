.class public Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;
.super Landroidx/preference/Preference;
.source "OPFactoryResetConfirmCategory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$OnFactoryResetConfirmListener;
    }
.end annotation


# instance fields
.field public mOnFactoryResetConfirmListener:Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$OnFactoryResetConfirmListener;

.field private onClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 60
    new-instance p1, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;

    invoke-direct {p1, p0}, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;-><init>(Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;)V

    iput-object p1, p0, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->onClickListener:Landroid/view/View$OnClickListener;

    .line 18
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->initViews()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    new-instance p1, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;

    invoke-direct {p1, p0}, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;-><init>(Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;)V

    iput-object p1, p0, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->onClickListener:Landroid/view/View$OnClickListener;

    .line 23
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->initViews()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    new-instance p1, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;

    invoke-direct {p1, p0}, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;-><init>(Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;)V

    iput-object p1, p0, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->onClickListener:Landroid/view/View$OnClickListener;

    .line 29
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->initViews()V

    return-void
.end method

.method private initViews()V
    .locals 1

    .line 33
    sget v0, Lcom/android/settings/R$layout;->op_boderless_button_preference:I

    .line 34
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setLayoutResource(I)V

    return-void
.end method


# virtual methods
.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 1

    .line 39
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    const v0, 0x1020016

    .line 40
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 41
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setConfirmButtonText(I)V
    .locals 0

    .line 56
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setTitle(I)V

    .line 57
    invoke-virtual {p0}, Landroidx/preference/Preference;->notifyChanged()V

    return-void
.end method

.method public setOnFactoryResetConfirmListener(Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$OnFactoryResetConfirmListener;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->mOnFactoryResetConfirmListener:Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$OnFactoryResetConfirmListener;

    return-void
.end method
