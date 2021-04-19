.class Lcom/android/settings/accessibility/BalanceSeekBar$1;
.super Ljava/lang/Object;
.source "BalanceSeekBar.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/accessibility/BalanceSeekBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/accessibility/BalanceSeekBar;


# direct methods
.method constructor <init>(Lcom/android/settings/accessibility/BalanceSeekBar;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    if-eqz p3, :cond_3

    .line 75
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$200(Lcom/android/settings/accessibility/BalanceSeekBar;)I

    move-result v0

    if-eq p2, v0, :cond_0

    int-to-float v0, p2

    iget-object v1, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    .line 76
    invoke-static {v1}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$200(Lcom/android/settings/accessibility/BalanceSeekBar;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v2}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$300(Lcom/android/settings/accessibility/BalanceSeekBar;)F

    move-result v2

    sub-float/2addr v1, v2

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    .line 77
    invoke-static {v1}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$200(Lcom/android/settings/accessibility/BalanceSeekBar;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v2}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$300(Lcom/android/settings/accessibility/BalanceSeekBar;)F

    move-result v2

    add-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 78
    iget-object p2, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {p2}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$200(Lcom/android/settings/accessibility/BalanceSeekBar;)I

    move-result p2

    .line 79
    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 81
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$400(Lcom/android/settings/accessibility/BalanceSeekBar;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 82
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-virtual {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->doVibrate()V

    .line 83
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$402(Lcom/android/settings/accessibility/BalanceSeekBar;Z)Z

    goto :goto_0

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$200(Lcom/android/settings/accessibility/BalanceSeekBar;)I

    move-result v0

    if-ne p2, v0, :cond_1

    .line 86
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-virtual {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->doVibrate()V

    goto :goto_0

    .line 88
    :cond_1
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$402(Lcom/android/settings/accessibility/BalanceSeekBar;Z)Z

    .line 91
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$200(Lcom/android/settings/accessibility/BalanceSeekBar;)I

    move-result v0

    sub-int v0, p2, v0

    int-to-float v0, v0

    const v1, 0x3c23d70a    # 0.01f

    mul-float/2addr v0, v1

    .line 92
    iget-object v1, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v1}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$500(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, -0x2

    const-string v3, "master_balance"

    invoke-static {v1, v3, v0, v2}, Landroid/provider/Settings$System;->putFloatForUser(Landroid/content/ContentResolver;Ljava/lang/String;FI)Z

    .line 100
    :cond_3
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$000(Lcom/android/settings/accessibility/BalanceSeekBar;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 101
    :try_start_0
    iget-object v1, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v1}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$100(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 102
    iget-object p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {p0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$100(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    .line 104
    :cond_4
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$000(Lcom/android/settings/accessibility/BalanceSeekBar;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 65
    :try_start_0
    iget-object v1, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v1}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$100(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 66
    iget-object p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {p0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$100(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    move-result-object p0

    invoke-interface {p0, p1}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onStartTrackingTouch(Landroid/widget/SeekBar;)V

    .line 68
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .line 55
    iget-object v0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$000(Lcom/android/settings/accessibility/BalanceSeekBar;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 56
    :try_start_0
    iget-object v1, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {v1}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$100(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 57
    iget-object p0, p0, Lcom/android/settings/accessibility/BalanceSeekBar$1;->this$0:Lcom/android/settings/accessibility/BalanceSeekBar;

    invoke-static {p0}, Lcom/android/settings/accessibility/BalanceSeekBar;->access$100(Lcom/android/settings/accessibility/BalanceSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    move-result-object p0

    invoke-interface {p0, p1}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onStopTrackingTouch(Landroid/widget/SeekBar;)V

    .line 59
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
