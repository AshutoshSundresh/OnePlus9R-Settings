package com.android.settings.network;

import android.app.Activity;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.ServiceManager;
import android.telephony.OpVzwFemtocellInfo;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import org.codeaurora.internal.IExtTelephony;

public class ExtendedNetworkList extends Fragment {
    private static final String TAG = ExtendedNetworkList.class.getSimpleName();
    private LinearLayout mEmptyLayout;
    private ExtenderTask mExtenderTask;
    private LinearLayout mListLayout;
    private LinearLayout mSearchLayout;

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(C0012R$layout.network_extended_list, (ViewGroup) null);
        TextView textView = (TextView) inflate.findViewById(C0010R$id.tv_searching_network);
        ImageView imageView = (ImageView) inflate.findViewById(C0010R$id.iv_empty_state);
        ProgressBar progressBar = (ProgressBar) inflate.findViewById(C0010R$id.progress_bar);
        this.mListLayout = (LinearLayout) inflate.findViewById(C0010R$id.layout_list);
        this.mSearchLayout = (LinearLayout) inflate.findViewById(C0010R$id.layout_search_network);
        this.mEmptyLayout = (LinearLayout) inflate.findViewById(C0010R$id.layout_empty_network);
        if (this.mExtenderTask == null) {
            ExtenderTask extenderTask = new ExtenderTask(new WeakReference(getActivity()));
            this.mExtenderTask = extenderTask;
            extenderTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new String[0][]);
        }
        return inflate;
    }

    @Override // androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private Long[] startScan() {
        String str = TAG;
        try {
            IExtTelephony asInterface = IExtTelephony.Stub.asInterface(ServiceManager.getService("extphone"));
            if (asInterface != null) {
                Log.d(str, "VzwCsgNetworkScaner opVzwCsgNetworkScan()");
                Method declaredMethod = asInterface.getClass().getDeclaredMethod("generalGetter", String.class, Bundle.class);
                declaredMethod.setAccessible(true);
                Bundle bundle = (Bundle) declaredMethod.invoke(asInterface, "opVzwCsgNetworkScan", new Bundle());
                if (bundle != null) {
                    int i = bundle.getInt("length", 0);
                    String[] split = bundle.getString("femtocell_list", "").split(",");
                    if (split.length == 0) {
                        Log.d(str, "csg list is null");
                        return null;
                    }
                    OpVzwFemtocellInfo[] opVzwFemtocellInfoArr = new OpVzwFemtocellInfo[i];
                    Long[] lArr = new Long[split.length];
                    for (int i2 = 0; i2 < split.length; i2++) {
                        int i3 = i2 * 3;
                        try {
                            long longValue = Long.valueOf(split[i3 + 0]).longValue();
                            lArr[i2] = Long.valueOf(longValue);
                            int intValue = Integer.valueOf(split[i3 + 1]).intValue();
                            int intValue2 = Integer.valueOf(split[i3 + 2]).intValue();
                            opVzwFemtocellInfoArr[i2] = new OpVzwFemtocellInfo(longValue, intValue, intValue2);
                            Log.d(str, "VzwCsgNetworkScaner csg item id " + longValue + " status " + intValue + " signalStrength " + intValue2);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    return lArr;
                }
                Log.d(str, "VzwCsgNetworkScaner result is null");
            }
            return null;
        } catch (Exception e2) {
            Log.d("VzwCsgNetworkScaner", "exception : " + e2);
            return null;
        }
    }

    private void handleUI(int i) {
        if (i == 1) {
            this.mSearchLayout.setVisibility(0);
            this.mListLayout.setVisibility(8);
            this.mEmptyLayout.setVisibility(8);
        } else if (i == 2) {
            this.mSearchLayout.setVisibility(8);
            this.mListLayout.setVisibility(0);
            this.mEmptyLayout.setVisibility(8);
        } else if (i == 3) {
            this.mSearchLayout.setVisibility(8);
            this.mListLayout.setVisibility(8);
            this.mEmptyLayout.setVisibility(0);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void onSearchStarted() {
        handleUI(1);
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        ExtenderTask extenderTask = this.mExtenderTask;
        if (extenderTask != null && extenderTask.getStatus() == AsyncTask.Status.RUNNING) {
            this.mExtenderTask.cancel(true);
            this.mExtenderTask = null;
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void onSearchCompleted(Long[] lArr) {
        if (lArr == null) {
            handleUI(3);
            return;
        }
        for (Long l : lArr) {
            TextView textView = new TextView(getActivity());
            textView.setText("CSG Id: " + l);
            textView.setPadding(40, 10, 0, 0);
            this.mListLayout.addView(textView);
            this.mListLayout.invalidate();
            handleUI(2);
        }
    }

    public class ExtenderTask extends AsyncTask<String[], String[], Long[]> {
        private Activity mActivity;

        ExtenderTask(WeakReference<Context> weakReference) {
            this.mActivity = (Activity) weakReference.get();
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            super.onPreExecute();
            ExtendedNetworkList.this.onSearchStarted();
        }

        /* access modifiers changed from: protected */
        public Long[] doInBackground(String[]... strArr) {
            return ExtendedNetworkList.this.startScan();
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Long[] lArr) {
            Activity activity = this.mActivity;
            if (activity != null && !activity.isFinishing()) {
                ExtendedNetworkList.this.onSearchCompleted(lArr);
            }
            super.onPostExecute((Object) lArr);
            ExtendedNetworkList.this.mExtenderTask = null;
        }
    }
}
