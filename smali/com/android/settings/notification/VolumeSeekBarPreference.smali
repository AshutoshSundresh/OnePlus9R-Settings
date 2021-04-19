.class public Lcom/android/settings/notification/VolumeSeekBarPreference;
.super Lcom/android/settings/widget/SeekBarPreference;
.source "VolumeSeekBarPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/notification/VolumeSeekBarPreference$Callback;
    }
.end annotation


# instance fields
.field mAudioManager:Landroid/media/AudioManager;

.field private mCallback:Lcom/android/settings/notification/VolumeSeekBarPreference$Callback;

.field private mIconResId:I

.field private mIconView:Landroid/widget/ImageView;

.field private mMuteIconResId:I

.field private mMuted:Z

.field protected mSeekBar:Landroid/widget/SeekBar;

.field private mStopped:Z

.field private mStream:I

.field private mSuppressionText:Ljava/lang/String;

.field private mSuppressionTextView:Landroid/widget/TextView;

.field private mVolumizer:Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

.field private mZenMuted:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 83
    invoke-direct {p0, p1}, Lcom/android/settings/widget/SeekBarPreference;-><init>(Landroid/content/Context;)V

    .line 84
    sget v0, Lcom/android/settings/R$layout;->preference_volume_slider:I

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setLayoutResource(I)V

    const-string v0, "audio"

    .line 85
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mAudioManager:Landroid/media/AudioManager;

    .line 86
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/android/settings/widget/SeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 77
    sget p2, Lcom/android/settings/R$layout;->preference_volume_slider:I

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setLayoutResource(I)V

    const-string p2, "audio"

    .line 78
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/media/AudioManager;

    iput-object p2, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mAudioManager:Landroid/media/AudioManager;

    .line 79
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2, p3}, Lcom/android/settings/widget/SeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    sget p2, Lcom/android/settings/R$layout;->preference_volume_slider:I

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setLayoutResource(I)V

    const-string p2, "audio"

    .line 71
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/media/AudioManager;

    iput-object p2, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mAudioManager:Landroid/media/AudioManager;

    .line 72
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 62
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/settings/widget/SeekBarPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 63
    sget p2, Lcom/android/settings/R$layout;->preference_volume_slider:I

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setLayoutResource(I)V

    const-string p2, "audio"

    .line 64
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/media/AudioManager;

    iput-object p2, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mAudioManager:Landroid/media/AudioManager;

    .line 65
    invoke-static {}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->getInstance()Lcom/oneplus/settings/utils/SeekBarVibratorHelper;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/oneplus/settings/utils/SeekBarVibratorHelper;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/notification/VolumeSeekBarPreference;)Lcom/android/settings/notification/VolumeSeekBarPreference$Callback;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mCallback:Lcom/android/settings/notification/VolumeSeekBarPreference$Callback;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/settings/notification/VolumeSeekBarPreference;)I
    .locals 0

    .line 42
    iget p0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStream:I

    return p0
.end method

.method static synthetic access$202(Lcom/android/settings/notification/VolumeSeekBarPreference;Z)Z
    .locals 0

    .line 42
    iput-boolean p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mMuted:Z

    return p1
.end method

.method static synthetic access$302(Lcom/android/settings/notification/VolumeSeekBarPreference;Z)Z
    .locals 0

    .line 42
    iput-boolean p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mZenMuted:Z

    return p1
.end method

.method private getMediaVolumeUri()Landroid/net/Uri;
    .locals 2

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android.resource://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p0, Lcom/android/settings/R$raw;->media_volume:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 211
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected init()V
    .locals 5

    .line 137
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    if-nez v0, :cond_0

    return-void

    .line 138
    :cond_0
    new-instance v0, Lcom/android/settings/notification/VolumeSeekBarPreference$1;

    invoke-direct {v0, p0}, Lcom/android/settings/notification/VolumeSeekBarPreference$1;-><init>(Lcom/android/settings/notification/VolumeSeekBarPreference;)V

    .line 167
    iget v1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStream:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    invoke-direct {p0}, Lcom/android/settings/notification/VolumeSeekBarPreference;->getMediaVolumeUri()Landroid/net/Uri;

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 168
    :goto_0
    iget-object v2, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mVolumizer:Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

    if-nez v2, :cond_2

    .line 169
    new-instance v2, Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStream:I

    invoke-direct {v2, v3, v4, v1, v0}, Lcom/oneplus/settings/notification/OPSeekBarVolumizer;-><init>(Landroid/content/Context;ILandroid/net/Uri;Lcom/oneplus/settings/notification/OPSeekBarVolumizer$Callback;)V

    iput-object v2, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mVolumizer:Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

    .line 171
    :cond_2
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mVolumizer:Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

    invoke-virtual {v0}, Lcom/oneplus/settings/notification/OPSeekBarVolumizer;->start()V

    .line 172
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mVolumizer:Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

    iget-object v1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/notification/OPSeekBarVolumizer;->setSeekBar(Landroid/widget/SeekBar;)V

    .line 173
    invoke-virtual {p0}, Lcom/android/settings/notification/VolumeSeekBarPreference;->updateIconView()V

    .line 174
    invoke-virtual {p0}, Lcom/android/settings/notification/VolumeSeekBarPreference;->updateSuppressionText()V

    .line 175
    invoke-virtual {p0}, Landroidx/preference/Preference;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_3

    .line 176
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 177
    iget-object p0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mVolumizer:Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

    invoke-virtual {p0}, Lcom/oneplus/settings/notification/OPSeekBarVolumizer;->stop()V

    :cond_3
    return-void
