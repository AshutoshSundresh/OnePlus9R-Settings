package com.android.settings.applications.assist;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.provider.Settings;
import android.service.voice.VoiceInteractionServiceInfo;
import android.text.TextUtils;
import androidx.preference.Preference;
import com.android.internal.app.AssistUtils;
import com.android.settings.C0005R$bool;
import com.android.settings.applications.defaultapps.DefaultAppPreferenceController;
import com.android.settingslib.applications.DefaultAppInfo;
import com.oneplus.settings.utils.OPUtils;
import java.util.List;

public class DefaultAssistPreferenceController extends DefaultAppPreferenceController {
    private final AssistUtils mAssistUtils;
    private final Intent mIntent;
    private final String mPrefKey;
    private final boolean mShowSetting;

    public DefaultAssistPreferenceController(Context context, String str, boolean z) {
        super(context);
        this.mPrefKey = str;
        this.mShowSetting = z;
        this.mAssistUtils = new AssistUtils(context);
        if (this.mPackageManager.getPermissionControllerPackageName() != null) {
            this.mIntent = new Intent("com.oneplus.intent.OPDefaultVoiceAssistPicker");
        } else {
            this.mIntent = null;
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.applications.defaultapps.DefaultAppPreferenceController
    public Intent getSettingIntent(DefaultAppInfo defaultAppInfo) {
        ComponentName assistComponentForUser;
        List<ResolveInfo> queryIntentServices;
        String assistSettingsActivity;
        if (!this.mShowSetting || (assistComponentForUser = this.mAssistUtils.getAssistComponentForUser(this.mUserId)) == null || (queryIntentServices = this.mPackageManager.queryIntentServices(new Intent("android.service.voice.VoiceInteractionService").setPackage(assistComponentForUser.getPackageName()), 128)) == null || queryIntentServices.isEmpty() || (assistSettingsActivity = getAssistSettingsActivity(assistComponentForUser, queryIntentServices.get(0), this.mPackageManager)) == null) {
            return null;
        }
        return new Intent("android.intent.action.MAIN").setComponent(new ComponentName(assistComponentForUser.getPackageName(), assistSettingsActivity));
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public boolean handlePreferenceTreeClick(Preference preference) {
        if (!TextUtils.equals(preference.getKey(), "default_assist")) {
            return false;
        }
        Intent intent = this.mIntent;
        if (intent == null) {
            return true;
        }
        this.mContext.startActivity(intent);
        return true;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public boolean isAvailable() {
        return this.mContext.getResources().getBoolean(C0005R$bool.config_show_assist_and_voice_input);
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public String getPreferenceKey() {
        return this.mPrefKey;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.applications.defaultapps.DefaultAppPreferenceController
    public DefaultAppInfo getDefaultAppInfo() {
        ComponentName currentAssist = getCurrentAssist();
        if (currentAssist == null) {
            return null;
        }
        return new DefaultAppInfo(this.mContext, this.mPackageManager, this.mUserId, currentAssist);
    }

    public ComponentName getCurrentAssist() {
        String stringForUser = Settings.Secure.getStringForUser(this.mContext.getContentResolver(), "oneplus_default_voice_assist_picker_service", this.mUserId);
        if ((TextUtils.isEmpty(stringForUser) || (OPUtils.isAppPakExist(this.mContext, stringForUser.split("/")[0]) && OPUtils.isApplicationEnabled(this.mContext, stringForUser.split("/")[0]))) && stringForUser != null) {
            return ComponentName.unflattenFromString(stringForUser);
        }
        return null;
    }

    /* access modifiers changed from: package-private */
    public String getAssistSettingsActivity(ComponentName componentName, ResolveInfo resolveInfo, PackageManager packageManager) {
        VoiceInteractionServiceInfo voiceInteractionServiceInfo = new VoiceInteractionServiceInfo(packageManager, resolveInfo.serviceInfo);
        if (!voiceInteractionServiceInfo.getSupportsAssist()) {
            return null;
        }
        return voiceInteractionServiceInfo.getSettingsActivity();
    }
}
