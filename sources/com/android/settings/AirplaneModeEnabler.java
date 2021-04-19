package com.android.settings;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Looper;
import android.os.UserHandle;
import android.provider.Settings;
import android.telephony.PhoneStateListener;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.View;
import android.widget.CheckBox;
import androidx.appcompat.app.AlertDialog;
import com.android.ims.ImsManager;
import com.android.settings.network.GlobalSettingsChangeListener;
import com.android.settings.network.ProxySubscriptionManager;
import com.android.settings.overlay.FeatureFactory;
import com.android.settingslib.WirelessUtils;
import com.android.settingslib.core.instrumentation.MetricsFeatureProvider;
import com.oneplus.settings.utils.ProductUtils;
import java.lang.ref.WeakReference;
import java.util.List;

public class AirplaneModeEnabler extends GlobalSettingsChangeListener {
    private SharedPreferences airplanePref;
    private final Context mContext;
    private final MetricsFeatureProvider mMetricsFeatureProvider;
    private OnAirplaneModeChangedListener mOnAirplaneModeChangedListener;
    PhoneStateListener mPhoneStateListener = new OPPhoneStateListener(Looper.getMainLooper(), this);
    private TelephonyManager mTelephonyManager;

    public interface OnAirplaneModeChangedListener {
        void onAirplaneModeChanged(boolean z);
    }

    public AirplaneModeEnabler(Context context, OnAirplaneModeChangedListener onAirplaneModeChangedListener) {
        super(context, "airplane_mode_on");
        this.mContext = context;
        this.mMetricsFeatureProvider = FeatureFactory.getFactory(context).getMetricsFeatureProvider();
        this.mOnAirplaneModeChangedListener = onAirplaneModeChangedListener;
        this.mTelephonyManager = (TelephonyManager) context.getSystemService(TelephonyManager.class);
    }

    private static class OPPhoneStateListener extends PhoneStateListener {
        WeakReference<AirplaneModeEnabler> airplaneModeEnablerWeakReference;

        OPPhoneStateListener(Looper looper, AirplaneModeEnabler airplaneModeEnabler) {
            super(looper);
            this.airplaneModeEnablerWeakReference = new WeakReference<>(airplaneModeEnabler);
        }

        public void onRadioPowerStateChanged(int i) {
            if (this.airplaneModeEnablerWeakReference.get() != null) {
                this.airplaneModeEnablerWeakReference.get().onAirplaneModeChanged();
            }
        }
    }

    @Override // com.android.settings.network.GlobalSettingsChangeListener
    public void onChanged(String str) {
        onAirplaneModeChanged();
    }

    public void start() {
        this.mTelephonyManager.listen(this.mPhoneStateListener, 8388608);
    }

    public void stop() {
        this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
    }

    private void setAirplaneModeOn(boolean z) {
        SharedPreferences sharedPreferences = this.mContext.getSharedPreferences("OPPref_airplane", 0);
        this.airplanePref = sharedPreferences;
        boolean z2 = sharedPreferences.getBoolean("airplanechecked", false);
        if (!ProductUtils.isUsvMode() || !z || z2) {
            performAirplaneModeOn(z);
        } else {
            showEnableDialog(z);
        }
    }

