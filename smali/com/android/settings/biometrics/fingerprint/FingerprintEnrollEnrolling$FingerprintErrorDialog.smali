.class public Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;
.super Lcom/android/settings/biometrics/BiometricErrorDialog;
.source "FingerprintEnrollEnrolling.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FingerprintErrorDialog"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 221
    invoke-direct {p0}, Lcom/android/settings/biometrics/BiometricErrorDialog;-><init>()V

    return-void
.end method

.method static newInstance(Ljava/lang/CharSequence;I)Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;
    .locals 3

    .line 223
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;

    invoke-direct {v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;-><init>()V

    .line 224
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "error_msg"

    .line 225
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const-string p0, "error_id"

    .line 226
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 227
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method static newInstance(Ljava/lang/CharSequence;IZ)Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;
    .locals 3

    .line 233
    new-instance v0, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;

    invoke-direct {v0}, Lcom/android/settings/biometrics/fingerprint/FingerprintEnrollEnrolling$FingerprintErrorDialog;-><init>()V

    .line 234
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "error_msg"

    .line 235
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    const-string p0, "error_id"

    .line 236
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "setup_for_back_fingerprint"

    .line 237
    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 238
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public getMetricsCategory()I
    .locals 0

    const/16 p0, 0x239

    return p0
.end method

.method public getOkButtonTextResId()I
    .locals 0

    .line 255
    sget p0, Lcom/android/settings/R$string;->oneplus_fullscreen_gesture_guide_gotit:I

    return p0
.end method

.method public getTitleResId()I
    .locals 0

    .line 250
    sget p0, Lcom/android/settings/R$string;->security_settings_fingerprint_enroll_error_dialog_title:I

    return p0
.end method
