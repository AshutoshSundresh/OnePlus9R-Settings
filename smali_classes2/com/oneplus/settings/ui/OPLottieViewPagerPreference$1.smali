.class Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "OPLottieViewPagerPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;


# direct methods
.method constructor <init>(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)V
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;->this$0:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 77
    iget-object p3, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;->this$0:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    invoke-static {p3}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->access$000(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)Ljava/util/ArrayList;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-le p3, p2, :cond_0

    .line 78
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;->this$0:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    invoke-static {p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->access$000(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_0

    .line 80
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    :goto_0
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 72
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;->this$0:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    invoke-static {p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->access$000(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

    const/4 p0, -0x2

    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;->this$0:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    invoke-static {v0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->access$000(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 88
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference$1;->this$0:Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;

    invoke-static {p0}, Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;->access$000(Lcom/oneplus/settings/ui/OPLottieViewPagerPreference;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
