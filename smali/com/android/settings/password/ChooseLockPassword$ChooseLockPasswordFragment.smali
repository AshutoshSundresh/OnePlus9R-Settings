.class public Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;
.super Lcom/android/settings/core/InstrumentedFragment;
.source "ChooseLockPassword.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/text/TextWatcher;
.implements Lcom/android/settings/password/SaveChosenLockWorkerBase$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/password/ChooseLockPassword;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChooseLockPasswordFragment"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$TextChangedHandler;,
        Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;
    }
.end annotation


# instance fields
.field private mChallenge:J

.field private mChooseLockSettingsHelper:Lcom/android/settings/password/ChooseLockSettingsHelper;

.field private mChosenPassword:Lcom/android/internal/widget/LockscreenCredential;

.field private mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

.field private mFirstPassword:Lcom/android/internal/widget/LockscreenCredential;

.field protected mForFace:Z

.field protected mForFingerprint:Z

.field private mHasChallenge:Z

.field protected mIsAlphaMode:Z

.field protected mLayout:Lcom/google/android/setupdesign/GlifLayout;

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mMessage:Landroid/widget/TextView;

.field private mMinComplexity:I

.field private mMinMetrics:Landroid/app/admin/PasswordMetrics;

.field private mNextButton:Lcom/google/android/setupcompat/template/FooterButton;

.field protected mPasswordEntry:Landroid/widget/ImeAwareEditText;

.field private mPasswordEntryInputDisabler:Lcom/android/internal/widget/TextViewInputDisabler;

