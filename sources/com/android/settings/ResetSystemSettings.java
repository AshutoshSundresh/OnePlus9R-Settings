package com.android.settings;

import android.app.ActivityManager;
import android.app.NotificationManager;
import android.app.ProgressDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.om.IOverlayManager;
import android.hardware.display.ColorDisplayManager;
import android.net.ConnectivityManager;
import android.net.wifi.WifiManager;
import android.nfc.NfcAdapter;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.os.UserManager;
import android.provider.DeviceConfig;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.ArraySet;
import android.util.Log;
import android.util.OpFeatures;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;
import androidx.appcompat.app.AlertDialog;
import com.android.internal.view.RotationPolicy;
import com.android.settings.ResetSystemSettings;
import com.android.settings.core.InstrumentedFragment;
import com.android.settings.password.ChooseLockSettingsHelper;
import com.android.settings.wifi.UseOpenWifiPreferenceController;
import com.android.settingslib.bluetooth.LocalBluetoothManager;
import com.android.settingslib.display.DisplayDensityUtils;
import com.oneplus.compat.util.OpThemeNative;
import com.oneplus.settings.OPThemeService;
import com.oneplus.settings.better.OPReadingModeTurnOnPreferenceController;
import com.oneplus.settings.controllers.OPChargeOptimizePreferenceController;
import com.oneplus.settings.gestures.OPGestureUtils;
import com.oneplus.settings.statusbar.Utils;
import com.oneplus.settings.system.OPRamBoostSettings;
import com.oneplus.settings.timer.timepower.SettingsUtil;
import com.oneplus.settings.utils.OPApplicationUtils;
import com.oneplus.settings.utils.OPThemeUtils;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.ProductUtils;
import java.util.HashMap;

