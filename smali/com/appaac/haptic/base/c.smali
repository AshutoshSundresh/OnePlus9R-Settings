.class public Lcom/appaac/haptic/base/c;
.super Ljava/lang/Thread;


# instance fields
.field final a:Ljava/lang/Object;

.field final b:Landroid/content/Context;

.field c:Z

.field d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/appaac/haptic/base/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/appaac/haptic/base/c;->a:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/appaac/haptic/base/c;->c:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    iput-object p1, p0, Lcom/appaac/haptic/base/c;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method a()J
    .locals 2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method public a(I)V
    .locals 7

    iget-object v0, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const-wide/16 v1, 0x5

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-le v0, v4, :cond_0

    const-string v0, "NonRichTapThread"

    const-string/jumbo v5, "vibrating ,so interrupt it,size > 1,remove one"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :goto_0
    iget-object v0, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/appaac/haptic/base/b;

    invoke-virtual {p0}, Lcom/appaac/haptic/base/c;->a()J

    move-result-wide v3

    int-to-long v5, p1

    add-long/2addr v3, v5

    add-long/2addr v3, v1

    iput-wide v3, v0, Lcom/appaac/haptic/base/b;->f:J

    goto :goto_1

    :cond_0
    if-lez v0, :cond_1

    const-string v0, "NonRichTapThread"

    const-string/jumbo v4, "vibrating ,so interrupt it,size == 1,just set next time play"

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/appaac/haptic/base/c;->a:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    iget-object p0, p0, Lcom/appaac/haptic/base/c;->a:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p0

    goto :goto_3

    :catch_0
    move-exception p0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    monitor-exit p1

    return-void

    :goto_3
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public run()V
    .locals 10

    const-string v0, "NonRichTapThread"

    const-string v1, "non richTap thread start!!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/appaac/haptic/base/c;->c:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    if-eqz v0, :cond_5

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_4

    :cond_1
    invoke-virtual {p0}, Lcom/appaac/haptic/base/c;->a()J

    move-result-wide v0

    iget-object v2, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/appaac/haptic/base/b;

    iget-boolean v4, v2, Lcom/appaac/haptic/base/b;->g:Z

    if-nez v4, :cond_2

    :goto_1
    iget-object v0, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    iget-wide v4, v2, Lcom/appaac/haptic/base/b;->f:J

    cmp-long v6, v4, v0

    if-lez v6, :cond_3

    sub-long/2addr v4, v0

    iget-object v0, p0, Lcom/appaac/haptic/base/c;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    const-string v1, "NonRichTapThread"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "go to sleep :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/appaac/haptic/base/c;->a:Ljava/lang/Object;

    invoke-virtual {v1, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p0

    goto :goto_3

    :catch_0
    move-exception v1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget v0, v2, Lcom/appaac/haptic/base/b;->i:I

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->c()I

    move-result v1

    if-le v0, v1, :cond_0

    const-string v0, "NonRichTapThread"

    const-string v1, " wake up vib looper is end ,remove it!!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v3, v2, Lcom/appaac/haptic/base/b;->g:Z

    iget-object v0, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :goto_3
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :cond_3
    iget-object v0, p0, Lcom/appaac/haptic/base/c;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/appaac/haptic/base/d;->a(Landroid/content/Context;)Lcom/appaac/haptic/base/d;

    move-result-object v4

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->b()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->c()I

    move-result v6

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->d()I

    move-result v7

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->e()I

    move-result v8

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->f()I

    move-result v9

    invoke-virtual/range {v4 .. v9}, Lcom/appaac/haptic/base/d;->b(Ljava/lang/String;IIII)V

    iget v0, v2, Lcom/appaac/haptic/base/b;->i:I

    add-int/lit8 v0, v0, 0x1

    iput v0, v2, Lcom/appaac/haptic/base/b;->i:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " vib mHasVibNum:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v2, Lcom/appaac/haptic/base/b;->i:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NonRichTapThread"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, v2, Lcom/appaac/haptic/base/b;->i:I

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->c()I

    move-result v1

    if-lt v0, v1, :cond_4

    const-string v0, "NonRichTapThread"

    const-string v1, " wake up vib looper is end ,remove it!!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v3, v2, Lcom/appaac/haptic/base/b;->g:Z

    iget-object v0, p0, Lcom/appaac/haptic/base/c;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/appaac/haptic/base/c;->a()J

    move-result-wide v0

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->a()I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v0, v3

    iput-wide v0, v2, Lcom/appaac/haptic/base/b;->f:J

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " vib now:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/appaac/haptic/base/c;->a()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " mWhen:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, v2, Lcom/appaac/haptic/base/b;->f:J

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " lastTime:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/appaac/haptic/base/b;->a()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NonRichTapThread"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_5
    :goto_4
    iget-object v0, p0, Lcom/appaac/haptic/base/c;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    const-string v1, "NonRichTapThread"

    const-string v2, "nothing is in list,just wait!!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/appaac/haptic/base/c;->a:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_5
    :try_start_4
    monitor-exit v0

    goto/16 :goto_0

    :catchall_1
    move-exception p0

    goto :goto_6

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    :goto_6
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p0

    :cond_6
    return-void
.end method
