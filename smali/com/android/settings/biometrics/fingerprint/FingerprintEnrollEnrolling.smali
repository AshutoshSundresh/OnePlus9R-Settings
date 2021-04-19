.class public Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;
.super Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;
.source "FingerprintEnrollEnrolling.java"

# interfaces
.implements Lcom/oneplus/settings/opfinger/OnOPFingerComfirmListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$IconTouchDialog;,
        Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;
    }
.end annotation


# instance fields
.field callFingerprintServiceRunnable:Ljava/lang/Runnable;

.field protected isSetupPage:Z

.field private mAnimationCancelled:Z

.field private mConfirmCompleted:Z

.field private mCurrentProgress:I

.field private final mDelayedFinishRunnable:Ljava/lang/Runnable;

.field private final mDelayedShowLottieRunnable:Ljava/lang/Runnable;

.field protected mDialog:Landroidx/appcompat/app/AlertDialog;

.field private mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

.field private mEnrollState:I

.field private mEnrollSuccessCount:I

.field private mErrorAnimator:Landroid/animation/Animator;

.field private mErrorText:Landroid/widget/TextView;

.field private mFastOutLinearInInterpolator:Landroid/view/animation/Interpolator;

.field private mHandler:Landroid/os/Handler;

.field private mHasInputCompleted:Z

.field private mIconAnimationDrawable:Landroid/graphics/drawable/AnimatedVectorDrawable;

.field private mIsEnrollPaused:Z

.field private mLaunchingFinish:Z

.field private mLinearOutSlowInInterpolator:Landroid/view/animation/Interpolator;

.field protected mNeedHideNavBar:Z

.field private mNeedJumpToFingerprintSettings:Z

.field protected mNextButton:Landroid/widget/Button;

.field protected mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

.field protected mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

.field private mOnBackPress:Z

.field private mProgressBar:Landroid/widget/ProgressBar;

.field protected mRepeatMessage:Landroid/widget/TextView;

.field private mScreenNavBarEnabled:Z

.field protected mStartMessage:Landroid/widget/TextView;

.field mStatusBarManager:Landroid/app/StatusBarManager;

.field private final mTouchAgainRunnable:Ljava/lang/Runnable;

.field private mValidEnroll:Z

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mWakeLockUseRunnable:Ljava/lang/Runnable;

