.class Lcom/android/settings/users/UserSettings$13;
.super Ljava/lang/Object;
.source "UserSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/users/UserSettings;->addUserNow(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/users/UserSettings;

.field final synthetic val$userType:I


# direct methods
.method constructor <init>(Lcom/android/settings/users/UserSettings;I)V
    .locals 0

    .line 762
    iput-object p1, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    iput p2, p0, Lcom/android/settings/users/UserSettings$13;->val$userType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 768
    iget-object v0, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v0}, Lcom/android/settings/users/UserSettings;->access$1300(Lcom/android/settings/users/UserSettings;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 769
    :try_start_0
    iget-object v1, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v1}, Lcom/android/settings/users/UserSettings;->access$1400(Lcom/android/settings/users/UserSettings;)Ljava/lang/String;

    move-result-object v1

    .line 770
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 773
    iget v0, p0, Lcom/android/settings/users/UserSettings$13;->val$userType:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    .line 774
    iget-object v0, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v0}, Lcom/android/settings/users/UserSettings;->access$400(Lcom/android/settings/users/UserSettings;)Landroid/os/UserManager;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Landroid/os/UserManager;->createUser(Ljava/lang/String;I)Landroid/content/pm/UserInfo;

    move-result-object v0

    goto :goto_0

    .line 776
    :cond_0
    iget-object v0, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v0}, Lcom/android/settings/users/UserSettings;->access$400(Lcom/android/settings/users/UserSettings;)Landroid/os/UserManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->createRestrictedProfile(Ljava/lang/String;)Landroid/content/pm/UserInfo;

    move-result-object v0

    .line 779
    :goto_0
    iget-object v1, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v1}, Lcom/android/settings/users/UserSettings;->access$1300(Lcom/android/settings/users/UserSettings;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    const/4 v4, 0x0

    if-nez v0, :cond_1

    .line 781
    :try_start_1
    iget-object v0, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v0, v2}, Lcom/android/settings/users/UserSettings;->access$1502(Lcom/android/settings/users/UserSettings;Z)Z

    .line 782
    iget-object v0, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v0, v4}, Lcom/android/settings/users/UserSettings;->access$1002(Lcom/android/settings/users/UserSettings;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 783
    iget-object p0, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {p0, v4}, Lcom/android/settings/users/UserSettings;->access$1102(Lcom/android/settings/users/UserSettings;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 784
    monitor-exit v1

    return-void

    .line 787
    :cond_1
    iget-object v2, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v2}, Lcom/android/settings/users/UserSettings;->access$1000(Lcom/android/settings/users/UserSettings;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 788
    iget-object v2, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v2}, Lcom/android/settings/users/UserSettings;->access$400(Lcom/android/settings/users/UserSettings;)Landroid/os/UserManager;

    move-result-object v2

    iget v5, v0, Landroid/content/pm/UserInfo;->id:I

    iget-object v6, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    .line 789
    invoke-static {v6}, Lcom/android/settings/users/UserSettings;->access$1000(Lcom/android/settings/users/UserSettings;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-static {v6}, Lcom/android/internal/util/UserIcons;->convertToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 788
    invoke-virtual {v2, v5, v6}, Landroid/os/UserManager;->setUserIcon(ILandroid/graphics/Bitmap;)V

    .line 792
    :cond_2
    iget v2, p0, Lcom/android/settings/users/UserSettings$13;->val$userType:I

    if-ne v2, v3, :cond_3

    .line 793
    iget-object v2, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v2}, Lcom/android/settings/users/UserSettings;->access$200(Lcom/android/settings/users/UserSettings;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 796
    :cond_3
    iget-object v2, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v2}, Lcom/android/settings/users/UserSettings;->access$200(Lcom/android/settings/users/UserSettings;)Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v3}, Lcom/android/settings/users/UserSettings;->access$200(Lcom/android/settings/users/UserSettings;)Landroid/os/Handler;

    move-result-object v3

    const/4 v5, 0x2

    iget v6, v0, Landroid/content/pm/UserInfo;->id:I

    iget v0, v0, Landroid/content/pm/UserInfo;->serialNumber:I

    invoke-virtual {v3, v5, v6, v0}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 799
    iget-object v0, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {v0, v4}, Lcom/android/settings/users/UserSettings;->access$1002(Lcom/android/settings/users/UserSettings;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 800
    iget-object p0, p0, Lcom/android/settings/users/UserSettings$13;->this$0:Lcom/android/settings/users/UserSettings;

    invoke-static {p0, v4}, Lcom/android/settings/users/UserSettings;->access$1102(Lcom/android/settings/users/UserSettings;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 801
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_1
    move-exception p0

    .line 770
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p0
.end method
