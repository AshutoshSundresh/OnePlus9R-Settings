.class Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference$1;
.super Ljava/lang/Object;
.source "OPSideBarSeekBarPreference.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->initSeekBar(Landroidx/preference/PreferenceViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;


# direct methods
.method constructor <init>(Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference$1;->this$0:Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 84
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference$1;->this$0:Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;

    invoke-static {p1, p2}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->access$002(Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;I)I

    .line 85
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference$1;->this$0:Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;

    invoke-static {p1}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->access$100(Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference$1;->this$0:Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;

    .line 86
    invoke-static {p0}, Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;->access$000(Lcom/oneplus/settings/ui/OPSideBarSeekBarPreference;)I

    move-result p0

    const-string p2, "edge_panel_float_bar_alpha"

    const/4 p3, -0x2

    .line 85
    invoke-static {p1, p2, p0, p3}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
