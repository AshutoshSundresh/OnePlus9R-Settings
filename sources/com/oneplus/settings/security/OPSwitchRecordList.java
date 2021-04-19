package com.oneplus.settings.security;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.android.settings.core.InstrumentedFragment;
import com.google.android.material.emptyview.EmptyPageView;
import com.oneplus.settings.edgeeffect.SpringRelativeLayout;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class OPSwitchRecordList extends InstrumentedFragment {
    private ArrayList<SwitchRecordInfo> mAllRecordList = new ArrayList<>();
    private EmptyPageView mEmptyPageView;
    private ContentObserver mRecordContentObserver = new ContentObserver(new Handler()) {
        /* class com.oneplus.settings.security.OPSwitchRecordList.AnonymousClass2 */

        public void onChange(boolean z, Uri uri) {
            super.onChange(z, uri);
            OPSwitchRecordList.this.updateSwitchRecord();
            OPSwitchRecordList.this.setEmptyPageViewVisibility();
            if (OPSwitchRecordList.this.mSwitchRecordAdapter != null) {
                OPSwitchRecordList.this.mSwitchRecordAdapter.setSwitchRecordInfos(OPSwitchRecordList.this.mAllRecordList);
                OPSwitchRecordList.this.mSwitchRecordAdapter.notifyDataSetChanged();
            }
        }
    };
    private boolean mRegistered;
    private SpringRelativeLayout mSpringRelativeLayout;
    private SwitchRecordAdapter mSwitchRecordAdapter;

    @Override // com.android.settingslib.core.instrumentation.Instrumentable
    public int getMetricsCategory() {
        return 9999;
    }

    @Override // com.android.settingslib.core.lifecycle.ObservableFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
        if (getActivity() != null) {
            getActivity().setTitle(C0017R$string.op_switch_record_title);
        }
        updateSwitchRecord();
    }

    @Override // com.android.settings.core.InstrumentedFragment, com.android.settingslib.core.lifecycle.ObservableFragment, androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        if (!this.mRegistered && getContext() != null) {
            getContext().getContentResolver().registerContentObserver(Settings.Global.getUriFor("oneplus_switch_record"), false, this.mRecordContentObserver);
            this.mRegistered = true;
        }
    }

    @Override // com.android.settingslib.core.lifecycle.ObservableFragment, androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        if (this.mRegistered && getContext() != null) {
            getContext().getContentResolver().unregisterContentObserver(this.mRecordContentObserver);
            this.mRegistered = false;
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(C0012R$layout.op_switch_records, (ViewGroup) null);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mSwitchRecordAdapter = new SwitchRecordAdapter(getContext(), this.mAllRecordList);
        RecyclerView recyclerView = (RecyclerView) view.findViewById(C0010R$id.record_list);
        recyclerView.setItemAnimator(null);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext(), 1, false));
        recyclerView.setAdapter(this.mSwitchRecordAdapter);
        SpringRelativeLayout springRelativeLayout = (SpringRelativeLayout) view.findViewById(C0010R$id.spring_layout);
        this.mSpringRelativeLayout = springRelativeLayout;
        springRelativeLayout.addSpringView(C0010R$id.record_list);
        recyclerView.setEdgeEffectFactory(this.mSpringRelativeLayout.createEdgeEffectFactory());
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            /* class com.oneplus.settings.security.OPSwitchRecordList.AnonymousClass1 */
            int state = 0;

            @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int i) {
                this.state = i;
            }

            @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int i, int i2) {
                if (this.state == 1 && i != 0) {
                    OPSwitchRecordList.this.mSpringRelativeLayout.onRecyclerViewScrolled();
                }
            }
        });
        EmptyPageView emptyPageView = (EmptyPageView) view.findViewById(16908292);
        this.mEmptyPageView = emptyPageView;
        emptyPageView.getEmptyTextView().setText(C0017R$string.op_switch_record_none);
        this.mEmptyPageView.getEmptyImageView().setImageResource(C0008R$drawable.op_empty);
        setEmptyPageViewVisibility();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateSwitchRecord() {
        this.mAllRecordList.clear();
        String string = Settings.Global.getString(getContext().getContentResolver(), "oneplus_switch_record");
        Log.d("OPSwitchRecordList", "get switch record:" + string);
        if (!TextUtils.isEmpty(string)) {
            for (String str : string.split("#")) {
                try {
                    String[] split = str.split(":");
                    String format = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date(Long.parseLong(split[0])));
                    Log.d("OPSwitchRecordList", "switch record time:" + split[0] + ", device =" + split[1]);
                    this.mAllRecordList.add(new SwitchRecordInfo(format, split[1]));
                } catch (Exception e) {
                    Log.d("OPSwitchRecordList", "get switch record time exception:" + e.getMessage());
                }
            }
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void setEmptyPageViewVisibility() {
        if (this.mSpringRelativeLayout != null && this.mEmptyPageView != null) {
            if (this.mAllRecordList.size() > 0) {
                this.mSpringRelativeLayout.setVisibility(0);
                this.mEmptyPageView.setVisibility(8);
                return;
            }
            this.mSpringRelativeLayout.setVisibility(8);
            this.mEmptyPageView.setVisibility(0);
        }
    }

    /* access modifiers changed from: package-private */
    public static class SwitchRecordInfo {
        private String mModel;
        private String mTimeStamp;

        public SwitchRecordInfo(String str, String str2) {
            this.mTimeStamp = str;
            this.mModel = str2;
        }

        public String getTimeStamp() {
            return this.mTimeStamp;
        }

        public String getModel() {
            return this.mModel;
        }
    }

    /* access modifiers changed from: package-private */
    public static class SwitchRecordViewHolder extends RecyclerView.ViewHolder {
        private TextView mRecordItemView;

        public SwitchRecordViewHolder(View view) {
            super(view);
            this.mRecordItemView = (TextView) view.findViewById(C0010R$id.record_item);
        }
    }

    /* access modifiers changed from: package-private */
    public static class SwitchRecordAdapter extends RecyclerView.Adapter<SwitchRecordViewHolder> {
        private Context mContext;
        private ArrayList<SwitchRecordInfo> mSwitchRecordInfos;

        public SwitchRecordAdapter(Context context, ArrayList<SwitchRecordInfo> arrayList) {
            this.mContext = context;
            this.mSwitchRecordInfos = arrayList;
        }

        public void setSwitchRecordInfos(ArrayList<SwitchRecordInfo> arrayList) {
            this.mSwitchRecordInfos = arrayList;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public SwitchRecordViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new SwitchRecordViewHolder(LayoutInflater.from(this.mContext).inflate(C0012R$layout.op_switch_record_item, (ViewGroup) null));
        }

        public void onBindViewHolder(SwitchRecordViewHolder switchRecordViewHolder, int i) {
            SwitchRecordInfo switchRecordInfo = this.mSwitchRecordInfos.get(i);
            switchRecordViewHolder.mRecordItemView.setText(String.format(this.mContext.getString(C0017R$string.op_switch_record_info), switchRecordInfo.getTimeStamp(), switchRecordInfo.getModel()));
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.mSwitchRecordInfos.size();
        }
    }
}
