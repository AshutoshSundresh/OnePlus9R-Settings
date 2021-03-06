.class public Lcom/android/settings/network/ApnSettings;
.super Lcom/android/settings/RestrictedSettingsFragment;
.source "ApnSettings.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;,
        Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;
    }
.end annotation


# static fields
.field private static final CARRIERS_PROJECTION:[Ljava/lang/String;

.field private static final DEFAULTAPN_URI:Landroid/net/Uri;

.field private static final PREFERAPN_URI:Landroid/net/Uri;

.field private static final isVzwSim:Z

.field private static mRestoreDefaultApnMode:Z


# instance fields
.field private keylistener:Landroid/content/DialogInterface$OnKeyListener;

.field private mAllowAddingApns:Z

.field private mApnEditable:Z

.field private mCarrierActived:Z

.field private mHideApnsGroupByIccid:Landroid/os/PersistableBundle;

.field private mHideApnsWithIccidRule:[Ljava/lang/String;

.field private mHideApnsWithRule:[Ljava/lang/String;

.field private mHideImsApn:Z

.field private mHidePresetApnDetails:Z

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mLastSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

.field private mMvnoMatchData:Ljava/lang/String;

.field private mMvnoType:Ljava/lang/String;

.field private mPhoneId:I

.field private final mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRestoreApnProcessHandler:Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;

.field private mRestoreApnUiHandler:Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;

.field private mRestoreDefaultApnThread:Landroid/os/HandlerThread;

.field private mSelectedKey:Ljava/lang/String;

.field private mSimLocked:Z

.field private mSubId:I

.field private mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mUnavailable:Z

.field private mUserManager:Landroid/os/UserManager;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const-string v0, "_id"

    const-string v1, "name"

    const-string v2, "apn"

    const-string/jumbo v3, "type"

    const-string v4, "mvno_type"

    const-string v5, "mvno_match_data"

    const-string v6, "edited"

    const-string v7, "bearer"

    const-string v8, "bearer_bitmask"

    .line 122
    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/settings/network/ApnSettings;->CARRIERS_PROJECTION:[Ljava/lang/String;

    const-string v0, "content://telephony/carriers/restore"

    .line 152
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/network/ApnSettings;->DEFAULTAPN_URI:Landroid/net/Uri;

    const-string v0, "content://telephony/carriers/preferapn"

    .line 153
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/network/ApnSettings;->PREFERAPN_URI:Landroid/net/Uri;

    const-string/jumbo v0, "vendor.radio.test.vzw.sim"

    const/4 v1, 0x0

    .line 155
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/android/settings/network/ApnSettings;->isVzwSim:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const-string v0, "no_config_mobile_networks"

    .line 200
    invoke-direct {p0, v0}, Lcom/android/settings/RestrictedSettingsFragment;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 192
    iput-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mCarrierActived:Z

    .line 193
    iput-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mSimLocked:Z

    .line 194
    iput-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mApnEditable:Z

    .line 203
    new-instance v0, Lcom/android/settings/network/ApnSettings$1;

    invoke-direct {v0, p0}, Lcom/android/settings/network/ApnSettings$1;-><init>(Lcom/android/settings/network/ApnSettings;)V

    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 218
    new-instance v0, Lcom/android/settings/network/ApnSettings$2;

    invoke-direct {v0, p0}, Lcom/android/settings/network/ApnSettings$2;-><init>(Lcom/android/settings/network/ApnSettings;)V

    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 1130
    new-instance v0, Lcom/android/settings/network/ApnSettings$3;

    invoke-direct {v0, p0}, Lcom/android/settings/network/ApnSettings$3;-><init>(Lcom/android/settings/network/ApnSettings;)V

    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->keylistener:Landroid/content/DialogInterface$OnKeyListener;

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .line 107
    sget-boolean v0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnMode:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .line 107
    sput-boolean p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnMode:Z

    return p0
.end method

.method static synthetic access$100(Lcom/android/settings/network/ApnSettings;)V
    .locals 0

    .line 107
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->fillList()V

    return-void
.end method

.method static synthetic access$1002(Lcom/android/settings/network/ApnSettings;Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;)Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/settings/network/ApnSettings;)Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;
    .locals 0

    .line 107
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnUiHandler:Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/settings/network/ApnSettings;I)V
    .locals 0

    .line 107
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->removeDialog(I)V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/settings/network/ApnSettings;)V
    .locals 0

    .line 107
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->loadCarrierConfigInfo()V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/settings/network/ApnSettings;I)V
    .locals 0

    .line 107
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->removeDialog(I)V

    return-void
.end method

.method static synthetic access$1600(Lcom/android/settings/network/ApnSettings;I)V
    .locals 0

    .line 107
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->removeDialog(I)V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/settings/network/ApnSettings;)Landroid/content/ContentResolver;
    .locals 0

    .line 107
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1800()Landroid/net/Uri;
    .locals 1

    .line 107
    sget-object v0, Lcom/android/settings/network/ApnSettings;->DEFAULTAPN_URI:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/android/settings/network/ApnSettings;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0

    .line 107
    invoke-direct {p0, p1}, Lcom/android/settings/network/ApnSettings;->getUriForCurrSubId(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/settings/network/ApnSettings;)I
    .locals 0

    .line 107
    iget p0, p0, Lcom/android/settings/network/ApnSettings;->mPhoneId:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/settings/network/ApnSettings;)I
    .locals 0

    .line 107
    iget p0, p0, Lcom/android/settings/network/ApnSettings;->mSubId:I

    return p0
