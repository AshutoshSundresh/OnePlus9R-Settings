package com.android.settings.applications;

import android.util.Log;
import java.util.ArrayList;

public class UninstallAppsBackend {
    PackageForUninstallCallback callback;
    private ArrayList<String> selectedApps = new ArrayList<>();

    public interface PackageForUninstallCallback {
        void onPackageAddedForUninstall(String str);

        void onPackageRemovedForUninstall(String str);
    }

    public void addApp(String str) {
        if (!isAddedToSelectedAppsList(str)) {
            this.selectedApps.add(str);
            this.callback.onPackageAddedForUninstall(str);
        }
    }

    /* access modifiers changed from: package-private */
    public void removeApp(String str) {
        if (this.selectedApps.contains(str)) {
            this.selectedApps.remove(str);
            this.callback.onPackageRemovedForUninstall(str);
        }
    }

    public boolean isAddedToSelectedAppsList(String str) {
        return this.selectedApps.contains(str);
    }

    public int getSize() {
        return this.selectedApps.size();
    }

    public String get(int i) {
        return this.selectedApps.get(i);
    }

    public void remove(int i) {
        this.selectedApps.remove(i);
    }

    /* access modifiers changed from: package-private */
    public void printList() {
        if (this.selectedApps.size() == 0) {
            Log.d("UninstallAppsBackend", "PrintList: no apps in selected list");
            return;
        }
        Log.d("UninstallAppsBackend", "PrintList: " + this.selectedApps);
    }

    public void removeAll() {
        this.selectedApps.clear();
        printList();
    }

    public void setPackageForUninstallCallback(PackageForUninstallCallback packageForUninstallCallback) {
        this.callback = packageForUninstallCallback;
    }
}
