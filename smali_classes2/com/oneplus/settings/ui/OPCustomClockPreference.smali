.class public Lcom/oneplus/settings/ui/OPCustomClockPreference;
.super Landroidx/preference/Preference;
.source "OPCustomClockPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;,
        Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;,
        Lcom/oneplus/settings/ui/OPCustomClockPreference$ChooseStyleAdapter;
    }
.end annotation


# static fields
.field private static final IS_SUPPORT_AOD_ALWAYS_ON:Z

.field private static final SUPPORT_FOD:Z


# instance fields
.field private mAlwaysOnEnabled:Z

.field private mBitmojiAodHelper:Lcom/oneplus/settings/utils/OpBitmojiAodHelper;

.field public mBitmojiAvatarListener:Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;

.field private mCanvasAodHelper:Lcom/oneplus/settings/utils/OpCanvasAodHelper;

.field private mCurrentVH:Lcom/oneplus/settings/ui/OPCustomItemEntityViewHolder;

.field private mFingerprintManager:Landroid/hardware/fingerprint/FingerprintManager;

.field private mFirstPreviewHelper:Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;

.field private mGuideContainer:Landroid/view/ViewGroup;

.field private final mIsSupportMsdAodInfo:Z

.field private final mItemEntities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;",
            ">;"
        }
    .end annotation
.end field

.field private mLastIndex:I

.field private mPreView:Landroid/widget/ImageView;

.field private mPreViewExtra:Lcom/oneplus/settings/ui/OpClockExtra;

.field private mSaveButton:Landroid/widget/Button;

.field private mSelectedIndex:I

.field private mSettingsPreferenceFragment:Lcom/android/settings/SettingsPreferenceFragment;

