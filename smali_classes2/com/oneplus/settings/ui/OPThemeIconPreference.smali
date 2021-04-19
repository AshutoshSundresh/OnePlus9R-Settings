.class public Lcom/oneplus/settings/ui/OPThemeIconPreference;
.super Landroidx/preference/Preference;
.source "OPThemeIconPreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final IS_SUPPORT_AOD_ALWAYS_ON:Z


# instance fields
.field private mAlwaysOnEnabled:Z

.field private mCanvas:Lcom/oneplus/settings/ui/RadiusImageView;

.field private mCanvasLayout:Landroid/view/View;

.field private mClockExtra:Lcom/oneplus/settings/ui/OpClockExtra;

.field private mClockStyle:Lcom/oneplus/settings/ui/RadiusImageView;

.field private mContext:Landroid/content/Context;

.field private mFingerprintAnimation:Lcom/oneplus/settings/ui/RadiusImageView;

.field private final mIsSupportMsdAodInfo:Z

.field private mNotificationAnimation:Lcom/oneplus/settings/ui/RadiusImageView;

.field private mWallpaper:Lcom/oneplus/settings/ui/RadiusImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x12c

    aput v2, v0, v1

    .line 70
    invoke-static {v0}, Landroid/util/OpFeatures;->isSupport([I)Z

    move-result v0

    sput-boolean v0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->IS_SUPPORT_AOD_ALWAYS_ON:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 91
    invoke-direct {p0, p1, v0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 95
    invoke-direct {p0, p1, p2, v0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 99
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 102
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 86
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportMsdAodInfo()Z

    move-result p2

    iput-boolean p2, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mIsSupportMsdAodInfo:Z

    const/4 p2, 0x0

    .line 87
    iput-boolean p2, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mAlwaysOnEnabled:Z

    .line 103
    sget p2, Lcom/android/settings/R$layout;->op_theme_icon_layout:I

    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->setLayoutResource(I)V

    .line 104
    iput-object p1, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    return-void
.end method

.method private getClockStyleImage(I)I
    .locals 1

    const/16 v0, 0x28

    if-eq p1, v0, :cond_8

    const/16 v0, 0x32

    if-eq p1, v0, :cond_7

    const/16 v0, 0x64

    if-eq p1, v0, :cond_6

    packed-switch p1, :pswitch_data_0

    .line 284
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_smart_space_default:I

    goto/16 :goto_0

    .line 277
    :pswitch_0
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_bitmoji:I

    goto/16 :goto_0

    .line 274
    :pswitch_1
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_parsons:I

    goto/16 :goto_0

    .line 220
    :pswitch_2
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->shouldShowMsdPreview()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 221
    sget p0, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_minimalism_2:I

    goto/16 :goto_0

    .line 223
    :cond_0
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_minimalism_2:I

    goto/16 :goto_0

    .line 213
    :pswitch_3
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->shouldShowMsdPreview()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 214
    sget p0, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_minimalism_1:I

    goto/16 :goto_0

    .line 216
    :cond_1
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_minimalism_1:I

    goto/16 :goto_0

    .line 253
    :pswitch_4
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->shouldShowMsdPreview()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 254
    sget p0, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_analog_3:I

    goto :goto_0

    .line 256
    :cond_2
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_analog_3:I

    goto :goto_0

    .line 246
    :pswitch_5
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->shouldShowMsdPreview()Z

    move-result p0

    if-eqz p0, :cond_3

    .line 247
    sget p0, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_analog_2:I

    goto :goto_0

    .line 249
    :cond_3
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_analog_2:I

    goto :goto_0

    .line 239
    :pswitch_6
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->shouldShowMsdPreview()Z

    move-result p0

    if-eqz p0, :cond_4

    .line 240
    sget p0, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_analog_1:I

    goto :goto_0

    .line 242
    :cond_4
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_analog_1:I

    goto :goto_0

    .line 260
    :pswitch_7
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->shouldShowMsdPreview()Z

    move-result p0

    if-eqz p0, :cond_5

    .line 261
    sget p0, Lcom/android/settings/R$drawable;->msd_op_custom_aodpreview_bold:I

    goto :goto_0

    .line 263
    :cond_5
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_bold:I

    goto :goto_0

    .line 268
    :pswitch_8
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_text_clock:I

    goto :goto_0

    .line 209
    :pswitch_9
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_digital_2:I

    goto :goto_0

    .line 206
    :pswitch_a
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_digital_1:I

    goto :goto_0

    .line 228
    :pswitch_b
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_none:I

    goto :goto_0

    .line 271
    :cond_6
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_default:I

    goto :goto_0

    .line 280
    :cond_7
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_red:I

    goto :goto_0

    .line 231
    :cond_8
    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportMclTheme()Z

    move-result p0

    if-eqz p0, :cond_9

    const-string p0, "ro.boot.project_name"

    invoke-static {p0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "18801"

    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_9

    .line 232
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_mcl:I

    goto :goto_0

    .line 234
    :cond_9
    sget p0, Lcom/android/settings/R$drawable;->op_custom_aodpreview_analog_1:I

    :goto_0
    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
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

.method private getFodAnimStyleImage()I
    .locals 7

    .line 297
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    .line 298
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "op_custom_unlock_animation_style"

    const/4 v2, 0x0

    const/4 v3, -0x2

    .line 297
    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    .line 302
    invoke-static {}, Lcom/oneplus/settings/utils/OPThemeUtils;->isSupportREDTheme()Z

    move-result v1

    const/16 v2, 0xb

    const/16 v3, 0x9

    const/4 v4, 0x4

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v1, :cond_6

    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/oneplus/settings/utils/OPThemeUtils;->isCurrentREDTheme(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_6

    if-eqz v0, :cond_5

    if-eq v0, v6, :cond_4

    if-eq v0, v5, :cond_3

    if-eq v0, v4, :cond_2

    if-eq v0, v3, :cond_1

    if-eq v0, v2, :cond_0

    .line 323
    sget p0, Lcom/android/settings/R$drawable;->op_red_custom_fingeprint_preview_cosmos:I

    goto :goto_0

    .line 305
    :cond_0
    sget p0, Lcom/android/settings/R$drawable;->op_red_custom_fingeprint_preview_red:I

    goto :goto_0

    .line 317
    :cond_1
    sget p0, Lcom/android/settings/R$drawable;->op_red_custom_fingeprint_preview_04:I

    goto :goto_0

    .line 320
    :cond_2
    sget p0, Lcom/android/settings/R$drawable;->op_red_custom_fingeprint_preview_energy:I

    goto :goto_0

    .line 314
    :cond_3
    sget p0, Lcom/android/settings/R$drawable;->op_red_custom_fingeprint_preview_stripe:I

    goto :goto_0

    .line 311
    :cond_4
    sget p0, Lcom/android/settings/R$drawable;->op_red_custom_fingeprint_preview_ripple:I

    goto :goto_0

    .line 308
    :cond_5
    sget p0, Lcom/android/settings/R$drawable;->op_red_custom_fingeprint_preview_cosmos:I

    goto :goto_0

    :cond_6
    if-eqz v0, :cond_d

    if-eq v0, v6, :cond_c

    if-eq v0, v5, :cond_b

    const/4 p0, 0x3

    if-eq v0, p0, :cond_a

    if-eq v0, v4, :cond_9

    if-eq v0, v3, :cond_8

    if-eq v0, v2, :cond_7

    .line 350
    sget p0, Lcom/android/settings/R$drawable;->op_custom_fingeprint_preview_cosmos:I

    goto :goto_0

    .line 329
    :cond_7
    sget p0, Lcom/android/settings/R$drawable;->op_custom_fingeprint_preview_red:I

    goto :goto_0

    .line 341
    :cond_8
    sget p0, Lcom/android/settings/R$drawable;->op_custom_fingeprint_preview_04:I

    goto :goto_0

    .line 347
    :cond_9
    sget p0, Lcom/android/settings/R$drawable;->op_custom_fingeprint_preview_energy:I

    goto :goto_0

    .line 344
    :cond_a
    sget p0, Lcom/android/settings/R$drawable;->op_custom_fingeprint_preview_00:I

    goto :goto_0

    .line 338
    :cond_b
    sget p0, Lcom/android/settings/R$drawable;->op_custom_fingeprint_preview_stripe:I

    goto :goto_0

    .line 335
    :cond_c
    sget p0, Lcom/android/settings/R$drawable;->op_custom_fingeprint_preview_ripple:I

    goto :goto_0

    .line 332
    :cond_d
    sget p0, Lcom/android/settings/R$drawable;->op_custom_fingeprint_preview_cosmos:I

    :goto_0
    return p0
.end method

.method private getHorizonLightStyleImage()I
    .locals 3

    .line 358
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    .line 359
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "op_custom_horizon_light_animation_style"

    const/4 v1, 0x0

    const/4 v2, -0x2

    .line 358
    invoke-static {p0, v0, v1, v2}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result p0

    if-eqz p0, :cond_5

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0x14

    if-eq p0, v0, :cond_0

    .line 383
    sget p0, Lcom/android/settings/R$drawable;->op_custom_horizon_light_preview_blue:I

    goto :goto_0

    .line 380
    :cond_0
    sget p0, Lcom/android/settings/R$drawable;->op_custom_horizon_light_preview_red1:I

    goto :goto_0

    .line 377
    :cond_1
    sget p0, Lcom/android/settings/R$drawable;->op_custom_horizon_light_preview_mcl:I

    goto :goto_0

    .line 374
    :cond_2
    sget p0, Lcom/android/settings/R$drawable;->op_custom_horizon_light_preview_purple:I

    goto :goto_0

    .line 371
    :cond_3
    sget p0, Lcom/android/settings/R$drawable;->op_custom_horizon_light_preview_gold:I

    goto :goto_0

    .line 368
    :cond_4
    sget p0, Lcom/android/settings/R$drawable;->op_custom_horizon_light_preview_red:I

    goto :goto_0

    .line 365
    :cond_5
    sget p0, Lcom/android/settings/R$drawable;->op_custom_horizon_light_preview_blue:I

    :goto_0
    return p0
.end method

.method private isCanvasEnabled()Z
    .locals 3

    .line 170
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object p0

    .line 171
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ApplicationInfo;

    .line 172
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const-string v2, "com.oneplus.canvasresources"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0
.end method

.method private synthetic lambda$onClick$0(Landroid/view/View;)V
    .locals 2

    .line 418
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.oneplus.action.INTENT_TRANSIT_ACTIVITY"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "intent_action"

    const-string v1, "com.android.settings.SEARCH_RESULT_TRAMPOLINE"

    .line 419
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, ":settings:show_fragment"

    const-string v1, "com.android.settings.DisplaySettings"

    .line 420
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 421
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    const-string v1, ":settings:fragment_args_key"

    if-eqz v0, :cond_0

    const-string v0, "doze_801"

    .line 422
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    const-string v0, "doze"

    .line 424
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 426
    :goto_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private synthetic lambda$onClick$1(Landroid/view/View;)V
    .locals 2

    .line 440
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.oneplus.action.INTENT_TRANSIT_ACTIVITY"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "intent_action"

    const-string v1, "com.android.settings.SEARCH_RESULT_TRAMPOLINE"

    .line 441
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, ":settings:show_fragment"

    const-string v1, "com.android.settings.security.SecuritySettings"

    .line 442
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, ":settings:fragment_args_key"

    const-string v1, "fingerprint_settings"

    .line 443
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 444
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private synthetic lambda$onClick$2(Landroid/view/View;)V
    .locals 2

    .line 460
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.oneplus.action.INTENT_TRANSIT_ACTIVITY"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "intent_action"

    const-string v1, "com.android.settings.SEARCH_RESULT_TRAMPOLINE"

    .line 461
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, ":settings:show_fragment"

    const-string v1, "com.android.settings.DisplaySettings"

    .line 462
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 463
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    const-string v1, ":settings:fragment_args_key"

    if-eqz v0, :cond_0

    const-string v0, "doze_801"

    .line 464
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    const-string v0, "doze"

    .line 466
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 468
    :goto_0
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private refreshCanvas()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/16 v1, 0x143

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 162
    invoke-static {v0}, Landroid/util/OpFeatures;->isSupport([I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->isCanvasEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mCanvasLayout:Landroid/view/View;

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 165
    :cond_0
    iget-object p0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mCanvasLayout:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method private shouldShowMsdPreview()Z
    .locals 1

    .line 292
    iget-boolean v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mIsSupportMsdAodInfo:Z

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mAlwaysOnEnabled:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public synthetic lambda$onClick$0$OPThemeIconPreference(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->lambda$onClick$0(Landroid/view/View;)V

    return-void
.end method

.method public synthetic lambda$onClick$1$OPThemeIconPreference(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->lambda$onClick$1(Landroid/view/View;)V

    return-void
.end method

.method public synthetic lambda$onClick$2$OPThemeIconPreference(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->lambda$onClick$2(Landroid/view/View;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 4

    .line 108
    invoke-super {p0, p1}, Landroidx/preference/Preference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    .line 111
    sget-boolean v0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->IS_SUPPORT_AOD_ALWAYS_ON:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 112
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v1

    const-string v2, "always_on_state"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3, v1}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v3, 0x1

    :cond_0
    iput-boolean v3, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mAlwaysOnEnabled:Z

    .line 116
    :cond_1
    sget v0, Lcom/android/settings/R$id;->layout_canvas:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mCanvasLayout:Landroid/view/View;

    .line 117
    sget v0, Lcom/android/settings/R$id;->theme_canvas:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/oneplus/settings/ui/RadiusImageView;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mCanvas:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v0, :cond_2

    .line 119
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    :cond_2
    sget v0, Lcom/android/settings/R$id;->theme_wallpaper:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/oneplus/settings/ui/RadiusImageView;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mWallpaper:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v0, :cond_3

    .line 123
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    :cond_3
    sget v0, Lcom/android/settings/R$id;->theme_clock_style:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/oneplus/settings/ui/RadiusImageView;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mClockStyle:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v0, :cond_4

    .line 127
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    :cond_4
    sget v0, Lcom/android/settings/R$id;->clock_extra:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/oneplus/settings/ui/OpClockExtra;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mClockExtra:Lcom/oneplus/settings/ui/OpClockExtra;

    if-eqz v0, :cond_5

    .line 131
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    :cond_5
    sget v0, Lcom/android/settings/R$id;->theme_fingerprint:I

    .line 135
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/oneplus/settings/ui/RadiusImageView;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mFingerprintAnimation:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v0, :cond_6

    .line 137
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    :cond_6
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportCustomFingerprint()Z

    move-result v0

    const/16 v1, 0x8

    if-nez v0, :cond_7

    .line 140
    sget v0, Lcom/android/settings/R$id;->theme_fingerprint_container:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 142
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 146
    :cond_7
    sget v0, Lcom/android/settings/R$id;->theme_notification:I

    .line 147
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/oneplus/settings/ui/RadiusImageView;

    iput-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mNotificationAnimation:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v0, :cond_8

    .line 149
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    :cond_8
    invoke-static {}, Lcom/oneplus/settings/utils/OPUtils;->isSupportNotificationLight()Z

    move-result v0

    if-nez v0, :cond_9

    .line 152
    sget v0, Lcom/android/settings/R$id;->op_custom_horizon_light:I

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_9

    .line 154
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 157
    :cond_9
    invoke-virtual {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->refreshUI()V

    .line 158
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->refreshCanvas()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 391
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 392
    sget v1, Lcom/android/settings/R$id;->theme_wallpaper:I

    const-string v2, "net.oneplus.launcher.wallpaper.picker.WallpaperPickerActivity"

    const-string v3, "net.oneplus.launcher"

    if-ne v0, v1, :cond_0

    .line 393
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 394
    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v0, 0x10000000

    .line 396
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 397
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_6

    .line 398
    :cond_0
    sget v1, Lcom/android/settings/R$id;->theme_clock_style:I

    const/16 v4, 0x270f

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v0, v1, :cond_7

    sget v1, Lcom/android/settings/R$id;->clock_extra:I

    if-ne v0, v1, :cond_1

    goto/16 :goto_1

    .line 435
    :cond_1
    sget v1, Lcom/android/settings/R$id;->theme_fingerprint:I

    if-ne v0, v1, :cond_3

    .line 436
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/settings/Utils;->getFingerprintManagerOrNull(Landroid/content/Context;)Landroid/hardware/fingerprint/FingerprintManager;

    move-result-object v0

    .line 437
    invoke-virtual {v0}, Landroid/hardware/fingerprint/FingerprintManager;->hasEnrolledFingerprints()Z

    move-result v0

    if-nez v0, :cond_2

    .line 438
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->oneplus_theme_fingerprint_snake_tip:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v5}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 439
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->oneplus_theme_fingerprint_snake_action:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/oneplus/settings/ui/-$$Lambda$OPThemeIconPreference$2hUhkUR3NvOGZPRMONCnL7jutRw;

    invoke-direct {v1, p0}, Lcom/oneplus/settings/ui/-$$Lambda$OPThemeIconPreference$2hUhkUR3NvOGZPRMONCnL7jutRw;-><init>(Lcom/oneplus/settings/ui/OPThemeIconPreference;)V

    invoke-virtual {p1, v0, v1}, Lcom/google/android/material/snackbar/Snackbar;->setAction(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Lcom/google/android/material/snackbar/Snackbar;

    .line 445
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    return-void

    .line 448
    :cond_2
    new-instance p1, Lcom/android/settings/core/SubSettingLauncher;

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    invoke-direct {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;-><init>(Landroid/content/Context;)V

    const-class p0, Lcom/oneplus/settings/OPCustomFingerprintAnimSettings;

    .line 449
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;->setDestination(Ljava/lang/String;)Lcom/android/settings/core/SubSettingLauncher;

    .line 450
    invoke-virtual {p1, v4}, Lcom/android/settings/core/SubSettingLauncher;->setSourceMetricsCategory(I)Lcom/android/settings/core/SubSettingLauncher;

    sget p0, Lcom/android/settings/R$string;->oneplus_fingerprint_animation_effect_title:I

    .line 451
    invoke-virtual {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;->setTitleRes(I)Lcom/android/settings/core/SubSettingLauncher;

    .line 452
    invoke-virtual {p1}, Lcom/android/settings/core/SubSettingLauncher;->launch()V

    goto/16 :goto_6

    .line 453
    :cond_3
    sget v1, Lcom/android/settings/R$id;->theme_notification:I

    if-ne v0, v1, :cond_6

    .line 454
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 455
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v1

    const-string v2, "notification_wake_enabled"

    .line 454
    invoke-static {v0, v2, v6, v1}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    if-ne v0, v6, :cond_4

    goto :goto_0

    :cond_4
    move v6, v5

    :goto_0
    if-nez v6, :cond_5

    .line 457
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->aod_horizon_light_snake_tip:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v5}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 459
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->aod_horizon_light_snake_action:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/oneplus/settings/ui/-$$Lambda$OPThemeIconPreference$32z1EioBQt9cLeskTiEIfOEOrw0;

    invoke-direct {v1, p0}, Lcom/oneplus/settings/ui/-$$Lambda$OPThemeIconPreference$32z1EioBQt9cLeskTiEIfOEOrw0;-><init>(Lcom/oneplus/settings/ui/OPThemeIconPreference;)V

    invoke-virtual {p1, v0, v1}, Lcom/google/android/material/snackbar/Snackbar;->setAction(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Lcom/google/android/material/snackbar/Snackbar;

    .line 469
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    return-void

    .line 472
    :cond_5
    new-instance p1, Lcom/android/settings/core/SubSettingLauncher;

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    invoke-direct {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;-><init>(Landroid/content/Context;)V

    const-class p0, Lcom/oneplus/settings/OPCustomNotificationAnimSettings;

    .line 473
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;->setDestination(Ljava/lang/String;)Lcom/android/settings/core/SubSettingLauncher;

    .line 474
    invoke-virtual {p1, v4}, Lcom/android/settings/core/SubSettingLauncher;->setSourceMetricsCategory(I)Lcom/android/settings/core/SubSettingLauncher;

    sget p0, Lcom/android/settings/R$string;->aod_horizon_light:I

    .line 475
    invoke-virtual {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;->setTitleRes(I)Lcom/android/settings/core/SubSettingLauncher;

    .line 476
    invoke-virtual {p1}, Lcom/android/settings/core/SubSettingLauncher;->launch()V

    goto/16 :goto_6

    .line 477
    :cond_6
    sget p1, Lcom/android/settings/R$id;->theme_canvas:I

    if-ne v0, p1, :cond_f

    .line 478
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 479
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, v3, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v0, "set_canvas_from_settings"

    .line 480
    invoke-virtual {p1, v0, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const v0, 0x10008000

    .line 481
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 482
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 483
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_6

    .line 401
    :cond_7
    :goto_1
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oem_acc_blackscreen_gestrue_enable"

    invoke-static {v0, v1, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/16 v1, 0xb

    invoke-static {v0, v1}, Lcom/oneplus/settings/gestures/OPGestureUtils;->get(II)I

    move-result v0

    if-ne v6, v0, :cond_8

    move v0, v6

    goto :goto_2

    :cond_8
    move v0, v5

    .line 403
    :goto_2
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v2

    const-string v3, "prox_wake_enabled"

    invoke-static {v1, v3, v6, v2}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-ne v6, v1, :cond_9

    move v1, v6

    goto :goto_3

    :cond_9
    move v1, v5

    .line 405
    :goto_3
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v3

    const-string v7, "aod_use_ambient_display_enabled"

    invoke-static {v2, v7, v6, v3}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    if-ne v6, v2, :cond_a

    move v2, v6

    goto :goto_4

    :cond_a
    move v2, v5

    :goto_4
    if-nez v0, :cond_b

    if-nez v1, :cond_b

    .line 409
    iget-boolean v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mAlwaysOnEnabled:Z

    if-eqz v0, :cond_d

    :cond_b
    if-nez v2, :cond_c

    goto :goto_5

    :cond_c
    move v6, v5

    :cond_d
    :goto_5
    if-eqz v6, :cond_e

    .line 416
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->oneplus_theme_clock_snake_tip:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v5}, Lcom/google/android/material/snackbar/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    .line 417
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/android/settings/R$string;->oneplus_theme_clock_snake_action:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/oneplus/settings/ui/-$$Lambda$OPThemeIconPreference$1gv9y775WOwpXD6wQNZOPFoL1jI;

    invoke-direct {v1, p0}, Lcom/oneplus/settings/ui/-$$Lambda$OPThemeIconPreference$1gv9y775WOwpXD6wQNZOPFoL1jI;-><init>(Lcom/oneplus/settings/ui/OPThemeIconPreference;)V

    invoke-virtual {p1, v0, v1}, Lcom/google/android/material/snackbar/Snackbar;->setAction(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Lcom/google/android/material/snackbar/Snackbar;

    .line 427
    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    return-void

    .line 430
    :cond_e
    new-instance p1, Lcom/android/settings/core/SubSettingLauncher;

    iget-object p0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    invoke-direct {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;-><init>(Landroid/content/Context;)V

    const-class p0, Lcom/oneplus/settings/OPCustomClockSettings;

    .line 431
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;->setDestination(Ljava/lang/String;)Lcom/android/settings/core/SubSettingLauncher;

    .line 432
    invoke-virtual {p1, v4}, Lcom/android/settings/core/SubSettingLauncher;->setSourceMetricsCategory(I)Lcom/android/settings/core/SubSettingLauncher;

    sget p0, Lcom/android/settings/R$string;->oneplus_theme_clock:I

    .line 433
    invoke-virtual {p1, p0}, Lcom/android/settings/core/SubSettingLauncher;->setTitleRes(I)Lcom/android/settings/core/SubSettingLauncher;

    .line 434
    invoke-virtual {p1}, Lcom/android/settings/core/SubSettingLauncher;->launch()V

    :cond_f
    :goto_6
    return-void
.end method

.method public refreshUI()V
    .locals 4

    .line 180
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mWallpaper:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v0, :cond_0

    .line 181
    iget-object v1, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/oneplus/settings/ui/OPWallPaperUtils;->loadHomeWallpaper(Landroid/content/Context;Landroid/app/WallpaperInfo;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OPSettings-wallpaper-preview--widht:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mWallpaper:Lcom/oneplus/settings/ui/RadiusImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " height:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mWallpaper:Lcom/oneplus/settings/ui/RadiusImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OPThemeIconPreference"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mContext:Landroid/content/Context;

    .line 185
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x0

    .line 186
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v2

    const-string v3, "aod_clock_style"

    .line 184
    invoke-static {v0, v3, v1, v2}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    .line 187
    iget-object v1, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mClockStyle:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v1, :cond_1

    .line 188
    invoke-direct {p0, v0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->getClockStyleImage(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 190
    :cond_1
    iget-object v1, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mClockExtra:Lcom/oneplus/settings/ui/OpClockExtra;

    if-eqz v1, :cond_2

    .line 191
    invoke-virtual {v1, v0}, Lcom/oneplus/settings/ui/OpClockExtra;->update(I)V

    .line 193
    :cond_2
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mFingerprintAnimation:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v0, :cond_3

    .line 194
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->getFodAnimStyleImage()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 196
    :cond_3
    iget-object v0, p0, Lcom/oneplus/settings/ui/OPThemeIconPreference;->mNotificationAnimation:Lcom/oneplus/settings/ui/RadiusImageView;

    if-eqz v0, :cond_4

    .line 198
    invoke-direct {p0}, Lcom/oneplus/settings/ui/OPThemeIconPreference;->getHorizonLightStyleImage()I

    move-result p0

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :cond_4
    return-void
.end method
