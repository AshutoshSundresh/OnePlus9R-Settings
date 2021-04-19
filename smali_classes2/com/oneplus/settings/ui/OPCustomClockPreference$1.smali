.class Lcom/oneplus/settings/ui/OPCustomClockPreference$1;
.super Ljava/lang/Object;
.source "OPCustomClockPreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/oneplus/settings/ui/OPCustomClockPreference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/oneplus/settings/ui/OPCustomClockPreference;


# direct methods
.method constructor <init>(Lcom/oneplus/settings/ui/OPCustomClockPreference;)V
    .locals 0

    .line 230
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$1;->this$0:Lcom/oneplus/settings/ui/OPCustomClockPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 233
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$1;->this$0:Lcom/oneplus/settings/ui/OPCustomClockPreference;

    invoke-static {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->access$100(Lcom/oneplus/settings/ui/OPCustomClockPreference;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$1;->this$0:Lcom/oneplus/settings/ui/OPCustomClockPreference;

    invoke-static {v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->access$000(Lcom/oneplus/settings/ui/OPCustomClockPreference;)I

    move-result v0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showInfo onClick, getMdmEventName:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmEventName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", getMdmLabel:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmLabel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OPCustomClockPreference"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmEventName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmLabel()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2"

    invoke-static {v0, v1, v2}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$1;->this$0:Lcom/oneplus/settings/ui/OPCustomClockPreference;

    invoke-static {p0, p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->access$200(Lcom/oneplus/settings/ui/OPCustomClockPreference;Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;)V

    return-void
.end method
