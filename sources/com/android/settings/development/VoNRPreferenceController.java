package com.android.settings.development;

import android.content.Context;
import android.os.Bundle;
import android.os.ServiceManager;
import android.provider.Settings;
import android.util.Log;
import androidx.preference.Preference;
import androidx.preference.SwitchPreference;
import com.android.settings.core.PreferenceControllerMixin;
import com.android.settingslib.development.DeveloperOptionsPreferenceController;
import java.lang.reflect.Method;
import org.codeaurora.internal.IExtTelephony;

public class VoNRPreferenceController extends DeveloperOptionsPreferenceController implements Preference.OnPreferenceChangeListener, PreferenceControllerMixin {
    static final int SETTING_VALUE_OFF = 0;
    static final int SETTING_VALUE_ON = 1;
    IExtTelephony mExtTelephony = IExtTelephony.Stub.asInterface(ServiceManager.getService("extphone"));

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public String getPreferenceKey() {
        return "vonr_option";
    }

    public VoNRPreferenceController(Context context) {
        super(context);
    }

    @Override // androidx.preference.Preference.OnPreferenceChangeListener
    public boolean onPreferenceChange(Preference preference, Object obj) {
        boolean booleanValue = ((Boolean) obj).booleanValue();
        Settings.Global.putInt(this.mContext.getContentResolver(), "vonr_option", booleanValue ? 1 : 0);
        setVonr(booleanValue);
        Log.d("VoNRPreferenceController", "setVonrEnable: isEnabled = " + booleanValue);
        return true;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public void updateState(Preference preference) {
        boolean z = false;
        if (Settings.Global.getInt(this.mContext.getContentResolver(), "vonr_option", 0) == 1) {
            z = true;
        }
        Log.d("VoNRPreferenceController", "getVonrEnabled: getVonrEnabled from setting = " + z);
        boolean vonr = getVonr();
        Log.d("VoNRPreferenceController", "getVonrEnabled: getVonrEnabled from modem = " + vonr);
        if ((z && !vonr) || (!z && vonr)) {
            setVonr(z);
        }
        ((SwitchPreference) this.mPreference).setChecked(z);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settingslib.development.DeveloperOptionsPreferenceController
    public void onDeveloperOptionsSwitchDisabled() {
        super.onDeveloperOptionsSwitchDisabled();
    }

    private void setVonr(boolean z) {
        try {
            IExtTelephony asInterface = IExtTelephony.Stub.asInterface(ServiceManager.getService("extphone"));
            this.mExtTelephony = asInterface;
            if (asInterface != null) {
                Bundle bundle = new Bundle();
                Method declaredMethod = this.mExtTelephony.getClass().getDeclaredMethod("generalSetter", String.class, Bundle.class);
                declaredMethod.setAccessible(true);
                bundle.putBoolean("enable", z);
                declaredMethod.invoke(this.mExtTelephony, "setVonrEnable", bundle);
            }
        } catch (Exception e) {
            Log.d("VoNRPreferenceController", "setVonrEnable: Exception " + e.toString());
        }
    }

    private boolean getVonr() {
        try {
            IExtTelephony asInterface = IExtTelephony.Stub.asInterface(ServiceManager.getService("extphone"));
            this.mExtTelephony = asInterface;
            if (asInterface == null) {
                return false;
            }
            Bundle bundle = new Bundle();
            Method declaredMethod = this.mExtTelephony.getClass().getDeclaredMethod("generalGetter", String.class, Bundle.class);
            declaredMethod.setAccessible(true);
            return ((Bundle) declaredMethod.invoke(this.mExtTelephony, "getVonrEnable", bundle)).getBoolean("enable", false);
        } catch (Exception e) {
            Log.d("VoNRPreferenceController", "getVonrEnabled: Exception " + e.toString());
            return false;
        }
    }
}
