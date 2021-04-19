.class public Lcom/oneplus/security/network/view/HeaderPreference;
.super Landroidx/preference/Preference;
.source "HeaderPreference.java"


# instance fields
.field private dataLeftTitle:Ljava/lang/String;

.field private dataUsedTitle:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDataLimitLabel:Ljava/lang/String;

.field private mDataUsageLabel:Ljava/lang/String;

.field private mDataUsageLayout:Landroid/view/View;

.field private mDataUsageLeftValue:Landroid/widget/TextView;

.field private mDataUsageProgress:Landroid/widget/ProgressBar;

.field private mDataUsageTitle:Landroid/widget/TextView;

.field private mDataUsageTotal:Landroid/widget/TextView;

.field private mDataUsageUsed:Landroid/widget/TextView;

.field private mDataWarnLabel:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 57
    invoke-direct {p0, p1}, Lcom/oneplus/security/network/view/HeaderPreference;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    invoke-direct {p0, p1}, Lcom/oneplus/security/network/view/HeaderPreference;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    invoke-direct {p0, p1}, Lcom/oneplus/security/network/view/HeaderPreference;->initView(Landroid/content/Context;)V

    return-void
.end method

.method private getDataInvalidValueHintString()Ljava/lang/String;
    .locals 1

    .line 176
    iget-object p0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    sget v0, Lcom/android/settings/R$string;->data_invalid_value_hint:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private initView(Landroid/content/Context;)V
    .locals 1

    .line 61
    iput-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    .line 62
    sget p1, Lcom/android/settings/R$layout;->data_usage_sim_pref_header:I

    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setLayoutResource(I)V

    const/4 p1, 0x0

    .line 63
    invoke-virtual {p0, p1}, Landroidx/preference/Preference;->setSelectable(Z)V

    .line 64
    iget-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/android/settings/R$string;->data_usage_left_title:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->dataLeftTitle:Ljava/lang/String;

    .line 65
    iget-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/android/settings/R$string;->traffic_package_used:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->dataUsedTitle:Ljava/lang/String;

    .line 66
    iget-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    sget v0, Lcom/android/settings/R$string;->data_usage_limit_label:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataLimitLabel:Ljava/lang/String;

    .line 67
    iget-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    sget v0, Lcom/android/settings/R$string;->data_usage_used_label:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLabel:Ljava/lang/String;

    .line 68
    iget-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    sget v0, Lcom/android/settings/R$string;->data_usage_warn_label:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataWarnLabel:Ljava/lang/String;

    return-void
.end method