.field private mPasswordHistoryHashFactor:[B

.field protected mPasswordRequirementAdapter:Lcom/android/settings/password/PasswordRequirementAdapter;

.field private mPasswordRestrictionView:Landroidx/recyclerview/widget/RecyclerView;

.field private mRequestedQuality:I

.field private mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

.field protected mSkipOrClearButton:Lcom/google/android/setupcompat/template/FooterButton;

.field private mTextChangedHandler:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$TextChangedHandler;

.field protected mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

.field private mUnificationProfileId:I

.field protected mUserId:I

.field private mValidationErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/internal/widget/PasswordValidationError;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 395
    invoke-direct {p0}, Lcom/android/settings/core/InstrumentedFragment;-><init>()V

    const/4 v0, 0x0

    .line 248
    iput v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMinComplexity:I

    const/16 v0, -0x2710

    .line 251
    iput v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUnificationProfileId:I

    const/high16 v0, 0x20000

    .line 255
    iput v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mRequestedQuality:I

    .line 257
    sget-object v0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->Introduction:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    return-void
.end method

.method private getPasswordHistoryHashFactor()[B
    .locals 3

    .line 681
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordHistoryHashFactor:[B

    if-nez v0, :cond_1

    .line 682
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 683
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 684
    :cond_0
    invoke-static {}, Lcom/android/internal/widget/LockscreenCredential;->createNone()Lcom/android/internal/widget/LockscreenCredential;

    move-result-object v1

    :goto_0
    iget v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    .line 682
    invoke-virtual {v0, v1, v2}, Lcom/android/internal/widget/LockPatternUtils;->getPasswordHistoryHashFactor(Lcom/android/internal/widget/LockscreenCredential;I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordHistoryHashFactor:[B

    .line 686
    :cond_1
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordHistoryHashFactor:[B

    return-object p0
.end method

.method private setHeaderText(Ljava/lang/String;)V
    .locals 1

    .line 902
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    invoke-virtual {v0}, Lcom/google/android/setupdesign/GlifLayout;->getHeaderText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    .line 903
    invoke-virtual {v0}, Lcom/google/android/setupdesign/GlifLayout;->getHeaderText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 906
    :cond_0
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    invoke-virtual {p0, p1}, Lcom/google/android/setupdesign/GlifLayout;->setHeaderText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setupPasswordRequirementsView(Landroid/view/View;)V
    .locals 2

    .line 584
    sget v0, Lcom/android/settings/R$id;->password_requirements_view:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordRestrictionView:Landroidx/recyclerview/widget/RecyclerView;

    .line 585
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 586
    new-instance p1, Lcom/android/settings/password/PasswordRequirementAdapter;

    invoke-direct {p1}, Lcom/android/settings/password/PasswordRequirementAdapter;-><init>()V

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordRequirementAdapter:Lcom/android/settings/password/PasswordRequirementAdapter;

    .line 587
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordRestrictionView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method private startSaveAndFinish()V
    .locals 12

    .line 927
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    if-eqz v0, :cond_0

    const-string p0, "ChooseLockPassword"

    const-string v0, "startSaveAndFinish with an existing SaveAndFinishWorker."

    .line 928
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 932
    :cond_0
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntryInputDisabler:Lcom/android/internal/widget/TextViewInputDisabler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/TextViewInputDisabler;->setInputEnabled(Z)V

    .line 933
    invoke-virtual {p0, v1}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->setNextEnabled(Z)V

    .line 935
    new-instance v0, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    invoke-direct {v0}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;-><init>()V

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    .line 936
    invoke-virtual {v0, p0}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;->setListener(Lcom/android/settings/password/SaveChosenLockWorkerBase$Listener;)V

    .line 938
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    const-string v2, "save_and_finish_worker"

    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/FragmentTransaction;->add(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 939
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    .line 940
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->executePendingTransactions()Z

    .line 942
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x1

    const-string v2, "extra_require_password"

    .line 943
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    .line 945
    iget v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUnificationProfileId:I

    const/16 v2, -0x2710

    if-eq v1, v2, :cond_2

    const-string/jumbo v1, "unification_profile_credential"

    .line 947
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/android/internal/widget/LockscreenCredential;

    .line 948
    :try_start_0
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    iget v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUnificationProfileId:I

    invoke-virtual {v1, v2, v0}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;->setProfileToUnify(ILcom/android/internal/widget/LockscreenCredential;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    .line 950
    invoke-virtual {v0}, Lcom/android/internal/widget/LockscreenCredential;->close()V

    goto :goto_1

    :catchall_0
    move-exception p0

    if-eqz v0, :cond_1

    .line 946
    :try_start_1
    invoke-virtual {v0}, Lcom/android/internal/widget/LockscreenCredential;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw p0

    .line 952
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    iget-object v4, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iget-boolean v6, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mHasChallenge:Z

    iget-wide v7, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChallenge:J

    iget-object v9, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChosenPassword:Lcom/android/internal/widget/LockscreenCredential;

    iget-object v10, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    iget v11, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    invoke-virtual/range {v3 .. v11}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;->start(Lcom/android/internal/widget/LockPatternUtils;ZZJLcom/android/internal/widget/LockscreenCredential;Lcom/android/internal/widget/LockscreenCredential;I)V

    return-void
.end method

.method private validateLocal(Ljava/lang/String;)Z
    .locals 3

    .line 837
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    const/4 p1, 0x0

    move v0, p1

    .line 838
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_2

    .line 839
    aget-char v1, p0, v0

    const/16 v2, 0x20

    if-le v1, v2, :cond_1

    const/16 v2, 0x7f

    if-lt v1, v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return p1

    :cond_2
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 911
    iget-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    sget-object v0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->ConfirmWrong:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    if-ne p1, v0, :cond_0

    .line 912
    sget-object p1, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->NeedToConfirm:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    .line 915
    :cond_0
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mTextChangedHandler:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$TextChangedHandler;

    invoke-static {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$TextChangedHandler;->access$000(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$TextChangedHandler;)V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method convertErrorCodeToMessages()[Ljava/lang/String;
    .locals 9

    .line 764
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 765
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mValidationErrors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/widget/PasswordValidationError;

    .line 766
    iget v4, v2, Lcom/android/internal/widget/PasswordValidationError;->errorCode:I

    const/4 v5, 0x1

    packed-switch v4, :pswitch_data_0

    .line 828
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unknown error validating password: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ChooseLockPassword"

    invoke-static {v3, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 823
    :pswitch_0
    iget-boolean v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    if-eqz v2, :cond_0

    .line 824
    sget v2, Lcom/android/settings/R$string;->lockpassword_password_recently_used:I

    goto :goto_1

    .line 825
    :cond_0
    sget v2, Lcom/android/settings/R$string;->lockpassword_pin_recently_used:I

    .line 823
    :goto_1
    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 801
    :pswitch_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_requires_nonnumerical:I

    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    new-array v5, v5, [Ljava/lang/Object;

    .line 803
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    .line 801
    invoke-virtual {v4, v6, v2, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 796
    :pswitch_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_requires_nonletter:I

    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    new-array v5, v5, [Ljava/lang/Object;

    .line 798
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    .line 796
    invoke-virtual {v4, v6, v2, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 791
    :pswitch_3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_requires_symbols:I

    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    new-array v5, v5, [Ljava/lang/Object;

    .line 793
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    .line 791
    invoke-virtual {v4, v6, v2, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 786
    :pswitch_4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_requires_numeric:I

    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    new-array v5, v5, [Ljava/lang/Object;

    .line 788
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    .line 786
    invoke-virtual {v4, v6, v2, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 776
    :pswitch_5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_requires_lowercase:I

    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    new-array v5, v5, [Ljava/lang/Object;

    .line 778
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    .line 776
    invoke-virtual {v4, v6, v2, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 771
    :pswitch_6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_requires_uppercase:I

    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    new-array v5, v5, [Ljava/lang/Object;

    .line 773
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    .line 771
    invoke-virtual {v4, v6, v2, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 781
    :pswitch_7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_requires_letters:I

    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    new-array v5, v5, [Ljava/lang/Object;

    .line 783
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    .line 781
    invoke-virtual {v4, v6, v2, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 820
    :pswitch_8
    sget v2, Lcom/android/settings/R$string;->lockpassword_pin_no_sequential_digits:I

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 813
    :pswitch_9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 814
    iget-boolean v6, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    if-eqz v6, :cond_1

    .line 815
    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_too_long:I

    goto :goto_2

    .line 816
    :cond_1
    sget v6, Lcom/android/settings/R$plurals;->lockpassword_pin_too_long:I

    :goto_2
    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    add-int/lit8 v7, v2, 0x1

    new-array v8, v5, [Ljava/lang/Object;

    add-int/2addr v2, v5

    .line 817
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v3

    .line 813
    invoke-virtual {v4, v6, v7, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 806
    :pswitch_a
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 807
    iget-boolean v6, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    if-eqz v6, :cond_2

    .line 808
    sget v6, Lcom/android/settings/R$plurals;->lockpassword_password_too_short:I

    goto :goto_3

    .line 809
    :cond_2
    sget v6, Lcom/android/settings/R$plurals;->lockpassword_pin_too_short:I

    :goto_3
    iget v2, v2, Lcom/android/internal/widget/PasswordValidationError;->requirement:I

    new-array v5, v5, [Ljava/lang/Object;

    .line 810
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v3

    .line 806
    invoke-virtual {v4, v6, v2, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 768
    :pswitch_b
    sget v2, Lcom/android/settings/R$string;->lockpassword_illegal_character:I

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_3
    new-array p0, v3, [Ljava/lang/String;

    .line 832
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x2
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

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x1c

    return p0
.end method

.method protected getRedactionInterstitialIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 641
    iget p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    invoke-static {p1, p0}, Lcom/android/settings/notification/RedactionInterstitial;->createStartIntent(Landroid/content/Context;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method protected getStageType()I
    .locals 1

    .line 578
    iget-boolean v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mForFingerprint:Z

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    .line 579
    :cond_0
    iget-boolean p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mForFace:Z

    if-eqz p0, :cond_1

    const/4 p0, 0x2

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public handleNext()V
    .locals 4

    .line 690
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    if-eqz v0, :cond_0

    return-void

    .line 692
    :cond_0
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {v0}, Landroid/widget/ImeAwareEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 693
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 696
    :cond_1
    iget-boolean v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    if-eqz v1, :cond_2

    invoke-static {v0}, Lcom/android/internal/widget/LockscreenCredential;->createPassword(Ljava/lang/CharSequence;)Lcom/android/internal/widget/LockscreenCredential;

    move-result-object v1

    goto :goto_0

    .line 697
    :cond_2
    invoke-static {v0}, Lcom/android/internal/widget/LockscreenCredential;->createPin(Ljava/lang/CharSequence;)Lcom/android/internal/widget/LockscreenCredential;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChosenPassword:Lcom/android/internal/widget/LockscreenCredential;

    .line 698
    iget-object v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    sget-object v3, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->Introduction:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    if-ne v2, v3, :cond_4

    .line 699
    invoke-virtual {p0, v1}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->validatePassword(Lcom/android/internal/widget/LockscreenCredential;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 701
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 702
    invoke-direct {p0, v0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->validateLocal(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 704
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChosenPassword:Lcom/android/internal/widget/LockscreenCredential;

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mFirstPassword:Lcom/android/internal/widget/LockscreenCredential;

    .line 705
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/ImeAwareEditText;->setText(Ljava/lang/CharSequence;)V

    .line 706
    sget-object v0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->NeedToConfirm:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    invoke-virtual {p0, v0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->updateStage(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;)V

    goto :goto_1

    .line 709
    :cond_3
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChosenPassword:Lcom/android/internal/widget/LockscreenCredential;

    invoke-virtual {p0}, Lcom/android/internal/widget/LockscreenCredential;->zeroize()V

    goto :goto_1

    .line 711
    :cond_4
    sget-object v3, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->NeedToConfirm:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    if-ne v2, v3, :cond_8

    .line 712
    iget-object v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mFirstPassword:Lcom/android/internal/widget/LockscreenCredential;

    invoke-virtual {v1, v2}, Lcom/android/internal/widget/LockscreenCredential;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_6

    .line 713
    invoke-direct {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->startSaveAndFinish()V

    .line 715
    iget-boolean v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    if-nez v1, :cond_5

    .line 716
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    iget p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    invoke-static {v1, v0, p0}, Lcom/oneplus/settings/utils/OPUtils;->savePINPasswordLength(Lcom/android/internal/widget/LockPatternUtils;II)V

    goto :goto_1

    .line 718
    :cond_5
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iget p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    invoke-static {v0, v2, p0}, Lcom/oneplus/settings/utils/OPUtils;->savePINPasswordLength(Lcom/android/internal/widget/LockPatternUtils;II)V

    goto :goto_1

    .line 722
    :cond_6
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {v0}, Landroid/widget/ImeAwareEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 724
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-static {v0, v2, v1}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 726
    :cond_7
    sget-object v0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->ConfirmWrong:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    invoke-virtual {p0, v0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->updateStage(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;)V

    .line 727
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChosenPassword:Lcom/android/internal/widget/LockscreenCredential;

    invoke-virtual {p0}, Lcom/android/internal/widget/LockscreenCredential;->zeroize()V

    :cond_8
    :goto_1
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 626
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x3a

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    if-eq p2, p1, :cond_1

    .line 630
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/Activity;->setResult(I)V

    .line 631
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_1
    const-string p1, "password"

    .line 633
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/android/internal/widget/LockscreenCredential;

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    :goto_0
    return-void
.end method

.method public onChosenLockSaveFinished(ZLandroid/content/Intent;)V
    .locals 2

    .line 958
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 960
    iget-object p2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChosenPassword:Lcom/android/internal/widget/LockscreenCredential;

    if-eqz p2, :cond_0

    .line 961
    invoke-virtual {p2}, Lcom/android/internal/widget/LockscreenCredential;->zeroize()V

    .line 963
    :cond_0
    iget-object p2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    if-eqz p2, :cond_1

    .line 964
    invoke-virtual {p2}, Lcom/android/internal/widget/LockscreenCredential;->zeroize()V

    .line 966
    :cond_1
    iget-object p2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mFirstPassword:Lcom/android/internal/widget/LockscreenCredential;

    if-eqz p2, :cond_2

    .line 967
    invoke-virtual {p2}, Lcom/android/internal/widget/LockscreenCredential;->zeroize()V

    .line 970
    :cond_2
    iget-object p2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    const-string v0, ""

    invoke-virtual {p2, v0}, Landroid/widget/ImeAwareEditText;->setText(Ljava/lang/CharSequence;)V

    if-nez p1, :cond_3

    .line 973
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->getRedactionInterstitialIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 975
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 978
    :cond_3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10

    .line 401
    invoke-super {p0, p1}, Lcom/android/settingslib/core/lifecycle/ObservableFragment;->onCreate(Landroid/os/Bundle;)V

    .line 402
    new-instance p1, Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 403
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 404
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    instance-of v0, v0, Lcom/android/settings/password/ChooseLockPassword;

    if-eqz v0, :cond_2

    .line 408
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/settings/Utils;->getUserIdFromBundle(Landroid/content/Context;Landroid/os/Bundle;)I

    move-result v0

    iput v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    const-string v0, "for_fingerprint"

    const/4 v1, 0x0

    .line 409
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mForFingerprint:Z

    const-string v0, "for_face"

    .line 411
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mForFace:Z

    const-string v0, "requested_min_complexity"

    .line 412
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMinComplexity:I

    const/high16 v0, 0x20000

    const-string v2, "lockscreen.password_type"

    .line 415
    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mRequestedQuality:I

    const-string/jumbo v0, "unification_profile_id"

    const/16 v2, -0x2710

    .line 417
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUnificationProfileId:I

    .line 420
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iget v3, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    invoke-virtual {v0, v3}, Lcom/android/internal/widget/LockPatternUtils;->getRequestedPasswordMetrics(I)Landroid/app/admin/PasswordMetrics;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMinMetrics:Landroid/app/admin/PasswordMetrics;

    .line 425
    iget v3, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUnificationProfileId:I

    if-eq v3, v2, :cond_0

    .line 426
    iget-object v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 427
    invoke-virtual {v2, v3}, Lcom/android/internal/widget/LockPatternUtils;->getRequestedPasswordMetrics(I)Landroid/app/admin/PasswordMetrics;

    move-result-object v2

    .line 426
    invoke-virtual {v0, v2}, Landroid/app/admin/PasswordMetrics;->maxWith(Landroid/app/admin/PasswordMetrics;)V

    .line 430
    :cond_0
    new-instance v0, Lcom/android/settings/password/ChooseLockSettingsHelper;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/android/settings/password/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChooseLockSettingsHelper:Lcom/android/settings/password/ChooseLockSettingsHelper;

    const-string v0, "for_cred_req_boot"

    .line 432
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 434
    new-instance v1, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    invoke-direct {v1}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;-><init>()V

    .line 435
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "extra_require_password"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const-string v2, "password"

    .line 437
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    move-object v8, p1

    check-cast v8, Lcom/android/internal/widget/LockscreenCredential;

    .line 440
    invoke-virtual {v1, v3}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;->setBlocking(Z)V

    .line 441
    invoke-virtual {v1, p0}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;->setListener(Lcom/android/settings/password/SaveChosenLockWorkerBase$Listener;)V

    .line 442
    iget-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChooseLockSettingsHelper:Lcom/android/settings/password/ChooseLockSettingsHelper;

    invoke-virtual {p1}, Lcom/android/settings/password/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v2

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    iget v9, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    move v3, v0

    move-object v7, v8

    invoke-virtual/range {v1 .. v9}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;->start(Lcom/android/internal/widget/LockPatternUtils;ZZJLcom/android/internal/widget/LockscreenCredential;Lcom/android/internal/widget/LockscreenCredential;I)V

    .line 445
    :cond_1
    new-instance p1, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$TextChangedHandler;

    invoke-direct {p1, p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$TextChangedHandler;-><init>(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;)V

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mTextChangedHandler:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$TextChangedHandler;

    return-void

    .line 405
    :cond_2
    new-instance p0, Ljava/lang/SecurityException;

    const-string p1, "Fragment contained in wrong activity"

    invoke-direct {p0, p1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    .line 451
    sget p0, Lcom/android/settings/R$layout;->choose_lock_password:I

    const/4 p3, 0x0

    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    .line 566
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservableFragment;->onDestroy()V

    .line 567
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    if-eqz p0, :cond_0

    .line 568
    invoke-virtual {p0}, Lcom/android/internal/widget/LockscreenCredential;->zeroize()V

    .line 572
    :cond_0
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 573
    invoke-static {}, Ljava/lang/System;->runFinalization()V

    .line 574
    invoke-static {}, Ljava/lang/System;->gc()V

    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    if-eqz p2, :cond_1

    const/4 p1, 0x6

    if-eq p2, p1, :cond_1

    const/4 p1, 0x5

    if-ne p2, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    .line 753
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->handleNext()V

    const/4 p0, 0x1

    return p0
.end method

.method protected onNextButtonClick(Landroid/view/View;)V
    .locals 0

    .line 745
    invoke-virtual {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->handleNext()V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 609
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 610
    invoke-virtual {v0, v1}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;->setListener(Lcom/android/settings/password/SaveChosenLockWorkerBase$Listener;)V

    .line 612
    :cond_0
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservableFragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 597
    invoke-super {p0}, Lcom/android/settings/core/InstrumentedFragment;->onResume()V

    .line 598
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    invoke-virtual {p0, v0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->updateStage(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;)V

    .line 599
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    if-eqz v0, :cond_0

    .line 600
    invoke-virtual {v0, p0}, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;->setListener(Lcom/android/settings/password/SaveChosenLockWorkerBase$Listener;)V

    goto :goto_0

    .line 602
    :cond_0
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {v0}, Landroid/widget/ImeAwareEditText;->requestFocus()Z

    .line 603
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {p0}, Landroid/widget/ImeAwareEditText;->scheduleShowSoftInput()V

    :goto_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 617
    invoke-super {p0, p1}, Lcom/android/settingslib/core/lifecycle/ObservableFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 618
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "ui_stage"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mFirstPassword:Lcom/android/internal/widget/LockscreenCredential;

    const-string v1, "first_password"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 620
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    const-string v0, "current_credential"

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-void
.end method

.method protected onSkipOrClearButtonClick(Landroid/view/View;)V
    .locals 0

    .line 741
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    const-string p1, ""

    invoke-virtual {p0, p1}, Landroid/widget/ImeAwareEditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6

    .line 456
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 458
    move-object v0, p1

    check-cast v0, Lcom/google/android/setupdesign/GlifLayout;

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    .line 462
    sget v0, Lcom/android/settings/R$id;->password_container:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 463
    sget-object v1, Landroid/graphics/Insets;->NONE:Landroid/graphics/Insets;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOpticalInsets(Landroid/graphics/Insets;)V

    .line 465
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    const-class v1, Lcom/google/android/setupcompat/template/FooterBarMixin;

    invoke-virtual {v0, v1}, Lcom/google/android/setupcompat/internal/TemplateLayout;->getMixin(Ljava/lang/Class;)Lcom/google/android/setupcompat/template/Mixin;

    move-result-object v0

    check-cast v0, Lcom/google/android/setupcompat/template/FooterBarMixin;

    .line 466
    new-instance v1, Lcom/google/android/setupcompat/template/FooterButton$Builder;

    .line 467
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/android/settings/R$string;->lockpassword_clear_label:I

    .line 468
    invoke-virtual {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->setText(I)Lcom/google/android/setupcompat/template/FooterButton$Builder;

    new-instance v2, Lcom/android/settings/password/-$$Lambda$ikzTUby0RNf2Od_PDDYThVTUDX4;

    invoke-direct {v2, p0}, Lcom/android/settings/password/-$$Lambda$ikzTUby0RNf2Od_PDDYThVTUDX4;-><init>(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;)V

    .line 469
    invoke-virtual {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->setListener(Landroid/view/View$OnClickListener;)Lcom/google/android/setupcompat/template/FooterButton$Builder;

    const/4 v2, 0x7

    .line 470
    invoke-virtual {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->setButtonType(I)Lcom/google/android/setupcompat/template/FooterButton$Builder;

    sget v2, Lcom/android/settings/R$style;->OnePlusSecondaryButtonStyle:I

    .line 471
    invoke-virtual {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->setTheme(I)Lcom/google/android/setupcompat/template/FooterButton$Builder;

    .line 472
    invoke-virtual {v1}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->build()Lcom/google/android/setupcompat/template/FooterButton;

    move-result-object v1

    .line 466
    invoke-virtual {v0, v1}, Lcom/google/android/setupcompat/template/FooterBarMixin;->setSecondaryButton(Lcom/google/android/setupcompat/template/FooterButton;)V

    .line 474
    new-instance v1, Lcom/google/android/setupcompat/template/FooterButton$Builder;

    .line 475
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/android/settings/R$string;->next_label:I

    .line 476
    invoke-virtual {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->setText(I)Lcom/google/android/setupcompat/template/FooterButton$Builder;

    new-instance v2, Lcom/android/settings/password/-$$Lambda$7NRrBWB0RaxJKWMsiZuTfUSqmeE;

    invoke-direct {v2, p0}, Lcom/android/settings/password/-$$Lambda$7NRrBWB0RaxJKWMsiZuTfUSqmeE;-><init>(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;)V

    .line 477
    invoke-virtual {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->setListener(Landroid/view/View$OnClickListener;)Lcom/google/android/setupcompat/template/FooterButton$Builder;

    const/4 v2, 0x5

    .line 478
    invoke-virtual {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->setButtonType(I)Lcom/google/android/setupcompat/template/FooterButton$Builder;

    sget v2, Lcom/android/settings/R$style;->OnePlusPrimaryButtonStyle:I

    .line 479
    invoke-virtual {v1, v2}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->setTheme(I)Lcom/google/android/setupcompat/template/FooterButton$Builder;

    .line 480
    invoke-virtual {v1}, Lcom/google/android/setupcompat/template/FooterButton$Builder;->build()Lcom/google/android/setupcompat/template/FooterButton;

    move-result-object v1

    .line 474
    invoke-virtual {v0, v1}, Lcom/google/android/setupcompat/template/FooterBarMixin;->setPrimaryButton(Lcom/google/android/setupcompat/template/FooterButton;)V

    .line 482
    invoke-virtual {v0}, Lcom/google/android/setupcompat/template/FooterBarMixin;->getSecondaryButton()Lcom/google/android/setupcompat/template/FooterButton;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSkipOrClearButton:Lcom/google/android/setupcompat/template/FooterButton;

    .line 483
    invoke-virtual {v0}, Lcom/google/android/setupcompat/template/FooterBarMixin;->getPrimaryButton()Lcom/google/android/setupcompat/template/FooterButton;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mNextButton:Lcom/google/android/setupcompat/template/FooterButton;

    .line 485
    sget v0, Lcom/android/settings/R$id;->sud_layout_description:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMessage:Landroid/widget/TextView;

    .line 486
    iget-boolean v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mForFingerprint:Z

    if-eqz v0, :cond_0

    .line 487
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/android/settings/R$drawable;->ic_opfinger_logo_bg:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/setupdesign/GlifLayout;->setIcon(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 488
    :cond_0
    iget-boolean v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mForFace:Z

    if-eqz v0, :cond_1

    .line 489
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/android/settings/R$drawable;->op_face_settings:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/setupdesign/GlifLayout;->setIcon(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    :goto_0
    const/high16 v0, 0x40000

    .line 492
    iget v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mRequestedQuality:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_3

    const/high16 v0, 0x50000

    if-eq v0, v1, :cond_3

    const/high16 v0, 0x60000

    if-ne v0, v1, :cond_2

    goto :goto_1

    :cond_2
    move v0, v2

    goto :goto_2

    :cond_3
    :goto_1
    move v0, v3

    :goto_2
    iput-boolean v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    .line 496
    invoke-direct {p0, p1}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->setupPasswordRequirementsView(Landroid/view/View;)V

    .line 498
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordRestrictionView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    invoke-direct {v1, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 499
    sget v0, Lcom/android/settings/R$id;->password_entry:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImeAwareEditText;

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    .line 500
    invoke-virtual {p1, p0}, Landroid/widget/ImeAwareEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 501
    iget-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {p1, p0}, Landroid/widget/ImeAwareEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 502
    iget-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {p1}, Landroid/widget/ImeAwareEditText;->requestFocus()Z

    .line 503
    new-instance p1, Lcom/android/internal/widget/TextViewInputDisabler;

    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-direct {p1, v0}, Lcom/android/internal/widget/TextViewInputDisabler;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntryInputDisabler:Lcom/android/internal/widget/TextViewInputDisabler;

    .line 505
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 507
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {v0}, Landroid/widget/ImeAwareEditText;->getInputType()I

    move-result v0

    .line 508
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    iget-boolean v4, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    if-eqz v4, :cond_4

    goto :goto_3

    :cond_4
    const/16 v0, 0x12

    :goto_3
    invoke-virtual {v1, v0}, Landroid/widget/ImeAwareEditText;->setInputType(I)V

    .line 510
    iget-boolean v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    if-eqz v0, :cond_5

    .line 511
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    sget v1, Lcom/android/settings/R$string;->unlock_set_unlock_password_title:I

    .line 512
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 511
    invoke-virtual {v0, v1}, Landroid/widget/ImeAwareEditText;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 514
    :cond_5
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    sget v1, Lcom/android/settings/R$string;->unlock_set_unlock_pin_title:I

    .line 515
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 514
    invoke-virtual {v0, v1}, Landroid/widget/ImeAwareEditText;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 518
    :goto_4
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    .line 519
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v4, 0x1040228

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 518
    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImeAwareEditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 522
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "confirm_credentials"

    .line 523
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    const-string v4, "password"

    .line 525
    invoke-virtual {v0, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/android/internal/widget/LockscreenCredential;

    iput-object v4, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    const-string v4, "has_challenge"

    .line 527
    invoke-virtual {v0, v4, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mHasChallenge:Z

    const-wide/16 v4, 0x0

    const-string v2, "challenge"

    .line 529
    invoke-virtual {v0, v2, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChallenge:J

    if-nez p2, :cond_6

    .line 531
    sget-object p2, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->Introduction:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    invoke-virtual {p0, p2}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->updateStage(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;)V

    if-eqz v1, :cond_9

    .line 533
    iget-object p2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mChooseLockSettingsHelper:Lcom/android/settings/password/ChooseLockSettingsHelper;

    const/16 v0, 0x3a

    sget v1, Lcom/android/settings/R$string;->unlock_set_unlock_launch_picker_title:I

    .line 534
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    .line 533
    invoke-virtual {p2, v0, v1, v3, v2}, Lcom/android/settings/password/ChooseLockSettingsHelper;->launchConfirmationActivity(ILjava/lang/CharSequence;ZI)Z

    goto :goto_5

    :cond_6
    const-string v0, "first_password"

    .line 540
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/android/internal/widget/LockscreenCredential;

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mFirstPassword:Lcom/android/internal/widget/LockscreenCredential;

    const-string/jumbo v0, "ui_stage"

    .line 541
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 543
    invoke-static {v0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->valueOf(Ljava/lang/String;)Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    .line 544
    invoke-virtual {p0, v0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->updateStage(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;)V

    .line 547
    :cond_7
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    if-nez v0, :cond_8

    const-string v0, "current_credential"

    .line 548
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Lcom/android/internal/widget/LockscreenCredential;

    iput-object p2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mCurrentCredential:Lcom/android/internal/widget/LockscreenCredential;

    .line 552
    :cond_8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    const-string v0, "save_and_finish_worker"

    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p2

    check-cast p2, Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    iput-object p2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    .line 556
    :cond_9
    :goto_5
    instance-of p2, p1, Lcom/android/settings/SettingsActivity;

    if-eqz p2, :cond_a

    .line 557
    check-cast p1, Lcom/android/settings/SettingsActivity;

    .line 558
    sget-object p2, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->Introduction:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    iget-boolean v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    invoke-virtual {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->getStageType()I

    move-result v1

    invoke-virtual {p2, v0, v1}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->getHint(ZI)I

    move-result p2

    .line 559
    invoke-virtual {p1, p2}, Landroid/app/Activity;->setTitle(I)V

    .line 560
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    invoke-virtual {p0, p2}, Lcom/google/android/setupdesign/GlifLayout;->setHeaderText(I)V

    :cond_a
    return-void
.end method

.method protected setNextEnabled(Z)V
    .locals 0

    .line 733
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mNextButton:Lcom/google/android/setupcompat/template/FooterButton;

    invoke-virtual {p0, p1}, Lcom/google/android/setupcompat/template/FooterButton;->setEnabled(Z)V

    return-void
.end method

.method protected setNextText(I)V
    .locals 1

    .line 737
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mNextButton:Lcom/google/android/setupcompat/template/FooterButton;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Lcom/google/android/setupcompat/template/FooterButton;->setText(Landroid/content/Context;I)V

    return-void
.end method

.method protected toVisibility(Z)I
    .locals 0

    if-eqz p1, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/16 p0, 0x8

    :goto_0
    return p0
.end method

.method protected updateStage(Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;)V
    .locals 1

    .line 645
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    .line 646
    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    .line 647
    invoke-virtual {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->updateUi()V

    if-eq v0, p1, :cond_0

    .line 652
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLayout:Lcom/google/android/setupdesign/GlifLayout;

    invoke-virtual {p0}, Lcom/google/android/setupdesign/GlifLayout;->getHeaderText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method protected updateUi()V
    .locals 9

    .line 852
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSaveAndFinishWorker:Lcom/android/settings/password/ChooseLockPassword$SaveAndFinishWorker;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 854
    :goto_0
    iget-boolean v3, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    if-eqz v3, :cond_1

    .line 855
    iget-object v3, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {v3}, Landroid/widget/ImeAwareEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/widget/LockscreenCredential;->createPasswordOrNone(Ljava/lang/CharSequence;)Lcom/android/internal/widget/LockscreenCredential;

    move-result-object v3

    goto :goto_1

    .line 856
    :cond_1
    iget-object v3, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {v3}, Landroid/widget/ImeAwareEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/widget/LockscreenCredential;->createPinOrNone(Ljava/lang/CharSequence;)Lcom/android/internal/widget/LockscreenCredential;

    move-result-object v3

    .line 857
    :goto_1
    invoke-virtual {v3}, Lcom/android/internal/widget/LockscreenCredential;->size()I

    move-result v4

    .line 858
    iget-object v5, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    sget-object v6, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->Introduction:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    const/16 v7, 0x8

    if-ne v5, v6, :cond_3

    .line 859
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordRestrictionView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 861
    invoke-virtual {p0, v3}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->validatePassword(Lcom/android/internal/widget/LockscreenCredential;)Z

    move-result v1

    .line 862
    iget-object v4, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntry:Landroid/widget/ImeAwareEditText;

    invoke-virtual {v4}, Landroid/widget/ImeAwareEditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 863
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-direct {p0, v4}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->validateLocal(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 865
    new-instance v1, Lcom/android/internal/widget/PasswordValidationError;

    const/4 v4, 0x2

    invoke-direct {v1, v4}, Lcom/android/internal/widget/PasswordValidationError;-><init>(I)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mValidationErrors:Ljava/util/List;

    goto :goto_2

    :cond_2
    move v2, v1

    .line 868
    :goto_2
    invoke-virtual {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->convertErrorCodeToMessages()[Ljava/lang/String;

    move-result-object v1

    .line 870
    iget-object v4, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordRequirementAdapter:Lcom/android/settings/password/PasswordRequirementAdapter;

    invoke-virtual {v4, v1}, Lcom/android/settings/password/PasswordRequirementAdapter;->setRequirements([Ljava/lang/String;)V

    .line 872
    invoke-virtual {p0, v2}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->setNextEnabled(Z)V

    goto :goto_5

    .line 875
    :cond_3
    iget-object v5, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordRestrictionView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 876
    iget-object v5, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    iget-boolean v6, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    invoke-virtual {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->getStageType()I

    move-result v8

    invoke-virtual {v5, v6, v8}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->getHint(ZI)I

    move-result v5

    invoke-virtual {p0, v5}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->setHeaderText(Ljava/lang/String;)V

    if-eqz v0, :cond_4

    const/4 v5, 0x4

    if-lt v4, v5, :cond_4

    move v5, v1

    goto :goto_3

    :cond_4
    move v5, v2

    .line 877
    :goto_3
    invoke-virtual {p0, v5}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->setNextEnabled(Z)V

    .line 878
    iget-object v5, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mSkipOrClearButton:Lcom/google/android/setupcompat/template/FooterButton;

    if-eqz v0, :cond_5

    if-lez v4, :cond_5

    goto :goto_4

    :cond_5
    move v1, v2

    :goto_4
    invoke-virtual {p0, v1}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->toVisibility(Z)I

    move-result v1

    invoke-virtual {v5, v1}, Lcom/google/android/setupcompat/template/FooterButton;->setVisibility(I)V

    .line 880
    :goto_5
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    iget-boolean v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    invoke-virtual {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->getStageType()I

    move-result v4

    invoke-virtual {v1, v2, v4}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->getMessage(ZI)I

    move-result v1

    if-eqz v1, :cond_6

    .line 883
    iget-object v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMessage:Landroid/widget/TextView;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 885
    iget-object v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMessage:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_6

    .line 888
    :cond_6
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMessage:Landroid/widget/TextView;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 891
    :goto_6
    iget-object v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUiStage:Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;

    iget v1, v1, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment$Stage;->buttonText:I

    invoke-virtual {p0, v1}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->setNextText(I)V

    .line 892
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mPasswordEntryInputDisabler:Lcom/android/internal/widget/TextViewInputDisabler;

    invoke-virtual {p0, v0}, Lcom/android/internal/widget/TextViewInputDisabler;->setInputEnabled(Z)V

    .line 893
    invoke-virtual {v3}, Lcom/android/internal/widget/LockscreenCredential;->zeroize()V

    return-void
.end method

.method validatePassword(Lcom/android/internal/widget/LockscreenCredential;)Z
    .locals 3
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .line 665
    invoke-virtual {p1}, Lcom/android/internal/widget/LockscreenCredential;->getCredential()[B

    move-result-object p1

    .line 666
    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMinMetrics:Landroid/app/admin/PasswordMetrics;

    iget v1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mMinComplexity:I

    iget-boolean v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mIsAlphaMode:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-static {v0, v1, v2, p1}, Landroid/app/admin/PasswordMetrics;->validatePassword(Landroid/app/admin/PasswordMetrics;IZ[B)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mValidationErrors:Ljava/util/List;

    .line 668
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 669
    invoke-direct {p0}, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->getPasswordHistoryHashFactor()[B

    move-result-object v1

    iget v2, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mUserId:I

    .line 668
    invoke-virtual {v0, p1, v1, v2}, Lcom/android/internal/widget/LockPatternUtils;->checkPasswordHistory([B[BI)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 670
    new-instance p1, Lcom/android/internal/widget/PasswordValidationError;

    const/16 v0, 0xd

    invoke-direct {p1, v0}, Lcom/android/internal/widget/PasswordValidationError;-><init>(I)V

    .line 671
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mValidationErrors:Ljava/util/List;

    .line 673
    :cond_0
    iget-object p0, p0, Lcom/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment;->mValidationErrors:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    return p0
.end method
