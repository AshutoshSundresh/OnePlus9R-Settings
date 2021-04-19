.class Lcom/android/settings/accessibility/HighTextContrastPreferenceController$1;
.super Ljava/lang/Object;
.source "HighTextContrastPreferenceController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/accessibility/HighTextContrastPreferenceController;->setChecked(Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/accessibility/HighTextContrastPreferenceController;

.field final synthetic val$isChecked:Z


# direct methods
.method constructor <init>(Lcom/android/settings/accessibility/HighTextContrastPreferenceController;Z)V
    .locals 0

    .line 47
    iput-object p1, p0, Lcom/android/settings/accessibility/HighTextContrastPreferenceController$1;->this$0:Lcom/android/settings/accessibility/HighTextContrastPreferenceController;

    iput-boolean p2, p0, Lcom/android/settings/accessibility/HighTextContrastPreferenceController$1;->val$isChecked:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 49
    iget-object v0, p0, Lcom/android/settings/accessibility/HighTextContrastPreferenceController$1;->this$0:Lcom/android/settings/accessibility/HighTextContrastPreferenceController;

    invoke-static {v0}, Lcom/android/settings/accessibility/HighTextContrastPreferenceController;->access$000(Lcom/android/settings/accessibility/HighTextContrastPreferenceController;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 50
    iget-boolean p0, p0, Lcom/android/settings/accessibility/HighTextContrastPreferenceController$1;->val$isChecked:Z

    const-string v1, "high_text_contrast_enabled"

    .line 49
    invoke-static {v0, v1, p0}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method