    private void showEnableDialog(final boolean z) {
        String str;
        String string = this.mContext.getResources().getString(C0017R$string.airplane_mode);
        if (getVzwVolteOrWiFiCallingStatus()) {
            str = this.mContext.getResources().getString(C0017R$string.airplane_mode_enable_dialog_message_wifi_volte);
        } else {
            str = this.mContext.getResources().getString(C0017R$string.airplane_mode_enable_dialog_message);
        }
        View inflate = View.inflate(this.mContext, C0012R$layout.dialog_checkbox_airplanemode, null);
        final CheckBox checkBox = (CheckBox) inflate.findViewById(C0010R$id.checkbox);
        AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
        builder.setTitle(string);
        builder.setMessage(str);
        builder.setPositiveButton(17039370, new DialogInterface.OnClickListener() {
            /* class com.android.settings.AirplaneModeEnabler.AnonymousClass1 */

            public void onClick(DialogInterface dialogInterface, int i) {
                SharedPreferences.Editor edit = AirplaneModeEnabler.this.airplanePref.edit();
                edit.putBoolean("airplanechecked", checkBox.isChecked());
                edit.commit();
                AirplaneModeEnabler.this.performAirplaneModeOn(z);
            }
        });
        builder.setNegativeButton(17039360, new DialogInterface.OnClickListener() {
            /* class com.android.settings.AirplaneModeEnabler.AnonymousClass2 */

            public void onClick(DialogInterface dialogInterface, int i) {
                if (AirplaneModeEnabler.this.mOnAirplaneModeChangedListener != null) {
                    AirplaneModeEnabler.this.mOnAirplaneModeChangedListener.onAirplaneModeChanged(!z);
                }
                dialogInterface.dismiss();
            }
        });
        builder.setOnDismissListener(new DialogInterface.OnDismissListener() {
            /* class com.android.settings.AirplaneModeEnabler.AnonymousClass3 */

            public void onDismiss(DialogInterface dialogInterface) {
                boolean z = false;
                int i = Settings.Global.getInt(AirplaneModeEnabler.this.mContext.getContentResolver(), "airplane_mode_on", 0);
                if (AirplaneModeEnabler.this.mOnAirplaneModeChangedListener != null) {
                    OnAirplaneModeChangedListener onAirplaneModeChangedListener = AirplaneModeEnabler.this.mOnAirplaneModeChangedListener;
                    if (i == 1) {
                        z = true;
                    }
                    onAirplaneModeChangedListener.onAirplaneModeChanged(z);
                }
            }
        });
        builder.setView(inflate);
        builder.create().show();
    }

    private boolean getVzwVolteOrWiFiCallingStatus() {
        ImsManager instance = ImsManager.getInstance(this.mContext, SubscriptionManager.from(this.mContext).getDefaultDataPhoneId());
        return instance.isWfcEnabledByUser() || instance.isEnhanced4gLteModeSettingEnabledByUser();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void performAirplaneModeOn(boolean z) {
        OnAirplaneModeChangedListener onAirplaneModeChangedListener;
        Settings.Global.putInt(this.mContext.getContentResolver(), "airplane_mode_on", z ? 1 : 0);
        if (!ProductUtils.isUsvMode() && (onAirplaneModeChangedListener = this.mOnAirplaneModeChangedListener) != null) {
            onAirplaneModeChangedListener.onAirplaneModeChanged(z);
        }
        Intent intent = new Intent("android.intent.action.AIRPLANE_MODE");
        intent.putExtra("state", z);
        this.mContext.sendBroadcastAsUser(intent, UserHandle.ALL);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void onAirplaneModeChanged() {
        OnAirplaneModeChangedListener onAirplaneModeChangedListener = this.mOnAirplaneModeChangedListener;
        if (onAirplaneModeChangedListener != null) {
            onAirplaneModeChangedListener.onAirplaneModeChanged(isAirplaneModeOn());
        }
    }

    public boolean isInEcmMode() {
        if (this.mTelephonyManager.getEmergencyCallbackMode()) {
            return true;
        }
        List<SubscriptionInfo> activeSubscriptionsInfo = ProxySubscriptionManager.getInstance(this.mContext).getActiveSubscriptionsInfo();
        if (activeSubscriptionsInfo == null) {
            return false;
        }
        for (SubscriptionInfo subscriptionInfo : activeSubscriptionsInfo) {
            TelephonyManager createForSubscriptionId = this.mTelephonyManager.createForSubscriptionId(subscriptionInfo.getSubscriptionId());
            if (createForSubscriptionId != null && createForSubscriptionId.getEmergencyCallbackMode()) {
                return true;
            }
        }
        return false;
    }

    public void setAirplaneMode(boolean z) {
        if (isInEcmMode()) {
            Log.d("AirplaneModeEnabler", "ECM airplane mode=" + z);
            return;
        }
        this.mMetricsFeatureProvider.action(this.mContext, 177, z);
        setAirplaneModeOn(z);
    }

    public void setAirplaneModeInECM(boolean z, boolean z2) {
        Log.d("AirplaneModeEnabler", "Exist ECM=" + z + ", with airplane mode=" + z2);
        if (z) {
            setAirplaneModeOn(z2);
        } else {
            onAirplaneModeChanged();
        }
    }

    public boolean isAirplaneModeOn() {
        return WirelessUtils.isAirplaneModeOn(this.mContext);
    }
}