.method private setDataUsageLeftValue([Ljava/lang/String;Landroid/content/Context;J)V
    .locals 4

    const/4 v0, 0x0

    .line 148
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "index_data_usage_unit"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 150
    invoke-virtual {v1}, Landroid/provider/Settings$SettingNotFoundException;->printStackTrace()V

    move v1, v0

    :goto_0
    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v1, v3, :cond_1

    if-eq v1, v2, :cond_0

    .line 166
    aget-object p2, p1, v0

    .line 167
    aget-object p1, p1, v3

    goto :goto_1

    .line 161
    :cond_0
    invoke-static {p2, p3, p4, v3}, Lcom/oneplus/security/utils/Utils;->getFormattedFileSizeInMb(Landroid/content/Context;JZ)[Ljava/lang/String;

    move-result-object p1

    .line 162
    aget-object p2, p1, v0

    .line 163
    aget-object p1, p1, v3

    goto :goto_1

    .line 156
    :cond_1
    invoke-static {p2, p3, p4, v3}, Lcom/oneplus/security/utils/Utils;->getFormattedFileSizeInGb(Landroid/content/Context;JZ)[Ljava/lang/String;

    move-result-object p1

    .line 157
    aget-object p2, p1, v0

    .line 158
    aget-object p1, p1, v3

    .line 170
    :goto_1
    iget-object p0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLeftValue:Landroid/widget/TextView;

    new-array p3, v2, [Ljava/lang/Object;

    aput-object p2, p3, v0

    aput-object p1, p3, v3

    const-string p1, "%s%s"

    invoke-static {p1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public getDataUsageSection(I)Ljava/lang/String;
    .locals 4

    .line 180
    iget-object v0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/oneplus/security/network/operator/AccountDayLocalCache;->getDataUsageSectionTimeMillByAccountDay(Landroid/content/Context;I)[J

    move-result-object p1

    .line 181
    iget-object p0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    const/4 v0, 0x0

    aget-wide v0, p1, v0

    const/4 v2, 0x1

    aget-wide v2, p1, v2

    invoke-static {p0, v0, v1, v2, v3}, Lcom/oneplus/security/utils/Utils;->formatDateRange(Landroid/content/Context;JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 1

    .line 73
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    .line 74
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 75
    sget v0, Lcom/android/settings/R$id;->data_usage_layout:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLayout:Landroid/view/View;

    .line 76
    sget v0, Lcom/android/settings/R$id;->data_usage_left_value:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLeftValue:Landroid/widget/TextView;

    .line 77
    sget v0, Lcom/android/settings/R$id;->data_usage_left_title:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageTitle:Landroid/widget/TextView;

    .line 78
    sget v0, Lcom/android/settings/R$id;->data_usage_progress:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    .line 79
    sget v0, Lcom/android/settings/R$id;->data_usage_used_value:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageUsed:Landroid/widget/TextView;

    .line 80
    sget v0, Lcom/android/settings/R$id;->data_usage_total:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageTotal:Landroid/widget/TextView;

    return-void
.end method

.method public updateData(IJJJ)V
    .locals 18

    move-object/from16 v0, p0

    const-wide/16 v1, -0x1

    cmp-long v3, p4, v1

    const/16 v4, 0x8

    if-nez v3, :cond_0

    .line 87
    :try_start_0
    iget-object v1, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLeftValue:Landroid/widget/TextView;

    invoke-direct/range {p0 .. p0}, Lcom/oneplus/security/network/view/HeaderPreference;->getDataInvalidValueHintString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    iget-object v1, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLayout:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 89
    iget-object v0, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto/16 :goto_7

    .line 91
    :cond_0
    iget-object v3, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    sub-long v5, p2, p4

    const/4 v7, 0x1

    invoke-static {v3, v5, v6, v7, v7}, Lcom/oneplus/security/utils/Utils;->getFormattedFileSizeAndUnitForDisplay(Landroid/content/Context;JZZ)[Ljava/lang/String;

    move-result-object v3

    .line 92
    iget-object v8, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    const-wide/16 v9, 0x0

    cmp-long v11, p4, v9

    if-lez v11, :cond_1

    move-wide/from16 v12, p4

    goto :goto_0

    :cond_1
    move-wide v12, v9

    :goto_0
    invoke-static {v8, v12, v13, v7, v7}, Lcom/oneplus/security/utils/Utils;->getFormattedFileSizeAndUnitForDisplay(Landroid/content/Context;JZZ)[Ljava/lang/String;

    move-result-object v8

    .line 93
    iget-object v12, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    cmp-long v13, p2, v9

    if-lez v13, :cond_2

    move-wide/from16 v13, p2

    goto :goto_1

    :cond_2
    move-wide v13, v9

    :goto_1
    invoke-static {v12, v13, v14, v7, v7}, Lcom/oneplus/security/utils/Utils;->getFormattedFileSizeAndUnitForDisplay(Landroid/content/Context;JZZ)[Ljava/lang/String;

    move-result-object v12
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    cmp-long v13, p2, v1

    const-string v14, "%s%s"

    const-string v15, "%s(%s)"

    const-wide/16 v16, 0x64

    const/4 v9, 0x3

    const-string v10, "%s %s%s"

    const/4 v4, 0x2

    const/4 v1, 0x0

    if-eqz v13, :cond_5

    .line 94
    :try_start_1
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    move/from16 v13, p1

    invoke-static {v2, v13}, Lcom/oneplus/security/network/trafficalarm/TrafficUsageAlarmUtils;->getDataTotalState(Landroid/content/Context;I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 95
    invoke-static {}, Lcom/oneplus/security/utils/FunctionUtils;->isUsvMode()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 96
    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v3, v2, v5, v6}, Lcom/oneplus/security/network/view/HeaderPreference;->setDataUsageLeftValue([Ljava/lang/String;Landroid/content/Context;J)V

    goto :goto_2

    .line 98
    :cond_3
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLeftValue:Landroid/widget/TextView;

    new-array v5, v4, [Ljava/lang/Object;

    aget-object v6, v3, v1

    aput-object v6, v5, v1

    aget-object v3, v3, v7

    aput-object v3, v5, v7

    invoke-static {v14, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    :goto_2
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageTitle:Landroid/widget/TextView;

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v5, v0, Lcom/oneplus/security/network/view/HeaderPreference;->dataLeftTitle:Ljava/lang/String;

    aput-object v5, v3, v1

    invoke-virtual/range {p0 .. p1}, Lcom/oneplus/security/network/view/HeaderPreference;->getDataUsageSection(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v7

    invoke-static {v15, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageTotal:Landroid/widget/TextView;

    new-array v3, v9, [Ljava/lang/Object;

    iget-object v5, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataLimitLabel:Ljava/lang/String;

    aput-object v5, v3, v1

    aget-object v5, v12, v1

    aput-object v5, v3, v7

    aget-object v5, v12, v7

    aput-object v5, v3, v4

    invoke-static {v10, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageUsed:Landroid/widget/TextView;

    new-array v3, v9, [Ljava/lang/Object;

    iget-object v5, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLabel:Ljava/lang/String;

    aput-object v5, v3, v1

    aget-object v5, v8, v1

    aput-object v5, v3, v7

    aget-object v5, v8, v7

    aput-object v5, v3, v4

    invoke-static {v10, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    cmp-long v2, p2, p4

    if-lez v2, :cond_4

    mul-long v2, p4, v16

    .line 104
    div-long v2, v2, p2

    long-to-int v2, v2

    .line 105
    iget-object v3, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 106
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    iget-object v3, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    sget v4, Lcom/android/settings/R$drawable;->progress_horizontal:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3

    :cond_4
    mul-long v2, p2, v16

    .line 108
    div-long v2, v2, p4

    long-to-int v2, v2

    .line 109
    iget-object v3, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 110
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    iget-object v3, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    sget v4, Lcom/android/settings/R$drawable;->progress_horizontal_limit:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 112
    :goto_3
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 113
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLayout:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 114
    iget-object v0, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageUsed:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_7

    :cond_5
    move/from16 v13, p1

    .line 117
    :cond_6
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageTitle:Landroid/widget/TextView;

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v5, v0, Lcom/oneplus/security/network/view/HeaderPreference;->dataUsedTitle:Ljava/lang/String;

    aput-object v5, v3, v1

    invoke-virtual/range {p0 .. p1}, Lcom/oneplus/security/network/view/HeaderPreference;->getDataUsageSection(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v7

    invoke-static {v15, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    invoke-static {}, Lcom/oneplus/security/utils/FunctionUtils;->isUsvMode()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 119
    invoke-virtual/range {p0 .. p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    if-lez v11, :cond_7

    move-wide/from16 v5, p4

    goto :goto_4

    :cond_7
    const-wide/16 v5, 0x0

    :goto_4
    invoke-direct {v0, v8, v2, v5, v6}, Lcom/oneplus/security/network/view/HeaderPreference;->setDataUsageLeftValue([Ljava/lang/String;Landroid/content/Context;J)V

    :goto_5
    const-wide/16 v2, -0x1

    goto :goto_6

    .line 121
    :cond_8
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLeftValue:Landroid/widget/TextView;

    new-array v3, v4, [Ljava/lang/Object;

    aget-object v5, v8, v1

    aput-object v5, v3, v1

    aget-object v5, v8, v7

    aput-object v5, v3, v7

    invoke-static {v14, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    :goto_6
    cmp-long v2, p6, v2

    if-nez v2, :cond_9

    .line 125
    iget-object v1, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLayout:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 126
    iget-object v0, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_7

    .line 128
    :cond_9
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageUsed:Landroid/widget/TextView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 129
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mContext:Landroid/content/Context;

    const-wide/16 v5, 0x0

    cmp-long v3, p6, v5

    if-lez v3, :cond_a

    move-wide/from16 v5, p6

    :cond_a
    invoke-static {v2, v5, v6, v7, v1}, Lcom/oneplus/security/utils/Utils;->getFormattedFileSizeAndUnitForDisplay(Landroid/content/Context;JZZ)[Ljava/lang/String;

    move-result-object v2

    .line 130
    iget-object v3, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageTotal:Landroid/widget/TextView;

    new-array v5, v9, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataWarnLabel:Ljava/lang/String;

    aput-object v6, v5, v1

    aget-object v6, v2, v1

    aput-object v6, v5, v7

    aget-object v2, v2, v7

    aput-object v2, v5, v4

    invoke-static {v10, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    mul-long v2, p4, v16

    .line 131
    div-long v2, v2, p6

    long-to-int v2, v2

    const-string v3, "HeaderPreference"

    .line 132
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "usedPercent="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/oneplus/security/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    iget-object v3, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 134
    iget-object v2, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 135
    iget-object v0, v0, Lcom/oneplus/security/network/view/HeaderPreference;->mDataUsageLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_7

    :catch_0
    move-exception v0

    .line 140
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    :goto_7
    return-void
.end method
