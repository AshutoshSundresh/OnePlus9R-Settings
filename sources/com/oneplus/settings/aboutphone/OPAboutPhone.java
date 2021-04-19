package com.oneplus.settings.aboutphone;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.RemoteException;
import android.provider.SearchIndexableResource;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0010R$id;
import com.android.settings.C0017R$string;
import com.android.settings.C0019R$xml;
import com.android.settings.dashboard.DashboardFragment;
import com.android.settings.search.BaseSearchIndexProvider;
import com.oneplus.settings.aboutphone.SoftwareInfoAdapter;
import com.oneplus.settings.ui.OPLayoutPreference;
import com.oneplus.settings.utils.OPUtils;
import com.qualcomm.qti.remoteSimlock.IUimRemoteSimlockService;
import com.qualcomm.qti.remoteSimlock.IUimRemoteSimlockServiceCallback;
import java.util.Arrays;
import java.util.List;

public class OPAboutPhone extends DashboardFragment implements Contract$View {
    public static final BaseSearchIndexProvider SEARCH_INDEX_DATA_PROVIDER = new BaseSearchIndexProvider() {
        /* class com.oneplus.settings.aboutphone.OPAboutPhone.AnonymousClass4 */

        @Override // com.android.settingslib.search.Indexable$SearchIndexProvider, com.android.settings.search.BaseSearchIndexProvider
        public List<SearchIndexableResource> getXmlResourcesToIndex(Context context, boolean z) {
            SearchIndexableResource searchIndexableResource = new SearchIndexableResource(context);
            searchIndexableResource.xmlResId = C0019R$xml.op_about_phone;
            return Arrays.asList(searchIndexableResource);
        }
    };
    private boolean isBindSimLockServiceSuccess = false;
    private SoftwareInfoAdapter mAdapter;
    private Context mContext;
    private View mCurrentClickView;
    private Toast mDevHitToast;
    private Handler mHandler = new Handler() {
        /* class com.oneplus.settings.aboutphone.OPAboutPhone.AnonymousClass1 */

        public void handleMessage(Message message) {
            SoftwareInfoAdapter.ViewHolder viewHolder;
            super.handleMessage(message);
            if (message.what == 1) {
                Log.d("OPAboutPhone", "update unlock icon");
                if (OPAboutPhone.this.mAdapter != null && OPAboutPhone.this.mRecyclerView != null) {
                    try {
                        boolean booleanValue = ((Boolean) message.obj).booleanValue();
                        int itemCount = OPAboutPhone.this.mAdapter.getItemCount() - 1;
                        if (itemCount > 0 && (viewHolder = (SoftwareInfoAdapter.ViewHolder) OPAboutPhone.this.mRecyclerView.findViewHolderForAdapterPosition(itemCount)) != null) {
                            Log.d("OPAboutPhone", "update unlock icon and item title = " + viewHolder.tvTitle.getText().toString());
                            if (!OPAboutPhone.this.mContext.getString(C0017R$string.op_network_unlock).equals(viewHolder.tvTitle.getText().toString())) {
                                return;
                            }
                            if (booleanValue) {
                                viewHolder.imageView.setImageDrawable(OPAboutPhone.this.mContext.getDrawable(C0008R$drawable.ic_network_locked));
                                viewHolder.tvSummary.setText(C0017R$string.op_unlock_status_locked);
                                return;
                            }
                            viewHolder.imageView.setImageDrawable(OPAboutPhone.this.mContext.getDrawable(C0008R$drawable.ic_network_unlock));
                            viewHolder.tvSummary.setText(C0017R$string.op_unlock_status_unlock);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    };
    private AboutPhonePresenter mPresenter;
    private RecyclerView mRecyclerView;
    private ServiceConnection mSimLockConnection = new ServiceConnection() {
        /* class com.oneplus.settings.aboutphone.OPAboutPhone.AnonymousClass5 */

        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            Log.i("OPAboutPhone", "mSimLockConnection service connected");
            OPAboutPhone.this.uimRemoteSimLockService = IUimRemoteSimlockService.Stub.asInterface(iBinder);
            try {
                OPAboutPhone.this.uimRemoteSimLockService.registerCallback(OPAboutPhone.this.uimRemoteSimlockServiceCallback);
                OPAboutPhone.this.uimRemoteSimLockService.uimRemoteSimlockGetSimlockStatus(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void onServiceDisconnected(ComponentName componentName) {
            Log.i("OPAboutPhone", "mSimLockConnection service disconnected");
        }
    };
    private IUimRemoteSimlockService uimRemoteSimLockService;
    private IUimRemoteSimlockServiceCallback uimRemoteSimlockServiceCallback = new IUimRemoteSimlockServiceCallback.Stub() {
        /* class com.oneplus.settings.aboutphone.OPAboutPhone.AnonymousClass6 */

        @Override // com.qualcomm.qti.remoteSimlock.IUimRemoteSimlockServiceCallback
        public void uimRemoteSimlockGetSimlockStatusResponse(int i, int i2, int i3, long j) throws RemoteException {
            Log.i("OPAboutPhone", "uimRemoteSimlockGetSimlockStatusResponse token:" + i + ", responseCode:" + i2 + ", unlockStatus:" + i3 + ", unlockTime:" + j);
            boolean z = i3 == 0 || i3 == 1;
            Message message = new Message();
            message.what = 1;
            message.obj = Boolean.valueOf(z);
            if (OPNetworkUnlockUtils.getNetworkUnlockStatus(OPAboutPhone.this.mContext) != z) {
                if (OPAboutPhone.this.mHandler != null) {
                    OPAboutPhone.this.mHandler.sendMessageDelayed(message, 50);
                }
                OPNetworkUnlockUtils.saveNetworkUnlockStatus(OPAboutPhone.this.mContext, z);
                if (OPAboutPhone.this.mPresenter != null) {
                    OPAboutPhone.this.mPresenter.updateNetworkUnlockStatus(Boolean.valueOf(z));
                }
            }
        }

        @Override // com.qualcomm.qti.remoteSimlock.IUimRemoteSimlockServiceCallback
        public void uimRemoteSimlockGetVersionResponse(int i, int i2, int i3, int i4) throws RemoteException {
            Log.i("OPAboutPhone", "uimRemoteSimlockGetVersionResponse token:" + i + ", responseCode:" + i2 + ", majorVersion:" + i3 + ", minorVersion:" + i4);
        }

        @Override // com.qualcomm.qti.remoteSimlock.IUimRemoteSimlockServiceCallback
        public void uimRemoteSimlockProcessSimlockDataResponse(int i, int i2, byte[] bArr) throws RemoteException {
            Log.i("OPAboutPhone", "uimRemoteSimlockProcessSimlockDataResponse token:" + i + ", responseCode:" + i2);
        }

        @Override // com.qualcomm.qti.remoteSimlock.IUimRemoteSimlockServiceCallback
        public void uimRemoteSimlockGetSharedKeyResponse(int i, int i2, byte[] bArr) throws RemoteException {
            Log.i("OPAboutPhone", "uimRemoteSimlockProcessSimlockDataResponse token:" + i + ", responseCode:" + i2);
        }

        @Override // com.qualcomm.qti.remoteSimlock.IUimRemoteSimlockServiceCallback
        public void uimRemoteSimlockGenerateHMACResponse(int i, int i2, byte[] bArr) throws RemoteException {
            Log.i("OPAboutPhone", "uimRemoteSimlockGenerateHMACResponse token:" + i + ", responseCode:" + i2);
        }
    };

    /* access modifiers changed from: protected */
    @Override // com.android.settings.dashboard.DashboardFragment
    public String getLogTag() {
        return "OPAboutPhone";
    }

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 9999;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment
    public int getPreferenceScreenResId() {
        return C0019R$xml.op_about_phone;
    }

    @Override // com.android.settings.SettingsPreferenceFragment, androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mContext = getActivity();
        initView();
        this.mPresenter = new AboutPhonePresenter(getActivity(), this, this);
    }

    @Override // com.oneplus.settings.aboutphone.Contract$View
    public void displayHardWarePreference(int i, String str, String str2, String str3, String str4) {
        OPAboutPhoneHardWareController newInstance = OPAboutPhoneHardWareController.newInstance(getActivity(), this, ((OPLayoutPreference) getPreferenceScreen().findPreference("hardware_view")).findViewById(C0010R$id.phone_hardware_info));
        newInstance.setPhoneImage(this.mContext.getDrawable(i));
        newInstance.done();
        newInstance.setCameraMessage(str);
        newInstance.setCpuMessage(str2);
        newInstance.setScreenMessage(str3);
        newInstance.setStorageMessage(str4 + "GB RAM + " + OPUtils.showROMStorage(getActivity()) + " ROM");
        newInstance.done();
    }

    @Override // com.oneplus.settings.aboutphone.Contract$View
    public void displaySoftWarePreference(List<SoftwareInfoEntity> list) {
        SoftwareInfoAdapter softwareInfoAdapter = new SoftwareInfoAdapter(this.mContext, list);
        this.mAdapter = softwareInfoAdapter;
        this.mRecyclerView.setAdapter(softwareInfoAdapter);
        this.mAdapter.notifyDataSetChanged();
        this.mAdapter.setOnItemClickListener(new SoftwareInfoAdapter.OnItemClickListener() {
            /* class com.oneplus.settings.aboutphone.OPAboutPhone.AnonymousClass2 */

            @Override // com.oneplus.settings.aboutphone.SoftwareInfoAdapter.OnItemClickListener
            public void onItemClick(View view, int i) {
                OPAboutPhone.this.mCurrentClickView = view;
                OPAboutPhone.this.mPresenter.onItemClick(i);
            }
        });
    }

    private void initView() {
        this.mRecyclerView = (RecyclerView) ((OPLayoutPreference) getPreferenceScreen().findPreference("soft_view")).findViewById(C0010R$id.phone_software_info).findViewById(C0010R$id.recycler_view_software_info);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this.mContext);
        linearLayoutManager.setOrientation(1);
        this.mRecyclerView.setLayoutManager(linearLayoutManager);
        this.mRecyclerView.setOnTouchListener(new View.OnTouchListener() {
            /* class com.oneplus.settings.aboutphone.OPAboutPhone.AnonymousClass3 */

            public boolean onTouch(View view, MotionEvent motionEvent) {
                OPAboutPhone.this.mRecyclerView.getParent().requestDisallowInterceptTouchEvent(false);
                return false;
            }
        });
    }

    @Override // com.oneplus.settings.aboutphone.Contract$View
    public void performHapticFeedback() {
        View view = this.mCurrentClickView;
        if (view != null) {
            view.performHapticFeedback(1);
        }
    }

    @Override // com.oneplus.settings.aboutphone.Contract$View
    public void showLongToast(int i) {
        showLongToast(this.mContext.getString(i));
    }

    @Override // com.oneplus.settings.aboutphone.Contract$View
    public void showLongToast(String str) {
        Toast makeText = Toast.makeText(getActivity(), str, 1);
        this.mDevHitToast = makeText;
        makeText.show();
    }

    @Override // com.oneplus.settings.aboutphone.Contract$View
    public void cancelToast() {
        Toast toast = this.mDevHitToast;
        if (toast != null) {
            toast.cancel();
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 100) {
            if (i2 == -1) {
                this.mPresenter.enableDevelopmentSettings();
            }
            this.mPresenter.mProcessingLastDevHit = false;
        }
    }

    @Override // com.android.settings.SettingsPreferenceFragment, com.android.settings.core.InstrumentedPreferenceFragment, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onResume() {
        super.onResume();
        this.mPresenter.onResume();
    }

    @Override // androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onStart() {
        super.onStart();
        if (OPUtils.isSupportUstUnify()) {
            bindSimLockService();
        }
    }

    @Override // androidx.preference.PreferenceFragmentCompat, com.android.settings.dashboard.DashboardFragment, androidx.fragment.app.Fragment, com.android.settingslib.core.lifecycle.ObservablePreferenceFragment
    public void onStop() {
        super.onStop();
        if (OPUtils.isSupportUstUnify()) {
            unBindSimLockService();
            Handler handler = this.mHandler;
            if (handler != null) {
                handler.removeCallbacksAndMessages(null);
            }
        }
    }

    private void bindSimLockService() {
        if (isUimLockServiceEnable()) {
            Intent intent = new Intent();
            intent.setComponent(new ComponentName("com.qualcomm.qti.uim", "com.qualcomm.qti.uim.RemoteSimLockService"));
            try {
                this.isBindSimLockServiceSuccess = getActivity().bindService(intent, this.mSimLockConnection, 1);
                Log.d("OPAboutPhone", "bind RemoteSimLockService isBindSimLockServiceSuccess = " + this.isBindSimLockServiceSuccess);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            Log.d("OPAboutPhone", "isSimLockEnable not exist.");
        }
    }

    private void unBindSimLockService() {
        try {
            if (this.isBindSimLockServiceSuccess && this.uimRemoteSimLockService != null) {
                this.uimRemoteSimLockService.deregisterCallback(this.uimRemoteSimlockServiceCallback);
                getActivity().unbindService(this.mSimLockConnection);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Log.d("OPAboutPhone", "unbindService mSimLockConnection.");
    }

    private boolean isUimLockServiceEnable() {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.qualcomm.qti.uim", "com.qualcomm.qti.uim.RemoteSimLockService"));
        List<ResolveInfo> queryIntentServices = getPackageManager().queryIntentServices(intent, 0);
        if (queryIntentServices == null || queryIntentServices.size() <= 0) {
            return false;
        }
        return true;
    }
}