.field overlayLayoutId:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x4

    new-array v1, v0, [J

    .line 131
    fill-array-data v1, :array_0

    const/4 v2, -0x1

    .line 132
    invoke-static {v1, v2}, Landroid/os/VibrationEffect;->createWaveform([JI)Landroid/os/VibrationEffect;

    .line 133
    new-instance v1, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 135
    invoke-virtual {v1, v0}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    const/16 v1, 0xd

    .line 136
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    .line 137
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    return-void

    nop

    :array_0
    .array-data 8
        0x0
        0x5
        0x37
        0x3c
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .line 106
    invoke-direct {p0}, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;-><init>()V

    const/4 v0, 0x0

    .line 169
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHasInputCompleted:Z

    .line 170
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mConfirmCompleted:Z

    .line 171
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOnBackPress:Z

    .line 174
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mScreenNavBarEnabled:Z

    .line 175
    iput v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mCurrentProgress:I

    .line 176
    iput v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    const/4 v1, 0x1

    .line 196
    iput-boolean v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mValidEnroll:Z

    const/4 v2, -0x1

    .line 198
    iput v2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->overlayLayoutId:I

    .line 200
    iput-boolean v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNeedHideNavBar:Z

    .line 204
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNeedJumpToFingerprintSettings:Z

    .line 209
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mIsEnrollPaused:Z

    .line 211
    iput v2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollState:I

    .line 811
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$4;

    invoke-direct {v0, p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$4;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    .line 818
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$5;

    invoke-direct {v0, p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$5;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    .line 843
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$7;

    invoke-direct {v0, p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$7;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mTouchAgainRunnable:Ljava/lang/Runnable;

    .line 1074
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$8;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$8;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    const-string v0, "fingerprint"

    .line 1085
    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 1084
    invoke-static {v0}, Landroid/hardware/fingerprint/IFingerprintService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/fingerprint/IFingerprintService;

    .line 1437
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$12;

    invoke-direct {v0, p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$12;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLockUseRunnable:Ljava/lang/Runnable;

    .line 1476
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$13;

    invoke-direct {v0, p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$13;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDelayedShowLottieRunnable:Ljava/lang/Runnable;

    .line 1487
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$14;

    invoke-direct {v0, p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$14;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->callFingerprintServiceRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)Landroid/widget/ProgressBar;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mProgressBar:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V
    .locals 0

    .line 106
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->releaseWakeLock()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)Lcom/android/settings/biometrics/BiometricEnrollSidecar;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    return-object p0
.end method

.method static synthetic access$1202(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;Lcom/android/settings/biometrics/BiometricEnrollSidecar;)Lcom/android/settings/biometrics/BiometricEnrollSidecar;
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)Lcom/android/settings/biometrics/BiometricEnrollSidecar;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)Lcom/android/settings/biometrics/BiometricEnrollSidecar;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)[B
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/android/settings/biometrics/BiometricEnrollBase;->mToken:[B

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)Z
    .locals 0

    .line 106
    iget-boolean p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mAnimationCancelled:Z

    return p0
.end method

.method static synthetic access$400(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V
    .locals 0

    .line 106
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->startIconAnimation()V

    return-void
.end method

.method static synthetic access$600(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V
    .locals 0

    .line 106
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->clearError()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;Ljava/lang/CharSequence;)V
    .locals 0

    .line 106
    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)Lcom/airbnb/lottie/LottieAnimationView;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)Landroid/os/PowerManager$WakeLock;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object p0
.end method

.method private acquireWakeLock()V
    .locals 3

    .line 1207
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_0

    const-string v0, "power"

    .line 1208
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/16 v1, 0x1a

    const-string v2, "FingerprintEnrollEnrolling"

    .line 1209
    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 1210
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    :cond_0
    return-void
.end method

.method private adjustTitleSize()V
    .locals 3

    .line 1539
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isLargerFontSize(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isLargerScreenZoom(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1540
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportBackFingerprint(Landroid/content/Context;)Z

    move-result v0

    const/high16 v1, 0x41900000    # 18.0f

    if-eqz v0, :cond_0

    .line 1541
    sget v0, Lcom/android/settings/R$id;->suc_layout_title:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1542
    sget v0, Lcom/android/settings/R$id;->start_message:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1543
    sget v0, Lcom/android/settings/R$id;->repeat_message:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1545
    sget v0, Lcom/android/settings/R$id;->sud_layout_icon:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1546
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 1547
    iget v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    div-int/lit8 v2, v2, 0x2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 1548
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1550
    sget v0, Lcom/android/settings/R$id;->fingerprint_enroll_enrolling_content:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1552
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 1553
    iget v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    div-int/lit8 v2, v2, 0x2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 1554
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 1557
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/biometrics/BiometricEnrollBase;->getLayout()Lcom/google/android/setupdesign/GlifLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/setupdesign/GlifLayout;->getHeaderTextView()Landroid/widget/TextView;

    move-result-object v0

    .line 1558
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1559
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStartMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1560
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mRepeatMessage:Landroid/widget/TextView;

    const/4 v1, 0x0

    const/high16 v2, 0x42400000    # 48.0f

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 1563
    :cond_1
    :goto_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1564
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStartMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1565
    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    div-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 1566
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStartMessage:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2
    return-void
.end method

.method private animateErrorText(Landroid/widget/TextView;)V
    .locals 1

    .line 1468
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorAnimator:Landroid/animation/Animator;

    if-nez v0, :cond_0

    .line 1469
    sget v0, Lcom/android/settings/R$anim;->shake_anim:I

    invoke-static {p0, v0}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorAnimator:Landroid/animation/Animator;

    .line 1471
    :cond_0
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 1472
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorAnimator:Landroid/animation/Animator;

    invoke-virtual {v0, p1}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 1473
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorAnimator:Landroid/animation/Animator;

    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    return-void
.end method

.method private changeEnrollStateByFocusChanged(Z)V
    .locals 2

    const-string p0, "FingerprintEnrollEnrolling"

    const-string v0, "fingerprint"

    .line 1099
    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 1098
    invoke-static {v0}, Landroid/hardware/fingerprint/IFingerprintService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/fingerprint/IFingerprintService;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const/16 p1, 0x8

    goto :goto_0

    :cond_0
    const/16 p1, 0x9

    .line 1109
    :goto_0
    :try_start_0
    invoke-interface {v0, p1}, Landroid/hardware/fingerprint/IFingerprintService;->updateStatus(I)I

    const-string p1, "changeEnrollStateByFocusChanged "

    .line 1110
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 1112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "updateStatus , "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_1
    return-void
.end method

.method private clearError()V
    .locals 3

    .line 778
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 779
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 780
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 781
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/android/settings/R$dimen;->fingerprint_error_text_disappear_distance:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x64

    .line 783
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mFastOutLinearInInterpolator:Landroid/view/animation/Interpolator;

    .line 784
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/android/settings/biometrics/fingerprint/-$$Lambda$FingerprintEnrollEnrolling$eo3zX11cVbdZD3KKpJKd94ja24w;

    invoke-direct {v1, p0}, Lcom/android/settings/biometrics/fingerprint/-$$Lambda$FingerprintEnrollEnrolling$eo3zX11cVbdZD3KKpJKd94ja24w;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    .line 785
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    .line 786
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_0
    return-void
.end method

.method private disableRecentAndHomeKey()V
    .locals 2

    .line 1152
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v0, :cond_0

    const-string v0, "FingerprintEnrollEnrolling"

    const-string v1, "disableRecentAndHomeKey:"

    .line 1153
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1154
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStatusBarManager:Landroid/app/StatusBarManager;

    const/high16 v0, 0x1200000

    invoke-virtual {p0, v0}, Landroid/app/StatusBarManager;->disable(I)V

    :cond_0
    return-void
.end method

.method private disableRecentKey()V
    .locals 1

    .line 1169
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz p0, :cond_0

    const/high16 v0, 0x1000000

    .line 1170
    invoke-virtual {p0, v0}, Landroid/app/StatusBarManager;->disable(I)V

    :cond_0
    return-void
.end method

.method private enableRecentAndHomeKey()V
    .locals 2

    const-string v0, "FingerprintEnrollEnrolling"

    const-string v1, "enableRecentAndHomeKey:"

    .line 1160
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1161
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 1162
    invoke-virtual {p0, v0}, Landroid/app/StatusBarManager;->disable(I)V

    :cond_0
    return-void
.end method

.method private enableRecentKey()V
    .locals 1

    .line 1175
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 1176
    invoke-virtual {p0, v0}, Landroid/app/StatusBarManager;->disable(I)V

    :cond_0
    return-void
.end method

.method private fadeIn(Landroid/view/View;)V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [F

    .line 1238
    fill-array-data v0, :array_0

    const-string v1, "alpha"

    invoke-static {p1, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    .line 1239
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1240
    new-instance v1, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$9;

    invoke-direct {v1, p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$9;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1257
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private fadeOut(Landroid/view/View;)V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [F

    .line 1261
    fill-array-data v0, :array_0

    const-string v1, "alpha"

    invoke-static {p1, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    .line 1262
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1263
    new-instance v1, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$10;

    invoke-direct {v1, p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$10;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1280
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private getHeadView()Landroid/widget/TextView;
    .locals 2

    .line 1507
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportBackFingerprint(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1508
    sget v0, Lcom/android/settings/R$id;->suc_layout_title:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    goto :goto_0

    .line 1510
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/biometrics/BiometricEnrollBase;->getLayout()Lcom/google/android/setupdesign/GlifLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/setupdesign/GlifLayout;->getHeaderTextView()Landroid/widget/TextView;

    move-result-object v0

    .line 1511
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1512
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v1, Lcom/android/settings/R$color;->oneplus_contorl_text_color_primary_dark:I

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_1
    move-object p0, v0

    :goto_0
    return-object p0
.end method

.method private initFingerPrintEnrollView()V
    .locals 3

    .line 1016
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1017
    sget v0, Lcom/android/settings/R$id;->op_finger_enroll_view:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    .line 1018
    iget-object v2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStartMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setTitleView(Landroid/widget/TextView;)V

    .line 1019
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mRepeatMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1020
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mRepeatMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setSubTitleView(Landroid/widget/TextView;)V

    .line 1021
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {v0}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->hideHeaderView()V

    .line 1022
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {v0, p0}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setOnOPFingerComfirmListener(Lcom/oneplus/settings/opfinger/OnOPFingerComfirmListener;)V

    .line 1023
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setEnrollAnimVisibility(Z)V

    goto :goto_1

    .line 1025
    :cond_0
    sget v0, Lcom/android/settings/R$id;->op_finger_enroll_view:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    .line 1026
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1027
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    iget-object v2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStartMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setTitleView(Landroid/widget/TextView;)V

    .line 1028
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mRepeatMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1029
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    iget-object v2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mRepeatMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setSubTitleView(Landroid/widget/TextView;)V

    goto :goto_0

    .line 1031
    :cond_1
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->getHeadView()Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setTitleView(Landroid/widget/TextView;)V

    .line 1032
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    iget-object v2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStartMessage:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setSubTitleView(Landroid/widget/TextView;)V

    .line 1034
    :goto_0
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {v0}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->hideHeaderView()V

    .line 1035
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {v0, p0}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setOnOPFingerComfirmListener(Lcom/oneplus/settings/opfinger/OnOPFingerComfirmListener;)V

    .line 1037
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1038
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setEnrollAnimVisibility(Z)V

    :cond_2
    :goto_1
    const v0, 0x10c000f

    .line 1043
    invoke-static {p0, v0}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mFastOutLinearInInterpolator:Landroid/view/animation/Interpolator;

    const v0, 0x10c000e

    .line 1045
    invoke-static {p0, v0}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mLinearOutSlowInInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method private synthetic lambda$clearError$1()V
    .locals 1

    .line 785
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method private synthetic lambda$showEnrollNoteDialog$0(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 449
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const/4 p1, -0x2

    const-string v0, "op_do_not_show_fingerprint_enroll_note"

    invoke-static {p0, v0, p2, p1}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 451
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Don\'t show again:"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "FingerprintNoteDialog"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private pauseEnroll()V
    .locals 3

    const-string v0, "FingerprintEnrollEnrolling"

    .line 1284
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1285
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNextButton:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 1288
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-direct {p0, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->fadeOut(Landroid/view/View;)V

    .line 1289
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-direct {p0, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->fadeIn(Landroid/view/View;)V

    .line 1290
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {v1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    goto :goto_0

    .line 1291
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1292
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNextButton:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 1295
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-direct {p0, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->fadeOut(Landroid/view/View;)V

    .line 1296
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-direct {p0, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->fadeIn(Landroid/view/View;)V

    .line 1297
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {v1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 1300
    iput-boolean v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mIsEnrollPaused:Z

    const-string v1, "fingerprint"

    .line 1303
    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 1302
    invoke-static {v1}, Landroid/hardware/fingerprint/IFingerprintService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/fingerprint/IFingerprintService;

    move-result-object v1

    if-eqz v1, :cond_2

    const/16 v2, 0x9

    .line 1307
    :try_start_0
    invoke-interface {v1, v2}, Landroid/hardware/fingerprint/IFingerprintService;->updateStatus(I)I

    .line 1308
    iput v2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollState:I

    const-string p0, "pauseEnroll "

    .line 1309
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 1311
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "updateStatus , "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_1
    return-void
.end method

.method private releaseWakeLock()V
    .locals 1

    .line 1216
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1217
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    const/4 v0, 0x0

    .line 1218
    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    :cond_0
    return-void
.end method

.method private resumeEnroll(ZI)V
    .locals 4

    const-string v0, "FingerprintEnrollEnrolling"

    .line 1329
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x4

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    .line 1330
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNextButton:Landroid/widget/Button;

    invoke-virtual {p1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 1331
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->fadeIn(Landroid/view/View;)V

    .line 1332
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->fadeOut(Landroid/view/View;)V

    .line 1333
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showContinueView()V

    .line 1334
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {p1, v2}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setEdgeVisible(Z)V

    .line 1335
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->pauseAnimation()V

    goto :goto_0

    .line 1336
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz p1, :cond_1

    .line 1337
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNextButton:Landroid/widget/Button;

    invoke-virtual {p1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 1338
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->fadeIn(Landroid/view/View;)V

    .line 1339
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->fadeOut(Landroid/view/View;)V

    .line 1340
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showContinueView()V

    .line 1341
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {p1, v2}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setEdgeVisible(Z)V

    .line 1342
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->pauseAnimation()V

    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 1344
    iput-boolean p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mIsEnrollPaused:Z

    const-string p1, "fingerprint"

    .line 1347
    invoke-static {p1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p1

    .line 1346
    invoke-static {p1}, Landroid/hardware/fingerprint/IFingerprintService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/hardware/fingerprint/IFingerprintService;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 1348
    iget v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollState:I

    const/16 v2, 0x9

    if-ne v1, v2, :cond_2

    .line 1351
    :try_start_0
    invoke-interface {p1, p2}, Landroid/hardware/fingerprint/IFingerprintService;->updateStatus(I)I

    .line 1352
    iput p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollState:I

    const-string p0, "resumeEnroll "

    .line 1353
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 1355
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo p2, "updateStatus , "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_1
    return-void
.end method

.method private setFingerprintEnrolling(Z)V
    .locals 3

    .line 1182
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportBackFingerprint(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1186
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 1187
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_acc_fingerprint_enrolling"

    const/4 v2, 0x0

    .line 1186
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    :cond_1
    if-eq p1, v2, :cond_2

    .line 1191
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    .line 1190
    invoke-static {p0, v1, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :cond_2
    return-void
.end method

.method private showContinueView()V
    .locals 4

    .line 1317
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$11;

    invoke-direct {v1, p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$11;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private showError(Ljava/lang/CharSequence;)V
    .locals 4

    .line 747
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 748
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mRepeatMessage:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 749
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mRepeatMessage:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->animateErrorText(Landroid/widget/TextView;)V

    goto :goto_0

    .line 751
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showError error:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FingerprintEnrollEnrolling"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 752
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 753
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    const/4 v0, 0x4

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    if-ne p1, v0, :cond_1

    .line 754
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 755
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/android/settings/R$dimen;->fingerprint_error_text_appear_distance:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 757
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 758
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    .line 759
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    .line 760
    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0xc8

    .line 761
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mLinearOutSlowInInterpolator:Landroid/view/animation/Interpolator;

    .line 762
    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    .line 763
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    .line 765
    :cond_1
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 766
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 767
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTranslationY(F)V

    :goto_0
    return-void
.end method

.method private showErrorDialog(Ljava/lang/CharSequence;I)V
    .locals 1

    .line 732
    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->isSetupPage:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 733
    invoke-static {p1, p2, v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;->newInstance(Ljava/lang/CharSequence;IZ)Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;

    move-result-object p1

    goto :goto_0

    .line 735
    :cond_0
    invoke-static {p1, p2}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;->newInstance(Ljava/lang/CharSequence;I)Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;

    move-result-object p1

    .line 738
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-class p2, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p0, p2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showScreenNavBar(Z)V
    .locals 1

    .line 1118
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    xor-int/lit8 p1, p1, 0x1

    const-string v0, "buttons_show_on_screen_navkeys"

    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method

.method private startIconAnimation()V
    .locals 0

    .line 528
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mIconAnimationDrawable:Landroid/graphics/drawable/AnimatedVectorDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->start()V

    return-void
.end method

.method private updateProgress(ZII)V
    .locals 6

    .line 1362
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "oneplus--updateProgress-enrollSteps:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " enrollStepsRemaining:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    return-void

    :cond_0
    add-int/lit8 v0, p2, 0x1

    sub-int v1, v0, p3

    const/16 v2, 0x64

    mul-int/2addr v1, v2

    .line 1367
    div-int/2addr v1, v0

    .line 1368
    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mCurrentProgress:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-le v1, v0, :cond_4

    if-gt p3, p2, :cond_4

    .line 1369
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->clearError()V

    .line 1370
    iput v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mCurrentProgress:I

    .line 1371
    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    add-int/2addr v0, v4

    iput v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    .line 1373
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1374
    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->getFingerprintScaleAnimStep(Landroid/content/Context;)I

    move-result v5

    if-gt v0, v5, :cond_1

    .line 1375
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {v0, v4}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setEnrollAnimVisibility(Z)V

    goto :goto_0

    .line 1377
    :cond_1
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {v0, v3}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setEnrollAnimVisibility(Z)V

    goto :goto_0

    .line 1381
    :cond_2
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {v0, v4}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setEnrollAnimVisibility(Z)V

    .line 1385
    :goto_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1386
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    iget v5, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    invoke-virtual {v0, v5, p3, v1, v4}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->doRecognition(IIIZ)V

    goto :goto_1

    .line 1388
    :cond_3
    iget-object p3, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    invoke-virtual {p3, v0, v1, v4}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->doRecognition(IIZ)V

    goto :goto_1

    .line 1391
    :cond_4
    iput v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mCurrentProgress:I

    .line 1392
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1393
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    iget v5, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    add-int/2addr v5, v4

    invoke-virtual {v0, v5, p3, v1, v3}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->doRecognition(IIIZ)V

    goto :goto_1

    .line 1395
    :cond_5
    iget-object p3, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    add-int/2addr v0, v4

    invoke-virtual {p3, v0, v1, v3}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->doRecognition(IIZ)V

    .line 1398
    :goto_1
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->getFingerprintScaleAnimStep(Landroid/content/Context;)I

    move-result p3

    .line 1399
    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    if-ne v0, p3, :cond_7

    .line 1400
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->pauseEnroll()V

    .line 1401
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 1402
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {p1}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setTipsContinueContent()V

    goto :goto_2

    .line 1404
    :cond_6
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {p1}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setTipsContinueContent()V

    .line 1406
    :goto_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result p1

    if-nez p1, :cond_7

    .line 1407
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showContinueView()V

    .line 1416
    :cond_7
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mTouchAgainRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    if-lt v1, v2, :cond_8

    .line 1423
    iput-boolean v4, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHasInputCompleted:Z

    .line 1424
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mTouchAgainRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1426
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDelayedShowLottieRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1427
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDelayedFinishRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x2ee

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1430
    :cond_8
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz p1, :cond_9

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p1

    if-nez p1, :cond_a

    .line 1431
    :cond_9
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->acquireWakeLock()V

    .line 1433
    :cond_a
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLockUseRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1434
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mWakeLockUseRunnable:Ljava/lang/Runnable;

    .line 1435
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string p3, "screen_off_timeout"

    .line 1434
    invoke-static {p0, p3, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    int-to-long v0, p0

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method protected delayCallFingerprintService()V
    .locals 3

    .line 1501
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->callFingerprintServiceRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1502
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->callFingerprintServiceRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public disableAllKey()V
    .locals 2

    const/4 v0, 0x0

    .line 1143
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mLaunchingFinish:Z

    const/4 v0, 0x1

    .line 1144
    invoke-direct {p0, v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->setFingerprintEnrolling(Z)V

    .line 1145
    iget-boolean v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mScreenNavBarEnabled:Z

    if-eqz v1, :cond_0

    .line 1146
    invoke-direct {p0, v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showScreenNavBar(Z)V

    :cond_0
    return-void
.end method

.method public enableAllKey()V
    .locals 2

    .line 1127
    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mLaunchingFinish:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 1128
    invoke-direct {p0, v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->setFingerprintEnrolling(Z)V

    goto :goto_0

    .line 1130
    :cond_0
    invoke-direct {p0, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->setFingerprintEnrolling(Z)V

    .line 1132
    :goto_0
    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mScreenNavBarEnabled:Z

    if-eqz v0, :cond_1

    .line 1133
    invoke-direct {p0, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showScreenNavBar(Z)V

    :cond_1
    return-void
.end method

.method protected expandViewTouchDelegate(Landroid/view/View;I)V
    .locals 2

    .line 475
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    new-instance v1, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$2;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;Landroid/view/View;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected getFinishIntent()Landroid/content/Intent;
    .locals 2

    .line 565
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollFinish;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0xf0

    return p0
.end method

.method protected getSidecar()Lcom/android/settings/biometrics/BiometricEnrollSidecar;
    .locals 0

    .line 427
    new-instance p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollSidecar;

    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollSidecar;-><init>()V

    return-object p0
.end method

.method public synthetic lambda$clearError$1$FingerprintEnrollEnrolling()V
    .locals 0

    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->lambda$clearError$1()V

    return-void
.end method

.method public synthetic lambda$showEnrollNoteDialog$0$FingerprintEnrollEnrolling(Landroid/widget/CompoundButton;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->lambda$showEnrollNoteDialog$0(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method protected launchFinish([B)V
    .locals 2

    const/4 v0, 0x1

    .line 1448
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mLaunchingFinish:Z

    .line 1449
    invoke-virtual {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->getFinishIntent()Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x26000000

    .line 1450
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v1, "hw_auth_token"

    .line 1453
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 1454
    iget-boolean p1, p0, Lcom/android/settings/biometrics/BiometricEnrollBase;->mFromSettingsSummary:Z

    const-string v1, "from_settings_summary"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1455
    iget p1, p0, Lcom/android/settings/biometrics/BiometricEnrollBase;->mUserId:I

    const/16 v1, -0x2710

    if-eq p1, v1, :cond_0

    const-string v1, "android.intent.extra.USER_ID"

    .line 1456
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1459
    :cond_0
    iget-boolean p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNeedJumpToFingerprintSettings:Z

    const-string v1, "needJumpToFingerprintSettings"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1461
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x0

    .line 1463
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 1464
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onBackPressed()V
    .locals 2

    const-string v0, "FingerprintEnrollEnrolling"

    const-string v1, "onBackPressed"

    .line 1007
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 1008
    invoke-direct {p0, v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->changeEnrollStateByFocusChanged(Z)V

    .line 1009
    invoke-super {p0}, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->onBackPressed()V

    const/4 v0, 0x1

    .line 1010
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 1011
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1520
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/android/settings/R$id;->skip_button:I

    if-ne v0, v1, :cond_0

    .line 1521
    invoke-virtual {p0, p1}, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->onSkipButtonClick(Landroid/view/View;)V

    goto :goto_0

    .line 1523
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/android/settings/R$id;->continue_enroll_button:I

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    const/16 v0, 0x8

    .line 1524
    invoke-direct {p0, p1, v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->resumeEnroll(ZI)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 262
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 263
    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->isSetupPage:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isO2()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 264
    sget v0, Lcom/android/settings/R$style;->SetupOnePlusFingerprintEnrolling:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    goto :goto_0

    .line 266
    :cond_0
    sget v0, Lcom/android/settings/R$style;->OnePlusFingerprintEnrolling:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 271
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Lcom/android/settings/biometrics/BiometricEnrollBase;->onCreate(Landroid/os/Bundle;)V

    .line 273
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 274
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 277
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 278
    sget v0, Lcom/android/settings/R$string;->oneplus_cannot_enroll_fingerprint_in_splitting_screen:I

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    .line 280
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 281
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 284
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "needJumpToFingerprintSettings"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNeedJumpToFingerprintSettings:Z

    .line 286
    invoke-static {p0}, Lcom/android/settings/Utils;->getFingerprintManagerOrNull(Landroid/content/Context;)Landroid/hardware/fingerprint/FingerprintManager;

    .line 287
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 288
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 291
    :cond_4
    invoke-virtual {p0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_5

    .line 293
    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 295
    invoke-virtual {p0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setElevation(F)V

    .line 300
    :cond_5
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v0

    const/4 v3, -0x1

    if-eqz v0, :cond_7

    .line 301
    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->overlayLayoutId:I

    if-eq v0, v3, :cond_6

    goto :goto_1

    .line 309
    :cond_6
    sget v0, Lcom/android/settings/R$layout;->op_fod_fingerprint_dynamic_enroll_enrolling_base:I

    goto :goto_1

    .line 311
    :cond_7
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 313
    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->overlayLayoutId:I

    if-eq v0, v3, :cond_8

    goto :goto_1

    .line 316
    :cond_8
    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->isSetupPage:Z

    if-eqz v0, :cond_9

    .line 317
    sget v0, Lcom/android/settings/R$layout;->op_fod_setup_fingerprint_enroll_enrolling_base:I

    goto :goto_1

    .line 319
    :cond_9
    sget v0, Lcom/android/settings/R$layout;->op_fod_fingerprint_enroll_enrolling_base:I

    goto :goto_1

    .line 322
    :cond_a
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportBackFingerprint(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 323
    iget v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->overlayLayoutId:I

    if-eq v0, v3, :cond_b

    goto :goto_1

    .line 326
    :cond_b
    sget v0, Lcom/android/settings/R$layout;->op_back_fingerprint_enroll_enrolling_base:I

    goto :goto_1

    .line 329
    :cond_c
    sget v0, Lcom/android/settings/R$layout;->fingerprint_enroll_enrolling_base:I

    .line 333
    :goto_1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 334
    sget v0, Lcom/android/settings/R$string;->security_settings_fingerprint_enroll_repeat_title:I

    invoke-virtual {p0, v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->setHeaderText(I)V

    .line 336
    sget v0, Lcom/android/settings/R$id;->setup_wizard_layout:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/setupdesign/GlifLayout;

    invoke-virtual {v0}, Lcom/google/android/setupdesign/GlifLayout;->getHeaderTextView()Landroid/widget/TextView;

    move-result-object v0

    .line 337
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/android/settings/R$color;->op_control_text_color_primary_dark:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 339
    sget v0, Lcom/android/settings/R$id;->start_message:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStartMessage:Landroid/widget/TextView;

    .line 340
    sget v0, Lcom/android/settings/R$id;->repeat_message:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mRepeatMessage:Landroid/widget/TextView;

    .line 341
    sget v0, Lcom/android/settings/R$id;->error_text:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    .line 342
    sget v0, Lcom/android/settings/R$id;->fingerprint_progress_bar:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mProgressBar:Landroid/widget/ProgressBar;

    .line 343
    const-class v0, Landroid/os/Vibrator;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 349
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 350
    sget v0, Lcom/android/settings/R$id;->continue_enroll_button:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNextButton:Landroid/widget/Button;

    .line 351
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 352
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNextButton:Landroid/widget/Button;

    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 353
    sget v0, Lcom/android/settings/R$id;->op_finger_edge_enroll_view:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    .line 354
    invoke-virtual {v0, v2}, Lcom/airbnb/lottie/LottieAnimationView;->loop(Z)V

    .line 371
    :cond_d
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->initFingerPrintEnrollView()V

    const-string v0, "statusbar"

    .line 375
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/StatusBarManager;

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mStatusBarManager:Landroid/app/StatusBarManager;

    .line 379
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "buttons_show_on_screen_navkeys"

    invoke-static {v0, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v2, :cond_e

    move v1, v2

    .line 380
    :cond_e
    iput-boolean v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mScreenNavBarEnabled:Z

    .line 382
    sget v0, Lcom/android/settings/R$anim;->shake_anim:I

    invoke-static {p0, v0}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorAnimator:Landroid/animation/Animator;

    .line 384
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->adjustTitleSize()V

    .line 421
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1, v2}, Lcom/oneplus/settings/utils/OPUtils;->setLightNavigationBar(Landroid/view/Window;I)V

    .line 422
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/google/android/setupcompat/util/SystemBarHelper;->showSystemBars(Landroid/view/Window;Landroid/content/Context;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 969
    iget-object v0, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    if-eqz v0, :cond_0

    .line 970
    invoke-virtual {v0}, Lcom/android/settings/biometrics/BiometricEnrollSidecar;->cancelEnrollment()Z

    .line 971
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 974
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 975
    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mNeedHideNavBar:Z

    if-eqz v0, :cond_1

    .line 976
    invoke-virtual {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->enableAllKey()V

    goto :goto_0

    .line 978
    :cond_1
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->enableRecentAndHomeKey()V

    goto :goto_0

    .line 982
    :cond_2
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportBackFingerprint(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 983
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->enableRecentKey()V

    goto :goto_0

    .line 985
    :cond_3
    invoke-virtual {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->enableAllKey()V

    .line 988
    :goto_0
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 989
    invoke-virtual {v0}, Lcom/airbnb/lottie/LottieAnimationView;->cancelAnimation()V

    .line 990
    iput-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEdgeEnrollAnimView:Lcom/airbnb/lottie/LottieAnimationView;

    .line 992
    :cond_4
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 993
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {v0}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->releaseEnrollCompletedAnim()V

    goto :goto_1

    .line 995
    :cond_5
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {v0}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->releaseEnrollCompletedAnim()V

    .line 997
    :goto_1
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 998
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 999
    iput-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDialog:Landroidx/appcompat/app/AlertDialog;

    .line 1001
    :cond_6
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservableActivity;->onDestroy()V

    return-void
.end method

.method public onEnrollmentError(ILjava/lang/CharSequence;)V
    .locals 2

    .line 649
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onEnrollmentError:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " errMsgId:"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "FingerprintEnrollEnrolling"

    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p2, 0x0

    .line 650
    iput-boolean p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mValidEnroll:Z

    .line 651
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    .line 652
    iget-object p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {p2, v0}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->setEnrollAnimVisibility(Z)V

    goto :goto_0

    .line 655
    :cond_0
    iget-object p2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {p2, v0}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setEnrollAnimVisibility(Z)V

    :goto_0
    const/4 p2, 0x3

    if-eq p1, p2, :cond_3

    const/16 p2, 0x428

    if-eq p1, p2, :cond_2

    const/16 p2, 0x446

    if-eq p1, p2, :cond_1

    .line 682
    sget p2, Lcom/android/settings/R$string;->oneplus_finger_input_error_tips:I

    goto :goto_1

    .line 671
    :cond_1
    sget p2, Lcom/android/settings/R$string;->oneplus_fingerprint_not_adjustment:I

    goto :goto_1

    .line 676
    :cond_2
    sget p2, Lcom/android/settings/R$string;->oneplus_fingerprint_hardware_exception:I

    goto :goto_1

    .line 662
    :cond_3
    sget p2, Lcom/android/settings/R$string;->security_settings_fingerprint_enroll_error_timeout_dialog_message:I

    .line 685
    :goto_1
    invoke-virtual {p0, p2}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-direct {p0, p2, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showErrorDialog(Ljava/lang/CharSequence;I)V

    .line 688
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mErrorText:Landroid/widget/TextView;

    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mTouchAgainRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onEnrollmentHelp(ILjava/lang/CharSequence;)V
    .locals 5

    .line 584
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onEnrollmentHelp:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " helpMsgId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FingerprintEnrollEnrolling"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 585
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mValidEnroll:Z

    .line 586
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    goto :goto_0

    .line 590
    :cond_0
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {v0, v2}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->setEnrollAnimVisibility(Z)V

    .line 593
    :goto_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    const/16 v3, 0x44c

    const/16 v4, 0x3ea

    if-nez v0, :cond_3

    if-eq p1, v4, :cond_2

    if-eq p1, v3, :cond_1

    .line 609
    invoke-direct {p0, p2}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 596
    :cond_1
    sget p1, Lcom/android/settings/R$string;->oneplus_security_settings_fingerprint_exists_dialog_message:I

    .line 597
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 600
    :cond_2
    sget p1, Lcom/android/settings/R$string;->oneplus_fingerprint_acquired_too_similar:I

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    .line 601
    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    .line 602
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "FINGERPRINT_ACQUIRED_TOO_SIMILAR:"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    if-eq p1, v2, :cond_9

    const/4 v0, 0x3

    if-eq p1, v0, :cond_8

    const/4 v0, 0x5

    if-eq p1, v0, :cond_7

    const/16 v0, 0x3e8

    if-eq p1, v0, :cond_6

    if-eq p1, v4, :cond_5

    if-eq p1, v3, :cond_4

    .line 640
    invoke-direct {p0, p2}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 620
    :cond_4
    sget p1, Lcom/android/settings/R$string;->oneplus_security_settings_fingerprint_exists_dialog_message:I

    .line 621
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 636
    :cond_5
    sget p1, Lcom/android/settings/R$string;->oneplus_fingerprint_acquired_too_similar:I

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    .line 637
    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 615
    :cond_6
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    if-eqz p0, :cond_a

    .line 616
    invoke-virtual {p0}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->startTouchDownAnim()V

    goto :goto_1

    .line 632
    :cond_7
    sget p1, Lcom/android/settings/R$string;->oneplus_fingerprint_acquired_too_fast:I

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    .line 633
    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 628
    :cond_8
    sget p1, Lcom/android/settings/R$string;->oneplus_fingerprint_acquired_imager_dirty:I

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    .line 629
    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 624
    :cond_9
    sget p1, Lcom/android/settings/R$string;->oneplus_fingerprint_acquired_partial:I

    invoke-virtual {p0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    .line 625
    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showError(Ljava/lang/CharSequence;)V

    :cond_a
    :goto_1
    return-void
.end method

.method public onEnrollmentProgressChange(II)V
    .locals 2

    .line 694
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onEnrollmentProgressChange--mValidEnroll:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mValidEnroll:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " steps:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " remaining:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FingerprintEnrollEnrolling"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    .line 696
    invoke-direct {p0, v0, p1, p2}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->updateProgress(ZII)V

    return-void
.end method

.method public onEnterAnimationComplete()V
    .locals 1

    .line 521
    invoke-super {p0}, Landroid/app/Activity;->onEnterAnimationComplete()V

    const/4 v0, 0x0

    .line 522
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mAnimationCancelled:Z

    return-void
.end method

.method public onMultiWindowModeChanged(Z)V
    .locals 1

    .line 1224
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onMultiWindowModeChanged(Z)V

    if-eqz p1, :cond_1

    .line 1226
    iget-object p1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->callFingerprintServiceRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1227
    iget-object p1, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    if-eqz p1, :cond_0

    .line 1228
    invoke-virtual {p1}, Lcom/android/settings/biometrics/BiometricEnrollSidecar;->cancelEnrollment()Z

    .line 1229
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p1

    iget-object v0, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1231
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->enableRecentAndHomeKey()V

    .line 1232
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_1
    return-void
.end method

.method public onOPFingerComfirmClick()V
    .locals 1

    const/4 v0, 0x1

    .line 1200
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mConfirmCompleted:Z

    .line 1201
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 1202
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onPause()V
    .locals 3

    .line 915
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservableActivity;->onPause()V

    .line 917
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 918
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->enableRecentAndHomeKey()V

    goto :goto_0

    .line 921
    :cond_0
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportBackFingerprint(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 922
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->enableRecentKey()V

    goto :goto_0

    .line 924
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->enableAllKey()V

    :goto_0
    const/4 v0, 0x0

    .line 928
    iput v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mCurrentProgress:I

    .line 929
    iput v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mEnrollSuccessCount:I

    .line 931
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->releaseWakeLock()V

    .line 932
    iget-boolean v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mConfirmCompleted:Z

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOnBackPress:Z

    .line 937
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 938
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {v1}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->hideWarningTips()V

    goto :goto_1

    .line 940
    :cond_3
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {v1}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->hideWarningTips()V

    .line 942
    :goto_1
    iget-object v1, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mTouchAgainRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 943
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mConfirmCompleted:Z

    .line 944
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOnBackPress:Z

    .line 945
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHasInputCompleted:Z

    .line 948
    invoke-virtual {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->onBackPressed()V

    const/16 v1, 0xa

    .line 950
    invoke-direct {p0, v0, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->resumeEnroll(ZI)V

    .line 953
    iget-object p0, p0, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->mSidecar:Lcom/android/settings/biometrics/BiometricEnrollSidecar;

    if-eqz p0, :cond_4

    .line 954
    invoke-virtual {p0}, Lcom/android/settings/biometrics/BiometricEnrollSidecar;->cancelEnrollment()Z

    :cond_4
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 885
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservableActivity;->onResume()V

    .line 887
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 888
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->disableRecentAndHomeKey()V

    goto :goto_0

    .line 890
    :cond_0
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportBackFingerprint(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 895
    invoke-direct {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->disableRecentKey()V

    goto :goto_0

    .line 897
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->disableAllKey()V

    .line 900
    :goto_0
    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mConfirmCompleted:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOnBackPress:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHasInputCompleted:Z

    if-nez v0, :cond_4

    .line 901
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportDynamicEnrollAnimation()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 902
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintDynamicEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;

    invoke-virtual {v0}, Lcom/oneplus/settings/opfinger/OPFingerPrintDynamicEnrollView;->resetWithoutAnimation()V

    goto :goto_1

    .line 904
    :cond_3
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOPFingerPrintEnrollView:Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;

    invoke-virtual {v0}, Lcom/oneplus/settings/opfinger/OPFingerPrintEnrollView;->resetWithoutAnimation()V

    :cond_4
    :goto_1
    const/4 v0, 0x0

    .line 907
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHasInputCompleted:Z

    .line 908
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mConfirmCompleted:Z

    .line 909
    iput-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mOnBackPress:Z

    return-void
.end method

.method protected onStart()V
    .locals 4

    .line 501
    invoke-super {p0}, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->onStart()V

    .line 503
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "op_do_not_show_fingerprint_enroll_note"

    const/4 v2, 0x0

    const/4 v3, -0x2

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 505
    invoke-virtual {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->delayCallFingerprintService()V

    goto :goto_0

    .line 507
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->showEnrollNoteDialog()V

    :goto_0
    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 540
    invoke-super {p0}, Lcom/android/settings/biometrics/BiometricsEnrollEnrolling;->onStop()V

    .line 544
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->callFingerprintServiceRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .line 1089
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 1090
    iget-boolean v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mIsEnrollPaused:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1093
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->changeEnrollStateByFocusChanged(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected setHeaderText(I)V
    .locals 1

    .line 1529
    invoke-static {p0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportBackFingerprint(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1530
    sget v0, Lcom/android/settings/R$id;->suc_layout_title:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 1532
    :cond_0
    invoke-super {p0, p1}, Lcom/android/settings/biometrics/BiometricEnrollBase;->setHeaderText(I)V

    :goto_0
    return-void
.end method

.method protected shouldStartAutomatically()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method protected showEnrollNoteDialog()V
    .locals 7

    .line 438
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDialog:Landroidx/appcompat/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 439
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 440
    iget-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 443
    :cond_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/android/settings/R$layout;->op_fingerprint_note_dialog:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 444
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/android/settings/R$dimen;->oneplus_contorl_avatar_standard:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 445
    sget v2, Lcom/android/settings/R$id;->checkbox:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 446
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v4, -0x2

    const-string v5, "op_do_not_show_fingerprint_enroll_note"

    const/4 v6, 0x0

    invoke-static {v3, v5, v6, v4}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v4, v6

    :goto_0
    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 448
    new-instance v3, Lcom/android/settings/biometrics/fingerprint/-$$Lambda$FingerprintEnrollEnrolling$rb_Rq7CTysqI3SAxCDpkfbZtt88;

    invoke-direct {v3, p0}, Lcom/android/settings/biometrics/fingerprint/-$$Lambda$FingerprintEnrollEnrolling$rb_Rq7CTysqI3SAxCDpkfbZtt88;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 453
    invoke-virtual {p0, v2, v1}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->expandViewTouchDelegate(Landroid/view/View;I)V

    .line 454
    new-instance v1, Landroidx/appcompat/app/AlertDialog$Builder;

    sget v2, Lcom/android/settings/R$style;->OPDarkDialogAlert:I

    invoke-direct {v1, p0, v2}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    sget v2, Lcom/android/settings/R$string;->op_fingerprint_enroll_note:I

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    sget v2, Lcom/android/settings/R$string;->op_fingerprint_enroll_note_dialog_msg:I

    .line 455
    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(I)Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 457
    invoke-virtual {v1, v6}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    sget v0, Lcom/android/settings/R$string;->oneplus_fullscreen_gesture_guide_gotit:I

    new-instance v2, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$1;

    invoke-direct {v2, p0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$1;-><init>(Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;)V

    .line 458
    invoke-virtual {v1, v0, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 463
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDialog:Landroidx/appcompat/app/AlertDialog;

    .line 464
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 465
    iget-object p0, p0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;->mDialog:Landroidx/appcompat/app/AlertDialog;

    invoke-static {p0}, Lcom/oneplus/settings/utils/OPThemeUtils;->setDialogTextColor(Landroidx/appcompat/app/AlertDialog;)V

    return-void
.end method