.end method

.method static synthetic access$302(Lcom/android/settings/network/ApnSettings;I)I
    .locals 0

    .line 107
    iput p1, p0, Lcom/android/settings/network/ApnSettings;->mSubId:I

    return p1
.end method

.method static synthetic access$400(Lcom/android/settings/network/ApnSettings;)Landroid/telephony/SubscriptionInfo;
    .locals 0

    .line 107
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mLastSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/settings/network/ApnSettings;Landroid/telephony/SubscriptionInfo;)Landroid/telephony/SubscriptionInfo;
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/android/settings/network/ApnSettings;->mLastSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/settings/network/ApnSettings;)Landroid/telephony/SubscriptionInfo;
    .locals 0

    .line 107
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/settings/network/ApnSettings;Landroid/telephony/SubscriptionInfo;)Landroid/telephony/SubscriptionInfo;
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/settings/network/ApnSettings;I)Landroid/telephony/SubscriptionInfo;
    .locals 0

    .line 107
    invoke-direct {p0, p1}, Lcom/android/settings/network/ApnSettings;->getSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/settings/network/ApnSettings;I)V
    .locals 0

    .line 107
    invoke-direct {p0, p1}, Lcom/android/settings/network/ApnSettings;->restartPhoneStateListener(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/settings/network/ApnSettings;I)V
    .locals 0

    .line 107
    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->showDialog(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/android/settings/network/ApnSettings;)Landroid/os/HandlerThread;
    .locals 0

    .line 107
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    return-object p0
.end method

.method static synthetic access$902(Lcom/android/settings/network/ApnSettings;Landroid/os/HandlerThread;)Landroid/os/HandlerThread;
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    return-object p1
.end method

