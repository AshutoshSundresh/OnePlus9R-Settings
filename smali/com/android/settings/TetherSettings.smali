.class public Lcom/android/settings/TetherSettings;
.super Lcom/android/settings/RestrictedSettingsFragment;
.source "TetherSettings.java"

# interfaces
.implements Lcom/android/settings/datausage/DataSaverBackend$Listener;
.implements Lcom/android/settings/wifi/tether/TetherDataObserver$OnTetherDataChangeCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/TetherSettings$EthernetListener;,
        Lcom/android/settings/TetherSettings$TetheringEventCallback;,
        Lcom/android/settings/TetherSettings$OnStartTetheringCallback;,
        Lcom/android/settings/TetherSettings$TetherChangeReceiver;
    }
.end annotation


# static fields
.field static final KEY_ENABLE_BLUETOOTH_TETHERING:Ljava/lang/String; = "enable_bluetooth_tethering"

.field static final KEY_TETHER_PREFS_FOOTER:Ljava/lang/String; = "tether_prefs_footer"

.field static final KEY_TETHER_PREFS_SCREEN:Ljava/lang/String; = "tether_prefs_screen"

.field static final KEY_USB_TETHER_SETTINGS:Ljava/lang/String; = "usb_tether_settings"

.field static final KEY_WIFI_TETHER:Ljava/lang/String; = "wifi_tether"

.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

.field private static final mHandler:Landroid/os/Handler;


# instance fields
.field private lastTetherData:I

.field private mBluetoothEnableForTether:Z

.field private mBluetoothPan:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/bluetooth/BluetoothPan;",
            ">;"
        }
    .end annotation
.end field

.field private mBluetoothRegexs:[Ljava/lang/String;

.field private mBluetoothTether:Landroidx/preference/SwitchPreference;

.field private mCallBack:Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient$ICallback;

.field private mChoiceItem:I

.field private mChoiceItemValue:Ljava/lang/String;

.field private mChoicePreference:Landroidx/preference/SwitchPreference;

.field private mClient:Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient;

.field private mCm:Landroid/net/ConnectivityManager;

.field private mDataSaverBackend:Lcom/android/settings/datausage/DataSaverBackend;

.field private mDataSaverEnabled:Z

.field private mDataSaverFooter:Landroidx/preference/Preference;

.field private mEm:Landroid/net/EthernetManager;

.field private mEthernetListener:Lcom/android/settings/TetherSettings$EthernetListener;

.field private mEthernetRegex:Ljava/lang/String;

.field private mEthernetTether:Landroidx/preference/SwitchPreference;

.field private mMassStorageActive:Z

.field private mProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field private mStartTetheringCallback:Lcom/android/settings/TetherSettings$OnStartTetheringCallback;

.field private mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

.field private mTetherDataObserver:Lcom/android/settings/wifi/tether/TetherDataObserver;

.field private mTetheringEventCallback:Lcom/android/settings/TetherSettings$TetheringEventCallback;

.field private mTm:Landroid/net/TetheringManager;

.field private mUnavailable:Z

.field private mUsbConnected:Z

.field private mUsbRegexs:[Ljava/lang/String;

.field private mUsbTether:Landroidx/preference/SwitchPreference;

.field private mWifiManager:Landroid/net/wifi/WifiManager;

.field private mWifiTetherPreferenceController:Lcom/android/settings/wifi/tether/WifiTetherPreferenceController;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 131
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/android/settings/TetherSettings;->mHandler:Landroid/os/Handler;

    .line 780
    new-instance v0, Lcom/android/settings/TetherSettings$4;

    invoke-direct {v0}, Lcom/android/settings/TetherSettings$4;-><init>()V

    sput-object v0, Lcom/android/settings/TetherSettings;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const-string v0, "no_config_tethering"

    .line 181
    invoke-direct {p0, v0}, Lcom/android/settings/RestrictedSettingsFragment;-><init>(Ljava/lang/String;)V

    .line 129
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothPan:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x3

    .line 154
    iput v0, p0, Lcom/android/settings/TetherSettings;->lastTetherData:I

    const/4 v0, -0x1

    .line 160
    iput v0, p0, Lcom/android/settings/TetherSettings;->mChoiceItem:I

    .line 770
    new-instance v0, Lcom/android/settings/TetherSettings$3;

    invoke-direct {v0, p0}, Lcom/android/settings/TetherSettings$3;-><init>(Lcom/android/settings/TetherSettings;)V

    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    .line 973
    new-instance v0, Lcom/android/settings/TetherSettings$5;

    invoke-direct {v0, p0}, Lcom/android/settings/TetherSettings$5;-><init>(Lcom/android/settings/TetherSettings;)V

    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mCallBack:Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient$ICallback;

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/TetherSettings;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 100
    invoke-direct {p0, p1, p2, p3}, Lcom/android/settings/TetherSettings;->updateState([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/settings/TetherSettings;I)V
    .locals 0

    .line 100
    invoke-direct {p0, p1}, Lcom/android/settings/TetherSettings;->tetherError(I)V

    return-void
.end method

.method static synthetic access$102(Lcom/android/settings/TetherSettings;Z)Z
    .locals 0

    .line 100
    iput-boolean p1, p0, Lcom/android/settings/TetherSettings;->mMassStorageActive:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/android/settings/TetherSettings;)V
    .locals 0

    .line 100
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->stopTethering()V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/settings/TetherSettings;Z)V
    .locals 0

    .line 100
    invoke-direct {p0, p1}, Lcom/android/settings/TetherSettings;->updateSimStatus(Z)V

    return-void
.end method

.method static synthetic access$1600(Lcom/android/settings/TetherSettings;)Landroidx/preference/SwitchPreference;
    .locals 0

    .line 100
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/android/settings/TetherSettings;)Landroid/net/wifi/WifiManager;
    .locals 0

    .line 100
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/android/settings/TetherSettings;)Landroid/app/ProgressDialog;
    .locals 0

    .line 100
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/android/settings/TetherSettings;IJ)V
    .locals 0

    .line 100
    invoke-direct {p0, p1, p2, p3}, Lcom/android/settings/TetherSettings;->startVzwTethering(IJ)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/settings/TetherSettings;)V
    .locals 0

    .line 100
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->updateState()V

    return-void
