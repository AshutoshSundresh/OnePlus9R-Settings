.class Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$1;
.super Ljava/lang/Object;
.source "OPChrominanceSeekBarPreference.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->initSeekBar(Landroidx/preference/PreferenceViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;


# direct methods
.method constructor <init>(Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$1;->this$0:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 85
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$1;->this$0:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mOPChrominanceSeekBarChangeListener:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;

    if-eqz p0, :cond_0

    .line 86
    invoke-interface {p0, p1, p2, p3}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;->onChrominanceProgressChanged(Landroid/widget/SeekBar;IZ)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 93
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$1;->this$0:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mOPChrominanceSeekBarChangeListener:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;

    if-eqz p0, :cond_0

    .line 94
    invoke-interface {p0, p1}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;->onChrominanceStartTrackingTouch(Landroid/widget/SeekBar;)V

    :cond_0
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 101
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$1;->this$0:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference;->mOPChrominanceSeekBarChangeListener:Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;

    if-eqz p0, :cond_0

    .line 102
    invoke-interface {p0, p1}, Lcom/oneplus/settings/ui/OPChrominanceSeekBarPreference$OPChrominanceSeekBarChangeListener;->onChrominanceStopTrackingTouch(Landroid/widget/SeekBar;)V

    :cond_0
    return-void
.end method
