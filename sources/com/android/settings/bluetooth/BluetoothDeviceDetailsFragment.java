package com.android.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.provider.DeviceConfig;
import android.provider.Settings;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import androidx.preference.Preference;
import com.android.settings.C0017R$string;
import com.android.settings.C0019R$xml;
import com.android.settings.dashboard.RestrictedDashboardFragment;
import com.android.settings.overlay.FeatureFactory;
import com.android.settings.slices.BlockingSlicePrefController;
import com.android.settingslib.bluetooth.CachedBluetoothDevice;
import com.android.settingslib.bluetooth.LocalBluetoothManager;
import com.android.settingslib.core.AbstractPreferenceController;
import com.android.settingslib.core.lifecycle.Lifecycle;
import com.oneplus.security.utils.ToastUtil;
import com.oos.onepluspods.service.aidl.IOnePlusPodDevice;
import com.oos.onepluspods.service.aidl.IOnePlusUpdate;
import java.util.ArrayList;
import java.util.List;

public class BluetoothDeviceDetailsFragment extends RestrictedDashboardFragment {
    static int EDIT_DEVICE_NAME_ITEM_ID = 1;
    static TestDataFactory sTestDataFactory;
    CachedBluetoothDevice mCachedDevice;
    private final ServiceConnection mConnection = new ServiceConnection() {
        /* class com.android.settings.bluetooth.BluetoothDeviceDetailsFragment.AnonymousClass1 */

        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            Log.d("BTDeviceDetailsFrg", "onServiceConnected componentName = " + componentName + " iBinder = " + iBinder);
            BluetoothDeviceDetailsFragment.this.mPodsService = IOnePlusPodDevice.Stub.asInterface(iBinder);
            String string = BluetoothDeviceDetailsFragment.this.getArguments().getString("device_address");
            try {
                if (BluetoothDeviceDetailsFragment.this.mPodsService.isOnePlusPods(string)) {
                    BluetoothDeviceDetailsFragment.this.mPodsService.setIOnePlusUpdate(BluetoothDeviceDetailsFragment.this.mStub);
                    BluetoothDeviceDetailsFragment.this.updateOnePlusPodsPreference(string);
                    BluetoothDeviceDetailsFragment.this.mHeadsetFunctionPreference.setVisible(true);
                    if (BluetoothDeviceDetailsFragment.this.mController != null) {
                        BluetoothDeviceDetailsFragment.this.mController.setTwsAddress(true);
                        return;
                    }
                    return;
                }
                BluetoothDeviceDetailsFragment.this.mHeadsetFunctionPreference.setVisible(false);
                BluetoothDeviceDetailsFragment.this.mContext.unbindService(BluetoothDeviceDetailsFragment.this.mConnection);
                BluetoothDeviceDetailsFragment.this.mPodsService = null;
                if (BluetoothDeviceDetailsFragment.this.mController != null) {
                    BluetoothDeviceDetailsFragment.this.mController.setTwsAddress(false);
                }
            } catch (Exception e) {
                Log.d("BTDeviceDetailsFrg", "onServiceConnected e = " + e);
            }
        }

