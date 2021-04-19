package com.android.settings.applications;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import com.android.settings.C0010R$id;
import com.android.settings.applications.AppStateBaseBridge;
import com.android.settingslib.applications.ApplicationsState;

public class AppStateUninstallBridge extends AppStateBaseBridge {
    private UninstallAppsBackend mBackend;

    public static final boolean enableSwitch(ApplicationsState.AppEntry appEntry) {
        return true;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.applications.AppStateBaseBridge
    public void updateExtraInfo(ApplicationsState.AppEntry appEntry, String str, int i) {
    }

    public AppStateUninstallBridge(Context context, ApplicationsState applicationsState, AppStateBaseBridge.Callback callback, UninstallAppsBackend uninstallAppsBackend) {
        super(applicationsState, callback);
        this.mBackend = uninstallAppsBackend;
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settings.applications.AppStateBaseBridge
    public void loadAllExtraInfo() {
        if (this.mAppSession.getAllApps() == null) {
        }
    }

    public View.OnClickListener getSwitchOnClickListener(ApplicationsState.AppEntry appEntry) {
        if (appEntry != null) {
            return new View.OnClickListener(appEntry) {
                /* class com.android.settings.applications.$$Lambda$AppStateUninstallBridge$2lHZI2jJHe_b_orlBcsYaeeQNI */
                public final /* synthetic */ ApplicationsState.AppEntry f$1;

                {
                    this.f$1 = r2;
                }

                public final void onClick(View view) {
                    AppStateUninstallBridge.this.lambda$getSwitchOnClickListener$0$AppStateUninstallBridge(this.f$1, view);
                }
            };
        }
        return null;
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$getSwitchOnClickListener$0 */
    public /* synthetic */ void lambda$getSwitchOnClickListener$0$AppStateUninstallBridge(ApplicationsState.AppEntry appEntry, View view) {
        CheckBox checkBox = (CheckBox) ((ViewGroup) view).findViewById(C0010R$id.checkbox);
        if (checkBox != null && checkBox.isEnabled()) {
            checkBox.toggle();
            if (checkBox.isChecked()) {
                this.mBackend.addApp(appEntry.info.packageName);
            } else {
                this.mBackend.removeApp(appEntry.info.packageName);
            }
            this.mBackend.printList();
        }
    }
}