.method private addNewApn()V
    .locals 3

    .line 989
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "android.intent.action.INSERT"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 990
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    :goto_0
    const-string v2, "sub_id"

    .line 992
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v1, 0x1

    .line 993
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 994
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mMvnoType:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mMvnoMatchData:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 995
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mMvnoType:Ljava/lang/String;

    const-string v2, "mvno_type"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 996
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mMvnoMatchData:Ljava/lang/String;

    const-string v2, "mvno_match_data"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 998
    :cond_1
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private appendFilter(Ljava/lang/StringBuilder;)V
    .locals 9

    .line 790
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsGroupByIccid:Landroid/os/PersistableBundle;

    const-string v1, "ApnSettings"

    const-string v2, "include_common_rules"

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/os/PersistableBundle;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 797
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsGroupByIccid:Landroid/os/PersistableBundle;

    invoke-virtual {v0, v2, v3}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 798
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "apn hidden rules specified iccid, include common rule: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 799
    iget-object v4, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsGroupByIccid:Landroid/os/PersistableBundle;

    invoke-virtual {v4}, Landroid/os/PersistableBundle;->keySet()Ljava/util/Set;

    move-result-object v4

    .line 800
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 801
    invoke-static {v5}, Lcom/android/settings/Utils;->carrierTableFieldValidate(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 802
    iget-object v6, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsGroupByIccid:Landroid/os/PersistableBundle;

    invoke-virtual {v6, v5}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 804
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " AND "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " <> \""

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\""

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    move v0, v3

    .line 821
    :cond_2
    iget-object v4, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsWithIccidRule:[Ljava/lang/String;

    if-eqz v4, :cond_6

    .line 822
    invoke-direct {p0, v4}, Lcom/android/settings/network/ApnSettings;->getApnRuleMap([Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    .line 823
    iget-object v5, p0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    if-nez v5, :cond_3

    const-string v5, ""

    goto :goto_1

    :cond_3
    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getIccId()Ljava/lang/String;

    move-result-object v5

    .line 824
    :goto_1
    invoke-direct {p0, v4, v5}, Lcom/android/settings/network/ApnSettings;->isOperatorIccid(Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 825
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    .line 826
    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_2

    :cond_4
    move v3, v2

    .line 827
    :cond_5
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "apn hidden rules in iccids, include common rule: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 828
    invoke-direct {p0, v4, p1}, Lcom/android/settings/network/ApnSettings;->filterWithKey(Ljava/util/Map;Ljava/lang/StringBuilder;)V

    move v0, v3

    :cond_6
    if-eqz v0, :cond_7

    .line 839
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsWithRule:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 840
    invoke-direct {p0, v0}, Lcom/android/settings/network/ApnSettings;->getApnRuleMap([Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 841
    invoke-direct {p0, v0, p1}, Lcom/android/settings/network/ApnSettings;->filterWithKey(Ljava/util/Map;Ljava/lang/StringBuilder;)V

    :cond_7
    return-void
.end method

.method private fillList()V
    .locals 22

    move-object/from16 v0, p0

    .line 596
    iget-object v1, v0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    .line 598
    :goto_0
    sget-object v2, Landroid/provider/Telephony$Carriers;->SIM_APN_URI:Landroid/net/Uri;

    .line 599
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    .line 598
    invoke-static {v2, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 600
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "NOT (type=\'ia\' AND (apn=\"\" OR apn IS NULL)) AND user_visible!=0"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 604
    invoke-static {v1}, Landroid/telephony/SubscriptionManager;->getPhoneId(I)I

    move-result v3

    .line 605
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    .line 606
    invoke-static {v10, v3}, Lcom/android/ims/ImsManager;->getInstance(Landroid/content/Context;I)Lcom/android/ims/ImsManager;

    move-result-object v3

    .line 607
    invoke-virtual {v3}, Lcom/android/ims/ImsManager;->isEnhanced4gLteModeSettingEnabledByUser()Z

    move-result v3

    .line 608
    iget-boolean v4, v0, Lcom/android/settings/network/ApnSettings;->mHideImsApn:Z

    if-nez v4, :cond_1

    invoke-static {v10}, Lcom/android/settings/Utils;->isSupportCTPA(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_2

    if-nez v3, :cond_2

    :cond_1
    const-string v4, " AND NOT (type=\'ims\')"

    .line 609
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    :cond_2
    invoke-direct {v0, v2}, Lcom/android/settings/network/ApnSettings;->appendFilter(Ljava/lang/StringBuilder;)V

    .line 614
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "where = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v11, "ApnSettings"

    invoke-static {v11, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 620
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v6, Lcom/android/settings/network/ApnSettings;->CARRIERS_PROJECTION:[Ljava/lang/String;

    .line 621
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    const-string v9, "_id"

    .line 620
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    if-eqz v2, :cond_19

    const-string v4, "apn_list"

    .line 626
    invoke-virtual {v0, v4}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v4

    check-cast v4, Landroidx/preference/PreferenceGroup;

    .line 627
    invoke-virtual {v4}, Landroidx/preference/PreferenceGroup;->removeAll()V

    .line 629
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 630
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 632
    invoke-direct/range {p0 .. p0}, Lcom/android/settings/network/ApnSettings;->getSelectedApnKey()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Lcom/android/settings/network/ApnSettings;->mSelectedKey:Ljava/lang/String;

    .line 635
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "select key = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v0, Lcom/android/settings/network/ApnSettings;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v11, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 640
    iget-object v7, v0, Lcom/android/settings/network/ApnSettings;->mSelectedKey:Ljava/lang/String;

    invoke-static {v7}, Lcom/android/settings/network/ApnPreference;->setSelectedKey(Ljava/lang/String;)V

    .line 641
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    const/4 v7, 0x0

    move v8, v7

    .line 642
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v9

    if-nez v9, :cond_15

    const/4 v9, 0x1

    .line 643
    invoke-interface {v2, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    .line 644
    invoke-interface {v2, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 645
    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x3

    .line 646
    invoke-interface {v2, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/4 v7, 0x6

    .line 647
    invoke-interface {v2, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    const/4 v9, 0x4

    .line 648
    invoke-interface {v2, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v0, Lcom/android/settings/network/ApnSettings;->mMvnoType:Ljava/lang/String;

    const/4 v9, 0x5

    .line 649
    invoke-interface {v2, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v0, Lcom/android/settings/network/ApnSettings;->mMvnoMatchData:Ljava/lang/String;

    const-string v9, "phone"

    .line 652
    invoke-virtual {v0, v9}, Lcom/android/settings/SettingsPreferenceFragment;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/telephony/TelephonyManager;

    move/from16 v17, v8

    .line 653
    iget-object v8, v0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    if-nez v8, :cond_3

    const-string v8, ""

    goto :goto_2

    :cond_3
    invoke-virtual {v9, v1}, Landroid/telephony/TelephonyManager;->getSimOperator(I)Ljava/lang/String;

    move-result-object v8

    .line 654
    :goto_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-direct {v0, v8}, Lcom/android/settings/network/ApnSettings;->isSprintMccMnc(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    const-string v9, "3G_APN"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    :cond_4
    const-string v9, "3G_HOT"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    :cond_5
    const-string v7, "skip 3G_APN/3G_HOT!"

    .line 655
    invoke-static {v11, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-object/from16 v16, v4

    move-object/from16 v19, v5

    move-object/from16 v20, v6

    move-object/from16 v21, v10

    goto/16 :goto_5

    .line 662
    :cond_6
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v9

    move-object/from16 v16, v4

    move-object/from16 v18, v12

    const/4 v12, 0x1

    invoke-interface {v2, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4}, Lcom/android/settings/Utils;->getLocalizedName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 664
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_7

    goto :goto_3

    :cond_7
    move-object/from16 v4, v18

    :goto_3
    const/4 v9, 0x7

    .line 667
    invoke-interface {v2, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    const/16 v12, 0x8

    .line 668
    invoke-interface {v2, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 669
    invoke-static {v9}, Landroid/telephony/ServiceState;->getBitmaskForTech(I)I

    move-result v19

    move-object/from16 v20, v6

    or-int v6, v19, v12

    move-object/from16 v19, v5

    .line 671
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v5

    .line 672
    invoke-virtual {v5, v1}, Landroid/telephony/TelephonyManager;->getDataNetworkType(I)I

    move-result v5

    .line 671
    invoke-static {v5}, Landroid/telephony/ServiceState;->networkTypeToRilRadioTechnology(I)I

    move-result v5

    .line 675
    invoke-static {v6, v5}, Landroid/telephony/ServiceState;->bitmaskHasTech(II)Z

    move-result v21

    if-nez v21, :cond_b

    if-nez v9, :cond_8

    if-eqz v12, :cond_b

    :cond_8
    sget-boolean v12, Lcom/android/settings/network/ApnSettings;->isVzwSim:Z

    if-nez v12, :cond_b

    .line 678
    invoke-direct {v0, v8}, Lcom/android/settings/network/ApnSettings;->isSprintMccMnc(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_b

    .line 680
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v10

    const-string v10, "fullBearer = "

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", radioTech = "

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v11, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v5, :cond_a

    if-nez v9, :cond_9

    if-nez v5, :cond_9

    goto :goto_4

    :cond_9
    const-string v5, "Do not remove apn when it has bearer and in no service surrounding"

    .line 690
    invoke-static {v11, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    :cond_a
    :goto_4
    const-string v4, "filter radio tech not match apn."

    .line 685
    invoke-static {v11, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 687
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    :goto_5
    move-object/from16 v4, v16

    move/from16 v8, v17

    move-object/from16 v5, v19

    move-object/from16 v6, v20

    :goto_6
    move-object/from16 v10, v21

    const/4 v7, 0x0

    goto/16 :goto_1

    :cond_b
    move-object/from16 v21, v10

    .line 693
    :goto_7
    new-instance v5, Lcom/android/settings/network/ApnPreference;

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/android/settings/network/ApnPreference;-><init>(Landroid/content/Context;)V

    .line 695
    invoke-virtual {v5, v14}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 696
    invoke-virtual {v5, v4}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v4, 0x0

    .line 697
    invoke-virtual {v5, v4}, Landroidx/preference/Preference;->setPersistent(Z)V

    .line 698
    invoke-virtual {v5, v0}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 699
    invoke-virtual {v5, v1}, Lcom/android/settings/network/ApnPreference;->setSubId(I)V

    .line 700
    iget-boolean v4, v0, Lcom/android/settings/network/ApnSettings;->mHidePresetApnDetails:Z

    if-eqz v4, :cond_c

    if-nez v7, :cond_c

    .line 701
    invoke-virtual {v5}, Lcom/android/settings/network/ApnPreference;->setHideDetails()V

    goto :goto_8

    .line 703
    :cond_c
    invoke-virtual {v5, v13}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 711
    :goto_8
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cursor key = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", type = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", mccmnc = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", is default type = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "default"

    invoke-direct {v0, v15, v6}, Lcom/android/settings/network/ApnSettings;->isApnType(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v11, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v15, :cond_e

    .line 714
    invoke-direct {v0, v15, v6}, Lcom/android/settings/network/ApnSettings;->isApnType(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    goto :goto_9

    :cond_d
    const/4 v4, 0x0

    goto :goto_a

    :cond_e
    :goto_9
    const/4 v4, 0x1

    .line 718
    :goto_a
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "isVoLTEEnabled = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, ", selectable = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, ", Utils.isSupportCTPA(appContext) = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Lcom/android/settings/Utils;->isSupportCTPA(Landroid/content/Context;)Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v11, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v3, :cond_11

    if-eqz v4, :cond_11

    .line 721
    invoke-static/range {v21 .. v21}, Lcom/android/settings/Utils;->isSupportCTPA(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_11

    if-eqz v15, :cond_10

    const-string v4, "ims"

    .line 722
    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_f

    goto :goto_b

    :cond_f
    const/4 v4, 0x0

    goto :goto_c

    :cond_10
    :goto_b
    const/4 v4, 0x1

    .line 726
    :cond_11
    :goto_c
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "final selectable = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v11, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 729
    invoke-virtual {v5, v4}, Lcom/android/settings/network/ApnPreference;->setSelectable(Z)V

    if-eqz v4, :cond_12

    .line 731
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v6

    if-eqz v6, :cond_12

    invoke-direct/range {p0 .. p0}, Lcom/android/settings/network/ApnSettings;->isAllowEditApn()Z

    move-result v6

    if-nez v6, :cond_12

    const/4 v6, 0x0

    .line 732
    invoke-virtual {v5, v6}, Lcom/android/settings/network/ApnPreference;->setRadioButtonEnable(Z)V

    :cond_12
    if-eqz v4, :cond_14

    .line 736
    iget-object v4, v0, Lcom/android/settings/network/ApnSettings;->mSelectedKey:Ljava/lang/String;

    if-eqz v4, :cond_13

    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 737
    invoke-virtual {v5}, Lcom/android/settings/network/ApnPreference;->setChecked()V

    .line 740
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "find select key = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v0, Lcom/android/settings/network/ApnSettings;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " apn: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v11, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v4, v19

    const/4 v8, 0x1

    goto :goto_d

    :cond_13
    move/from16 v8, v17

    move-object/from16 v4, v19

    .line 743
    :goto_d
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v6, v20

    goto :goto_e

    :cond_14
    move-object/from16 v4, v19

    move-object/from16 v6, v20

    .line 745
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v8, v17

    .line 747
    :goto_e
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-object v5, v4

    move-object/from16 v4, v16

    goto/16 :goto_6

    :cond_15
    move-object/from16 v16, v4

    move-object v4, v5

    move/from16 v17, v8

    .line 749
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 750
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/preference/Preference;

    move-object/from16 v4, v16

    .line 751
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    goto :goto_f

    :cond_16
    move-object/from16 v4, v16

    .line 753
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/preference/Preference;

    .line 754
    invoke-virtual {v4, v2}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    goto :goto_10

    :cond_17
    if-nez v17, :cond_18

    .line 758
    invoke-virtual {v4}, Landroidx/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lez v1, :cond_18

    const/4 v1, 0x0

    .line 759
    invoke-virtual {v4, v1}, Landroidx/preference/PreferenceGroup;->getPreference(I)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/android/settings/network/ApnPreference;

    .line 760
    invoke-virtual {v1}, Lcom/android/settings/network/ApnPreference;->setChecked()V

    .line 761
    invoke-virtual {v1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/android/settings/network/ApnSettings;->setSelectedApnKey(Ljava/lang/String;)V

    .line 762
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "set key to  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 766
    :cond_18
    new-instance v1, Lcom/oneplus/settings/ui/OPPreferenceHeaderMargin;

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/oneplus/settings/ui/OPPreferenceHeaderMargin;-><init>(Landroid/content/Context;)V

    const/16 v0, -0x12c

    .line 767
    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setOrder(I)V

    .line 768
    invoke-virtual {v4, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    :cond_19
    return-void
.end method

.method private filterWithKey(Ljava/util/Map;Ljava/lang/StringBuilder;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .line 847
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    .line 848
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 849
    invoke-static {v0}, Lcom/android/settings/Utils;->carrierTableFieldValidate(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 850
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 851
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ","

    .line 852
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 853
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 854
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " <> \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\""

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private getApnRuleMap([Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 862
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    if-eqz p1, :cond_0

    .line 864
    array-length v0, p1

    .line 865
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ruleArray size = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ApnSettings"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-lez v0, :cond_0

    .line 866
    rem-int/lit8 v1, v0, 0x2

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 868
    aget-object v2, p1, v1

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    aget-object v3, p1, v3

    invoke-virtual {p0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method private getCarrierActiveState()I
    .locals 2

    const-string v0, "subscriber_carrierid"

    const-string/jumbo v1, "value"

    .line 432
    invoke-direct {p0, v0, v1}, Lcom/android/settings/network/ApnSettings;->queryParamstore(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 433
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Chameleon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 438
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getCarrierActiveState: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ApnSettings"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return p0
.end method

.method private getSelectedApnKey()Ljava/lang/String;
    .locals 6

    .line 1025
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/settings/network/ApnSettings;->PREFERAPN_URI:Landroid/net/Uri;

    invoke-direct {p0, v1}, Lcom/android/settings/network/ApnSettings;->getUriForCurrSubId(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v1

    const-string p0, "_id"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "name ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 1027
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 1028
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    const/4 v0, 0x0

    .line 1029
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1031
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object v0
.end method

.method private getSimLockState()I
    .locals 4

    const-string p0, "extphone"

    .line 444
    invoke-static {p0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p0

    invoke-static {p0}, Lorg/codeaurora/internal/IExtTelephony$Stub;->asInterface(Landroid/os/IBinder;)Lorg/codeaurora/internal/IExtTelephony;

    move-result-object p0

    .line 447
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getSimLockStatus"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    .line 448
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v1, v2, [Ljava/lang/Object;

    .line 449
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 451
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p0, -0x1

    .line 453
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getSimLockState: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ApnSettings"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return p0
.end method

.method private getSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;
    .locals 0

    .line 578
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-static {p0}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object p0

    return-object p0
.end method

.method private getUriForCurrSubId(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 2

    .line 1060
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    .line 1062
    :goto_0
    invoke-static {p0}, Landroid/telephony/SubscriptionManager;->isValidSubscriptionId(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1063
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "subId/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_1
    return-object p1
.end method

.method private isAllowEditApn()Z
    .locals 2

    .line 426
    iget-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mApnEditable:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mCarrierActived:Z

    if-eqz v0, :cond_1

    iget-boolean p0, p0, Lcom/android/settings/network/ApnSettings;->mSimLocked:Z

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private isApnType(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    .line 775
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_0

    return v0

    :cond_0
    const-string p0, ","

    .line 778
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length p1, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, p1, :cond_3

    aget-object v3, p0, v2

    .line 779
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 780
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v0

    :cond_3
    return v1
.end method

.method private isOperatorIccid(Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const-string p0, "iccid"

    .line 877
    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    .line 878
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_1

    const-string p1, ","

    .line 879
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 880
    array-length p1, p0

    move v1, v0

    :goto_0
    if-ge v1, p1, :cond_1

    aget-object v2, p0, v1

    .line 881
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private isSprintMccMnc(Ljava/lang/String;)Z
    .locals 1

    const/4 p0, 0x0

    if-eqz p1, :cond_1

    const-string v0, "310120"

    .line 583
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "311870"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "311490"

    .line 584
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "312530"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "310000"

    .line 585
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p0, 0x1

    :cond_1
    return p0
.end method

.method private loadCarrierConfigInfo()V
    .locals 5

    const-string v0, "carrier_config"

    .line 1171
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/CarrierConfigManager;

    .line 1172
    iget v1, p0, Lcom/android/settings/network/ApnSettings;->mSubId:I

    invoke-virtual {v0, v1}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object v0

    const-string v1, "hide_ims_apn_bool"

    .line 1174
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mHideImsApn:Z

    const-string v1, "allow_adding_apns_bool"

    .line 1175
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mAllowAddingApns:Z

    const-string v1, "apn_hide_rule_strings_array"

    .line 1176
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsWithRule:[Ljava/lang/String;

    const-string v1, "apn_hide_rule_strings_with_iccids_array"

    .line 1177
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsWithIccidRule:[Ljava/lang/String;

    .line 1179
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    const-string v2, "ApnSettings"

    if-eqz v1, :cond_0

    .line 1180
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getIccId()Ljava/lang/String;

    move-result-object v1

    .line 1181
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "loadCarrierConfigInfo: iccid = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1182
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getPersistableBundle(Ljava/lang/String;)Landroid/os/PersistableBundle;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsGroupByIccid:Landroid/os/PersistableBundle;

    .line 1184
    :cond_0
    iget-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mAllowAddingApns:Z

    if-eqz v1, :cond_1

    const-string v1, "read_only_apn_types_string_array"

    .line 1185
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1188
    invoke-static {v1}, Lcom/android/settings/network/ApnEditor;->hasAllApns([Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "loadCarrierConfigInfo: not allowing adding APN because all APN types are read only"

    .line 1189
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .line 1190
    iput-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mAllowAddingApns:Z

    :cond_1
    const-string v1, "hide_preset_apn_details_bool"

    .line 1193
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mHidePresetApnDetails:Z

    return-void
.end method

.method private queryParamstore(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const-string v0, "content://com.redbend.app.provider"

    .line 459
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 460
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 p0, 0x3

    new-array v5, p0, [Ljava/lang/String;

    const/4 p0, 0x0

    aput-object p1, v5, p0

    const/4 p1, 0x1

    aput-object p2, v5, p1

    const/4 p2, 0x2

    const-string v0, "0"

    aput-object v0, v5, p2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2

    const-string v0, ""

    if-eqz p2, :cond_1

    .line 462
    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ne v1, p1, :cond_0

    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 463
    invoke-interface {p2, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    move-object v0, p0

    .line 465
    :cond_0
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object v0
.end method

.method private restartPhoneStateListener(I)V
    .locals 3

    .line 327
    sget-boolean v0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnMode:Z

    if-eqz v0, :cond_0

    return-void

    .line 331
    :cond_0
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 332
    invoke-virtual {v0, p1}, Landroid/telephony/TelephonyManager;->createForSubscriptionId(I)Landroid/telephony/TelephonyManager;

    move-result-object p1

    .line 335
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 338
    iput-object p1, p0, Lcom/android/settings/network/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 340
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v0, 0x1000

    invoke-virtual {p1, p0, v0}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    return-void
.end method

.method private restoreDefaultApn()Z
    .locals 4

    const-string v0, "ApnSettings"

    const-string v1, "restoreDefaultApn"

    .line 1036
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x3e9

    .line 1037
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->showDialog(I)V

    const/4 v0, 0x1

    .line 1038
    sput-boolean v0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnMode:Z

    .line 1040
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnUiHandler:Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;

    if-nez v1, :cond_0

    .line 1041
    new-instance v1, Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;-><init>(Lcom/android/settings/network/ApnSettings;Lcom/android/settings/network/ApnSettings$1;)V

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnUiHandler:Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;

    .line 1044
    :cond_0
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    if-nez v1, :cond_2

    .line 1046
    :cond_1
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "Restore default APN Handler: Process Thread"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    .line 1048
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 1049
    new-instance v1, Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;

    iget-object v2, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    .line 1050
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnUiHandler:Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;

    invoke-direct {v1, p0, v2, v3}, Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;-><init>(Lcom/android/settings/network/ApnSettings;Landroid/os/Looper;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;

    .line 1053
    :cond_2
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;

    .line 1054
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return v0
.end method

.method private setSelectedApnKey(Ljava/lang/String;)V
    .locals 3

    .line 1014
    iput-object p1, p0, Lcom/android/settings/network/ApnSettings;->mSelectedKey:Ljava/lang/String;

    .line 1015
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 1017
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1018
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mSelectedKey:Ljava/lang/String;

    const-string v2, "apn_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1019
    sget-object v1, Lcom/android/settings/network/ApnSettings;->PREFERAPN_URI:Landroid/net/Uri;

    invoke-direct {p0, v1}, Lcom/android/settings/network/ApnSettings;->getUriForCurrSubId(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p1, p0, v0, v1, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method private updateApnEditState()V
    .locals 3

    .line 419
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->getCarrierActiveState()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mCarrierActived:Z

    .line 420
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->getSimLockState()I

    move-result v0

    if-ne v0, v2, :cond_1

    move v1, v2

    :cond_1
    iput-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mSimLocked:Z

    .line 421
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->getApnEditable()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mApnEditable:Z

    .line 422
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->isAllowEditApn()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mAllowAddingApns:Z

    return-void
.end method


# virtual methods
.method public getDialogMetricsCategory(I)I
    .locals 0

    const/16 p0, 0x3e9

    if-ne p1, p0, :cond_0

    const/16 p0, 0x243

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0xc

    return p0
.end method

.method public getRestrictionEnforcedAdmin()Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;
    .locals 3

    .line 568
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mUserManager:Landroid/os/UserManager;

    invoke-virtual {v0}, Landroid/os/UserManager;->getUserHandle()I

    move-result v0

    invoke-static {v0}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v0

    .line 569
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mUserManager:Landroid/os/UserManager;

    const-string v2, "no_config_mobile_networks"

    invoke-virtual {v1, v2, v0}, Landroid/os/UserManager;->hasUserRestriction(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mUserManager:Landroid/os/UserManager;

    .line 570
    invoke-virtual {p0, v2, v0}, Landroid/os/UserManager;->hasBaseUserRestriction(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 572
    sget-object p0, Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;->MULTIPLE_ENFORCED_ADMIN:Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 473
    invoke-super {p0, p1}, Lcom/android/settings/RestrictedSettingsFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 476
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 477
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/preference/PreferenceGroup;->removeAll()V

    .line 481
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/RestrictedSettingsFragment;->getEmptyTextView()Landroid/widget/TextView;

    move-result-object p1

    sget v0, Lcom/android/settings/R$string;->apn_settings_not_available:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 482
    invoke-virtual {p0}, Lcom/android/settings/RestrictedSettingsFragment;->isUiRestricted()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/settings/network/ApnSettings;->mUnavailable:Z

    xor-int/lit8 p1, p1, 0x1

    .line 483
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    .line 484
    iget-boolean p1, p0, Lcom/android/settings/network/ApnSettings;->mUnavailable:Z

    if-eqz p1, :cond_1

    .line 485
    sget p1, Lcom/android/settings/R$xml;->placeholder_prefs:I

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    return-void

    .line 489
    :cond_1
    sget p1, Lcom/android/settings/R$xml;->apn_settings:I

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 351
    invoke-super {p0, p1}, Lcom/android/settings/RestrictedSettingsFragment;->onCreate(Landroid/os/Bundle;)V

    .line 352
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 353
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "sub_id"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/settings/network/ApnSettings;->mSubId:I

    .line 355
    invoke-static {p1, v0}, Lcom/android/settings/network/SubscriptionUtil;->getPhoneId(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/android/settings/network/ApnSettings;->mPhoneId:I

    .line 356
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.telephony.action.SUBSCRIPTION_CARRIER_IDENTITY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mIntentFilter:Landroid/content/IntentFilter;

    .line 358
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/settings/Utils;->isSupportCTPA(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "org.codeaurora.intent.action.ACTION_ENHANCE_4G_SWITCH"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 366
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 369
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.restoreDefaultAPN"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 372
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.telephony.action.CARRIER_CONFIG_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 375
    invoke-virtual {p0, v0}, Lcom/android/settings/RestrictedSettingsFragment;->setIfOnlyAvailableForAdmins(Z)V

    .line 377
    iget v0, p0, Lcom/android/settings/network/ApnSettings;->mSubId:I

    invoke-direct {p0, v0}, Lcom/android/settings/network/ApnSettings;->getSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    const/4 v0, 0x0

    .line 379
    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mLastSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    .line 381
    const-class v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    const-string v0, "carrier_config"

    .line 384
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/CarrierConfigManager;

    .line 385
    iget v1, p0, Lcom/android/settings/network/ApnSettings;->mSubId:I

    invoke-virtual {v0, v1}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object v0

    const-string v1, "hide_ims_apn_bool"

    .line 386
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mHideImsApn:Z

    const-string v1, "allow_adding_apns_bool"

    .line 387
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mAllowAddingApns:Z

    const-string v1, "apn_hide_rule_strings_array"

    .line 389
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsWithRule:[Ljava/lang/String;

    const-string v1, "apn_hide_rule_strings_with_iccids_array"

    .line 390
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsWithIccidRule:[Ljava/lang/String;

    .line 391
    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mSubscriptionInfo:Landroid/telephony/SubscriptionInfo;

    const-string v2, "ApnSettings"

    if-eqz v1, :cond_1

    .line 392
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getIccId()Ljava/lang/String;

    move-result-object v1

    .line 393
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "iccid: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getPersistableBundle(Ljava/lang/String;)Landroid/os/PersistableBundle;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/network/ApnSettings;->mHideApnsGroupByIccid:Landroid/os/PersistableBundle;

    .line 396
    :cond_1
    iget-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mAllowAddingApns:Z

    if-eqz v1, :cond_2

    const-string v1, "read_only_apn_types_string_array"

    .line 397
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 400
    invoke-static {v1}, Lcom/android/settings/network/ApnEditor;->hasAllApns([Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "not allowing adding APN because all APN types are read only"

    .line 401
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .line 402
    iput-boolean v1, p0, Lcom/android/settings/network/ApnSettings;->mAllowAddingApns:Z

    :cond_2
    const-string v1, "hide_preset_apn_details_bool"

    .line 405
    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mHidePresetApnDetails:Z

    .line 409
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 410
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->updateApnEditState()V

    .line 414
    :cond_3
    invoke-static {p1}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/network/ApnSettings;->mUserManager:Landroid/os/UserManager;

    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 2

    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_0

    .line 1145
    new-instance p1, Lcom/android/settings/network/ApnSettings$4;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/android/settings/network/ApnSettings$4;-><init>(Lcom/android/settings/network/ApnSettings;Landroid/content/Context;)V

    .line 1150
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->restore_default_apn:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    .line 1151
    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1153
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->keylistener:Landroid/content/DialogInterface$OnKeyListener;

    invoke-virtual {p1, p0}, Landroid/app/ProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    return-object p1

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4

    .line 948
    iget-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mUnavailable:Z

    if-nez v0, :cond_2

    .line 949
    iget-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mAllowAddingApns:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 951
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-nez v0, :cond_0

    .line 954
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/android/settings/R$string;->menu_new:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 953
    invoke-interface {p1, v2, v1, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    sget v3, Lcom/android/settings/R$drawable;->ic_add_vpn:I

    .line 955
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 956
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 959
    :cond_0
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->isAllowEditApn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 961
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/android/settings/R$string;->menu_new:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 960
    invoke-interface {p1, v2, v1, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    sget v3, Lcom/android/settings/R$drawable;->ic_add_vpn:I

    .line 962
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 963
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    :cond_1
    const/4 v0, 0x2

    .line 967
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v3, Lcom/android/settings/R$string;->menu_restore:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 966
    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080055

    .line 968
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 971
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    const-string v0, "ApnSettings"

    const-string v1, "onDestroy"

    .line 550
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 551
    invoke-super {p0}, Lcom/android/settings/RestrictedSettingsFragment;->onDestroy()V

    .line 553
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    .line 554
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    :cond_0
    const/4 v0, 0x0

    .line 557
    sput-boolean v0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnMode:Z

    .line 560
    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnUiHandler:Lcom/android/settings/network/ApnSettings$RestoreApnUiHandler;

    if-eqz p0, :cond_1

    const/4 v0, 0x2

    .line 561
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    :cond_1
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    .line 976
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    .line 985
    invoke-super {p0, p1}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    .line 982
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->restoreDefaultApn()Z

    return v1

    .line 978
    :cond_1
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->addNewApn()V

    return v1
.end method

.method public onPause()V
    .locals 2

    .line 529
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onPause()V

    .line 531
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    const/16 v0, 0x3e9

    .line 532
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removeDialog(I)V

    .line 533
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    const/4 v0, 0x0

    .line 534
    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    .line 535
    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;

    .line 538
    :cond_0
    iget-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mUnavailable:Z

    if-eqz v0, :cond_1

    return-void

    .line 542
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 544
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object p0, p0, Lcom/android/settings/network/ApnSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    .line 1003
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPreferenceChange(): Preference - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", newValue - "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", newValue type - "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1005
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ApnSettings"

    .line 1003
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1006
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 1007
    check-cast p2, Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/android/settings/network/ApnSettings;->setSelectedApnKey(Ljava/lang/String;)V

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 1

    .line 938
    invoke-super {p0, p1}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 939
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->isAllowEditApn()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x2

    .line 940
    invoke-interface {p1, p0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    const/4 p1, 0x0

    .line 941
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 494
    invoke-super {p0}, Lcom/android/settings/RestrictedSettingsFragment;->onResume()V

    .line 496
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onResume: restoreMode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnMode:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ApnSettings"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    const/16 v0, 0x3e9

    .line 500
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removeDialog(I)V

    .line 501
    iget-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    const/4 v0, 0x0

    .line 502
    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    .line 503
    iput-object v0, p0, Lcom/android/settings/network/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/network/ApnSettings$RestoreApnProcessHandler;

    .line 506
    :cond_0
    iget-boolean v0, p0, Lcom/android/settings/network/ApnSettings;->mUnavailable:Z

    if-eqz v0, :cond_1

    return-void

    .line 510
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/network/ApnSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/android/settings/network/ApnSettings;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 512
    iget v0, p0, Lcom/android/settings/network/ApnSettings;->mSubId:I

    invoke-direct {p0, v0}, Lcom/android/settings/network/ApnSettings;->restartPhoneStateListener(I)V

    .line 515
    sget-boolean v0, Lcom/android/settings/network/ApnSettings;->mRestoreDefaultApnMode:Z

    if-nez v0, :cond_2

    .line 516
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->loadCarrierConfigInfo()V

    .line 517
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->fillList()V

    .line 521
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 522
    invoke-direct {p0}, Lcom/android/settings/network/ApnSettings;->updateApnEditState()V

    :cond_3
    return-void
.end method
