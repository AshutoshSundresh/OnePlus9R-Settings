.class Lcom/android/settings/core/LiveDataController$1;
.super Ljava/lang/Object;
.source "LiveDataController.java"

# interfaces
.implements Landroidx/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/core/LiveDataController;-><init>(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/lifecycle/Observer<",
        "Ljava/lang/CharSequence;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/core/LiveDataController;


# direct methods
.method constructor <init>(Lcom/android/settings/core/LiveDataController;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/android/settings/core/LiveDataController$1;->this$0:Lcom/android/settings/core/LiveDataController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(Ljava/lang/CharSequence;)V
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/android/settings/core/LiveDataController$1;->this$0:Lcom/android/settings/core/LiveDataController;

    iput-object p1, p0, Lcom/android/settings/core/LiveDataController;->mSummary:Ljava/lang/CharSequence;

    .line 55
    invoke-static {p0}, Lcom/android/settings/core/LiveDataController;->access$000(Lcom/android/settings/core/LiveDataController;)Landroidx/preference/Preference;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/android/settings/core/LiveDataController;->access$100(Lcom/android/settings/core/LiveDataController;Landroidx/preference/Preference;)V

    return-void
.end method

.method public bridge synthetic onChanged(Ljava/lang/Object;)V
    .locals 0

    .line 51
    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/android/settings/core/LiveDataController$1;->onChanged(Ljava/lang/CharSequence;)V

    return-void
.end method
