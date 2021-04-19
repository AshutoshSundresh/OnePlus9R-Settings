.class public Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;
.super Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;
.source "WifiTetherApChannelPreferenceController.java"


# static fields
.field private static final PREF_KEY:Ljava/lang/String; = "wifi_tether_ap_channel"

.field private static final TAG:Ljava/lang/String; = "WifiTetherApChannelPref"


# instance fields
.field private mBandEntries:[Ljava/lang/String;

.field private mBandIndex:I

.field private mBandSummaries:[Ljava/lang/String;

.field private mChannelIndex:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController$OnTetherConfigUpdateListener;)V
    .locals 1

    const-string/jumbo v0, "wifi_tether_ap_channel"

    .line 30
    invoke-direct {p0, p1, p2, v0}, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;-><init>(Landroid/content/Context;Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController$OnTetherConfigUpdateListener;Ljava/lang/String;)V

    const/4 p1, 0x2

    .line 24
    iput p1, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mChannelIndex:I

    const/4 p1, 0x1

    .line 25
    iput p1, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandIndex:I

    .line 31
    iget-object p1, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {p1}, Landroid/net/wifi/WifiManager;->getSoftApConfiguration()Landroid/net/wifi/SoftApConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/wifi/SoftApConfiguration;->getBand()I

    move-result p1

    iput p1, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandIndex:I

    .line 32
    iget-object p1, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {p1}, Landroid/net/wifi/WifiManager;->getSoftApConfiguration()Landroid/net/wifi/SoftApConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/wifi/SoftApConfiguration;->getChannel()I

    move-result p1

    iput p1, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mChannelIndex:I

    .line 33
    invoke-direct {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->updatePreferenceEntries()V

    return-void
.end method

.method private updatePreferenceEntries()V
    .locals 3

    .line 110
    iget-object v0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 114
    iget v1, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandIndex:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_0

    .line 115
    sget v1, Lcom/android/settings/R$array;->wifi_ap_channel_config_5band:I

    .line 117
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandEntries:[Ljava/lang/String;

    .line 118
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandSummaries:[Ljava/lang/String;

    const/16 v0, 0x31

    .line 119
    iput v0, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mChannelIndex:I

    goto :goto_0

    .line 121
    :cond_0
    sget v1, Lcom/android/settings/R$array;->wifi_ap_channel_band:I

    .line 123
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandEntries:[Ljava/lang/String;

    .line 124
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandSummaries:[Ljava/lang/String;

    .line 125
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getChannelIndex()I

    move-result v0

    iput v0, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mChannelIndex:I

    :goto_0
    return-void
.end method


# virtual methods
.method public bridge synthetic copy()V
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->copy()V

    return-void
.end method

.method public getAvailabilityStatus()I
    .locals 0

    .line 38
    invoke-static {}, Lcom/oneplus/settings/utils/ProductUtils;->isUsvMode()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x3

    return p0
.end method

.method public bridge synthetic getBackgroundWorkerClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/android/settings/slices/SliceBackgroundWorker;",
            ">;"
        }
    .end annotation

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->getBackgroundWorkerClass()Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public getChannelIndex()I
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getSoftApConfiguration()Landroid/net/wifi/SoftApConfiguration;

    move-result-object v0

    .line 134
    invoke-virtual {v0}, Landroid/net/wifi/SoftApConfiguration;->getBand()I

    move-result v0

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/16 p0, 0x31

    return p0

    .line 137
    :cond_0
    iget p0, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mChannelIndex:I

    if-lt p0, v1, :cond_2

    const/16 v0, 0xd

    if-le p0, v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, p0

    :cond_2
    :goto_0
    return v1
.end method

.method getConfigSummary()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getSoftApConfiguration()Landroid/net/wifi/SoftApConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wifi/SoftApConfiguration;->getBand()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    .line 88
    iget-object p0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/android/settings/R$string;->wifi_ap_choose_auto:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 90
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getChannelIndex()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getIntentFilter()Landroid/content/IntentFilter;
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->getIntentFilter()Landroid/content/IntentFilter;

    move-result-object p0

    return-object p0
.end method

.method public getPreferenceKey()Ljava/lang/String;
    .locals 0

    const-string/jumbo p0, "wifi_tether_ap_channel"

    return-object p0
.end method

.method public bridge synthetic hasAsyncUpdate()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->hasAsyncUpdate()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isCopyableSlice()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isCopyableSlice()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isPublicSlice()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isPublicSlice()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isSliceable()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->isSliceable()Z

    move-result p0

    return p0
.end method

.method public onBandIndexChange(I)V
    .locals 2

    .line 46
    iput p1, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandIndex:I

    .line 47
    iget-object v0, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mPreference:Landroidx/preference/Preference;

    check-cast v0, Landroidx/preference/ListPreference;

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 49
    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 50
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 51
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getConfigSummary()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 53
    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 54
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getConfigSummary()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 55
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getConfigSummary()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 56
    new-instance p1, Landroid/net/wifi/SoftApConfiguration$Builder;

    iget-object v0, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getSoftApConfiguration()Landroid/net/wifi/SoftApConfiguration;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/net/wifi/SoftApConfiguration$Builder;-><init>(Landroid/net/wifi/SoftApConfiguration;)V

    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getChannelIndex()I

    move-result v0

    iget v1, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandIndex:I

    invoke-virtual {p1, v0, v1}, Landroid/net/wifi/SoftApConfiguration$Builder;->setChannel(II)Landroid/net/wifi/SoftApConfiguration$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/wifi/SoftApConfiguration$Builder;->build()Landroid/net/wifi/SoftApConfiguration;

    .line 58
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->updateDisplay()V

    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    .line 102
    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mChannelIndex:I

    .line 103
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getConfigSummary()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 104
    iget-object p1, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mListener:Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController$OnTetherConfigUpdateListener;

    invoke-interface {p1, p0}, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController$OnTetherConfigUpdateListener;->onTetherConfigUpdated(Lcom/android/settings/core/BasePreferenceController;)V

    const/4 p0, 0x1

    return p0
.end method

.method public updateDisplay()V
    .locals 5

    .line 62
    iget-object v0, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getSoftApConfiguration()Landroid/net/wifi/SoftApConfiguration;

    move-result-object v0

    .line 63
    invoke-direct {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->updatePreferenceEntries()V

    .line 64
    iget-object v1, p0, Lcom/android/settings/wifi/tether/WifiTetherBasePreferenceController;->mPreference:Landroidx/preference/Preference;

    check-cast v1, Landroidx/preference/ListPreference;

    .line 66
    iget-object v2, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandSummaries:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroidx/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 67
    iget-object v2, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandEntries:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroidx/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 68
    new-instance v2, Landroid/net/wifi/SoftApConfiguration$Builder;

    invoke-direct {v2, v0}, Landroid/net/wifi/SoftApConfiguration$Builder;-><init>(Landroid/net/wifi/SoftApConfiguration;)V

    .line 69
    invoke-virtual {v0}, Landroid/net/wifi/SoftApConfiguration;->getBand()I

    move-result v3

    iput v3, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mBandIndex:I

    if-eqz v0, :cond_3

    const/4 v0, 0x2

    and-int/2addr v3, v0

    if-eqz v3, :cond_0

    const/4 v0, 0x0

    .line 73
    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 74
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getConfigSummary()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroidx/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_0
    const/4 v3, 0x1

    .line 77
    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setEnabled(Z)V

    .line 78
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getConfigSummary()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroidx/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 79
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getConfigSummary()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroidx/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 80
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getChannelIndex()I

    move-result v1

    if-lt v1, v0, :cond_2

    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getChannelIndex()I

    move-result v1

    const/16 v4, 0xd

    if-le v1, v4, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getChannelIndex()I

    move-result v0

    :cond_2
    :goto_0
    iput v0, p0, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->mChannelIndex:I

    .line 81
    invoke-virtual {p0}, Lcom/android/settings/wifi/tether/WifiTetherApChannelPreferenceController;->getChannelIndex()I

    move-result p0

    invoke-virtual {v2, p0, v3}, Landroid/net/wifi/SoftApConfiguration$Builder;->setChannel(II)Landroid/net/wifi/SoftApConfiguration$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/wifi/SoftApConfiguration$Builder;->build()Landroid/net/wifi/SoftApConfiguration;

    :cond_3
    :goto_1
    return-void
.end method

.method public bridge synthetic useDynamicSliceSummary()Z
    .locals 0

    invoke-super {p0}, Lcom/android/settings/slices/Sliceable;->useDynamicSliceSummary()Z

    move-result p0

    return p0
.end method
