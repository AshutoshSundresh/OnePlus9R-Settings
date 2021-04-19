.class Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;
.super Ljava/lang/Object;
.source "OPFactoryResetConfirmCategory.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;


# direct methods
.method constructor <init>(Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;->this$0:Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 64
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$1;->this$0:Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory;->mOnFactoryResetConfirmListener:Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$OnFactoryResetConfirmListener;

    if-eqz p0, :cond_0

    .line 65
    invoke-interface {p0}, Lcom/oneplus/settings/ui/OPFactoryResetConfirmCategory$OnFactoryResetConfirmListener;->onFactoryResetConfirmClick()V

    :cond_0
    return-void
.end method