.end method

.method static synthetic access$2000()Landroid/os/Handler;
    .locals 1

    .line 100
    sget-object v0, Lcom/android/settings/TetherSettings;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/android/settings/TetherSettings;)V
    .locals 0

    .line 100
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->dismissDialog()V

    return-void
.end method

.method static synthetic access$2200(Lcom/android/settings/TetherSettings;)I
    .locals 0

    .line 100
    iget p0, p0, Lcom/android/settings/TetherSettings;->mChoiceItem:I

    return p0
.end method

.method static synthetic access$2300(Lcom/android/settings/TetherSettings;)V
    .locals 0

    .line 100
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->resetSwitch()V

    return-void
.end method

.method static synthetic access$2400(Lcom/android/settings/TetherSettings;)V
    .locals 0

    .line 100
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->mobileHotspotDialog()V

    return-void
.end method

.method static synthetic access$302(Lcom/android/settings/TetherSettings;Z)Z
    .locals 0

    .line 100
    iput-boolean p1, p0, Lcom/android/settings/TetherSettings;->mUsbConnected:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/settings/TetherSettings;)Z
    .locals 0

    .line 100
    iget-boolean p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothEnableForTether:Z

    return p0
.end method

.method static synthetic access$402(Lcom/android/settings/TetherSettings;Z)Z
    .locals 0

    .line 100
    iput-boolean p1, p0, Lcom/android/settings/TetherSettings;->mBluetoothEnableForTether:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/settings/TetherSettings;I)V
    .locals 0

    .line 100
    invoke-direct {p0, p1}, Lcom/android/settings/TetherSettings;->startTethering(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/settings/TetherSettings;)Landroidx/preference/SwitchPreference;
    .locals 0

    .line 100
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/settings/TetherSettings;Landroidx/preference/SwitchPreference;I)V
    .locals 0

    .line 100
    invoke-direct {p0, p1, p2}, Lcom/android/settings/TetherSettings;->startUssTethering(Landroidx/preference/SwitchPreference;I)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/settings/TetherSettings;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 0

    .line 100
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothPan:Ljava/util/concurrent/atomic/AtomicReference;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/settings/TetherSettings;)Landroid/bluetooth/BluetoothProfile$ServiceListener;
    .locals 0

    .line 100
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    return-object p0
.end method

.method private checkTetherData()V
    .locals 3

    .line 869
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 870
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/settings/wifi/tether/utils/TetherUtils;->getTetherData(Landroid/content/Context;)I

    move-result v0

    .line 871
    iget v1, p0, Lcom/android/settings/TetherSettings;->lastTetherData:I

    if-ne v1, v0, :cond_0

    return-void

    .line 872
    :cond_0
    iput v0, p0, Lcom/android/settings/TetherSettings;->lastTetherData:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 874
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    goto :goto_0

    :cond_1
    const/4 v2, 0x2

    if-ne v0, v2, :cond_5

    .line 876
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_3

    .line 877
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 878
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    .line 880
    :cond_2
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 881
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    .line 884
    :cond_3
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 885
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_4

    .line 886
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 887
    :cond_4
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_7

    .line 888
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, p0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto :goto_0

    :cond_5
    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    .line 891
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_6

    .line 892
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    .line 893
    :cond_6
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_7

    .line 894
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, p0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    :cond_7
    :goto_0
    return-void
.end method