        public void onServiceDisconnected(ComponentName componentName) {
            Log.d("BTDeviceDetailsFrg", "onServiceDisconnected componentName = " + componentName);
        }
    };
    private Context mContext;
    private BluetoothDetailsHeaderController mController;
    String mDeviceAddress;
    private Handler mHandler;
    private Preference mHeadsetFunctionPreference;
    LocalBluetoothManager mManager;
    private IOnePlusPodDevice mPodsService;
    private BroadcastReceiver mReceiver = new BroadcastReceiver() {
        /* class com.android.settings.bluetooth.BluetoothDeviceDetailsFragment.AnonymousClass3 */

        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if ("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED".equals(action)) {
                int intExtra = intent.getIntExtra("android.bluetooth.adapter.extra.CONNECTION_STATE", Integer.MIN_VALUE);
                BluetoothDevice bluetoothDevice = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                if (intExtra == 2) {
                    try {
                        if (BluetoothDeviceDetailsFragment.this.mPodsService == null) {
                            Intent intent2 = new Intent();
                            intent2.setClassName("com.oneplus.twspods", "com.oos.onepluspods.service.MultiDeviceCoreService");
                            intent2.putExtra("address", bluetoothDevice.getAddress());
                            intent2.putExtra("device", bluetoothDevice);
                            BluetoothDeviceDetailsFragment.this.mContext.bindService(intent2, BluetoothDeviceDetailsFragment.this.mConnection, 1);
                        } else if (BluetoothDeviceDetailsFragment.this.mPodsService.isOnePlusPods(bluetoothDevice.getAddress())) {
                            BluetoothDeviceDetailsFragment.this.updateOnePlusPodsPreference(bluetoothDevice.getAddress());
                            BluetoothDeviceDetailsFragment.this.mHeadsetFunctionPreference.setVisible(true);
                        }
                    } catch (Exception e) {
                        Log.d("BTDeviceDetailsFrg", "onReceive e = " + e);
                    }
                } else if (BluetoothDeviceDetailsFragment.this.mDeviceAddress.equals(bluetoothDevice.getAddress())) {
                    BluetoothDeviceDetailsFragment bluetoothDeviceDetailsFragment = BluetoothDeviceDetailsFragment.this;
                    bluetoothDeviceDetailsFragment.mCachedDevice = bluetoothDeviceDetailsFragment.getCachedDevice(bluetoothDeviceDetailsFragment.mDeviceAddress);
                }
            } else if ("android.bluetooth.headset.action.VENDOR_SPECIFIC_HEADSET_EVENT".equals(action)) {
                try {
                    if (BluetoothDeviceDetailsFragment.this.mPodsService != null) {
                        BluetoothDevice bluetoothDevice2 = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                        if ((bluetoothDevice2 == null || BluetoothDeviceDetailsFragment.this.mDeviceAddress.equals(bluetoothDevice2.getAddress())) && bluetoothDevice2 != null && BluetoothDeviceDetailsFragment.this.mPodsService.isOnePlusPods(bluetoothDevice2.getAddress())) {
                            String stringExtra = intent.getStringExtra("android.bluetooth.headset.extra.VENDOR_SPECIFIC_HEADSET_EVENT_CMD");
                            Object[] objArr = (Object[]) intent.getExtras().get("android.bluetooth.headset.extra.VENDOR_SPECIFIC_HEADSET_EVENT_ARGS");
                            if (stringExtra != null && objArr != null && objArr.length == 7) {
                                int batteryLevel = BluetoothDeviceDetailsFragment.this.getBatteryLevel(objArr[2]);
                                int batteryLevel2 = BluetoothDeviceDetailsFragment.this.getBatteryLevel(objArr[4]);
                                int batteryLevel3 = BluetoothDeviceDetailsFragment.this.getBatteryLevel(objArr[6]);
                                Log.d("BTDeviceDetailsFrg", "ACTION_VENDOR_SPECIFIC_HEADSET_EVENT address = " + bluetoothDevice2.getAddress() + ", leftLevel: " + batteryLevel + ", rightLevel: " + batteryLevel2 + ", boxLevel: " + batteryLevel3);
                                BluetoothDeviceDetailsFragment.this.mController.updateSumary(bluetoothDevice2.getAddress(), BluetoothDeviceDetailsFragment.this.getBatteryString(batteryLevel, batteryLevel2, batteryLevel3));
                            }
                        }
                    }
                } catch (Exception e2) {
                    Log.d("BTDeviceDetailsFrg", "onReceive e2 = " + e2);
                }
            } else if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(action)) {
                intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE);
            }
        }
    };
    private IOnePlusUpdate.Stub mStub = new IOnePlusUpdate.Stub() {
        /* class com.android.settings.bluetooth.BluetoothDeviceDetailsFragment.AnonymousClass2 */

        @Override // com.oos.onepluspods.service.aidl.IOnePlusUpdate
        public void updateView(final String str, final int i) {
            BluetoothDeviceDetailsFragment.this.mHandler.post(new Runnable() {
                /* class com.android.settings.bluetooth.BluetoothDeviceDetailsFragment.AnonymousClass2.AnonymousClass1 */

                public void run() {
                    int battaryInfo;
                    try {
                        if (str.equals(BluetoothDeviceDetailsFragment.this.mDeviceAddress)) {
                            Log.d("BTDeviceDetailsFrg", "updateView address = " + str + " content = " + i);
                            if (i == 2 && (battaryInfo = BluetoothDeviceDetailsFragment.this.mPodsService.getBattaryInfo(BluetoothDeviceDetailsFragment.this.getArguments().getString("device_address"))) > 0) {
                                int i = battaryInfo % 1000;
                                int i2 = battaryInfo / 1000;
                                int i3 = i2 % 1000;
                                int i4 = i2 / 1000;
                                int i5 = i4 % 1000;
                                Log.d("BTDeviceDetailsFrg", "updateView detail battery = " + i4 + " left = " + i + " right=" + i3 + " box = " + i5);
                                BluetoothDeviceDetailsFragment.this.mController.updateSumary(str, BluetoothDeviceDetailsFragment.this.getBatteryString(i, i3, i5));
                            }
                        }
                    } catch (Exception e) {
                        Log.d("BTDeviceDetailsFrg", "updateView e = " + e);
                    }
                }
            });
        }
    };

    /* access modifiers changed from: package-private */
    public interface TestDataFactory {
        CachedBluetoothDevice getDevice(String str);

        LocalBluetoothManager getManager(Context context);
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public String getLogTag() {
        return "BTDeviceDetailsFrg";
    }

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 1009;
    }

    public BluetoothDeviceDetailsFragment() {
        super("no_config_bluetooth");
    }

    /* access modifiers changed from: package-private */
    public LocalBluetoothManager getLocalBluetoothManager(Context context) {
        TestDataFactory testDataFactory = sTestDataFactory;
        if (testDataFactory != null) {
            return testDataFactory.getManager(context);
        }
        return Utils.getLocalBtManager(context);
    }

    /* access modifiers changed from: package-private */
    public CachedBluetoothDevice getCachedDevice(String str) {
        TestDataFactory testDataFactory = sTestDataFactory;
        if (testDataFactory != null) {
            return testDataFactory.getDevice(str);
        }
        return this.mManager.getCachedDeviceManager().findDevice(this.mManager.getBluetoothAdapter().getRemoteDevice(str));
    }

    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onAttach(Context context) {
        this.mDeviceAddress = getArguments().getString("device_address");
        this.mManager = getLocalBluetoothManager(context);
        this.mCachedDevice = getCachedDevice(this.mDeviceAddress);
        super.onAttach(context);
        if (this.mCachedDevice == null) {
            Log.w("BTDeviceDetailsFrg", "onAttach() CachedDevice is null!");
            finish();
            return;
        }
        ((AdvancedBluetoothDetailsHeaderController) use(AdvancedBluetoothDetailsHeaderController.class)).init(this.mCachedDevice);
        BluetoothFeatureProvider bluetoothFeatureProvider = FeatureFactory.getFactory(context).getBluetoothFeatureProvider(context);
        ((BlockingSlicePrefController) use(BlockingSlicePrefController.class)).setSliceUri(DeviceConfig.getBoolean("settings_ui", "bt_slice_settings_enabled", true) ? bluetoothFeatureProvider.getBluetoothDeviceSettingsUri(this.mCachedDevice.getDevice()) : null);
    }

    @Override // com.android.settings.SettingsPreferenceFragment, com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settings.dashboard.RestrictedDashboardFragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onResume() {
        super.onResume();
        finishFragmentIfNecessary();
    }

    /* access modifiers changed from: package-private */
    public void finishFragmentIfNecessary() {
        if (this.mCachedDevice.getBondState() == 10) {
            finish();
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment
    public int getPreferenceScreenResId() {
        return C0019R$xml.bluetooth_device_details_fragment;
    }

    @Override // androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        MenuItem add = menu.add(0, EDIT_DEVICE_NAME_ITEM_ID, 0, C0017R$string.bluetooth_rename_button);
        add.setIcon(17302751);
        add.setShowAsAction(2);
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    @Override // androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != EDIT_DEVICE_NAME_ITEM_ID) {
            return super.onOptionsItemSelected(menuItem);
        }
        RemoteDeviceNameDialogFragment.newInstance(this.mCachedDevice).show(getFragmentManager(), "RemoteDeviceName");
        return true;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public List<AbstractPreferenceController> createPreferenceControllers(Context context) {
        ArrayList arrayList = new ArrayList();
        if (this.mCachedDevice != null) {
            Lifecycle settingsLifecycle = getSettingsLifecycle();
            BluetoothDetailsHeaderController bluetoothDetailsHeaderController = new BluetoothDetailsHeaderController(context, this, this.mCachedDevice, settingsLifecycle, this.mManager);
            this.mController = bluetoothDetailsHeaderController;
            arrayList.add(bluetoothDetailsHeaderController);
            arrayList.add(new BluetoothDetailsButtonsController(context, this, this.mCachedDevice, settingsLifecycle));
            arrayList.add(new BluetoothDetailsProfilesController(context, this, this.mManager, this.mCachedDevice, settingsLifecycle));
            arrayList.add(new BluetoothDetailsMacAddressController(context, this, this.mCachedDevice, settingsLifecycle));
        }
        return arrayList;
    }

    @Override // androidx.preference.PreferenceFragmentCompat, com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment, androidx.preference.PreferenceManager.OnPreferenceTreeClickListener
    public boolean onPreferenceTreeClick(Preference preference) {
        Log.d("BTDeviceDetailsFrg", "onPreferenceTreeClick  key = " + preference.getKey());
        if ("headset_function".equals(preference.getKey())) {
            if (!isIntentExisting(this.mContext, "oneplus.intent.action.ONEPLUS_PODS_DISPLAY_EARPHONE")) {
                ToastUtil.showShortToast(this.mContext, getString(C0017R$string.oneplus_buds_need_update));
                return super.onPreferenceTreeClick(preference);
            }
            Intent intent = new Intent("oneplus.intent.action.ONEPLUS_PODS_DISPLAY_EARPHONE");
            intent.addFlags(268435456);
            Bundle bundle = new Bundle();
            bundle.putParcelable("device", this.mCachedDevice.getDevice());
            intent.putExtras(bundle);
            this.mContext.startActivity(intent);
        }
        return super.onPreferenceTreeClick(preference);
    }

    @Override // com.android.settings.SettingsPreferenceFragment, androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settings.dashboard.RestrictedDashboardFragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mContext = getActivity();
        String string = getArguments().getString("device_address");
        this.mDeviceAddress = string;
        CachedBluetoothDevice cachedDevice = getCachedDevice(string);
        this.mCachedDevice = cachedDevice;
        if (cachedDevice != null) {
            Intent intent = new Intent();
            intent.setClassName("com.oneplus.twspods", "com.oos.onepluspods.service.MultiDeviceCoreService");
            intent.putExtra("address", this.mDeviceAddress);
            intent.putExtra("device", this.mCachedDevice.getDevice());
            this.mContext.bindService(intent, this.mConnection, 1);
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED");
            intentFilter.addAction("android.bluetooth.headset.action.VENDOR_SPECIFIC_HEADSET_EVENT");
            intentFilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
            this.mContext.registerReceiver(this.mReceiver, intentFilter);
            Log.d("BTDeviceDetailsFrg", "onCreate binderservice address = " + this.mDeviceAddress);
        }
        this.mHandler = new Handler(this.mContext.getMainLooper());
        Preference findPreference = findPreference("headset_function");
        this.mHeadsetFunctionPreference = findPreference;
        findPreference.setVisible(false);
    }

    @Override // androidx.fragment.app.Fragment, com.android.settings.dashboard.RestrictedDashboardFragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onDestroy() {
        Handler handler = this.mHandler;
        if (handler != null) {
            handler.removeCallbacksAndMessages(null);
        }
        try {
            this.mPodsService.setIOnePlusUpdate(null);
            this.mContext.unbindService(this.mConnection);
        } catch (Exception e) {
            Log.d("BTDeviceDetailsFrg", "unbindService e = " + e);
        }
        try {
            this.mContext.unregisterReceiver(this.mReceiver);
        } catch (Exception e2) {
            Log.d("BTDeviceDetailsFrg", "unregisterReceiver e = " + e2);
        }
        super.onDestroy();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateOnePlusPodsPreference(String str) {
        CachedBluetoothDevice cachedBluetoothDevice = this.mCachedDevice;
        if (cachedBluetoothDevice != null && cachedBluetoothDevice.isConnected()) {
            try {
                int i = Settings.System.getInt(this.mContext.getContentResolver(), "onepluspods_auto_ota_version", -1);
                int i2 = Settings.System.getInt(this.mContext.getContentResolver(), "onepluspods_ota_data_download", -1);
                if (!(i == -1 || i2 == -1)) {
                    Log.d("BTDeviceDetailsFrg", "migrate ota switch state from Settings to OnePlusBuds app");
                    if (this.mPodsService.migrateOtaSwitchState(i, i2)) {
                        Log.d("BTDeviceDetailsFrg", "migrate ota switch state success");
                        Settings.System.putInt(this.mContext.getContentResolver(), "onepluspods_auto_ota_version", -1);
                        Settings.System.putInt(this.mContext.getContentResolver(), "onepluspods_ota_data_download", -1);
                    }
                }
                int battaryInfo = this.mPodsService.getBattaryInfo(getArguments().getString("device_address"));
                if (battaryInfo > 0) {
                    int i3 = battaryInfo % 1000;
                    int i4 = battaryInfo / 1000;
                    int i5 = i4 % 1000;
                    int i6 = i4 / 1000;
                    int i7 = i6 % 1000;
                    Log.d("BTDeviceDetailsFrg", "updateView detail battery = " + i6 + " left = " + i3 + " right=" + i5 + " box = " + i7);
                    this.mController.updateSumary(str, getBatteryString(i3, i5, i7));
                }
            } catch (Exception e) {
                Log.d("BTDeviceDetailsFrg", "updateOnePlusPodsPreference e = " + e);
            }
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private String getBatteryString(int i, int i2, int i3) {
        StringBuilder sb = new StringBuilder();
        if (i > 0) {
            Context context = this.mContext;
            int i4 = C0017R$string.earphone_support_battery_info_left;
            sb.append(context.getString(i4, i + "%"));
        }
        if (i2 > 0) {
            if (i > 0) {
                sb.append(this.mContext.getString(C0017R$string.earphone_support_battery_dot));
            }
            Context context2 = this.mContext;
            int i5 = C0017R$string.earphone_support_battery_info_right;
            sb.append(context2.getString(i5, i2 + "%"));
        }
        if (i3 > 0) {
            if (i > 0 || i2 > 0) {
                sb.append(this.mContext.getString(C0017R$string.earphone_support_battery_dot));
            }
            Context context3 = this.mContext;
            int i6 = C0017R$string.earphone_support_battery_info_box;
            sb.append(context3.getString(i6, i3 + "%"));
        }
        return sb.toString();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private int getBatteryLevel(Object obj) {
        if (obj == null) {
            return 0;
        }
        if (obj instanceof String) {
            return 1;
        }
        int intValue = ((Integer) obj).intValue();
        int i = intValue > 1000 ? intValue % 1000 : (intValue + 1) * 10;
        Log.d("BTDeviceDetailsFrg", "getBatteryLevel value = " + intValue + " level = " + i);
        return i;
    }

    private boolean isIntentExisting(Context context, String str) {
        return context.getPackageManager().queryIntentActivities(new Intent(str), 65536).size() > 0;
    }
}