public class ResetSystemSettings extends InstrumentedFragment {
    private static final String TAG = ResetSystemSettings.class.getSimpleName();
    private View mContentView;
    private Button mInitiateButton;
    private final View.OnClickListener mInitiateListener = new View.OnClickListener() {
        /* class com.android.settings.ResetSystemSettings.AnonymousClass1 */

        public void onClick(View view) {
            if (!ResetSystemSettings.this.runKeyguardConfirmation(2311)) {
                ResetSystemSettings.this.showFinalConfirmation();
            }
        }
    };
    private ProgressDialog mProgressDialog;
    private ResetSystemSettingsTask mResetSystemSettingsTask;

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 0;
    }

    @Override // com.android.settingslib.core.lifecycle.ObservableFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getActivity().setTitle(C0017R$string.reset_system_settings_title);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(C0012R$layout.reset_system_settings, (ViewGroup) null);
        this.mContentView = inflate;
        Button button = (Button) inflate.findViewById(C0010R$id.initiate_reset_system_settings);
        this.mInitiateButton = button;
        button.setOnClickListener(this.mInitiateListener);
        return this.mContentView;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private boolean runKeyguardConfirmation(int i) {
        return new ChooseLockSettingsHelper(getActivity(), this).launchConfirmationActivity(i, getActivity().getResources().getText(C0017R$string.reset_network_title));
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 2311 && i2 == -1) {
            showFinalConfirmation();
        }
    }

    /* access modifiers changed from: package-private */
    public void showFinalConfirmation() {
        Log.d(TAG, "showFinalConfirmation");
        String string = getActivity().getString(C0017R$string.reset_system_settings_dialog_title);
        String string2 = getActivity().getString(C0017R$string.reset_system_settings_dialog_message);
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(string);
        builder.setMessage(string2);
        builder.setPositiveButton(C0017R$string.okay, new DialogInterface.OnClickListener() {
            /* class com.android.settings.ResetSystemSettings.AnonymousClass2 */

            public void onClick(DialogInterface dialogInterface, int i) {
                Log.d(ResetSystemSettings.TAG, "onClick: Ok");
                ResetSystemSettings resetSystemSettings = ResetSystemSettings.this;
                resetSystemSettings.mProgressDialog = resetSystemSettings.getProgressDialog(resetSystemSettings.getActivity());
                ResetSystemSettings.this.mProgressDialog.show();
                ResetSystemSettings resetSystemSettings2 = ResetSystemSettings.this;
                ResetSystemSettings resetSystemSettings3 = ResetSystemSettings.this;
                resetSystemSettings2.mResetSystemSettingsTask = new ResetSystemSettingsTask(resetSystemSettings3.getActivity());
                ResetSystemSettings.this.mResetSystemSettingsTask.execute(new Void[0]);
            }
        });
        builder.setNegativeButton(C0017R$string.alert_dialog_cancel, new DialogInterface.OnClickListener(this) {
            /* class com.android.settings.ResetSystemSettings.AnonymousClass3 */

            public void onClick(DialogInterface dialogInterface, int i) {
                Log.d(ResetSystemSettings.TAG, "onClick: Cancel");
                dialogInterface.dismiss();
            }
        });
        builder.create().show();
    }

    /* access modifiers changed from: private */
    public class ResetSystemSettingsTask extends AsyncTask<Void, Void, Boolean> {
        private ActivityManager mAm;
        private final Context mContext;
        private Handler mHandler;
        private IOverlayManager mOverlayManager;

        ResetSystemSettingsTask(Context context) {
            this.mContext = context;
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(Void... voidArr) {
            int currentUser = ActivityManager.getCurrentUser();
            ConnectivityManager connectivityManager = (ConnectivityManager) this.mContext.getSystemService("connectivity");
            if (connectivityManager != null) {
                connectivityManager.setAirplaneMode(false);
            }
            Settings.Global.putInt(this.mContext.getContentResolver(), "airplane_mode_on", 0);
            WifiManager wifiManager = (WifiManager) this.mContext.getSystemService("wifi");
            if (wifiManager != null) {
                wifiManager.factoryReset();
            }
            resetBTAndDeviceConnectionCategory(currentUser);
            resetDisplayCategory(currentUser);
            resetSoundAndVibrationCategory(currentUser);
            resetButtonsAndGesturesCategory(currentUser);
            resetPrivacyCategory(currentUser);
            resetLocationCategory(currentUser);
            resetBatteryCategory(currentUser);
            resetStorageCategory();
            resetUtilitiesCategory(currentUser);
            resetSystemCategory();
            Log.d(ResetSystemSettings.TAG, "Reset device name");
            Settings.System.putString(this.mContext.getContentResolver(), "oem_oneplus_devicename", ResetSystemSettings.this.getDefaultDeviceName());
            Settings.System.putString(this.mContext.getContentResolver(), "oem_oneplus_modified_devicename", "null");
            resetCustomizationCategory(currentUser);
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Boolean bool) {
            if (ResetSystemSettings.this.mProgressDialog != null) {
                ResetSystemSettings.this.mProgressDialog.dismiss();
            }
            Toast.makeText(this.mContext, C0017R$string.reset_system_settings_complete_toast, 0).show();
        }

        private void resetBTAndDeviceConnectionCategory(int i) {
            BluetoothAdapter adapter;
            BluetoothManager bluetoothManager = (BluetoothManager) this.mContext.getSystemService("bluetooth");
            if (!(bluetoothManager == null || (adapter = bluetoothManager.getAdapter()) == null)) {
                adapter.factoryReset();
                LocalBluetoothManager instance = LocalBluetoothManager.getInstance(this.mContext, null);
                if (instance != null) {
                    instance.getCachedDeviceManager().clearAllDevices();
                }
            }
            NfcAdapter defaultAdapter = NfcAdapter.getDefaultAdapter(this.mContext);
            defaultAdapter.enable();
            Settings.Global.putInt(this.mContext.getContentResolver(), "wifi_display_on", 0);
            defaultAdapter.disableNdefPush();
            Settings.Global.putString(this.mContext.getContentResolver(), "private_dns_mode", "opportunistic");
            Settings.Global.putString(this.mContext.getContentResolver(), "private_dns_specifier", "");
        }

        private void resetDisplayCategory(int i) {
            Log.d(ResetSystemSettings.TAG, "Reset Night mode");
            ColorDisplayManager colorDisplayManager = (ColorDisplayManager) this.mContext.getSystemService(ColorDisplayManager.class);
            if (colorDisplayManager.getNightDisplayAutoMode() != 0) {
                colorDisplayManager.setNightDisplayAutoMode(0);
            }
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "oem_nightmode_progress_status", 50, -2);
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "oem_nightmode_brightness_progress", 50, -2);
            if (colorDisplayManager.isNightDisplayActivated()) {
                colorDisplayManager.setNightDisplayActivated(false);
            }
            Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "night_display_custom_start_time", 72000000, -2);
            Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "night_display_custom_end_time", 25200000, -2);
            Log.d(ResetSystemSettings.TAG, "Turn on Adaptive brightness");
            Settings.System.putInt(this.mContext.getContentResolver(), "screen_brightness_mode", 1);
            Log.d(ResetSystemSettings.TAG, "Reset Screen timeout");
            if (OpFeatures.isSupport(new int[]{73})) {
                Settings.System.putLong(this.mContext.getContentResolver(), "screen_off_timeout", 30000);
            } else {
                Settings.System.putLong(this.mContext.getContentResolver(), "screen_off_timeout", 60000);
            }
            Log.d(ResetSystemSettings.TAG, "Set Screen calibration as Vivid");
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "screen_color_mode_settings_value", 1, -2);
            Log.d(ResetSystemSettings.TAG, "Set Screen Refresh rate 90");
            Settings.Global.putInt(this.mContext.getContentResolver(), "oneplus_screen_refresh_rate", 2);
            Settings.System.putInt(this.mContext.getContentResolver(), OPReadingModeTurnOnPreferenceController.READING_MODE_STATUS_MANUAL, 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "reading_mode_option_manual", 0);
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "reading_mode_block_notification", 0, i);
            Log.d(ResetSystemSettings.TAG, "Turn off Video enhancer");
            SystemProperties.set("persist.sys.oem.vendor.media.vpp.enable", "false");
            Settings.Global.putInt(this.mContext.getContentResolver(), "op_video_enhancer", 0);
            Log.d(ResetSystemSettings.TAG, "Set font scale to 1.0f");
            Settings.System.putFloat(this.mContext.getContentResolver(), "font_scale", 1.0f);
            Log.d(ResetSystemSettings.TAG, "Reset display size/screen zoon to Small");
            DisplayDensityUtils.clearForcedDisplayDensity(0);
            Settings.System.putInt(this.mContext.getContentResolver(), "status_bar_battery_style", 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "status_bar_show_battery_percent", 1);
            ArraySet<String> iconBlacklist = Utils.getIconBlacklist(Settings.Secure.getStringForUser(this.mContext.getContentResolver(), "icon_blacklist", i));
            String str = ResetSystemSettings.TAG;
            Log.d(str, "mBlacklist = " + iconBlacklist.toString());
            if (!iconBlacklist.contains("networkspeed")) {
                iconBlacklist.add("networkspeed");
            }
            String string = this.mContext.getString(17041307);
            Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "clock_seconds", 0, i);
            if (iconBlacklist.contains(string)) {
                iconBlacklist.remove(string);
            }
            if (!iconBlacklist.contains("rotate")) {
                iconBlacklist.add("rotate");
            }
            if (iconBlacklist.contains("ethernet")) {
                iconBlacklist.remove("ethernet");
            }
            if (iconBlacklist.contains("mobile")) {
                iconBlacklist.remove("mobile");
            }
            if (iconBlacklist.contains("volume")) {
                iconBlacklist.remove("volume");
            }
            if (iconBlacklist.contains("vowifi")) {
                iconBlacklist.remove("vowifi");
            }
            if (iconBlacklist.contains("airplane")) {
                iconBlacklist.remove("airplane");
            }
            if (iconBlacklist.contains("managed_profile")) {
                iconBlacklist.remove("managed_profile");
            }
            if (iconBlacklist.contains("nfc")) {
                iconBlacklist.remove("nfc");
            }
            if (iconBlacklist.contains("zen")) {
                iconBlacklist.remove("zen");
            }
            if (iconBlacklist.contains("cast")) {
                iconBlacklist.remove("cast");
            }
            if (iconBlacklist.contains("wifi")) {
                iconBlacklist.remove("wifi");
            }
            if (iconBlacklist.contains("volte")) {
                iconBlacklist.remove("volte");
            }
            if (iconBlacklist.contains("alarm_clock")) {
                iconBlacklist.remove("alarm_clock");
            }
            if (iconBlacklist.contains("headset")) {
                iconBlacklist.remove("headset");
            }
            if (iconBlacklist.contains("hotspot")) {
                iconBlacklist.remove("hotspot");
            }
            if (iconBlacklist.contains("bluetooth")) {
                iconBlacklist.remove("bluetooth");
            }
            if (iconBlacklist.contains("wlb")) {
                iconBlacklist.remove("wlb");
            }
            Settings.Secure.putStringForUser(this.mContext.getContentResolver(), "icon_blacklist", TextUtils.join(",", iconBlacklist), i);
            Log.d(ResetSystemSettings.TAG, "Turn On Auto-rotate");
            RotationPolicy.setRotationLockForAccessibility(this.mContext, false);
        }

        private void resetCustomizationCategory(int i) {
            Log.d(ResetSystemSettings.TAG, "Reset Preset Theme");
            Intent intent = new Intent();
            intent.setClass(this.mContext, OPThemeService.class);
            this.mContext.startService(intent);
            Handler handler = new Handler(Looper.getMainLooper());
            this.mHandler = handler;
            handler.postDelayed(new Runnable() {
                /* class com.android.settings.$$Lambda$ResetSystemSettings$ResetSystemSettingsTask$84GKT26DadRk0eloaj8DcJV2yjM */

                public final void run() {
                    ResetSystemSettings.ResetSystemSettingsTask.this.lambda$resetCustomizationCategory$0$ResetSystemSettings$ResetSystemSettingsTask();
                }
            }, 100);
            Settings.System.putInt(this.mContext.getContentResolver(), "op_customization_theme_style", 0);
            Settings.Secure.putIntForUser(ResetSystemSettings.this.getContext().getContentResolver(), "aod_clock_style", 0, i);
            boolean isSupportCustomFingerprint = OPUtils.isSupportCustomFingerprint();
            boolean z = 1 == Settings.Secure.getIntForUser(ResetSystemSettings.this.getContext().getContentResolver(), "doze_enabled", 0, i);
            boolean z2 = 1 == Settings.System.getIntForUser(ResetSystemSettings.this.getContext().getContentResolver(), "prox_wake_enabled", 0, i);
            if (isSupportCustomFingerprint) {
                boolean z3 = OPGestureUtils.get(Settings.System.getInt(ResetSystemSettings.this.getContext().getContentResolver(), "oem_acc_blackscreen_gestrue_enable", 0), 11) == 1;
                if (z && (z2 || z3)) {
                    Settings.System.putIntForUser(ResetSystemSettings.this.getContext().getContentResolver(), "aod_smart_display_enabled", 1, i);
                }
            } else if (z && z2) {
                Settings.System.putIntForUser(ResetSystemSettings.this.getContext().getContentResolver(), "aod_smart_display_enabled", 1, i);
            }
            setAnimStyle(0);
            Settings.System.putStringForUser(this.mContext.getContentResolver(), "oneplus_accent_color", "#ff2196f3", -2);
            Settings.System.putStringForUser(this.mContext.getContentResolver(), "oem_white_mode_accent_color", "#ff2196f3", -2);
            Settings.System.putInt(this.mContext.getContentResolver(), "oem_white_mode_accent_color_index", 0);
            SystemProperties.set("persist.sys.theme.accentcolor", "#ff2196f3");
            if (this.mAm == null) {
                ActivityManager activityManager = (ActivityManager) this.mContext.getSystemService("activity");
                this.mAm = activityManager;
                OPApplicationUtils.killProcess(activityManager, true);
                OPThemeUtils.enableTheme("oneplus_shape", OPThemeUtils.getCurrentShapeByIndex(1), ResetSystemSettings.this.getContext());
                OPThemeUtils.setCurrentShape(this.mContext, 1);
            }
            setFontStyle(1);
        }

        /* access modifiers changed from: private */
        /* renamed from: lambda$resetCustomizationCategory$0 */
        public /* synthetic */ void lambda$resetCustomizationCategory$0$ResetSystemSettings$ResetSystemSettingsTask() {
            ActivityManager activityManager = (ActivityManager) this.mContext.getSystemService("activity");
            this.mAm = activityManager;
            OPApplicationUtils.killProcess(activityManager, true);
            OPThemeUtils.enableLightThemes(this.mContext);
        }

        private void resetSoundAndVibrationCategory(int i) {
            Log.d(ResetSystemSettings.TAG, "Reset Earphone mode: Auto play OFF, SMART Answer OFF, Speak Caller ID OFF, BT absolute volume ON");
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "oem_auto_play", 0, i);
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "auto_answer_via_bluetooth", 0, i);
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "oem_notification_ringtone", 0, i);
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "oem_call_information_broadcast", 0, i);
            SystemProperties.set("persist.bluetooth.disableabsvol", "false");
            this.mContext.sendBroadcast(new Intent("android.avrcp.intent.action.ENABLE_ABSVOL"));
            NotificationManager.from(this.mContext).setZenMode(0, null, ResetSystemSettings.TAG);
            Settings.System.putInt(this.mContext.getContentResolver(), "incoming_call_vibrate_mode", 5);
            Settings.System.putInt(this.mContext.getContentResolver(), "incoming_call_vibrate_intensity", 1);
            Settings.System.putInt(this.mContext.getContentResolver(), "vibrate_when_ringing", 1);
            Settings.System.putInt(this.mContext.getContentResolver(), "notice_vibrate_intensity", 1);
            Settings.System.putInt(this.mContext.getContentResolver(), "sound_effects_enabled", 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "dtmf_tone", 1);
            Settings.System.putInt(this.mContext.getContentResolver(), "lockscreen_sounds_enabled", 1);
            Settings.System.putInt(this.mContext.getContentResolver(), "oem_screenshot_sound_enable", 1);
            Settings.System.putInt(this.mContext.getContentResolver(), "haptic_feedback_enabled", 1);
        }

        private void resetButtonsAndGesturesCategory(int i) {
            Settings.System.putInt(this.mContext.getContentResolver(), "oem_zen_media_switch", 1);
            Settings.System.putInt(this.mContext.getContentResolver(), "vibrate_when_ringing", 1);
            resetNavigationBarAndGestures();
            Settings.System.putInt(this.mContext.getContentResolver(), "oem_acc_sensor_rotate_silent", 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "oem_acc_sensor_three_finger", 0);
            UserManager userManager = (UserManager) this.mContext.getSystemService("user");
            if (userManager != null && userManager.isUserRunning(999)) {
                Settings.System.putIntForUser(ResetSystemSettings.this.getActivity().getContentResolver(), "oem_acc_sensor_three_finger", 0, 999);
            }
            Settings.Global.putInt(this.mContext.getContentResolver(), "opguest_answer_call", 0);
            Settings.Global.putInt(this.mContext.getContentResolver(), "opguest_route_audio", 0);
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "op_one_hand_mode_setting", 0, i);
            OPGestureUtils.set0(this.mContext, 7);
            OPGestureUtils.set0(this.mContext, 1);
            OPGestureUtils.set0(this.mContext, 2);
            OPGestureUtils.set0(this.mContext, 3);
            OPGestureUtils.set0(this.mContext, 4);
            OPGestureUtils.set0(this.mContext, 6);
            Settings.System.putString(this.mContext.getContentResolver(), "oem_acc_blackscreen_gesture_o", "");
            OPGestureUtils.set0(this.mContext, 0);
            Settings.System.putString(this.mContext.getContentResolver(), "oem_acc_blackscreen_gesture_v", "");
            OPGestureUtils.set0(this.mContext, 8);
            Settings.System.putString(this.mContext.getContentResolver(), "oem_acc_blackscreen_gesture_s", "");
            OPGestureUtils.set0(this.mContext, 9);
            Settings.System.putString(this.mContext.getContentResolver(), "oem_acc_blackscreen_gesture_m", "");
            OPGestureUtils.set0(this.mContext, 10);
            Settings.System.putString(this.mContext.getContentResolver(), "oem_acc_blackscreen_gesture_w", "");
            Settings.Secure.putInt(this.mContext.getContentResolver(), "camera_double_tap_power_gesture_disabled", 0);
            Settings.System.getInt(this.mContext.getContentResolver(), "quick_turn_on_voice_assistant", 1);
        }

        private void resetPrivacyCategory(int i) {
            Settings.System.putInt(this.mContext.getContentResolver(), "show_password", 1);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "lock_screen_allow_private_notifications", 1);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "lock_screen_show_notifications", 1);
            Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "lock_screen_allow_private_notifications", 1, i);
            Settings.Secure.putIntForUser(this.mContext.getContentResolver(), "lock_screen_show_notifications", 1, i);
        }

        private void resetLocationCategory(int i) {
            Settings.Secure.putInt(this.mContext.getContentResolver(), "location_mode", 3);
            Settings.Global.putInt(this.mContext.getContentResolver(), "wifi_scan_always_enabled", 1);
            Settings.Global.putInt(this.mContext.getContentResolver(), "ble_scan_always_enabled", 1);
        }

        private void resetBatteryCategory(int i) {
            Settings.Global.putInt(this.mContext.getContentResolver(), "automatic_power_save_mode", 0);
            Settings.Global.putInt(this.mContext.getContentResolver(), "low_power_trigger_level", 0);
            Settings.Global.putInt(this.mContext.getContentResolver(), "low_power_sticky_auto_disable_enabled", 1);
            Settings.System.putIntForUser(this.mContext.getContentResolver(), OPChargeOptimizePreferenceController.CHARING_GUARDER_ENABLED, 1, 0);
        }

        private void resetStorageCategory() {
            Settings.Secure.putInt(this.mContext.getContentResolver(), "automatic_storage_manager_enabled", 0);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "automatic_storage_manager_days_to_retain", com.android.settingslib.Utils.getDefaultStorageManagerDaysToRetain(ResetSystemSettings.this.getResources()));
        }

        private void resetNavigationBarAndGestures() {
            Settings.System.putInt(this.mContext.getContentResolver(), "oneplus_fullscreen_gesture_type", 0);
            IOverlayManager asInterface = IOverlayManager.Stub.asInterface(ServiceManager.getService("overlay"));
            this.mOverlayManager = asInterface;
            setNavBarInteractionMode(asInterface, "com.android.internal.systemui.navbar.threebutton");
            Settings.System.putInt(this.mContext.getContentResolver(), "oem_acc_key_define", 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "key_home_long_press_action", 3);
            Settings.System.putInt(this.mContext.getContentResolver(), "key_home_double_tap_action", 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "key_app_switch_long_press_action", 1);
            Settings.System.putInt(this.mContext.getContentResolver(), "key_app_switch_double_tap_action", 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "key_back_long_press_action", 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "key_back_double_tap_action", 0);
        }

        private void setNavBarInteractionMode(IOverlayManager iOverlayManager, String str) {
            String str2 = ResetSystemSettings.TAG;
            Log.d(str2, "setNavBarInteractionMode: overlayPackage = " + str);
            try {
                iOverlayManager.setEnabledExclusiveInCategory(str, -2);
            } catch (RemoteException e) {
                throw e.rethrowFromSystemServer();
            }
        }

        private void resetUtilitiesCategory(int i) {
            Settings.Secure.putInt(this.mContext.getContentResolver(), "op_quickpay_enable", 0);
            Settings.System.putString(this.mContext.getContentResolver(), "def_timepower_config", "060000000000");
            Intent intent = new Intent("com.android.settings.POWER_OP_ON");
            intent.addFlags(285212672);
            this.mContext.sendBroadcast(intent);
            if (OPUtils.isSupportNewPlanPowerOffAlarm()) {
                long[] nearestTime = SettingsUtil.getNearestTime(Settings.System.getString(this.mContext.getContentResolver(), "def_timepower_config"));
                Intent intent2 = new Intent("org.codeaurora.poweroffalarm.action.CANCEL_ALARM");
                intent2.putExtra("time", nearestTime[0]);
                intent2.setPackage("com.qualcomm.qti.poweroffalarm");
                intent2.addFlags(285212672);
                this.mContext.sendBroadcast(intent2);
            }
            Intent intent3 = new Intent("com.android.settings.POWER_CANCEL_OP_OFF");
            intent3.addFlags(285212672);
            this.mContext.sendBroadcast(new Intent(intent3));
            Settings.Secure.putInt(this.mContext.getContentResolver(), "op_force_dark_mode", 0);
            Settings.System.putInt(this.mContext.getContentResolver(), "op_quickreply_ime_adjust", 1);
        }

        private void resetSystemCategory() {
            Settings.Secure.putInt(this.mContext.getContentResolver(), "DummyString", 1);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "accessibility_shortcut_on_lock_screen", 0);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "accessibility_display_magnification_enabled", 0);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "accessibility_display_magnification_navbar_enabled", 0);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "accessibility_display_daltonizer_enabled", 0);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "accessibility_display_daltonizer", 12);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "accessibility_display_inversion_enabled", 0);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "accessibility_large_pointer_icon", 0);
            Settings.Global.putInt(this.mContext.getContentResolver(), "window_animation_scale", 1);
            Settings.Global.putInt(this.mContext.getContentResolver(), "transition_animation_scale", 1);
            Settings.Global.putInt(this.mContext.getContentResolver(), "window_animation_scale", 1);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "incall_power_button_behavior", 1);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "long_press_timeout", UseOpenWifiPreferenceController.REQUEST_CODE_OPEN_WIFI_AUTOMATICALLY);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "accessibility_interactive_ui_timeout_ms", 0);
            if (ResetSystemSettings.this.isRampingRingerEnabled(this.mContext)) {
                Settings.Global.putInt(this.mContext.getContentResolver(), "apply_ramping_ringer", 1);
            } else {
                Settings.Global.putInt(this.mContext.getContentResolver(), "vibrate_when_ringing", 1);
            }
            Settings.System.putInt(this.mContext.getContentResolver(), "notification_vibration_intensity", 2);
            Settings.System.putInt(this.mContext.getContentResolver(), "haptic_feedback_enabled", 1);
            Settings.System.putIntForUser(this.mContext.getContentResolver(), "master_mono", 0, -2);
            Settings.System.putFloatForUser(this.mContext.getContentResolver(), "master_balance", 0.0f, -2);
            Settings.System.putInt(this.mContext.getContentResolver(), "hearing_aid", 0);
            Settings.Secure.putInt(this.mContext.getContentResolver(), "high_text_contrast_enabled", 0);
            Log.d(ResetSystemSettings.TAG, "Turn OFF OTG storage");
            SystemProperties.set("persist.sys.oem.otg_support", "false");
            Settings.Global.putInt(this.mContext.getContentResolver(), "oneplus_otg_auto_disable", 0);
            Log.d(ResetSystemSettings.TAG, "Reset Experience improvement programs");
            resetOnePlusNotifications(this.mContext);
            resetUEProgram(this.mContext);
            Settings.System.putInt(this.mContext.getContentResolver(), "oem_join_stability_plan_settings", 0);
            resetBuiltInAppUpdates(this.mContext);
            Log.d(ResetSystemSettings.TAG, "Turn On RAM boost");
            OPRamBoostSettings.setRamBoostState(this.mContext, true);
        }

        private void resetOnePlusNotifications(Context context) {
            Settings.System.putInt(context.getContentResolver(), "oem_receive_notifications", !ProductUtils.isUsvMode() ? 1 : 0);
            Intent intent = new Intent("net.oneplus.push.action.SWITCH_CHANGED");
            intent.setPackage("net.oneplus.push");
            intent.putExtra("oem_receive_notifications", !ProductUtils.isUsvMode());
            intent.addFlags(268435456);
            context.sendBroadcast(intent);
        }

        private void resetUEProgram(Context context) {
            Settings.System.putInt(context.getContentResolver(), "oem_join_user_plan_settings", 1);
            Intent intent = new Intent();
            intent.setAction("INTENT_START_ODM");
            context.sendOrderedBroadcast(intent, null);
        }

        private void resetBuiltInAppUpdates(Context context) {
            Settings.System.putInt(context.getContentResolver(), "oem_app_updates_enable", 0);
            Intent intent = new Intent("com.oneplus.appupgrader.action.SWITCH_CHANGED");
            intent.setPackage("com.oneplus.appupgrader");
            intent.putExtra("oem_app_updates_enable", false);
            intent.addFlags(268435456);
            context.sendBroadcast(intent, "com.android.settings.RECEIVE_PERMISSION");
        }

        private void setAnimStyle(int i) {
            String str = ResetSystemSettings.TAG;
            Log.d(str, "setAnimStyle value:" + i);
            OPThemeUtils.enableTheme("oneplus_aodnotification", OPThemeUtils.getCurrentHorizonLightByIndex(ResetSystemSettings.this.getActivity(), i), ResetSystemSettings.this.getActivity());
            OPThemeUtils.setCurrentHorizonLight(ResetSystemSettings.this.getActivity(), i);
        }

        private void setFontStyle(final int i) {
            new Thread(new Runnable() {
                /* class com.android.settings.ResetSystemSettings.ResetSystemSettingsTask.AnonymousClass1 */

                public void run() {
                    try {
                        Thread.sleep(300);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    Settings.System.putInt(ResetSystemSettingsTask.this.mContext.getContentResolver(), "oem_font_mode", i);
                    HashMap hashMap = new HashMap();
                    hashMap.put("oneplus_dynamicfont", String.valueOf(i));
                    OpThemeNative.enableTheme(ResetSystemSettingsTask.this.mContext, hashMap);
                }
            }).start();
        }
    }

    /* access modifiers changed from: package-private */
    public boolean isRampingRingerEnabled(Context context) {
        if (Settings.Global.getInt(context.getContentResolver(), "apply_ramping_ringer", 0) != 1 || !DeviceConfig.getBoolean("telephony", "ramping_ringer_enabled", false)) {
            return false;
        }
        return true;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private ProgressDialog getProgressDialog(Context context) {
        ProgressDialog progressDialog = new ProgressDialog(context);
        progressDialog.setIndeterminate(true);
        progressDialog.setCancelable(false);
        progressDialog.setMessage(context.getString(C0017R$string.master_clear_progress_text));
        return progressDialog;
    }

    @Override // com.android.settingslib.core.lifecycle.ObservableFragment, androidx.fragment.app.Fragment
    public void onDestroy() {
        ProgressDialog progressDialog = this.mProgressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
        }
        super.onDestroy();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private String getDefaultDeviceName() {
        String str = SystemProperties.get("ro.display.series");
        return (!OpFeatures.isSupport(new int[]{73}) || TextUtils.isEmpty(str)) ? str : str.replace("Single", "");
    }
}
