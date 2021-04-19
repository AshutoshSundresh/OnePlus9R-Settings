.class Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController$3;
.super Ljava/lang/Object;
.source "OPThemeMCLSwitchPreferenceController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController;->onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController;


# direct methods
.method constructor <init>(Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController;)V
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController$3;->this$0:Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 123
    iget-object p0, p0, Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController$3;->this$0:Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController;

    invoke-virtual {p0}, Lcom/oneplus/settings/controllers/OPThemeMCLSwitchPreferenceController;->enableDarkMode()V

    return-void
.end method