.end method

.method public onActivityPause()V
    .locals 1

    const/4 v0, 0x1

    .line 120
    iput-boolean v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStopped:Z

    .line 121
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mVolumizer:Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

    if-eqz v0, :cond_0

    .line 122
    invoke-virtual {v0}, Lcom/oneplus/settings/notification/OPSeekBarVolumizer;->stop()V

    const/4 v0, 0x0

    .line 123
    iput-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mVolumizer:Lcom/oneplus/settings/notification/OPSeekBarVolumizer;

    :cond_0
    return-void
.end method

.method public onActivityResume()V
    .locals 1

    .line 111
    iget-boolean v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStopped:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 113
    iput-boolean v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStopped:Z

    .line 115
    invoke-virtual {p0}, Lcom/android/settings/notification/VolumeSeekBarPreference;->init()V

    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 1

    .line 129
    invoke-super {p0, p1}, Lcom/android/settings/widget/SeekBarPreference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    const v0, 0x102045a

    .line 130
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    const v0, 0x1020006

    .line 131
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mIconView:Landroid/widget/ImageView;

    .line 132
    sget v0, Lcom/android/settings/R$id;->suppression_text:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSuppressionTextView:Landroid/widget/TextView;

    .line 133
    invoke-virtual {p0}, Lcom/android/settings/notification/VolumeSeekBarPreference;->init()V

    return-void
.end method

.method public setCallback(Lcom/android/settings/notification/VolumeSeekBarPreference$Callback;)V
    .locals 0

    .line 99
    iput-object p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mCallback:Lcom/android/settings/notification/VolumeSeekBarPreference$Callback;

    return-void
.end method

.method public setMuteIcon(I)V
    .locals 1

    .line 205
    iget v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mMuteIconResId:I

    if-ne v0, p1, :cond_0

    return-void

    .line 206
    :cond_0
    iput p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mMuteIconResId:I

    .line 207
    invoke-virtual {p0}, Lcom/android/settings/notification/VolumeSeekBarPreference;->updateIconView()V

    return-void
.end method

.method public setStream(I)V
    .locals 1

    .line 90
    iput p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStream:I

    .line 91
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/settings/widget/SeekBarPreference;->setMax(I)V

    .line 94
    iget-object p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mAudioManager:Landroid/media/AudioManager;

    iget v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStream:I

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getStreamMinVolumeInt(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/settings/widget/SeekBarPreference;->setMin(I)V

    .line 95
    iget-object p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mAudioManager:Landroid/media/AudioManager;

    iget v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStream:I

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/settings/widget/SeekBarPreference;->setProgress(I)V

    return-void
.end method

.method public setSuppressionText(Ljava/lang/String;)V
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSuppressionText:Ljava/lang/String;

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 218
    :cond_0
    iput-object p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSuppressionText:Ljava/lang/String;

    .line 219
    invoke-virtual {p0}, Lcom/android/settings/notification/VolumeSeekBarPreference;->updateSuppressionText()V

    return-void
.end method

.method public showIcon(I)V
    .locals 1

    .line 199
    iget v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mIconResId:I

    if-ne v0, p1, :cond_0

    return-void

    .line 200
    :cond_0
    iput p1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mIconResId:I

    .line 201
    invoke-virtual {p0}, Lcom/android/settings/notification/VolumeSeekBarPreference;->updateIconView()V

    return-void
.end method

.method protected updateIconView()V
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mIconView:Landroid/widget/ImageView;

    if-eqz v0, :cond_3

    iget-boolean v1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mStopped:Z

    if-eqz v1, :cond_0

    goto :goto_0

    .line 186
    :cond_0
    iget v1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mIconResId:I

    if-eqz v1, :cond_1

    .line 187
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 188
    :cond_1
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mMuteIconResId:I

    if-eqz v0, :cond_2

    .line 189
    iget-object p0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 191
    :cond_2
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroidx/preference/Preference;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_3
    :goto_0
    return-void
.end method

.method protected updateSuppressionText()V
    .locals 2

    .line 223
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSuppressionTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSeekBar:Landroid/widget/SeekBar;

    if-eqz v1, :cond_1

    .line 224
    iget-object v1, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSuppressionText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    iget-object v0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSuppressionText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 226
    iget-object p0, p0, Lcom/android/settings/notification/VolumeSeekBarPreference;->mSuppressionTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    return-void
.end method