.method private dismissDialog()V
    .locals 0

    .line 1004
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz p0, :cond_0

    .line 1005
    invoke-virtual {p0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method private mobileHotspotDialog()V
    .locals 4

    .line 1032
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1033
    new-instance v1, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1034
    sget v2, Lcom/android/settings/R$string;->hotspot_tip_title:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    sget v2, Lcom/android/settings/R$string;->mobile_hotspot_authoration_error:I

    .line 1035
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    .line 1036
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    sget v2, Lcom/android/settings/R$string;->mhs_app:I

    .line 1037
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/android/settings/TetherSettings$6;

    invoke-direct {v3, p0, v0}, Lcom/android/settings/TetherSettings$6;-><init>(Lcom/android/settings/TetherSettings;Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 1060
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method private resetSwitch()V
    .locals 3

    .line 1010
    iget v0, p0, Lcom/android/settings/TetherSettings;->mChoiceItem:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 1011
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    .line 1013
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_0

    :cond_1
    const/4 v2, 0x5

    if-ne v0, v2, :cond_2

    .line 1015
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method private startTethering(I)V
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 601
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    .line 602
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 603
    iput-boolean v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothEnableForTether:Z

    .line 604
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->enable()Z

    .line 605
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    return-void

    .line 610
    :cond_0
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mStartTetheringCallback:Lcom/android/settings/TetherSettings$OnStartTetheringCallback;

    sget-object v2, Lcom/android/settings/TetherSettings;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1, v0, p0, v2}, Landroid/net/ConnectivityManager;->startTethering(IZLandroid/net/ConnectivityManager$OnStartTetheringCallback;Landroid/os/Handler;)V

    return-void
.end method

.method private startUssTethering(Landroidx/preference/SwitchPreference;I)V
    .locals 1

    .line 907
    iput-object p1, p0, Lcom/android/settings/TetherSettings;->mChoicePreference:Landroidx/preference/SwitchPreference;

    .line 908
    iput p2, p0, Lcom/android/settings/TetherSettings;->mChoiceItem:I

    .line 909
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/settings/wifi/tether/utils/TetherUtils;->isNoSimCard(Landroid/content/Context;)Z

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_2

    if-ne p2, v0, :cond_0

    .line 911
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/android/settings/R$string;->usb_tethering_button_text:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/TetherSettings;->mChoiceItemValue:Ljava/lang/String;

    goto :goto_0

    .line 913
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/android/settings/R$string;->bluetooth_tether_checkbox_text:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/TetherSettings;->mChoiceItemValue:Ljava/lang/String;

    .line 915
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/settings/wifi/tether/utils/TetherUtils;->isHaveProfile(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 916
    invoke-direct {p0, p2}, Lcom/android/settings/TetherSettings;->startTethering(I)V

    goto :goto_1

    :cond_1
    const/4 p1, 0x2

    .line 918
    invoke-direct {p0, p1}, Lcom/android/settings/TetherSettings;->tetherError(I)V

    goto :goto_1

    .line 921
    :cond_2
    invoke-direct {p0, v0}, Lcom/android/settings/TetherSettings;->tetherError(I)V

    :goto_1
    return-void
.end method

.method private startVzwTethering(IJ)V
    .locals 5

    .line 1020
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 1021
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1022
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/android/settings/R$string;->dialog_mhs_error:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    if-eqz v0, :cond_0

    .line 1023
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1024
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 1025
    new-instance v0, Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/TetherSettings;->mCallBack:Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient$ICallback;

    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubscriptionId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient;-><init>(Landroid/content/Context;Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient$ICallback;Ljava/lang/Integer;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mClient:Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient;

    .line 1026
    invoke-virtual {v0, p2, p3}, Lcom/verizon/loginenginesvc/clientsdk/internal/LoginSvcClient;->sendRequest(J)V

    .line 1027
    iput p1, p0, Lcom/android/settings/TetherSettings;->mChoiceItem:I

    :cond_0
    return-void
.end method

.method private stopTethering()V
    .locals 2

    .line 951
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/settings/TetherSettings;->mChoiceItem:I

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mChoicePreference:Landroidx/preference/SwitchPreference;

    if-eqz v0, :cond_1

    .line 952
    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 953
    iget v0, p0, Lcom/android/settings/TetherSettings;->mChoiceItem:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 954
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {p0, v1}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 956
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {p0, v1}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private tetherError(I)V
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, v0, :cond_3

    const/4 v2, 0x2

    if-eq p1, v2, :cond_0

    goto :goto_0

    .line 936
    :cond_0
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mChoiceItemValue:Ljava/lang/String;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 937
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object p1

    sget v2, Lcom/android/settings/R$string;->tether_error_item_default:I

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/TetherSettings;->mChoiceItemValue:Ljava/lang/String;

    .line 939
    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 940
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/android/settings/R$string;->tether_error_title:I

    new-array v4, v0, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/android/settings/TetherSettings;->mChoiceItemValue:Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/android/settings/R$string;->tether_error_message:I

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/android/settings/TetherSettings;->mChoiceItemValue:Ljava/lang/String;

    aput-object v5, v0, v1

    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 939
    invoke-static {p1, v2, v0}, Lcom/android/settings/wifi/tether/utils/TetherUtils;->showTertheringErrorDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 941
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mChoicePreference:Landroidx/preference/SwitchPreference;

    if-eqz p0, :cond_4

    .line 942
    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_0

    .line 928
    :cond_3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 929
    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/android/settings/R$string;->tether_no_sim_title:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/android/settings/R$string;->tether_no_sim_message:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 928
    invoke-static {p1, v0, v2}, Lcom/android/settings/wifi/tether/utils/TetherUtils;->showTertheringErrorDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 930
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mChoicePreference:Landroidx/preference/SwitchPreference;

    if-eqz p1, :cond_4

    .line 931
    invoke-virtual {p1, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 932
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mChoicePreference:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    :cond_4
    :goto_0
    return-void
.end method

.method private updateBluetoothState()V
    .locals 5

    .line 551
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 555
    :cond_0
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v0

    const/16 v1, 0xd

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 557
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    goto :goto_0

    :cond_1
    const/16 v1, 0xb

    if-ne v0, v1, :cond_2

    .line 559
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    goto :goto_0

    .line 561
    :cond_2
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mBluetoothPan:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothPan;

    const/16 v3, 0xc

    const/4 v4, 0x1

    if-ne v0, v3, :cond_3

    if-eqz v1, :cond_3

    .line 563
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothPan;->isTetheringOn()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 564
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 565
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    iget-boolean p0, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    xor-int/2addr p0, v4

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setEnabled(Z)V

    goto :goto_0

    .line 567
    :cond_3
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    iget-boolean v1, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    xor-int/2addr v1, v4

    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 568
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    :goto_0
    return-void
.end method

.method private updateEthernetState([Ljava/lang/String;[Ljava/lang/String;)V
    .locals 7

    .line 578
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    const/4 v4, 0x1

    if-ge v2, v0, :cond_1

    aget-object v5, p1, v2

    .line 579
    iget-object v6, p0, Lcom/android/settings/TetherSettings;->mEthernetRegex:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v3, v4

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 582
    :cond_1
    array-length p1, p2

    move v0, v1

    move v2, v0

    :goto_1
    if-ge v0, p1, :cond_3

    aget-object v5, p2, v0

    .line 583
    iget-object v6, p0, Lcom/android/settings/TetherSettings;->mEthernetRegex:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v2, v4

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    if-eqz v2, :cond_4

    .line 587
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    iget-boolean p2, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    xor-int/2addr p2, v4

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 588
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v4}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_3

    :cond_4
    if-nez v3, :cond_6

    .line 589
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mEm:Landroid/net/EthernetManager;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Landroid/net/EthernetManager;->isAvailable()Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_2

    .line 593
    :cond_5
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 594
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_3

    .line 590
    :cond_6
    :goto_2
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    iget-boolean p2, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    xor-int/2addr p2, v4

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 591
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    :goto_3
    return-void
.end method

.method private updateSimStatus(Z)V
    .locals 2

    if-eqz p1, :cond_2

    .line 963
    iget-boolean p1, p0, Lcom/android/settings/TetherSettings;->mUsbConnected:Z

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/android/settings/TetherSettings;->mMassStorageActive:Z

    if-nez p1, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 964
    :goto_0
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    if-eqz v1, :cond_1

    if-eqz p1, :cond_1

    .line 965
    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 966
    :cond_1
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    if-eqz p0, :cond_2

    .line 967
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    :cond_2
    return-void
.end method

.method private updateState()V
    .locals 3

    .line 499
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getTetherableIfaces()[Ljava/lang/String;

    move-result-object v0

    .line 500
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getTetheredIfaces()[Ljava/lang/String;

    move-result-object v1

    .line 501
    iget-object v2, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getTetheringErroredIfaces()[Ljava/lang/String;

    move-result-object v2

    .line 502
    invoke-direct {p0, v0, v1, v2}, Lcom/android/settings/TetherSettings;->updateState([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method private updateState([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 507
    invoke-direct {p0, p1, p2, p3}, Lcom/android/settings/TetherSettings;->updateUsbState([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 508
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->updateBluetoothState()V

    .line 509
    invoke-direct {p0, p1, p2}, Lcom/android/settings/TetherSettings;->updateEthernetState([Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method private updateUsbState([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 11

    .line 514
    iget-boolean v0, p0, Lcom/android/settings/TetherSettings;->mUsbConnected:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/settings/TetherSettings;->mMassStorageActive:Z

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 516
    :goto_0
    array-length v3, p1

    move v4, v2

    move v5, v4

    :goto_1
    if-ge v4, v3, :cond_3

    aget-object v6, p1, v4

    .line 517
    iget-object v7, p0, Lcom/android/settings/TetherSettings;->mUsbRegexs:[Ljava/lang/String;

    array-length v8, v7

    move v9, v2

    :goto_2
    if-ge v9, v8, :cond_2

    aget-object v10, v7, v9

    .line 518
    invoke-virtual {v6, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    if-nez v5, :cond_1

    .line 520
    iget-object v5, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v5, v6}, Landroid/net/ConnectivityManager;->getLastTetherError(Ljava/lang/String;)I

    move-result v5

    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 526
    :cond_3
    array-length p1, p2

    move v3, v2

    move v4, v3

    :goto_3
    if-ge v3, p1, :cond_6

    aget-object v5, p2, v3

    .line 527
    iget-object v6, p0, Lcom/android/settings/TetherSettings;->mUsbRegexs:[Ljava/lang/String;

    array-length v7, v6

    move v8, v2

    :goto_4
    if-ge v8, v7, :cond_5

    aget-object v9, v6, v8

    .line 528
    invoke-virtual {v5, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    move v4, v1

    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 532
    :cond_6
    array-length p1, p3

    move p2, v2

    :goto_5
    if-ge p2, p1, :cond_8

    aget-object v3, p3, p2

    .line 533
    iget-object v5, p0, Lcom/android/settings/TetherSettings;->mUsbRegexs:[Ljava/lang/String;

    array-length v6, v5

    move v7, v2

    :goto_6
    if-ge v7, v6, :cond_7

    aget-object v8, v5, v7

    .line 534
    invoke-virtual {v3, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    :cond_7
    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    :cond_8
    if-eqz v4, :cond_9

    .line 539
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    iget-boolean p2, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    xor-int/2addr p2, v1

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 540
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_7

    :cond_9
    if-eqz v0, :cond_a

    .line 542
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    iget-boolean p2, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    xor-int/2addr p2, v1

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 543
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_7

    .line 545
    :cond_a
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 546
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p0, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    :goto_7
    return-void
.end method


# virtual methods
.method public getHelpResource()I
    .locals 0

    .line 767
    sget p0, Lcom/android/settings/R$string;->help_url_tether:I

    return p0
.end method

.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x5a

    return p0
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 2

    .line 186
    invoke-super {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->onAttach(Landroid/content/Context;)V

    .line 187
    new-instance v0, Lcom/android/settings/wifi/tether/WifiTetherPreferenceController;

    .line 188
    invoke-virtual {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->getSettingsLifecycle()Lcom/android/settingslib/core/lifecycle/Lifecycle;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/android/settings/wifi/tether/WifiTetherPreferenceController;-><init>(Landroid/content/Context;Lcom/android/settingslib/core/lifecycle/Lifecycle;)V

    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mWifiTetherPreferenceController:Lcom/android/settings/wifi/tether/WifiTetherPreferenceController;

    return-void
.end method

.method public onBlacklistStatusChanged(IZ)V
    .locals 0

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 193
    invoke-super {p0, p1}, Lcom/android/settings/RestrictedSettingsFragment;->onCreate(Landroid/os/Bundle;)V

    .line 195
    sget p1, Lcom/android/settings/R$xml;->tether_prefs:I

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    .line 196
    new-instance p1, Lcom/android/settings/datausage/DataSaverBackend;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/android/settings/datausage/DataSaverBackend;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/settings/TetherSettings;->mDataSaverBackend:Lcom/android/settings/datausage/DataSaverBackend;

    .line 197
    invoke-virtual {p1}, Lcom/android/settings/datausage/DataSaverBackend;->isDataSaverEnabled()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    const-string p1, "disabled_on_data_saver"

    .line 198
    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/TetherSettings;->mDataSaverFooter:Landroidx/preference/Preference;

    const/4 p1, 0x1

    .line 200
    invoke-virtual {p0, p1}, Lcom/android/settings/RestrictedSettingsFragment;->setIfOnlyAvailableForAdmins(Z)V

    .line 201
    invoke-virtual {p0}, Lcom/android/settings/RestrictedSettingsFragment;->isUiRestricted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 202
    iput-boolean p1, p0, Lcom/android/settings/TetherSettings;->mUnavailable:Z

    .line 203
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/preference/PreferenceGroup;->removeAll()V

    return-void

    .line 207
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 208
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 209
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v1

    const/16 v2, 0xc

    if-ne v1, v2, :cond_1

    .line 211
    invoke-static {}, Lcom/oneplus/settings/SettingsBaseApplication;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/TetherSettings;->mProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    :cond_1
    const-string/jumbo v1, "usb_tether_settings"

    .line 215
    invoke-virtual {p0, v1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/SwitchPreference;

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    const-string v1, "enable_bluetooth_tethering"

    .line 216
    invoke-virtual {p0, v1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/SwitchPreference;

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    const-string v1, "enable_ethernet_tethering"

    .line 217
    invoke-virtual {p0, v1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    check-cast v1, Landroidx/preference/SwitchPreference;

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    .line 218
    invoke-virtual {p0}, Lcom/android/settings/TetherSettings;->setFooterPreferenceTitle()V

    .line 220
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mDataSaverBackend:Lcom/android/settings/datausage/DataSaverBackend;

    invoke-virtual {v1, p0}, Lcom/android/settings/datausage/DataSaverBackend;->addListener(Lcom/android/settings/datausage/DataSaverBackend$Listener;)V

    const-string v1, "connectivity"

    .line 222
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    const-string v1, "ethernet"

    .line 223
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/EthernetManager;

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mEm:Landroid/net/EthernetManager;

    const-string v1, "tethering"

    .line 224
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/TetheringManager;

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mTm:Landroid/net/TetheringManager;

    .line 226
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getTetherableUsbRegexs()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mUsbRegexs:[Ljava/lang/String;

    .line 227
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getTetherableBluetoothRegexs()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mBluetoothRegexs:[Ljava/lang/String;

    .line 228
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1040220

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mEthernetRegex:Ljava/lang/String;

    .line 231
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mUsbRegexs:[Ljava/lang/String;

    array-length v1, v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    move v1, p1

    goto :goto_0

    :cond_2
    move v1, v2

    :goto_0
    if-eqz v0, :cond_3

    .line 232
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothRegexs:[Ljava/lang/String;

    array-length v0, v0

    if-eqz v0, :cond_3

    move v0, p1

    goto :goto_1

    :cond_3
    move v0, v2

    .line 233
    :goto_1
    iget-object v3, p0, Lcom/android/settings/TetherSettings;->mEthernetRegex:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    xor-int/2addr v3, p1

    if-eqz v1, :cond_4

    .line 235
    invoke-static {}, Lcom/android/settings/Utils;->isMonkeyRunning()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 236
    :cond_4
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v1

    iget-object v4, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v1, v4}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 239
    :cond_5
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mWifiTetherPreferenceController:Lcom/android/settings/wifi/tether/WifiTetherPreferenceController;

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/android/settings/wifi/tether/WifiTetherPreferenceController;->displayPreference(Landroidx/preference/PreferenceScreen;)V

    if-nez v0, :cond_6

    .line 242
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    goto :goto_2

    .line 244
    :cond_6
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothPan:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothPan;

    if-eqz v0, :cond_7

    .line 245
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothPan;->isTetheringOn()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 246
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0, p1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_2

    .line 248
    :cond_7
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v2}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    :goto_2
    if-nez v3, :cond_8

    .line 251
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->removePreference(Landroidx/preference/Preference;)Z

    .line 253
    :cond_8
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mDataSaverBackend:Lcom/android/settings/datausage/DataSaverBackend;

    invoke-virtual {p1}, Lcom/android/settings/datausage/DataSaverBackend;->isDataSaverEnabled()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/settings/TetherSettings;->onDataSaverChanged(Z)V

    .line 256
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string/jumbo v0, "wifi"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/wifi/WifiManager;

    iput-object p1, p0, Lcom/android/settings/TetherSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 259
    new-instance p1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method public onDataSaverChanged(Z)V
    .locals 1

    .line 277
    iput-boolean p1, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    .line 278
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 279
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    iget-boolean v0, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 280
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    iget-boolean v0, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 281
    iget-object p1, p0, Lcom/android/settings/TetherSettings;->mDataSaverFooter:Landroidx/preference/Preference;

    iget-boolean p0, p0, Lcom/android/settings/TetherSettings;->mDataSaverEnabled:Z

    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->setVisible(Z)V

    return-void
.end method

.method public onDestroy()V
    .locals 3

    .line 264
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mDataSaverBackend:Lcom/android/settings/datausage/DataSaverBackend;

    invoke-virtual {v0, p0}, Lcom/android/settings/datausage/DataSaverBackend;->remListener(Lcom/android/settings/datausage/DataSaverBackend$Listener;)V

    .line 266
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 267
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mBluetoothPan:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothProfile;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    const/4 v2, 0x5

    .line 269
    invoke-virtual {v0, v2, v1}, Landroid/bluetooth/BluetoothAdapter;->closeProfileProxy(ILandroid/bluetooth/BluetoothProfile;)V

    .line 272
    :cond_0
    invoke-super {p0}, Lcom/android/settings/RestrictedSettingsFragment;->onDestroy()V

    return-void
.end method

.method public onPreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 7

    .line 615
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isUsvMode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v0

    if-nez v0, :cond_3

    .line 616
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    if-ne p1, v0, :cond_0

    .line 617
    invoke-virtual {v0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 618
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 619
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/android/settings/R$string;->hotspot_tip_title:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    sget v2, Lcom/android/settings/R$string;->mobile_hotspot_data_off_error:I

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 618
    invoke-static {p1, v0, p0}, Lcom/android/settings/wifi/tether/utils/TetherUtils;->showTertheringErrorDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 621
    :cond_0
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    if-ne p1, v0, :cond_1

    .line 622
    invoke-virtual {v0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 623
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 624
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/android/settings/R$string;->hotspot_tip_title:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    sget v2, Lcom/android/settings/R$string;->mobile_hotspot_data_off_error:I

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 623
    invoke-static {p1, v0, p0}, Lcom/android/settings/wifi/tether/utils/TetherUtils;->showTertheringErrorDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 626
    :cond_1
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    if-ne p1, v0, :cond_2

    .line 627
    invoke-virtual {v0, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 628
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 629
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/android/settings/R$string;->hotspot_tip_title:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    sget v2, Lcom/android/settings/R$string;->mobile_hotspot_data_off_error:I

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 628
    invoke-static {p1, v0, p0}, Lcom/android/settings/wifi/tether/utils/TetherUtils;->showTertheringErrorDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 632
    :cond_2
    invoke-super {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->onPreferenceTreeClick(Landroidx/preference/Preference;)Z

    move-result p0

    return p0

    .line 634
    :cond_3
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    const-wide/16 v2, 0x61a8

    if-ne p1, v0, :cond_f

    .line 636
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isUsvMode()Z

    move-result v0

    const/4 v4, 0x1

    if-eqz v0, :cond_c

    .line 637
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 638
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v5, "tether_settings_prefs"

    invoke-virtual {v0, v5, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v5, "checkbox_status"

    const-string/jumbo v6, "unchecked"

    .line 639
    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v5, "checked"

    .line 640
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 641
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 643
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-nez v0, :cond_5

    .line 644
    invoke-static {}, Lcom/android/settings/wifi/tether/WifiTetherSwitchBarController;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_4

    .line 645
    invoke-direct {p0, v4, v2, v3}, Lcom/android/settings/TetherSettings;->startVzwTethering(IJ)V

    goto :goto_0

    .line 647
    :cond_4
    invoke-direct {p0, v4}, Lcom/android/settings/TetherSettings;->startTethering(I)V

    goto :goto_0

    .line 650
    :cond_5
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-direct {p0, v0, v4}, Lcom/android/settings/TetherSettings;->startUssTethering(Landroidx/preference/SwitchPreference;I)V

    .line 652
    :goto_0
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    goto/16 :goto_1

    .line 654
    :cond_6
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    goto/16 :goto_1

    .line 657
    :cond_7
    iget-object v2, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v2, v1}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 658
    new-instance v1, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 659
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 660
    sget v3, Lcom/android/settings/R$layout;->dialog_checkbox:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 661
    sget v3, Lcom/android/settings/R$id;->dialogCheckbox:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    .line 662
    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 663
    sget v2, Lcom/android/settings/R$string;->dialog_usb_tether_title:I

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 664
    sget v2, Lcom/android/settings/R$string;->dialog_usb_tether_cancel:I

    new-instance v4, Lcom/android/settings/TetherSettings$1;

    invoke-direct {v4, p0, v3}, Lcom/android/settings/TetherSettings$1;-><init>(Lcom/android/settings/TetherSettings;Landroid/widget/CheckBox;)V

    invoke-virtual {v1, v2, v4}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 676
    sget v2, Lcom/android/settings/R$string;->dialog_usb_tether_ok:I

    new-instance v4, Lcom/android/settings/TetherSettings$2;

    invoke-direct {v4, p0, v3}, Lcom/android/settings/TetherSettings$2;-><init>(Lcom/android/settings/TetherSettings;Landroid/widget/CheckBox;)V

    invoke-virtual {v1, v2, v4}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 698
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    .line 699
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 700
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    goto/16 :goto_1

    .line 704
    :cond_8
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 706
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-nez v0, :cond_a

    .line 707
    invoke-static {}, Lcom/android/settings/wifi/tether/WifiTetherSwitchBarController;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_9

    .line 708
    invoke-direct {p0, v4, v2, v3}, Lcom/android/settings/TetherSettings;->startVzwTethering(IJ)V

    goto/16 :goto_1

    .line 710
    :cond_9
    invoke-direct {p0, v4}, Lcom/android/settings/TetherSettings;->startTethering(I)V

    goto/16 :goto_1

    .line 713
    :cond_a
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-direct {p0, v0, v4}, Lcom/android/settings/TetherSettings;->startUssTethering(Landroidx/preference/SwitchPreference;I)V

    goto/16 :goto_1

    .line 717
    :cond_b
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    goto/16 :goto_1

    .line 721
    :cond_c
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 723
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-nez v0, :cond_d

    .line 724
    invoke-direct {p0, v4}, Lcom/android/settings/TetherSettings;->startTethering(I)V

    goto :goto_1

    .line 726
    :cond_d
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mUsbTether:Landroidx/preference/SwitchPreference;

    invoke-direct {p0, v0, v4}, Lcom/android/settings/TetherSettings;->startUssTethering(Landroidx/preference/SwitchPreference;I)V

    goto :goto_1

    .line 730
    :cond_e
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    goto :goto_1

    .line 734
    :cond_f
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    if-ne p1, v0, :cond_13

    .line 735
    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_12

    .line 737
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-nez v0, :cond_11

    .line 738
    invoke-static {}, Lcom/android/settings/wifi/tether/WifiTetherSwitchBarController;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_10

    .line 739
    invoke-direct {p0, v1, v2, v3}, Lcom/android/settings/TetherSettings;->startVzwTethering(IJ)V

    goto :goto_1

    .line 741
    :cond_10
    invoke-direct {p0, v1}, Lcom/android/settings/TetherSettings;->startTethering(I)V

    goto :goto_1

    .line 744
    :cond_11
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mBluetoothTether:Landroidx/preference/SwitchPreference;

    invoke-direct {p0, v0, v1}, Lcom/android/settings/TetherSettings;->startUssTethering(Landroidx/preference/SwitchPreference;I)V

    goto :goto_1

    .line 748
    :cond_12
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    goto :goto_1

    .line 750
    :cond_13
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mEthernetTether:Landroidx/preference/SwitchPreference;

    if-ne p1, v0, :cond_16

    .line 751
    invoke-virtual {v0}, Landroidx/preference/TwoStatePreference;->isChecked()Z

    move-result v0

    const/4 v1, 0x5

    if-eqz v0, :cond_15

    .line 752
    invoke-static {}, Lcom/android/settings/wifi/tether/WifiTetherSwitchBarController;->isVerizon()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_14

    .line 753
    invoke-direct {p0, v1, v2, v3}, Lcom/android/settings/TetherSettings;->startVzwTethering(IJ)V

    goto :goto_1

    .line 755
    :cond_14
    invoke-direct {p0, v1}, Lcom/android/settings/TetherSettings;->startTethering(I)V

    goto :goto_1

    .line 758
    :cond_15
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->stopTethering(I)V

    .line 762
    :cond_16
    :goto_1
    invoke-super {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->onPreferenceTreeClick(Landroidx/preference/Preference;)Z

    move-result p0

    return p0
.end method

.method public onStart()V
    .locals 5

    .line 395
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onStart()V

    .line 397
    iget-boolean v0, p0, Lcom/android/settings/TetherSettings;->mUnavailable:Z

    if-eqz v0, :cond_1

    .line 398
    invoke-virtual {p0}, Lcom/android/settings/RestrictedSettingsFragment;->isUiRestrictedByOnlyAdmin()Z

    move-result v0

    if-nez v0, :cond_0

    .line 399
    invoke-virtual {p0}, Lcom/android/settings/RestrictedSettingsFragment;->getEmptyTextView()Landroid/widget/TextView;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->tethering_settings_not_available:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 401
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/preference/PreferenceGroup;->removeAll()V

    return-void

    .line 405
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 407
    new-instance v1, Lcom/android/settings/TetherSettings$OnStartTetheringCallback;

    invoke-direct {v1, p0}, Lcom/android/settings/TetherSettings$OnStartTetheringCallback;-><init>(Lcom/android/settings/TetherSettings;)V

    iput-object v1, p0, Lcom/android/settings/TetherSettings;->mStartTetheringCallback:Lcom/android/settings/TetherSettings$OnStartTetheringCallback;

    const/4 v1, 0x0

    .line 410
    :try_start_0
    new-instance v2, Lcom/android/settings/TetherSettings$TetheringEventCallback;

    invoke-direct {v2, p0, v1}, Lcom/android/settings/TetherSettings$TetheringEventCallback;-><init>(Lcom/android/settings/TetherSettings;Lcom/android/settings/TetherSettings$1;)V

    iput-object v2, p0, Lcom/android/settings/TetherSettings;->mTetheringEventCallback:Lcom/android/settings/TetherSettings$TetheringEventCallback;

    .line 411
    iget-object v2, p0, Lcom/android/settings/TetherSettings;->mTm:Landroid/net/TetheringManager;

    new-instance v3, Landroid/os/HandlerExecutor;

    sget-object v4, Lcom/android/settings/TetherSettings;->mHandler:Landroid/os/Handler;

    invoke-direct {v3, v4}, Landroid/os/HandlerExecutor;-><init>(Landroid/os/Handler;)V

    iget-object v4, p0, Lcom/android/settings/TetherSettings;->mTetheringEventCallback:Lcom/android/settings/TetherSettings$TetheringEventCallback;

    invoke-virtual {v2, v3, v4}, Landroid/net/TetheringManager;->registerTetheringEventCallback(Ljava/util/concurrent/Executor;Landroid/net/TetheringManager$TetheringEventCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 413
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 417
    :goto_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    const-string v3, "shared"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/settings/TetherSettings;->mMassStorageActive:Z

    .line 418
    new-instance v2, Lcom/android/settings/TetherSettings$TetherChangeReceiver;

    invoke-direct {v2, p0, v1}, Lcom/android/settings/TetherSettings$TetherChangeReceiver;-><init>(Lcom/android/settings/TetherSettings;Lcom/android/settings/TetherSettings$1;)V

    iput-object v2, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    .line 419
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 420
    iget-object v3, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v3, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v2

    .line 422
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    const-string v4, "android.hardware.usb.action.USB_STATE"

    .line 423
    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 424
    iget-object v4, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v4, v3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 426
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    const-string v4, "android.intent.action.MEDIA_SHARED"

    .line 427
    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v4, "android.intent.action.MEDIA_UNSHARED"

    .line 428
    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v4, "file"

    .line 429
    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 430
    iget-object v4, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v4, v3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 432
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    const-string v4, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 433
    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 434
    iget-object v4, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v4, v3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 437
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 438
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    const-string v4, "android.intent.action.setupDataError_tether"

    .line 439
    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v4, "android.intent.action.SIM_STATE_CHANGED"

    .line 440
    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 441
    iget-object v4, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v4, v3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_2
    if-eqz v2, :cond_3

    .line 445
    iget-object v3, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v0, v2}, Landroid/content/BroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 447
    :cond_3
    new-instance v0, Lcom/android/settings/TetherSettings$EthernetListener;

    invoke-direct {v0, p0, v1}, Lcom/android/settings/TetherSettings$EthernetListener;-><init>(Lcom/android/settings/TetherSettings;Lcom/android/settings/TetherSettings$1;)V

    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mEthernetListener:Lcom/android/settings/TetherSettings$EthernetListener;

    .line 448
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mEm:Landroid/net/EthernetManager;

    if-eqz v1, :cond_4

    .line 449
    invoke-virtual {v1, v0}, Landroid/net/EthernetManager;->addListener(Landroid/net/EthernetManager$Listener;)V

    .line 451
    :cond_4
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->updateState()V

    .line 454
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 455
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->checkTetherData()V

    .line 456
    new-instance v0, Lcom/android/settings/wifi/tether/TetherDataObserver;

    invoke-direct {v0, p0}, Lcom/android/settings/wifi/tether/TetherDataObserver;-><init>(Lcom/android/settings/wifi/tether/TetherDataObserver$OnTetherDataChangeCallback;)V

    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mTetherDataObserver:Lcom/android/settings/wifi/tether/TetherDataObserver;

    .line 457
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "TetheredData"

    invoke-static {v1}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mTetherDataObserver:Lcom/android/settings/wifi/tether/TetherDataObserver;

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    :cond_5
    return-void
.end method

.method public onStop()V
    .locals 3

    .line 464
    invoke-super {p0}, Lcom/android/settingslib/core/lifecycle/ObservablePreferenceFragment;->onStop()V

    .line 466
    iget-boolean v0, p0, Lcom/android/settings/TetherSettings;->mUnavailable:Z

    if-eqz v0, :cond_0

    return-void

    .line 469
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 470
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mTm:Landroid/net/TetheringManager;

    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mTetheringEventCallback:Lcom/android/settings/TetherSettings$TetheringEventCallback;

    invoke-virtual {v0, v1}, Landroid/net/TetheringManager;->unregisterTetheringEventCallback(Landroid/net/TetheringManager$TetheringEventCallback;)V

    .line 471
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mEm:Landroid/net/EthernetManager;

    if-eqz v0, :cond_1

    .line 472
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mEthernetListener:Lcom/android/settings/TetherSettings$EthernetListener;

    invoke-virtual {v0, v1}, Landroid/net/EthernetManager;->removeListener(Landroid/net/EthernetManager$Listener;)V

    :cond_1
    const/4 v0, 0x0

    .line 473
    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mTetherChangeReceiver:Landroid/content/BroadcastReceiver;

    .line 474
    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mStartTetheringCallback:Lcom/android/settings/TetherSettings$OnStartTetheringCallback;

    .line 475
    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mTetheringEventCallback:Lcom/android/settings/TetherSettings$TetheringEventCallback;

    .line 476
    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mEthernetListener:Lcom/android/settings/TetherSettings$EthernetListener;

    .line 479
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportUss()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 480
    iget-object v1, p0, Lcom/android/settings/TetherSettings;->mTetherDataObserver:Lcom/android/settings/wifi/tether/TetherDataObserver;

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 481
    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/TetherSettings;->mTetherDataObserver:Lcom/android/settings/wifi/tether/TetherDataObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 482
    iput-object v0, p0, Lcom/android/settings/TetherSettings;->mTetherDataObserver:Lcom/android/settings/wifi/tether/TetherDataObserver;

    .line 487
    :cond_2
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isUsvMode()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 488
    iget-object v0, p0, Lcom/android/settings/TetherSettings;->mClient:Lcom/verizon/loginenginesvc/clientsdk/MhsAuthorizedClient;

    if-eqz v0, :cond_3

    .line 489
    invoke-virtual {v0}, Lcom/verizon/loginenginesvc/clientsdk/internal/LoginSvcClient;->cancelRequest()V

    .line 491
    :cond_3
    iget-object p0, p0, Lcom/android/settings/TetherSettings;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz p0, :cond_4

    .line 492
    invoke-virtual {p0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_4
    return-void
.end method

.method public onTetherDataChange()V
    .locals 0

    .line 901
    invoke-direct {p0}, Lcom/android/settings/TetherSettings;->checkTetherData()V

    return-void
.end method

.method public onWhitelistStatusChanged(IZ)V
    .locals 0

    return-void
.end method

.method setFooterPreferenceTitle()V
    .locals 2

    const-string v0, "tether_prefs_footer"

    .line 294
    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    .line 296
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string/jumbo v1, "wifi"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/wifi/WifiManager;

    .line 297
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->isStaApConcurrencySupported()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 298
    sget p0, Lcom/android/settings/R$string;->tethering_footer_info_sta_ap_concurrency:I

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setSummary(I)V

    goto :goto_0

    .line 300
    :cond_0
    sget p0, Lcom/android/settings/R$string;->tethering_footer_info:I

    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->setSummary(I)V

    :goto_0
    return-void
.end method
