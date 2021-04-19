.class Lcom/oneplus/security/firewall/NetworkRestrictManager$1;
.super Ljava/lang/Object;
.source "NetworkRestrictManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/oneplus/security/firewall/NetworkRestrictManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/oneplus/security/firewall/NetworkRestrictManager;


# direct methods
.method constructor <init>(Lcom/oneplus/security/firewall/NetworkRestrictManager;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager$1;->this$0:Lcom/oneplus/security/firewall/NetworkRestrictManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/oneplus/security/firewall/NetworkRestrictManager$1;->this$0:Lcom/oneplus/security/firewall/NetworkRestrictManager;

    invoke-static {p0}, Lcom/oneplus/security/firewall/NetworkRestrictManager;->access$000(Lcom/oneplus/security/firewall/NetworkRestrictManager;)V

    return-void
.end method
