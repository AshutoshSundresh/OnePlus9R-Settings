package com.android.settings.connecteddevice;

import android.content.Context;
import android.content.IntentFilter;
import android.icu.text.ListFormatter;
import com.android.settings.C0005R$bool;
import com.android.settings.C0017R$string;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.nfc.NfcPreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.oneplus.settings.utils.OPUtils;
import java.util.ArrayList;

public class TopLevelConnectedDevicesPreferenceController extends BasePreferenceController {
    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ Class<? extends SliceBackgroundWorker> getBackgroundWorkerClass() {
        return super.getBackgroundWorkerClass();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ IntentFilter getIntentFilter() {
        return super.getIntentFilter();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean hasAsyncUpdate() {
        return super.hasAsyncUpdate();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isCopyableSlice() {
        return super.isCopyableSlice();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isPublicSlice() {
        return super.isPublicSlice();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean isSliceable() {
        return super.isSliceable();
    }

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ boolean useDynamicSliceSummary() {
        return super.useDynamicSliceSummary();
    }

    public TopLevelConnectedDevicesPreferenceController(Context context, String str) {
        super(context, str);
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return this.mContext.getResources().getBoolean(C0005R$bool.config_show_top_level_connected_devices) ? 0 : 3;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public CharSequence getSummary() {
        if (!new NfcPreferenceController(this.mContext, NfcPreferenceController.KEY_TOGGLE_NFC).isAvailable()) {
            ArrayList arrayList = new ArrayList();
            String string = this.mContext.getString(C0017R$string.op_wifi_display_summary);
            String lowerCase = this.mContext.getString(C0017R$string.nfc_payment_settings_title).toLowerCase();
            arrayList.add(string);
            arrayList.add(lowerCase);
            return ListFormatter.getInstance().format(arrayList);
        } else if (!OPUtils.isO2()) {
            return this.mContext.getString(C0017R$string.oneplus_top_level_connected_summary);
        } else {
            ArrayList arrayList2 = new ArrayList();
            String string2 = this.mContext.getString(C0017R$string.nfc_quick_toggle_title);
            String string3 = this.mContext.getString(C0017R$string.op_android_auto_title);
            String string4 = this.mContext.getString(C0017R$string.oneplus_wifi_display_settings_title);
            String lowerCase2 = this.mContext.getString(C0017R$string.oneplus_nfc_payment_settings_title).toLowerCase();
            arrayList2.add(string2);
            arrayList2.add(string3);
            arrayList2.add(lowerCase2.toLowerCase());
            arrayList2.add(string4.toLowerCase());
            String format = ListFormatter.getInstance().format(arrayList2);
            if (OPUtils.isEn(this.mContext)) {
                return format.replace("and cast", "cast");
            }
            return OPUtils.isZh(this.mContext) ? format.replace("和", "、") : format;
        }
    }
}
