.class public Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;
.super Ljava/lang/Object;
.source "AboutPhonePresenter.java"


# instance fields
.field private isSimLock:Z

.field private mActivity:Landroid/app/Activity;

.field private mContext:Landroid/content/Context;

.field private mDebuggingFeaturesDisallowedAdmin:Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

.field private mDebuggingFeaturesDisallowedBySystem:Z

.field private mDevHitCountdown:I

.field private mFragment:Landroidx/fragment/app/Fragment;

.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;",
            ">;"
        }
    .end annotation
.end field

.field public mProcessingLastDevHit:Z

.field private final mUm:Landroid/os/UserManager;

.field private mView:Lcom/oneplus/settings/aboutphone/Contract$View;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroidx/fragment/app/Fragment;Lcom/oneplus/settings/aboutphone/Contract$View;)V
    .locals 1

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    .line 76
    iput-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 78
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mContext:Landroid/content/Context;

    .line 79
    invoke-static {p1}, Lcom/oneplus/settings/aboutphone/OPNetworkUnlockUtils;->getNetworkUnlockStatus(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->isSimLock:Z

    .line 81
    iput-object p3, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    .line 82
    iput-object p2, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mFragment:Landroidx/fragment/app/Fragment;

    .line 84
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    const-string p2, "user"

    invoke-virtual {p1, p2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/UserManager;

    iput-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mUm:Landroid/os/UserManager;

    .line 85
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 88
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p2

    const-string p3, "no_debugging_features"

    .line 86
    invoke-static {p1, p3, p2}, Lcom/android/settingslib/RestrictedLockUtilsInternal;->checkIfRestrictionEnforced(Landroid/content/Context;Ljava/lang/String;I)Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDebuggingFeaturesDisallowedAdmin:Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    .line 90
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/android/settingslib/development/DevelopmentSettingsEnabler;->isDevelopmentSettingsEnabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x7

    .line 91
    :goto_0
    iput p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDevHitCountdown:I

    .line 92
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 95
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result p2

    .line 93
    invoke-static {p1, p3, p2}, Lcom/android/settingslib/RestrictedLockUtilsInternal;->hasBaseUserRestriction(Landroid/content/Context;Ljava/lang/String;I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDebuggingFeaturesDisallowedBySystem:Z

    return-void
.end method

.method private addAndroidVersion()V
    .locals 3

    .line 335
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 336
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->firmware_version:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 337
    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 338
    sget v1, Lcom/android/settings/R$drawable;->op_android_version:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const-string v1, "com.android.FirmwareVersionDialogFragment"

    .line 339
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 340
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addAuthenticationInfo()V
    .locals 7

    .line 254
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 255
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_regulatory_information:I

    .line 256
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 255
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 257
    sget v1, Lcom/android/settings/R$drawable;->op_authentication_information:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    .line 260
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v2, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v3, Lcom/android/settings/R$string;->oneplus_model_for_china_and_india:I

    .line 261
    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 260
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, ""

    const-string v3, "com.oneplus.intent.OPAuthenticationInformationSettings"

    const-string v4, "android.settings.SHOW_REGULATORY_INFO"

    if-nez v1, :cond_10

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "ONEPLUS A6000"

    .line 263
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "ONEPLUS A5010"

    .line 265
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "ONEPLUS A5000"

    .line 267
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    .line 276
    :cond_0
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_for_europe_and_america:I

    .line 277
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 276
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "ONEPLUS A6003"

    .line 279
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto/16 :goto_2

    .line 282
    :cond_1
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP3()Z

    move-result v1

    if-nez v1, :cond_d

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP3T()Z

    move-result v1

    if-eqz v1, :cond_2

    goto/16 :goto_1

    .line 292
    :cond_2
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_oneplus_model_18821_for_eu:I

    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_18865_for_eu:I

    .line 293
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_19801_for_eu:I

    .line 294
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_oneplus_model_18857_for_eu:I

    .line 295
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_oneplus_model_18821_for_us:I

    .line 296
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_oneplus_model_18831_for_us:I

    .line 297
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_oneplus_model_18857_for_us:I

    .line 298
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_oneplus_model_18825_for_us:I

    .line 299
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isO2()Z

    move-result v1

    if-nez v1, :cond_c

    :cond_3
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_oneplus_model_ee145:I

    .line 300
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_19801_for_us:I

    .line 301
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_18865_for_us:I

    .line 302
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_18865_for_tmo:I

    .line 303
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_19861_for_tmo:I

    .line 304
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_19863_for_tmo:I

    .line 305
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isMEARom()Z

    move-result v1

    if-eqz v1, :cond_c

    :cond_5
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_19855_for_tmo:I

    .line 306
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOnePlusBrand()Z

    move-result v1

    if-nez v1, :cond_c

    :cond_6
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_19821_for_us:I

    .line 307
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOnePlusBrand()Z

    move-result v1

    if-nez v1, :cond_c

    :cond_7
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_19867_for_vzw:I

    .line 308
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOnePlusBrand()Z

    move-result v1

    if-nez v1, :cond_c

    :cond_8
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_19811_for_us:I

    .line 309
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOnePlusBrand()Z

    move-result v1

    if-nez v1, :cond_c

    :cond_9
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_kebabt:I

    .line 310
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_kebab_for_03:I

    .line 311
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_kebab_for_01:I

    .line 312
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_kebab_for_04:I

    .line 313
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_avicii_for_us:I

    .line 314
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_breeze_for_01:I

    .line 315
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_breeze_for_02:I

    .line 316
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_breeze_for_05:I

    .line 317
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/android/settings/R$string;->oneplus_model_breeze_for_06:I

    .line 318
    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_0

    .line 321
    :cond_a
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 322
    invoke-static {v1}, Lcom/oneplus/settings/utils/OPAuthenticationInformationUtils;->isNeedShowAuthenticationInformation(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 324
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_authentication_information:I

    .line 325
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_5

    :cond_b
    move-object v3, v2

    goto :goto_5

    .line 320
    :cond_c
    :goto_0
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->regulatory_labels:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    :cond_d
    :goto_1
    const-string v1, "ro.rf_version"

    .line 283
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Am"

    .line 284
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 286
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->regulatory_labels:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    goto :goto_4

    .line 289
    :cond_e
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_authentication_information:I

    .line 290
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    goto :goto_5

    .line 281
    :cond_f
    :goto_2
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->regulatory_labels:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    .line 268
    :cond_10
    :goto_3
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isO2()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 270
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->regulatory_labels:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_4
    move-object v3, v4

    goto :goto_5

    .line 273
    :cond_11
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_authentication_information:I

    .line 274
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 328
    :goto_5
    invoke-virtual {v0, v2}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 329
    invoke-virtual {v0, v3}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 331
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addAwardInfo()V
    .locals 3

    .line 430
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 431
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_forum_award_title:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 432
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isO2()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 433
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_o2_contributors:I

    .line 434
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 433
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 436
    :cond_0
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_h2_contributors:I

    .line 437
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 436
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 439
    :goto_0
    sget v1, Lcom/android/settings/R$drawable;->op_award_icon:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const-string v1, "com.oneplus.intent.OPForumContributorsActivity"

    .line 440
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 441
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addDeviceModel()V
    .locals 5

    .line 397
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 398
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->model_info:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 399
    sget v1, Lcom/android/settings/R$drawable;->op_model:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const/4 v1, 0x0

    .line 400
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 401
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "A30"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "A50"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "A60"

    .line 402
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 406
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isLDEV()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "OnePlus VZW"

    goto :goto_0

    :cond_1
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 403
    :cond_2
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ONEPLUS\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v3, "ONEPLUS "

    const-string v4, ""

    .line 404
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 403
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 408
    :goto_2
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addDeviceName()V
    .locals 3

    .line 235
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 236
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->my_device_info_device_name_preference_title:I

    .line 238
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 237
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 239
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 240
    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "oem_oneplus_devicename"

    .line 239
    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 242
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isEF009Project()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 243
    invoke-static {v1}, Lcom/oneplus/settings/utils/OPUtils;->isContainSymbol(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v1}, Lcom/oneplus/settings/utils/OPUtils;->getSymbolDeviceName(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    :cond_0
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 245
    :cond_1
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isLDEV()Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v1, "OnePlus VZW"

    :cond_2
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 248
    :goto_0
    sget v1, Lcom/android/settings/R$drawable;->op_device_name:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const-string v1, "com.oneplus.intent.OPDeviceNameActivity"

    .line 249
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 250
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addHardwareVersion()V
    .locals 4

    .line 499
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 500
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->onplus_hardware_version_info:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 501
    sget v1, Lcom/android/settings/R$drawable;->op_hardware_icon:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    .line 503
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/android/settings/R$string;->device_info_default:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ro.boot.hw_version"

    .line 505
    invoke-static {v2, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 506
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->initHwId()Ljava/lang/String;

    move-result-object v2

    .line 507
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v2

    .line 512
    :goto_0
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isUsvMode()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 513
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/16 v3, 0xd

    if-gt v2, v3, :cond_1

    .line 515
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 519
    :cond_1
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isLDEV()Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x15

    if-ne v2, v3, :cond_2

    const-string v1, "22"

    .line 520
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 522
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isLDEV()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 523
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_3
    const-string v1, "15"

    .line 525
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 531
    :cond_4
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    :goto_1
    const/4 v1, 0x0

    .line 533
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 534
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addLegalInfo()V
    .locals 3

    .line 412
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 413
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->legal_information:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 414
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_legal_summary:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 415
    sget v1, Lcom/android/settings/R$drawable;->op_legal_settings:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const-string v1, "com.oneplus.intent.LegalSettingsActivity"

    .line 416
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 417
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addOneplusSystemVersion()V
    .locals 7

    .line 344
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    aput v1, v2, v3

    .line 348
    invoke-static {v2}, Landroid/util/OpFeatures;->isSupport([I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 349
    sget v1, Lcom/android/settings/R$drawable;->op_o2_version:I

    .line 350
    iget-object v2, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/android/settings/R$string;->oneplus_oxygen_version:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 352
    iget-object v3, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 354
    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/android/settings/R$string;->device_info_default:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "ro.oxygen.version"

    .line 352
    invoke-static {v4, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "O2"

    const-string v5, "O\u2082"

    .line 355
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 357
    :cond_0
    sget v1, Lcom/android/settings/R$drawable;->op_h2_version:I

    .line 358
    iget-object v2, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/android/settings/R$string;->oneplus_hydrogen_version:I

    .line 359
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "H2"

    const-string v4, "H\u2082"

    .line 360
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 361
    iget-object v5, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 363
    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/android/settings/R$string;->device_info_default:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "ro.rom.version"

    .line 361
    invoke-static {v6, v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 364
    invoke-virtual {v5, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 367
    :goto_0
    invoke-virtual {v0, v2}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 368
    invoke-virtual {v0, v3}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 369
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const/4 v1, 0x0

    .line 370
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 372
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addProductIntroduce()V
    .locals 3

    .line 445
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 446
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_product_info:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 447
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_product_info_summary:I

    .line 448
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 447
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 449
    sget v1, Lcom/android/settings/R$drawable;->op_product_info:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const-string v1, "com.oneplus.action.PRODUCT_INFO"

    .line 450
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 451
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addSoftwareVersion()V
    .locals 7

    .line 456
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 457
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->onplus_software_version_info:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 458
    sget v1, Lcom/android/settings/R$drawable;->op_software_icon:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    .line 459
    invoke-static {}, Landroid/text/BidiFormatter;->getInstance()Landroid/text/BidiFormatter;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 461
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSM8X50Products()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 462
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/android/settings/R$string;->device_info_default:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 464
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isUsvMode()Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "ro.build.display.id"

    .line 466
    invoke-static {v2, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 467
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "_"

    .line 468
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 469
    array-length v5, v4

    const/4 v6, 0x3

    if-ne v5, v6, :cond_2

    .line 470
    iget-object v2, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v5, Lcom/android/settings/R$string;->device_info_default:I

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v5, "ro.boot.hw_version"

    .line 472
    invoke-static {v5, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 473
    iget-object v2, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v5, "hw_version_ui"

    invoke-static {v2, v5}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 474
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v2

    .line 478
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/16 v5, 0xd

    if-le v2, v5, :cond_1

    const-string v1, "15"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 482
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 484
    :cond_1
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    aget-object v5, v4, v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x2

    aget-object v1, v4, v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_2
    move-object v1, v2

    goto :goto_2

    :cond_3
    const-string v2, "ro.rom.version"

    .line 489
    invoke-static {v2, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 493
    :cond_4
    :goto_2
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    const-string v1, "build.number"

    .line 494
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 495
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addStatusInfo()V
    .locals 3

    .line 421
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 422
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->device_status:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 423
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->oneplus_status_summary:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 424
    sget v1, Lcom/android/settings/R$drawable;->op_status_settings:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const-string v1, "com.oneplus.intent.MyDeviceInfoFragmentActivity"

    .line 425
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 426
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addVersionNumber()V
    .locals 4

    .line 376
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 377
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->build_number:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 380
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/android/settings/R$string;->device_info_default:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ro.rom.version"

    .line 383
    invoke-static {v2, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 385
    sget-object v2, Landroid/os/Build;->BOARD:Ljava/lang/String;

    const-string v3, "enchilada"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Landroid/os/Build;->BOARD:Ljava/lang/String;

    const-string v3, "fajita"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 386
    :cond_0
    invoke-static {}, Landroid/text/BidiFormatter;->getInstance()Landroid/text/BidiFormatter;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 389
    :cond_1
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 391
    sget v1, Lcom/android/settings/R$drawable;->op_soft_version:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    const-string v1, "build.number"

    .line 392
    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 393
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private getCameraInfo()Ljava/lang/String;
    .locals 2

    .line 670
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isLProducts()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOnePlusBrand()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 671
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_lproducts_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_2

    .line 672
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isAviciiProducts()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 673
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_avicii_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_2

    .line 674
    :cond_1
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->showKebabInfomation()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 675
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_kebab_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_2

    .line 676
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19821()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19855()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19867()Z

    move-result v0

    if-eqz v0, :cond_3

    goto/16 :goto_1

    .line 678
    :cond_3
    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19811()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 679
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_8pro_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_2

    .line 680
    :cond_4
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "A60"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "A50"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto/16 :goto_0

    .line 682
    :cond_5
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP3T()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 683
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_3t_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    .line 684
    :cond_6
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP3()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 685
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_3_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    .line 686
    :cond_7
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->is18857Project()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 687
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_18857_camera_info:I

    .line 688
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    .line 689
    :cond_8
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isGuaProject()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 690
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_7_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    .line 691
    :cond_9
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isHDProject()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isMEARom()Z

    move-result v0

    if-nez v0, :cond_a

    .line 692
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_hd_project_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    .line 693
    :cond_a
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP_19_2nd()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isMEARom()Z

    move-result v0

    if-nez v0, :cond_b

    .line 694
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_19_2nd_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    :cond_b
    const-string p0, "none"

    goto :goto_2

    :cond_c
    :goto_0
    const-string p0, "16 + 20 MP Dual Camera"

    goto :goto_2

    .line 677
    :cond_d
    :goto_1
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_8_camera_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_2
    return-object p0
.end method

.method private getCpuName()Ljava/lang/String;
    .locals 2

    .line 569
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isLProducts()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOnePlusBrand()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 570
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_lproducts_cpu_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_1

    .line 571
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isAviciiProducts()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 572
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_avicii_series_cpu_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_1

    .line 573
    :cond_1
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->showKebabInfomation()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 574
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_kebab_series_cpu_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_1

    .line 575
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19811()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19821()Z

    move-result v0

    if-nez v0, :cond_b

    .line 576
    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19855()Z

    move-result v0

    if-nez v0, :cond_b

    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19867()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    .line 578
    :cond_3
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A60"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string p0, "Snapdragon\u2122 845"

    goto :goto_1

    .line 580
    :cond_4
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A50"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string p0, "Snapdragon\u2122 835"

    goto :goto_1

    .line 582
    :cond_5
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP3T()Z

    move-result v0

    if-eqz v0, :cond_6

    const-string p0, "Snapdragon\u2122 821"

    goto :goto_1

    .line 584
    :cond_6
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP3()Z

    move-result v0

    if-eqz v0, :cond_7

    const-string p0, "Snapdragon\u2122 820"

    goto :goto_1

    .line 586
    :cond_7
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isGuaProject()Z

    move-result v0

    if-eqz v0, :cond_8

    const-string p0, "Snapdragon\u2122 855"

    goto :goto_1

    .line 588
    :cond_8
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isHDProject()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isMEARom()Z

    move-result v0

    if-nez v0, :cond_9

    .line 589
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_hd_project_cpu_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 590
    :cond_9
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP_19_2nd()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isMEARom()Z

    move-result v0

    if-nez v0, :cond_a

    .line 591
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_19_2nd_cpu_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_a
    const-string p0, "none"

    goto :goto_1

    .line 577
    :cond_b
    :goto_0
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_8_series_cpu_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_1
    return-object p0
.end method

.method private getScreenInfo()Ljava/lang/String;
    .locals 2

    .line 639
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isLProducts()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOnePlusBrand()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 640
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_lproducts_screen_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4

    .line 641
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isAviciiProducts()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 642
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_avicii_screen_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4

    .line 643
    :cond_1
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->showKebabInfomation()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 644
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_kebab_screen_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4

    .line 645
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19821()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19855()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19867()Z

    move-result v0

    if-eqz v0, :cond_3

    goto/16 :goto_3

    .line 647
    :cond_3
    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19811()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 648
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_8pro_screen_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4

    .line 649
    :cond_4
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A6000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A6003"

    .line 650
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto/16 :goto_2

    .line 652
    :cond_5
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A5010"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 653
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_6_01_inch_amoled_display:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4

    .line 654
    :cond_6
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "A50"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "A30"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_1

    .line 656
    :cond_7
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A6010"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A6013"

    .line 657
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 658
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->is18857Project()Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_0

    .line 660
    :cond_8
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isGuaProject()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 661
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_7_pro_screen_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    .line 662
    :cond_9
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isHDProject()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isMEARom()Z

    move-result v0

    if-nez v0, :cond_a

    .line 663
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_hd_project_screen_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    :cond_a
    const-string p0, "none"

    goto :goto_4

    .line 659
    :cond_b
    :goto_0
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_6_41_inch_amoled_display:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    .line 655
    :cond_c
    :goto_1
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_5_5_inch_amoled_display:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    .line 651
    :cond_d
    :goto_2
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_6_28_inch_amoled_display:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    .line 646
    :cond_e
    :goto_3
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_in_project_8_screen_info:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_4
    return-object p0
.end method

.method private static getTotalMemory()Ljava/lang/String;
    .locals 4

    const-string v0, "/proc/meminfo"

    const/4 v1, 0x0

    .line 623
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 624
    new-instance v0, Ljava/io/BufferedReader;

    const/16 v3, 0x2000

    invoke-direct {v0, v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 625
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\s+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v1, v2, v3

    .line 626
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 628
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    if-eqz v1, :cond_0

    .line 631
    new-instance v0, Ljava/lang/Float;

    invoke-static {v1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const v2, 0x49742400    # 1000000.0f

    div-float/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    invoke-virtual {v0}, Ljava/lang/Float;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 634
    :goto_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static is7TMCLVersionProject()Z
    .locals 3

    .line 118
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v1, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    sget v2, Lcom/android/settings/R$string;->oneplus_model_19861_for_tmo:I

    invoke-virtual {v1, v2}, Landroid/app/Application;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v1, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    sget v2, Lcom/android/settings/R$string;->oneplus_model_19801_for_cn:I

    .line 119
    invoke-virtual {v1, v2}, Landroid/app/Application;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v1, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    sget v2, Lcom/android/settings/R$string;->oneplus_model_19801_for_in:I

    .line 120
    invoke-virtual {v1, v2}, Landroid/app/Application;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v1, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    sget v2, Lcom/android/settings/R$string;->oneplus_model_19801_for_eu:I

    .line 121
    invoke-virtual {v1, v2}, Landroid/app/Application;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v1, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    sget v2, Lcom/android/settings/R$string;->oneplus_model_19801_for_us:I

    .line 122
    invoke-virtual {v1, v2}, Landroid/app/Application;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private static isGuaLiftCameraProject()Z
    .locals 5

    .line 105
    sget-object v0, Lcom/oneplus/settings/SettingsBaseApplication;->mApplication:Landroid/app/Application;

    .line 106
    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/android/settings/R$array;->oneplus_guacamole_lift_camera_project:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    .line 108
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 109
    aget-object v3, v0, v2

    if-eqz v3, :cond_0

    aget-object v3, v0, v2

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 110
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private showHardwareInfo()V
    .locals 7

    .line 131
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isLProducts()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOnePlusBrand()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    sget v0, Lcom/android/settings/R$drawable;->oneplus_l_products:I

    goto :goto_0

    .line 133
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isAviciiProducts()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    sget v0, Lcom/android/settings/R$drawable;->oneplus_avicii:I

    :goto_0
    move v2, v0

    goto/16 :goto_3

    .line 136
    :cond_1
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->showKebabInfomation()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 138
    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportREDTheme()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 139
    sget v0, Lcom/android/settings/R$drawable;->oneplus_kebab_red:I

    goto :goto_0

    .line 141
    :cond_2
    sget v0, Lcom/android/settings/R$drawable;->oneplus_kebab:I

    goto :goto_0

    .line 144
    :cond_3
    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19811()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 145
    sget v0, Lcom/android/settings/R$drawable;->oneplus_8_pro:I

    goto :goto_0

    .line 146
    :cond_4
    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19821()Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19855()Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {}, Lcom/oneplus/settings/utils/OPBuildModelUtils;->is19867()Z

    move-result v0

    if-eqz v0, :cond_5

    goto/16 :goto_2

    .line 148
    :cond_5
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isEightSeriesProducts()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 150
    sget v0, Lcom/android/settings/R$drawable;->oneplus_other:I

    goto :goto_0

    .line 151
    :cond_6
    invoke-static {}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->is7TMCLVersionProject()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportMclTheme()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 152
    sget v0, Lcom/android/settings/R$drawable;->hd_mcl:I

    goto :goto_0

    .line 153
    :cond_7
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isHDProject()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isMEARom()Z

    move-result v0

    if-nez v0, :cond_8

    .line 154
    sget v0, Lcom/android/settings/R$drawable;->oneplus_other:I

    goto :goto_0

    .line 155
    :cond_8
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A6000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_11

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A6003"

    .line 156
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_1

    .line 158
    :cond_9
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A5000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 159
    sget v0, Lcom/android/settings/R$drawable;->oneplus_5:I

    goto :goto_0

    .line 160
    :cond_a
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ONEPLUS A5010"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 161
    sget v0, Lcom/android/settings/R$drawable;->oneplus_5t:I

    goto/16 :goto_0

    .line 162
    :cond_b
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP3()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 163
    sget v0, Lcom/android/settings/R$drawable;->oneplus_3:I

    goto/16 :goto_0

    .line 164
    :cond_c
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isOP3T()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 165
    sget v0, Lcom/android/settings/R$drawable;->oneplus_3t:I

    goto/16 :goto_0

    .line 166
    :cond_d
    invoke-static {}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->isGuaLiftCameraProject()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 167
    sget v0, Lcom/android/settings/R$drawable;->oneplus_gua_lift_camera:I

    goto/16 :goto_0

    .line 168
    :cond_e
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->is18857Project()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 169
    sget v0, Lcom/android/settings/R$drawable;->oneplus_18857:I

    goto/16 :goto_0

    .line 170
    :cond_f
    invoke-static {}, Lcom/oneplus/settings/utils/OPAuthenticationInformationUtils;->isOlder6tProducts()Z

    move-result v0

    if-nez v0, :cond_10

    .line 171
    sget v0, Lcom/android/settings/R$drawable;->oneplus_other:I

    goto/16 :goto_0

    .line 173
    :cond_10
    sget v0, Lcom/android/settings/R$drawable;->oneplus_6:I

    goto/16 :goto_0

    .line 157
    :cond_11
    :goto_1
    sget v0, Lcom/android/settings/R$drawable;->oneplus_6:I

    goto/16 :goto_0

    .line 147
    :cond_12
    :goto_2
    sget v0, Lcom/android/settings/R$drawable;->oneplus_8:I

    goto/16 :goto_0

    .line 175
    :goto_3
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->getCameraInfo()Ljava/lang/String;

    move-result-object v3

    .line 176
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->getCpuName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->getScreenInfo()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->getTotalMemory()Ljava/lang/String;

    move-result-object v6

    .line 175
    invoke-interface/range {v1 .. v6}, Lcom/oneplus/settings/aboutphone/Contract$View;->displayHardWarePreference(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private showKebabInfomation()Z
    .locals 1

    .line 540
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v0, Lcom/android/settings/R$string;->oneplus_project_name:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "ro.boot.project_codename"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method private showSoftwareInfo()V
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 184
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addDeviceName()V

    .line 186
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 187
    invoke-static {v0}, Lcom/oneplus/settings/utils/OPAuthenticationInformationUtils;->isNeedAddAuthenticationInfo(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addAuthenticationInfo()V

    .line 191
    :cond_0
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addAndroidVersion()V

    .line 192
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSM8X50Products()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isAviciiProducts()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isBengalProducts()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isBillieProducts()Z

    move-result v0

    if-nez v0, :cond_1

    .line 193
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addOneplusSystemVersion()V

    .line 196
    :cond_1
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUstUnify()Z

    move-result v0

    if-nez v0, :cond_2

    .line 197
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addVersionNumber()V

    .line 200
    :cond_2
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addDeviceModel()V

    .line 201
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addLegalInfo()V

    .line 202
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addStatusInfo()V

    .line 204
    invoke-static {}, Lcom/oneplus/settings/utils/OPAuthenticationInformationUtils;->isOlder6tProducts()Z

    move-result v0

    if-nez v0, :cond_5

    .line 205
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isO2()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/oneplus/settings/utils/OPUtils;->isSurportProductInfo(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 208
    :cond_3
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addProductIntroduce()V

    .line 209
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addAwardInfo()V

    goto :goto_1

    .line 206
    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addAwardInfo()V

    goto :goto_1

    .line 212
    :cond_5
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isO2()Z

    move-result v0

    if-nez v0, :cond_6

    .line 213
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addProductIntroduce()V

    .line 218
    :cond_6
    :goto_1
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-nez v0, :cond_7

    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isUsvMode()Z

    move-result v0

    if-nez v0, :cond_7

    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUstUnify()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 220
    :cond_7
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isLDEV()Z

    move-result v0

    if-nez v0, :cond_8

    .line 221
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addSoftwareVersion()V

    .line 223
    :cond_8
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addHardwareVersion()V

    .line 227
    :cond_9
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUstUnify()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 228
    iget-boolean v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->isSimLock:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->addNetworkUnlock(Ljava/lang/Boolean;)V

    .line 231
    :cond_a
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {v0, p0}, Lcom/oneplus/settings/aboutphone/Contract$View;->displaySoftWarePreference(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public addNetworkUnlock(Ljava/lang/Boolean;)V
    .locals 3

    .line 545
    new-instance v0, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    invoke-direct {v0}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;-><init>()V

    .line 546
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_network_unlock:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setTitle(Ljava/lang/String;)V

    .line 547
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 548
    sget v1, Lcom/android/settings/R$drawable;->ic_network_locked:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    .line 549
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_unlock_status_locked:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 551
    :cond_0
    sget v1, Lcom/android/settings/R$drawable;->ic_network_unlock:I

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setResIcon(I)V

    .line 552
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mContext:Landroid/content/Context;

    sget v2, Lcom/android/settings/R$string;->op_unlock_status_unlock:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setSummary(Ljava/lang/CharSequence;)V

    .line 554
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addNetworkUnlock simLockStatus = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "AboutPhonePresenter"

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "intent_network_unlock"

    .line 555
    invoke-virtual {v0, p1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->setIntent(Ljava/lang/String;)V

    .line 556
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public enableDevelopmentSettings()V
    .locals 2

    const/4 v0, 0x0

    .line 703
    iput v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDevHitCountdown:I

    .line 704
    iput-boolean v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mProcessingLastDevHit:Z

    .line 705
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/settingslib/development/DevelopmentSettingsEnabler;->setDevelopmentSettingsEnabled(Landroid/content/Context;Z)V

    .line 707
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    invoke-interface {v0}, Lcom/oneplus/settings/aboutphone/Contract$View;->cancelToast()V

    .line 709
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportXVibrate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 710
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    invoke-interface {v0}, Lcom/oneplus/settings/aboutphone/Contract$View;->performHapticFeedback()V

    .line 713
    :cond_0
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    sget v0, Lcom/android/settings/R$string;->show_dev_on:I

    invoke-interface {p0, v0}, Lcom/oneplus/settings/aboutphone/Contract$View;->showLongToast(I)V

    return-void
.end method

.method public onItemClick(I)V
    .locals 5

    .line 718
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;

    .line 719
    invoke-virtual {p1}, Lcom/oneplus/settings/aboutphone/SoftwareInfoEntity;->getIntent()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_d

    const-string v0, ""

    .line 720
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const-string v0, "com.android.FirmwareVersionDialogFragment"

    .line 724
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 725
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    const-class p1, Lcom/android/settings/deviceinfo/firmwareversion/FirmwareVersionSettings;

    .line 726
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x270f

    .line 725
    invoke-static {p0, p1, v0}, Lcom/oneplus/settings/utils/OPUtils;->startFragment(Landroid/content/Context;Ljava/lang/String;I)V

    goto/16 :goto_0

    :cond_1
    const-string v0, "build.number"

    .line 728
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    .line 729
    invoke-static {}, Lcom/android/settings/Utils;->isMonkeyRunning()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    .line 733
    :cond_2
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mUm:Landroid/os/UserManager;

    invoke-virtual {p1}, Landroid/os/UserManager;->isAdminUser()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mUm:Landroid/os/UserManager;

    invoke-virtual {p1}, Landroid/os/UserManager;->isDemoUser()Z

    move-result p1

    if-nez p1, :cond_3

    return-void

    .line 737
    :cond_3
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/oneplus/settings/utils/OPUtils;->isDeviceProvisioned(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_4

    return-void

    .line 740
    :cond_4
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mUm:Landroid/os/UserManager;

    const-string v0, "no_debugging_features"

    invoke-virtual {p1, v0}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 741
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mUm:Landroid/os/UserManager;

    invoke-virtual {p1}, Landroid/os/UserManager;->isDemoUser()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 744
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 745
    invoke-static {p1}, Lcom/android/settings/Utils;->getDeviceOwnerComponent(Landroid/content/Context;)Landroid/content/ComponentName;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 747
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 748
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.android.settings.action.REQUEST_DEBUG_FEATURES"

    .line 749
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 751
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    .line 752
    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 755
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 760
    :cond_5
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDebuggingFeaturesDisallowedAdmin:Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    if-eqz p1, :cond_6

    iget-boolean v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDebuggingFeaturesDisallowedBySystem:Z

    if-nez v0, :cond_6

    .line 762
    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Lcom/android/settingslib/RestrictedLockUtils;->sendShowAdminSupportDetailsIntent(Landroid/content/Context;Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;)V

    .line 766
    :cond_6
    iget p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDevHitCountdown:I

    if-lez p1, :cond_8

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    .line 767
    iput p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDevHitCountdown:I

    if-nez p1, :cond_7

    .line 768
    iget-boolean v2, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mProcessingLastDevHit:Z

    if-nez v2, :cond_7

    add-int/2addr p1, v0

    .line 770
    iput p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDevHitCountdown:I

    .line 771
    new-instance p1, Lcom/android/settings/password/ChooseLockSettingsHelper;

    iget-object v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mFragment:Landroidx/fragment/app/Fragment;

    invoke-direct {p1, v0, v1}, Lcom/android/settings/password/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;Landroidx/fragment/app/Fragment;)V

    const/16 v0, 0x64

    .line 773
    iget-object v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    sget v2, Lcom/android/settings/R$string;->unlock_set_unlock_launch_picker_title:I

    .line 777
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 774
    invoke-virtual {p1, v0, v1}, Lcom/android/settings/password/ChooseLockSettingsHelper;->launchConfirmationActivity(ILjava/lang/CharSequence;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mProcessingLastDevHit:Z

    if-nez p1, :cond_d

    .line 779
    invoke-virtual {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->enableDevelopmentSettings()V

    goto/16 :goto_0

    .line 781
    :cond_7
    iget p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDevHitCountdown:I

    if-lez p1, :cond_d

    const/4 v2, 0x5

    if-ge p1, v2, :cond_d

    .line 783
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    invoke-interface {p1}, Lcom/oneplus/settings/aboutphone/Contract$View;->cancelToast()V

    .line 784
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    iget-object v2, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/android/settings/R$plurals;->show_dev_countdown:I

    iget p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mDevHitCountdown:I

    new-array v0, v0, [Ljava/lang/Object;

    .line 786
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v0, v1

    .line 785
    invoke-virtual {v2, v3, p0, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 784
    invoke-interface {p1, p0}, Lcom/oneplus/settings/aboutphone/Contract$View;->showLongToast(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_8
    if-gez p1, :cond_d

    .line 789
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    invoke-interface {p1}, Lcom/oneplus/settings/aboutphone/Contract$View;->cancelToast()V

    .line 790
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mView:Lcom/oneplus/settings/aboutphone/Contract$View;

    sget p1, Lcom/android/settings/R$string;->show_dev_already:I

    invoke-interface {p0, p1}, Lcom/oneplus/settings/aboutphone/Contract$View;->showLongToast(I)V

    goto :goto_0

    :cond_9
    const-string v0, "intent_network_unlock"

    .line 792
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 794
    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/oneplus/settings/aboutphone/OPNetworkUnlockUtils;->getUnlockAppEnabledStatus(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 796
    :try_start_0
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.tmobile.rsuapp"

    const-string v1, "com.tmobile.rsuapp.MainActivity"

    .line 797
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 798
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 800
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 803
    :cond_a
    iget-boolean p1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->isSimLock:Z

    if-eqz p1, :cond_b

    .line 804
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/android/settings/R$string;->op_sim_lock_summary:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 806
    :cond_b
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/android/settings/R$string;->op_sim_unlock_summary:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 811
    :cond_c
    iget-object p0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->mFragment:Landroidx/fragment/app/Fragment;

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    :cond_d
    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 100
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->showHardwareInfo()V

    .line 101
    invoke-direct {p0}, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->showSoftwareInfo()V

    return-void
.end method

.method public updateNetworkUnlockStatus(Ljava/lang/Boolean;)V
    .locals 2

    .line 560
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-boolean v1, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->isSimLock:Z

    if-eq v0, v1, :cond_0

    .line 561
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/oneplus/settings/aboutphone/AboutPhonePresenter;->isSimLock:Z

    .line 563
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "updateNetworkUnlockStatus simLockStatus = "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "AboutPhonePresenter"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