.field private mShowInfo:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 74
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    sput-boolean v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->SUPPORT_FOD:Z

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x12c

    aput v2, v0, v1

    .line 114
    invoke-static {v0}, Landroid/util/OpFeatures;->isSupport([I)Z

    move-result v0

    sput-boolean v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->IS_SUPPORT_AOD_ALWAYS_ON:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 147
    invoke-direct {p0, p1, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 143
    invoke-direct {p0, p1, p2, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 139
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    .line 128
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 92
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    .line 115
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportMsdAodInfo()Z

    move-result p2

    iput-boolean p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mIsSupportMsdAodInfo:Z

    const/4 p2, 0x0

    .line 116
    iput-boolean p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mAlwaysOnEnabled:Z

    .line 764
    new-instance p3, Lcom/oneplus/settings/ui/OPCustomClockPreference$6;

    invoke-direct {p3, p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference$6;-><init>(Lcom/oneplus/settings/ui/OPCustomClockPreference;)V

    iput-object p3, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mBitmojiAvatarListener:Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;

    .line 129
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result p4

    const-string v0, "aod_clock_style"

    invoke-static {p3, v0, p2, p4}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result p2

    iput p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mLastIndex:I

    .line 130
    sget p2, Lcom/android/settings/R$layout;->op_custom_clock_choose_layout:I

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setLayoutResource(I)V

    .line 131
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/android/settings/Utils;->getFingerprintManagerOrNull(Landroid/content/Context;)Landroid/hardware/fingerprint/FingerprintManager;

    move-result-object p2

    iput-object p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mFingerprintManager:Landroid/hardware/fingerprint/FingerprintManager;

    .line 133
    new-instance p2, Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;

    invoke-direct {p2, p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mFirstPreviewHelper:Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;

    .line 134
    new-instance p2, Lcom/oneplus/settings/utils/OpCanvasAodHelper;

    invoke-direct {p2, p1}, Lcom/oneplus/settings/utils/OpCanvasAodHelper;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mCanvasAodHelper:Lcom/oneplus/settings/utils/OpCanvasAodHelper;

    .line 135
    new-instance p2, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;

    invoke-direct {p2, p1}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mBitmojiAodHelper:Lcom/oneplus/settings/utils/OpBitmojiAodHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/oneplus/settings/ui/OPCustomClockPreference;)I
    .locals 0

    .line 66
    iget p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    return p0
.end method

.method static synthetic access$002(Lcom/oneplus/settings/ui/OPCustomClockPreference;I)I
    .locals 0

    .line 66
    iput p1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    return p1
.end method

.method static synthetic access$100(Lcom/oneplus/settings/ui/OPCustomClockPreference;)Ljava/util/List;
    .locals 0

    .line 66
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/oneplus/settings/ui/OPCustomClockPreference;Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;)V
    .locals 0

    .line 66
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->showInfoDialog(Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;)V

    return-void
.end method

.method static synthetic access$300(Lcom/oneplus/settings/ui/OPCustomClockPreference;)Lcom/oneplus/settings/utils/OpCanvasAodHelper;
    .locals 0

    .line 66
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mCanvasAodHelper:Lcom/oneplus/settings/utils/OpCanvasAodHelper;

    return-object p0
.end method

.method static synthetic access$400(Lcom/oneplus/settings/ui/OPCustomClockPreference;)Lcom/android/settings/SettingsPreferenceFragment;
    .locals 0

    .line 66
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSettingsPreferenceFragment:Lcom/android/settings/SettingsPreferenceFragment;

    return-object p0
.end method

.method static synthetic access$500(Lcom/oneplus/settings/ui/OPCustomClockPreference;)V
    .locals 0

    .line 66
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->save()V

    return-void
.end method

.method static synthetic access$600(Lcom/oneplus/settings/ui/OPCustomClockPreference;)Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;
    .locals 0

    .line 66
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mFirstPreviewHelper:Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;

    return-object p0
.end method

.method static synthetic access$700(Lcom/oneplus/settings/ui/OPCustomClockPreference;)Lcom/oneplus/settings/ui/OPCustomItemEntityViewHolder;
    .locals 0

    .line 66
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mCurrentVH:Lcom/oneplus/settings/ui/OPCustomItemEntityViewHolder;

    return-object p0
.end method

.method static synthetic access$702(Lcom/oneplus/settings/ui/OPCustomClockPreference;Lcom/oneplus/settings/ui/OPCustomItemEntityViewHolder;)Lcom/oneplus/settings/ui/OPCustomItemEntityViewHolder;
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mCurrentVH:Lcom/oneplus/settings/ui/OPCustomItemEntityViewHolder;

    return-object p1
.end method

.method static synthetic access$800(Lcom/oneplus/settings/ui/OPCustomClockPreference;I)V
    .locals 0

    .line 66
    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->changeAdaptive(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/oneplus/settings/ui/OPCustomClockPreference;)V
    .locals 0

    .line 66
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->updateBitmojiGuideViewIfNeeded()V

    return-void
.end method

.method private changeAdaptive(I)V
    .locals 4

    .line 449
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mGuideContainer:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 450
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mGuideContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 451
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSaveButton:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    const/16 v0, 0x28

    if-eq p1, v0, :cond_8

    const/16 v0, 0x32

    if-eq p1, v0, :cond_7

    const/16 v0, 0x64

    if-eq p1, v0, :cond_6

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    .line 525
    :pswitch_0
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_bitmoji:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 526
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mBitmojiAodHelper:Lcom/oneplus/settings/utils/OpBitmojiAodHelper;

    iget-object v2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mGuideContainer:Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSaveButton:Landroid/widget/Button;

    invoke-virtual {v0, v2, v3}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->handleStatus(Landroid/view/ViewGroup;Landroid/widget/Button;)V

    goto/16 :goto_0

    .line 519
    :pswitch_1
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_parsons:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 502
    :pswitch_2
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->shouldShowMsdPreview()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 503
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_minimalism_2:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 505
    :cond_0
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_minimalism_2:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 495
    :pswitch_3
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->shouldShowMsdPreview()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 496
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_minimalism_1:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 498
    :cond_1
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_minimalism_1:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 488
    :pswitch_4
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->shouldShowMsdPreview()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 489
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_analog_3:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 491
    :cond_2
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_analog_3:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 481
    :pswitch_5
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->shouldShowMsdPreview()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 482
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_analog_2:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 484
    :cond_3
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_analog_2:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 474
    :pswitch_6
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->shouldShowMsdPreview()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 475
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_analog_1:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 477
    :cond_4
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_analog_1:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 467
    :pswitch_7
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->shouldShowMsdPreview()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 468
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_bold:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 470
    :cond_5
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_bold:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 463
    :pswitch_8
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_text_clock:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 460
    :pswitch_9
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_digital_2:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 457
    :pswitch_a
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_digital_1:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 510
    :pswitch_b
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_none:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 516
    :pswitch_c
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_smart_space_default:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 454
    :cond_6
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_default:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 522
    :cond_7
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_red:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_0

    .line 513
    :cond_8
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    sget v2, Lcom/android/settings/R$drawable;->op_custom_aodpreview_mcl:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 530
    :goto_0
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreViewExtra:Lcom/oneplus/settings/ui/OpClockExtra;

    invoke-virtual {v0, p1}, Lcom/oneplus/settings/ui/OpClockExtra;->update(I)V

    .line 532
    iget-object p1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    iget v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    .line 533
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mShowInfo:Landroid/widget/ImageView;

    if-eqz p1, :cond_9

    iget-boolean v2, p1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->hasInfo:Z

    if-eqz v2, :cond_9

    const/4 v2, 0x0

    goto :goto_1

    :cond_9
    const/4 v2, 0x4

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 535
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mFirstPreviewHelper:Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;

    iget-object v2, p1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->key_pref:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/oneplus/settings/ui/OPCustomClockPreference$FirstPreviewHelper;->isFirstPreview(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 537
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showInfo isFirstPreview, getMdmEventName:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmEventName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", getMdmLabel:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmLabel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "OPCustomClockPreference"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmEventName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmLabel()Ljava/lang/String;

    move-result-object v2

    const-string v3, "1"

    invoke-static {v0, v2, v3}, Lcom/oneplus/settings/utils/OPUtils;->sendAnalytics(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->getMdmEventName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "showinfo_ever_show_"

    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v3

    invoke-static {v0, v2, v1, v3}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 541
    new-instance v0, Lcom/oneplus/settings/ui/OPCustomClockPreference$3;

    invoke-direct {v0, p0, p1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$3;-><init>(Lcom/oneplus/settings/ui/OPCustomClockPreference;Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;)V

    invoke-direct {p0, p1, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->showInfoDialog(Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;Ljava/lang/Runnable;)V

    :cond_a
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private isBitmojiClockSelected()Z
    .locals 3

    .line 428
    iget v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    const/4 v1, 0x0

    if-ltz v0, :cond_0

    iget-object v2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 429
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    iget p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    .line 430
    iget p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->type:I

    const/16 v0, 0xc

    if-ne p0, v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method static synthetic lambda$onBindViewHolder$0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 211
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$onBindViewHolder$1(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 243
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    const/4 p0, 0x0

    return p0
.end method

.method private needShowNoneClockStyle()Z
    .locals 0

    .line 444
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mFingerprintManager:Landroid/hardware/fingerprint/FingerprintManager;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/hardware/fingerprint/FingerprintManager;->hasEnrolledFingerprints()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 445
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private save()V
    .locals 0

    .line 437
    invoke-virtual {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->saveSelectedClock()V

    .line 438
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSettingsPreferenceFragment:Lcom/android/settings/SettingsPreferenceFragment;

    if-eqz p0, :cond_0

    .line 439
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    :cond_0
    return-void
.end method

.method private shouldShowMsdPreview()Z
    .locals 1

    .line 552
    iget-boolean v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mIsSupportMsdAodInfo:Z

    iget-boolean p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mAlwaysOnEnabled:Z

    and-int/2addr p0, v0

    return p0
.end method

.method private showInfoDialog(IIIILjava/lang/Runnable;)V
    .locals 7

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    if-ne p3, v0, :cond_0

    if-ne p4, v0, :cond_0

    if-ne p1, v0, :cond_0

    return-void

    .line 592
    :cond_0
    new-instance v1, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;)V

    .line 593
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/android/settings/R$layout;->op_custom_clock_info_detail:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 595
    sget v3, Lcom/android/settings/R$id;->aod_clock_detail_preview:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 596
    sget v4, Lcom/android/settings/R$id;->aod_clock_detail_title:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 597
    sget v5, Lcom/android/settings/R$id;->aod_clock_detail_content:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 598
    sget v6, Lcom/android/settings/R$id;->ok_button:I

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    if-eq p1, v0, :cond_1

    .line 600
    invoke-virtual {v3, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_1
    if-eq p2, v0, :cond_2

    .line 603
    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(I)V

    :cond_2
    if-eq p3, v0, :cond_3

    .line 606
    invoke-virtual {v5, p3}, Landroid/widget/TextView;->setText(I)V

    .line 608
    :cond_3
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    if-eqz p5, :cond_4

    .line 610
    new-instance p1, Lcom/oneplus/settings/ui/OPCustomClockPreference$4;

    invoke-direct {p1, p0, p5}, Lcom/oneplus/settings/ui/OPCustomClockPreference$4;-><init>(Lcom/oneplus/settings/ui/OPCustomClockPreference;Ljava/lang/Runnable;)V

    invoke-virtual {v1, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    :cond_4
    if-eq p4, v0, :cond_5

    .line 618
    invoke-virtual {v6, p4}, Landroid/widget/Button;->setText(I)V

    .line 620
    :cond_5
    new-instance p1, Lcom/oneplus/settings/ui/OPCustomClockPreference$5;

    invoke-direct {p1, p0, v1}, Lcom/oneplus/settings/ui/OPCustomClockPreference$5;-><init>(Lcom/oneplus/settings/ui/OPCustomClockPreference;Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    invoke-virtual {v6, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 626
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p0

    const/4 p1, 0x3

    .line 627
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 628
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method private showInfoDialog(Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;)V
    .locals 1

    const/4 v0, 0x0

    .line 557
    invoke-direct {p0, p1, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->showInfoDialog(Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;Ljava/lang/Runnable;)V

    return-void
.end method

.method private showInfoDialog(Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;Ljava/lang/Runnable;)V
    .locals 9

    if-eqz p1, :cond_2

    .line 561
    iget-boolean v0, p1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->hasInfo:Z

    if-eqz v0, :cond_2

    .line 566
    iget p1, p1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->type:I

    const/16 v0, 0xb

    const/4 v1, -0x1

    if-eq p1, v0, :cond_1

    const/16 v0, 0xc

    if-eq p1, v0, :cond_0

    move v4, v1

    move v5, v4

    move v6, v5

    move v7, v6

    goto :goto_1

    .line 575
    :cond_0
    sget v1, Lcom/android/settings/R$string;->aod_clock_bitmoji:I

    .line 576
    sget p1, Lcom/android/settings/R$string;->op_bitmoji_aod_guide_content1:I

    .line 577
    sget v0, Lcom/android/settings/R$string;->op_aod_parsons_info_button:I

    .line 578
    sget v2, Lcom/android/settings/R$drawable;->op_bitmoji_slice:I

    goto :goto_0

    .line 569
    :cond_1
    sget v1, Lcom/android/settings/R$string;->aod_clock_parsons:I

    .line 570
    sget p1, Lcom/android/settings/R$string;->op_aod_parsons_info_message:I

    .line 571
    sget v0, Lcom/android/settings/R$string;->op_aod_parsons_info_button:I

    .line 572
    sget v2, Lcom/android/settings/R$drawable;->op_parsons_info_image:I

    :goto_0
    move v6, p1

    move v7, v0

    move v5, v1

    move v4, v2

    :goto_1
    move-object v3, p0

    move-object v8, p2

    .line 581
    invoke-direct/range {v3 .. v8}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->showInfoDialog(IIIILjava/lang/Runnable;)V

    :cond_2
    return-void
.end method

.method private updateBitmojiGuideViewIfNeeded()V
    .locals 1

    .line 422
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->isBitmojiClockSelected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xc

    .line 423
    invoke-direct {p0, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->changeAdaptive(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public needShowWarningDialog()Z
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    .line 192
    :goto_0
    iget-object v2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 193
    iget-object v2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    iget-boolean v2, v2, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    if-eqz v2, :cond_1

    .line 194
    iget v2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mLastIndex:I

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    iget p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->type:I

    if-eq v2, p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 412
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onActivityResult: resultCode= "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "OPCustomClockPreference"

    invoke-static {v0, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p3, 0x64

    if-ne p1, p3, :cond_0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    .line 416
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->save()V

    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 202
    invoke-super/range {p0 .. p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    .line 204
    sget-boolean v2, Lcom/oneplus/settings/ui/OPCustomClockPreference;->IS_SUPPORT_AOD_ALWAYS_ON:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 205
    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v5

    const-string v6, "always_on_state"

    invoke-static {v2, v6, v3, v5}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    if-eqz v2, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    iput-boolean v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mAlwaysOnEnabled:Z

    .line 209
    :cond_1
    sget v2, Lcom/android/settings/R$id;->video_container_scrollview:I

    invoke-virtual {v1, v2}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ScrollView;

    .line 210
    sget-object v5, Lcom/oneplus/settings/ui/-$$Lambda$OPCustomClockPreference$R0hYGgoHJXoeOM0AzCeYqbFHm_4;->INSTANCE:Lcom/oneplus/settings/ui/-$$Lambda$OPCustomClockPreference$R0hYGgoHJXoeOM0AzCeYqbFHm_4;

    invoke-virtual {v2, v5}, Landroid/widget/ScrollView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 215
    sget v2, Lcom/android/settings/R$id;->preview:I

    invoke-virtual {v1, v2}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreView:Landroid/widget/ImageView;

    .line 216
    sget v2, Lcom/android/settings/R$id;->preview_extra:I

    invoke-virtual {v1, v2}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/oneplus/settings/ui/OpClockExtra;

    iput-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mPreViewExtra:Lcom/oneplus/settings/ui/OpClockExtra;

    .line 218
    sget v2, Lcom/android/settings/R$id;->showInfo:I

    invoke-virtual {v1, v2}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mShowInfo:Landroid/widget/ImageView;

    .line 219
    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2}, Lcom/oneplus/settings/utils/OPUtils;->isBlackModeOn(Landroid/content/ContentResolver;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 220
    iget-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mShowInfo:Landroid/widget/ImageView;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/android/settings/R$color;->op_aod_parsons_show_info_bg_dark:I

    .line 221
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    .line 220
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 222
    iget-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mShowInfo:Landroid/widget/ImageView;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/android/settings/R$color;->op_control_icon_color_active_light:I

    .line 223
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    .line 222
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_1

    .line 225
    :cond_2
    iget-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mShowInfo:Landroid/widget/ImageView;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/android/settings/R$color;->op_aod_parsons_show_info_bg_light:I

    .line 226
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    .line 225
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 227
    iget-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mShowInfo:Landroid/widget/ImageView;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/android/settings/R$color;->op_control_icon_color_active_dark:I

    .line 228
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    .line 227
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 230
    :goto_1
    iget-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mShowInfo:Landroid/widget/ImageView;

    new-instance v5, Lcom/oneplus/settings/ui/OPCustomClockPreference$1;

    invoke-direct {v5, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference$1;-><init>(Lcom/oneplus/settings/ui/OPCustomClockPreference;)V

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 241
    sget v2, Lcom/android/settings/R$id;->guide:I

    invoke-virtual {v1, v2}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mGuideContainer:Landroid/view/ViewGroup;

    .line 242
    sget-object v5, Lcom/oneplus/settings/ui/-$$Lambda$OPCustomClockPreference$6fBmvm3uWkXSVnpWfiewCItP0b0;->INSTANCE:Lcom/oneplus/settings/ui/-$$Lambda$OPCustomClockPreference$6fBmvm3uWkXSVnpWfiewCItP0b0;

    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 247
    sget v2, Lcom/android/settings/R$id;->custom_style_recyclerview:I

    invoke-virtual {v1, v2}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    .line 248
    new-instance v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 249
    invoke-virtual {v5, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 250
    invoke-virtual {v2, v5}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 253
    new-instance v5, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v6

    sget v7, Lcom/android/settings/R$string;->aod_clock_default:I

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    sget v7, Lcom/android/settings/R$drawable;->aod_clock_smart_space_default:I

    invoke-direct {v5, v6, v7, v3}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 254
    new-instance v6, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v7

    sget v8, Lcom/android/settings/R$string;->aod_clock_digital:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    sget v8, Lcom/android/settings/R$drawable;->aod_clock_default:I

    const/16 v9, 0x64

    invoke-direct {v6, v7, v8, v9}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 255
    new-instance v7, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v8

    sget v10, Lcom/android/settings/R$string;->aod_clock_none:I

    invoke-virtual {v8, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    sget v10, Lcom/android/settings/R$drawable;->aod_clock_none:I

    invoke-direct {v7, v8, v10, v4}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 256
    new-instance v8, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v10

    sget v11, Lcom/android/settings/R$string;->aod_clock_digital_1:I

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    sget v11, Lcom/android/settings/R$drawable;->aod_clock_digital_1:I

    const/4 v12, 0x2

    invoke-direct {v8, v10, v11, v12}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 257
    new-instance v10, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v11

    sget v13, Lcom/android/settings/R$string;->aod_clock_digital_2:I

    invoke-virtual {v11, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    sget v13, Lcom/android/settings/R$drawable;->aod_clock_digital_2:I

    const/4 v14, 0x3

    invoke-direct {v10, v11, v13, v14}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 258
    new-instance v11, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v13

    sget v15, Lcom/android/settings/R$string;->aod_clock_text_clock:I

    invoke-virtual {v13, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    sget v15, Lcom/android/settings/R$drawable;->aod_clock_text_clock:I

    const/4 v14, 0x4

    invoke-direct {v11, v13, v15, v14}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 260
    invoke-direct/range {p0 .. p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->shouldShowMsdPreview()Z

    move-result v13

    const/16 v14, 0x8

    const/4 v9, 0x7

    const/4 v4, 0x6

    const/4 v3, 0x5

    if-eqz v13, :cond_3

    .line 261
    new-instance v13, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v15

    sget v12, Lcom/android/settings/R$string;->aod_clock_bold:I

    invoke-virtual {v15, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    sget v15, Lcom/android/settings/R$drawable;->msd_aod_clock_bold:I

    invoke-direct {v13, v12, v15, v3}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 262
    new-instance v12, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v15

    sget v3, Lcom/android/settings/R$string;->aod_clock_analog:I

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget v15, Lcom/android/settings/R$drawable;->msd_aod_clock_analog_1:I

    invoke-direct {v12, v3, v15, v4}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 263
    new-instance v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v15

    sget v4, Lcom/android/settings/R$string;->aod_clock_analog_1:I

    invoke-virtual {v15, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    sget v15, Lcom/android/settings/R$drawable;->msd_aod_clock_analog_2:I

    invoke-direct {v3, v4, v15, v9}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 264
    new-instance v4, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v15

    sget v9, Lcom/android/settings/R$string;->aod_clock_analog_2:I

    invoke-virtual {v15, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    sget v15, Lcom/android/settings/R$drawable;->msd_aod_clock_analog_3:I

    invoke-direct {v4, v9, v15, v14}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 265
    new-instance v9, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v15

    sget v14, Lcom/android/settings/R$string;->aod_clock_minimalism:I

    invoke-virtual {v15, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    sget v15, Lcom/android/settings/R$drawable;->msd_aod_clock_minimalism_1:I

    move-object/from16 v16, v3

    const/16 v3, 0x9

    invoke-direct {v9, v14, v15, v3}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 266
    new-instance v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v14

    sget v15, Lcom/android/settings/R$string;->aod_clock_minimalism_1:I

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    sget v15, Lcom/android/settings/R$drawable;->msd_aod_clock_minimalism_2:I

    move-object/from16 v17, v4

    const/16 v4, 0xa

    invoke-direct {v3, v14, v15, v4}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    goto :goto_2

    .line 268
    :cond_3
    new-instance v13, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/android/settings/R$string;->aod_clock_bold:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/android/settings/R$drawable;->aod_clock_bold:I

    const/4 v9, 0x5

    invoke-direct {v13, v3, v4, v9}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 269
    new-instance v12, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/android/settings/R$string;->aod_clock_analog:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/android/settings/R$drawable;->aod_clock_analog_1:I

    const/4 v9, 0x6

    invoke-direct {v12, v3, v4, v9}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 270
    new-instance v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v9, Lcom/android/settings/R$string;->aod_clock_analog_1:I

    invoke-virtual {v4, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    sget v9, Lcom/android/settings/R$drawable;->aod_clock_analog_2:I

    const/4 v14, 0x7

    invoke-direct {v3, v4, v9, v14}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 271
    new-instance v4, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v9

    sget v14, Lcom/android/settings/R$string;->aod_clock_analog_2:I

    invoke-virtual {v9, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    sget v14, Lcom/android/settings/R$drawable;->aod_clock_analog_3:I

    const/16 v15, 0x8

    invoke-direct {v4, v9, v14, v15}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 272
    new-instance v9, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v14

    sget v15, Lcom/android/settings/R$string;->aod_clock_minimalism:I

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    sget v15, Lcom/android/settings/R$drawable;->aod_clock_minimalism_1:I

    move-object/from16 v16, v3

    const/16 v3, 0x9

    invoke-direct {v9, v14, v15, v3}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 273
    new-instance v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v14

    sget v15, Lcom/android/settings/R$string;->aod_clock_minimalism_1:I

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    sget v15, Lcom/android/settings/R$drawable;->aod_clock_minimalism_2:I

    move-object/from16 v17, v4

    const/16 v4, 0xa

    invoke-direct {v3, v14, v15, v4}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    :goto_2
    move-object v14, v13

    move-object/from16 v4, v16

    move-object v13, v12

    move-object v12, v9

    move-object/from16 v9, v17

    .line 276
    new-instance v15, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    move-object/from16 v16, v2

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v1, Lcom/android/settings/R$string;->aod_clock_mcl:I

    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/android/settings/R$drawable;->aod_clock_mcl:I

    move-object/from16 v17, v7

    const/16 v7, 0x28

    invoke-direct {v15, v1, v2, v7}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 277
    new-instance v1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v7, Lcom/android/settings/R$string;->aod_clock_parsons:I

    invoke-virtual {v2, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    sget v20, Lcom/android/settings/R$drawable;->aod_clock_parsons:I

    const/16 v21, 0xb

    const/16 v22, 0x1

    const-string v23, "aod_parsons"

    move-object/from16 v18, v1

    invoke-direct/range {v18 .. v23}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;IIZLjava/lang/String;)V

    .line 278
    new-instance v2, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v7

    move-object/from16 v18, v3

    sget v3, Lcom/android/settings/R$string;->aod_clock_red:I

    invoke-virtual {v7, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget v7, Lcom/android/settings/R$drawable;->aod_clock_red:I

    move-object/from16 v19, v12

    const/16 v12, 0x32

    invoke-direct {v2, v3, v7, v12}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;II)V

    .line 279
    new-instance v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v7

    sget v12, Lcom/android/settings/R$string;->aod_clock_bitmoji:I

    invoke-virtual {v7, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v25

    sget v26, Lcom/android/settings/R$drawable;->aod_clock_bitmoji:I

    const/16 v27, 0xc

    const/16 v28, 0x1

    const-string v29, "aod_bitmoji"

    move-object/from16 v24, v3

    invoke-direct/range {v24 .. v29}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;-><init>(Ljava/lang/String;IIZLjava/lang/String;)V

    .line 280
    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportMclTheme()Z

    move-result v7

    const-string v12, "ro.boot.project_name"

    move-object/from16 v21, v9

    const-string v9, "18801"

    if-eqz v7, :cond_4

    invoke-static {v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 281
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 283
    :cond_4
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 284
    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportREDTheme()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 285
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    :cond_5
    invoke-static {}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->isBitmojiAodSupported()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 288
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 290
    :cond_6
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    move-object/from16 v22, v3

    move-object/from16 v3, v21

    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    move-object/from16 v21, v2

    move-object/from16 v2, v19

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    move-object/from16 v19, v15

    move-object/from16 v15, v18

    invoke-interface {v7, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    invoke-direct/range {p0 .. p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->needShowNoneClockStyle()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 302
    iget-object v7, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    move-object/from16 v18, v1

    move-object/from16 v1, v17

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_7
    move-object/from16 v18, v1

    move-object/from16 v1, v17

    .line 305
    :goto_3
    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    move-object/from16 v17, v1

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v1

    move-object/from16 v23, v15

    const-string v15, "aod_clock_style"

    move-object/from16 v24, v2

    const/4 v2, 0x0

    invoke-static {v7, v15, v2, v1}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    .line 306
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onBindViewHolder  clock curType = "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v7, "OPCustomClockPreference"

    invoke-static {v7, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportREDTheme()Z

    move-result v2

    .line 309
    invoke-static {}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->isBitmojiAodSupported()Z

    move-result v7

    .line 310
    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportMclTheme()Z

    move-result v15

    if-eqz v15, :cond_8

    invoke-static {v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_8

    const/4 v9, 0x1

    goto :goto_4

    :cond_8
    const/4 v9, 0x0

    :goto_4
    if-nez v1, :cond_9

    const/4 v12, 0x1

    .line 314
    iput-boolean v12, v5, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/4 v2, 0x0

    add-int/2addr v9, v2

    .line 315
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto/16 :goto_5

    :cond_9
    const/16 v5, 0x64

    const/4 v12, 0x1

    if-ne v1, v5, :cond_a

    .line 317
    iput-boolean v12, v6, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/4 v3, 0x4

    add-int/2addr v9, v3

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 318
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto/16 :goto_5

    :cond_a
    const/4 v5, 0x2

    if-ne v1, v5, :cond_b

    .line 320
    iput-boolean v12, v8, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/4 v3, 0x5

    add-int/2addr v9, v3

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 321
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto/16 :goto_5

    :cond_b
    const/4 v5, 0x3

    if-ne v1, v5, :cond_c

    .line 323
    iput-boolean v12, v10, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/4 v3, 0x6

    add-int/2addr v9, v3

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 324
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto/16 :goto_5

    :cond_c
    const/4 v5, 0x4

    if-ne v1, v5, :cond_d

    .line 326
    iput-boolean v12, v11, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/4 v3, 0x2

    add-int/2addr v9, v3

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 327
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto/16 :goto_5

    :cond_d
    const/4 v5, 0x5

    if-ne v1, v5, :cond_e

    .line 329
    iput-boolean v12, v14, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/4 v3, 0x3

    add-int/2addr v9, v3

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 330
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto/16 :goto_5

    :cond_e
    const/4 v5, 0x6

    if-ne v1, v5, :cond_f

    .line 332
    iput-boolean v12, v13, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/4 v5, 0x7

    add-int/2addr v9, v5

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 333
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto/16 :goto_5

    :cond_f
    const/4 v5, 0x7

    if-ne v1, v5, :cond_10

    .line 335
    iput-boolean v12, v4, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/16 v4, 0x8

    add-int/2addr v9, v4

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 336
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto/16 :goto_5

    :cond_10
    const/16 v4, 0x8

    if-ne v1, v4, :cond_11

    .line 338
    iput-boolean v12, v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/16 v3, 0x9

    add-int/2addr v9, v3

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 339
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto :goto_5

    :cond_11
    const/16 v3, 0x9

    if-ne v1, v3, :cond_12

    move-object/from16 v3, v24

    .line 341
    iput-boolean v12, v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/16 v3, 0xa

    add-int/2addr v9, v3

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 342
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto :goto_5

    :cond_12
    const/16 v3, 0xa

    const/16 v4, 0xb

    if-ne v1, v3, :cond_13

    move-object/from16 v3, v23

    .line 344
    iput-boolean v12, v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    add-int/2addr v9, v4

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 345
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto :goto_5

    :cond_13
    if-ne v1, v4, :cond_14

    move-object/from16 v3, v18

    .line 347
    iput-boolean v12, v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    add-int/2addr v9, v12

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 348
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto :goto_5

    :cond_14
    const/16 v3, 0xc

    if-ne v1, v12, :cond_15

    move-object/from16 v4, v17

    .line 350
    iput-boolean v12, v4, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    add-int/2addr v9, v3

    add-int/2addr v9, v2

    add-int/2addr v9, v7

    .line 351
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto :goto_5

    :cond_15
    const/16 v4, 0x28

    if-ne v1, v4, :cond_16

    move-object/from16 v4, v19

    .line 353
    iput-boolean v12, v4, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    const/4 v2, 0x0

    .line 354
    iput v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto :goto_5

    :cond_16
    const/16 v4, 0x32

    if-ne v1, v4, :cond_17

    move-object/from16 v4, v21

    .line 356
    iput-boolean v12, v4, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    add-int/2addr v9, v12

    .line 357
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    goto :goto_5

    :cond_17
    if-ne v1, v3, :cond_18

    move-object/from16 v3, v22

    .line 359
    iput-boolean v12, v3, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->selected:Z

    add-int/2addr v9, v12

    add-int/2addr v9, v2

    .line 360
    iput v9, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    .line 363
    :cond_18
    :goto_5
    sget v2, Lcom/android/settings/R$id;->save_button:I

    move-object/from16 v3, p1

    invoke-virtual {v3, v2}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSaveButton:Landroid/widget/Button;

    .line 365
    invoke-direct {v0, v1}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->changeAdaptive(I)V

    .line 367
    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/android/settings/R$dimen;->op_control_margin_space4:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    .line 369
    new-instance v2, Lcom/oneplus/settings/ui/OPSpaceItemDecoration;

    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v2, v3, v4, v1}, Lcom/oneplus/settings/ui/OPSpaceItemDecoration;-><init>(Landroid/content/Context;II)V

    move-object/from16 v1, v16

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 371
    new-instance v2, Lcom/oneplus/settings/ui/OPCustomClockPreference$ChooseStyleAdapter;

    invoke-direct {v2, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference$ChooseStyleAdapter;-><init>(Lcom/oneplus/settings/ui/OPCustomClockPreference;)V

    .line 372
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 374
    iget v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    if-ltz v2, :cond_1a

    iget-object v3, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1a

    .line 377
    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportREDTheme()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 378
    iget v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    goto :goto_6

    .line 380
    :cond_19
    iget v2, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 384
    :cond_1a
    :goto_6
    iget-object v1, v0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSaveButton:Landroid/widget/Button;

    if-eqz v1, :cond_1b

    .line 385
    new-instance v2, Lcom/oneplus/settings/ui/OPCustomClockPreference$2;

    invoke-direct {v2, v0}, Lcom/oneplus/settings/ui/OPCustomClockPreference$2;-><init>(Lcom/oneplus/settings/ui/OPCustomClockPreference;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1b
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 157
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mBitmojiAodHelper:Lcom/oneplus/settings/utils/OpBitmojiAodHelper;

    invoke-virtual {p0}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->unregisterObserver()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 152
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mBitmojiAodHelper:Lcom/oneplus/settings/utils/OpBitmojiAodHelper;

    iget-object v1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mBitmojiAvatarListener:Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/utils/OpBitmojiAodHelper;->registerObserver(Lcom/oneplus/settings/utils/OpBitmojiAodHelper$OnBitmojiAvatarChangedListener;)V

    .line 153
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPCustomClockPreference;->updateBitmojiGuideViewIfNeeded()V

    return-void
.end method

.method public saveSelectedClock()V
    .locals 8

    .line 161
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v0

    .line 163
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    iget v3, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    .line 164
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    iget v2, v2, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->type:I

    const-string v3, "aod_clock_style"

    .line 163
    invoke-static {v1, v3, v2, v0}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 167
    iget-object v1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mItemEntities:Ljava/util/List;

    iget v2, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSelectedIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;

    iget v1, v1, Lcom/oneplus/settings/ui/OPCustomClockPreference$ItemEntity;->type:I

    const-string v2, "aod_smart_display_enabled"

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v4, :cond_0

    .line 168
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, v2, v3, v0}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    goto :goto_2

    .line 171
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v5, "doze_enabled"

    invoke-static {v1, v5, v3, v0}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-ne v4, v1, :cond_1

    move v1, v4

    goto :goto_0

    :cond_1
    move v1, v3

    .line 172
    :goto_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "prox_wake_enabled"

    invoke-static {v5, v6, v3, v0}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v5

    if-ne v4, v5, :cond_2

    move v5, v4

    goto :goto_1

    :cond_2
    move v5, v3

    .line 173
    :goto_1
    sget-boolean v6, Lcom/oneplus/settings/ui/OPCustomClockPreference;->SUPPORT_FOD:Z

    if-eqz v6, :cond_5

    .line 174
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "oem_acc_blackscreen_gestrue_enable"

    invoke-static {v6, v7, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    const/16 v7, 0xb

    invoke-static {v6, v7}, Lcom/oneplus/settings/gestures/OPGestureUtils;->get(II)I

    move-result v6

    if-ne v6, v4, :cond_3

    move v3, v4

    :cond_3
    if-eqz v1, :cond_6

    if-nez v5, :cond_4

    if-eqz v3, :cond_6

    .line 177
    :cond_4
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, v2, v4, v0}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    goto :goto_2

    :cond_5
    if-eqz v1, :cond_6

    if-eqz v5, :cond_6

    .line 182
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, v2, v4, v0}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 188
    :cond_6
    :goto_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->sendAppTrackerForClockStyle()V

    return-void
.end method

.method public setSettingsPreferenceFragment(Lcom/android/settings/SettingsPreferenceFragment;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPCustomClockPreference;->mSettingsPreferenceFragment:Lcom/android/settings/SettingsPreferenceFragment;

    return-void
.end method
