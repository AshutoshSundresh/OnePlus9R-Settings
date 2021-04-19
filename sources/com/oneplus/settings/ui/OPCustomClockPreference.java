package com.oneplus.settings.ui;

import android.app.ActivityManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.hardware.fingerprint.FingerprintManager;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.OpFeatures;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.preference.Preference;
import androidx.recyclerview.widget.RecyclerView;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.Utils;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import com.oneplus.settings.gestures.OPGestureUtils;
import com.oneplus.settings.ui.OPCustomClockPreference;
import com.oneplus.settings.utils.OPUtils;
import com.oneplus.settings.utils.OpBitmojiAodHelper;
import com.oneplus.settings.utils.OpCanvasAodHelper;
import java.util.ArrayList;
import java.util.List;

public class OPCustomClockPreference extends Preference {
    private static final boolean IS_SUPPORT_AOD_ALWAYS_ON = OpFeatures.isSupport(new int[]{300});
    private static final boolean SUPPORT_FOD = OPUtils.isSupportCustomFingerprint();
    private boolean mAlwaysOnEnabled;
    private OpBitmojiAodHelper mBitmojiAodHelper;
    public OpBitmojiAodHelper.OnBitmojiAvatarChangedListener mBitmojiAvatarListener;
    private OpCanvasAodHelper mCanvasAodHelper;
    private OPCustomItemEntityViewHolder mCurrentVH;
    private FingerprintManager mFingerprintManager;
    private FirstPreviewHelper mFirstPreviewHelper;
    private ViewGroup mGuideContainer;
    private final boolean mIsSupportMsdAodInfo;
    private final List<ItemEntity> mItemEntities;
    private int mLastIndex;
    private ImageView mPreView;
    private OpClockExtra mPreViewExtra;
    private Button mSaveButton;
    private int mSelectedIndex;
    private SettingsPreferenceFragment mSettingsPreferenceFragment;
    private ImageView mShowInfo;

    public void setSettingsPreferenceFragment(SettingsPreferenceFragment settingsPreferenceFragment) {
        this.mSettingsPreferenceFragment = settingsPreferenceFragment;
    }

    public OPCustomClockPreference(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.mItemEntities = new ArrayList();
        this.mIsSupportMsdAodInfo = OPUtils.isSupportMsdAodInfo();
        this.mAlwaysOnEnabled = false;
        this.mBitmojiAvatarListener = new OpBitmojiAodHelper.OnBitmojiAvatarChangedListener() {
            /* class com.oneplus.settings.ui.OPCustomClockPreference.AnonymousClass6 */

            @Override // com.oneplus.settings.utils.OpBitmojiAodHelper.OnBitmojiAvatarChangedListener
            public void onBitmojiAvatarChanged() {
                OPCustomClockPreference.this.updateBitmojiGuideViewIfNeeded();
            }
        };
        this.mLastIndex = Settings.Secure.getIntForUser(getContext().getContentResolver(), "aod_clock_style", 0, ActivityManager.getCurrentUser());
        setLayoutResource(C0012R$layout.op_custom_clock_choose_layout);
        this.mFingerprintManager = Utils.getFingerprintManagerOrNull(getContext());
        this.mFirstPreviewHelper = new FirstPreviewHelper(context);
        this.mCanvasAodHelper = new OpCanvasAodHelper(context);
        this.mBitmojiAodHelper = new OpBitmojiAodHelper(context);
    }

    public OPCustomClockPreference(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public OPCustomClockPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public OPCustomClockPreference(Context context) {
        this(context, null);
    }

    public void onResume() {
        this.mBitmojiAodHelper.registerObserver(this.mBitmojiAvatarListener);
        updateBitmojiGuideViewIfNeeded();
    }

    public void onPause() {
        this.mBitmojiAodHelper.unregisterObserver();
    }

    public void saveSelectedClock() {
        int currentUser = ActivityManager.getCurrentUser();
        Settings.Secure.putIntForUser(getContext().getContentResolver(), "aod_clock_style", this.mItemEntities.get(this.mSelectedIndex).type, currentUser);
        boolean z = false;
        if (this.mItemEntities.get(this.mSelectedIndex).type == 1) {
            Settings.System.putIntForUser(getContext().getContentResolver(), "aod_smart_display_enabled", 0, currentUser);
        } else {
            boolean z2 = 1 == Settings.Secure.getIntForUser(getContext().getContentResolver(), "doze_enabled", 0, currentUser);
            boolean z3 = 1 == Settings.System.getIntForUser(getContext().getContentResolver(), "prox_wake_enabled", 0, currentUser);
            if (SUPPORT_FOD) {
                if (OPGestureUtils.get(Settings.System.getInt(getContext().getContentResolver(), "oem_acc_blackscreen_gestrue_enable", 0), 11) == 1) {
                    z = true;
                }
                if (z2 && (z3 || z)) {
                    Settings.System.putIntForUser(getContext().getContentResolver(), "aod_smart_display_enabled", 1, currentUser);
                }
            } else if (z2 && z3) {
                Settings.System.putIntForUser(getContext().getContentResolver(), "aod_smart_display_enabled", 1, currentUser);
            }
        }
        OPUtils.sendAppTrackerForClockStyle();
    }

    public boolean needShowWarningDialog() {
        for (int i = 0; i < this.mItemEntities.size(); i++) {
            if (this.mItemEntities.get(i).selected) {
                if (this.mLastIndex != this.mItemEntities.get(i).type) {
                    return true;
                } else {
                    return false;
                }
            }
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r2v31, types: [int, boolean] */
    /* JADX WARN: Type inference failed for: r7v30, types: [int, boolean] */
    /* JADX WARNING: Unknown variable types count: 2 */
    @Override // androidx.preference.Preference
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onBindViewHolder(androidx.preference.PreferenceViewHolder r31) {
        /*
        // Method dump skipped, instructions count: 1201
        */
        throw new UnsupportedOperationException("Method not decompiled: com.oneplus.settings.ui.OPCustomClockPreference.onBindViewHolder(androidx.preference.PreferenceViewHolder):void");
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        Log.i("OPCustomClockPreference", "onActivityResult: resultCode= " + i2);
        if (i == 100 && i2 == -1) {
            save();
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateBitmojiGuideViewIfNeeded() {
        if (isBitmojiClockSelected()) {
            changeAdaptive(12);
        }
    }

    private boolean isBitmojiClockSelected() {
        int i = this.mSelectedIndex;
        if (i < 0 || i >= this.mItemEntities.size() || this.mItemEntities.get(this.mSelectedIndex).type != 12) {
            return false;
        }
        return true;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void save() {
        saveSelectedClock();
        SettingsPreferenceFragment settingsPreferenceFragment = this.mSettingsPreferenceFragment;
        if (settingsPreferenceFragment != null) {
            settingsPreferenceFragment.finish();
        }
    }

    private boolean needShowNoneClockStyle() {
        FingerprintManager fingerprintManager = this.mFingerprintManager;
        return fingerprintManager != null && fingerprintManager.hasEnrolledFingerprints() && OPUtils.isSupportCustomFingerprint();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void changeAdaptive(int i) {
        this.mGuideContainer.setVisibility(8);
        this.mGuideContainer.removeAllViews();
        this.mSaveButton.setEnabled(true);
        if (i == 40) {
            this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_mcl);
        } else if (i == 50) {
            this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_red);
        } else if (i != 100) {
            switch (i) {
                case 0:
                    this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_smart_space_default);
                    break;
                case 1:
                    this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_none);
                    break;
                case 2:
                    this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_digital_1);
                    break;
                case 3:
                    this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_digital_2);
                    break;
                case 4:
                    this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_text_clock);
                    break;
                case 5:
                    if (!shouldShowMsdPreview()) {
                        this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_bold);
                        break;
                    } else {
                        this.mPreView.setBackgroundResource(C0008R$drawable.msd_op_custom_aodpreview_bold);
                        break;
                    }
                case 6:
                    if (!shouldShowMsdPreview()) {
                        this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_analog_1);
                        break;
                    } else {
                        this.mPreView.setBackgroundResource(C0008R$drawable.msd_op_custom_aodpreview_analog_1);
                        break;
                    }
                case 7:
                    if (!shouldShowMsdPreview()) {
                        this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_analog_2);
                        break;
                    } else {
                        this.mPreView.setBackgroundResource(C0008R$drawable.msd_op_custom_aodpreview_analog_2);
                        break;
                    }
                case 8:
                    if (!shouldShowMsdPreview()) {
                        this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_analog_3);
                        break;
                    } else {
                        this.mPreView.setBackgroundResource(C0008R$drawable.msd_op_custom_aodpreview_analog_3);
                        break;
                    }
                case 9:
                    if (!shouldShowMsdPreview()) {
                        this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_minimalism_1);
                        break;
                    } else {
                        this.mPreView.setBackgroundResource(C0008R$drawable.msd_op_custom_aodpreview_minimalism_1);
                        break;
                    }
                case 10:
                    if (!shouldShowMsdPreview()) {
                        this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_minimalism_2);
                        break;
                    } else {
                        this.mPreView.setBackgroundResource(C0008R$drawable.msd_op_custom_aodpreview_minimalism_2);
                        break;
                    }
                case 11:
                    this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_parsons);
                    break;
                case 12:
                    this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_bitmoji);
                    this.mBitmojiAodHelper.handleStatus(this.mGuideContainer, this.mSaveButton);
                    break;
            }
        } else {
            this.mPreView.setBackgroundResource(C0008R$drawable.op_custom_aodpreview_default);
        }
        this.mPreViewExtra.update(i);
        final ItemEntity itemEntity = this.mItemEntities.get(this.mSelectedIndex);
        this.mShowInfo.setVisibility((itemEntity == null || !itemEntity.hasInfo) ? 4 : 0);
        if (this.mFirstPreviewHelper.isFirstPreview(itemEntity.key_pref)) {
            Log.i("OPCustomClockPreference", "showInfo isFirstPreview, getMdmEventName:" + itemEntity.getMdmEventName() + ", getMdmLabel:" + itemEntity.getMdmLabel());
            OPUtils.sendAnalytics(itemEntity.getMdmEventName(), itemEntity.getMdmLabel(), "1");
            Settings.Secure.putIntForUser(getContext().getContentResolver(), "showinfo_ever_show_".concat(itemEntity.getMdmEventName()), 1, ActivityManager.getCurrentUser());
            showInfoDialog(itemEntity, new Runnable() {
                /* class com.oneplus.settings.ui.OPCustomClockPreference.AnonymousClass3 */

                public void run() {
                    OPCustomClockPreference.this.mFirstPreviewHelper.previewDone(itemEntity.key_pref);
                }
            });
        }
    }

    private boolean shouldShowMsdPreview() {
        return this.mAlwaysOnEnabled & this.mIsSupportMsdAodInfo;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void showInfoDialog(ItemEntity itemEntity) {
        showInfoDialog(itemEntity, null);
    }

    private void showInfoDialog(ItemEntity itemEntity, Runnable runnable) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        if (itemEntity != null && itemEntity.hasInfo) {
            int i9 = itemEntity.type;
            if (i9 == 11) {
                i7 = C0017R$string.aod_clock_parsons;
                i5 = C0017R$string.op_aod_parsons_info_message;
                i8 = C0017R$string.op_aod_parsons_info_button;
                i6 = C0008R$drawable.op_parsons_info_image;
            } else if (i9 != 12) {
                i4 = -1;
                i3 = -1;
                i2 = -1;
                i = -1;
                showInfoDialog(i4, i3, i2, i, runnable);
            } else {
                i7 = C0017R$string.aod_clock_bitmoji;
                i5 = C0017R$string.op_bitmoji_aod_guide_content1;
                i8 = C0017R$string.op_aod_parsons_info_button;
                i6 = C0008R$drawable.op_bitmoji_slice;
            }
            i2 = i5;
            i = i8;
            i3 = i7;
            i4 = i6;
            showInfoDialog(i4, i3, i2, i, runnable);
        }
    }

    private void showInfoDialog(int i, int i2, int i3, int i4, final Runnable runnable) {
        if (i2 != -1 || i3 != -1 || i4 != -1 || i != -1) {
            final BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(getContext());
            View inflate = LayoutInflater.from(getContext()).inflate(C0012R$layout.op_custom_clock_info_detail, (ViewGroup) null);
            ImageView imageView = (ImageView) inflate.findViewById(C0010R$id.aod_clock_detail_preview);
            TextView textView = (TextView) inflate.findViewById(C0010R$id.aod_clock_detail_title);
            TextView textView2 = (TextView) inflate.findViewById(C0010R$id.aod_clock_detail_content);
            Button button = (Button) inflate.findViewById(C0010R$id.ok_button);
            if (i != -1) {
                imageView.setImageResource(i);
            }
            if (i2 != -1) {
                textView.setText(i2);
            }
            if (i3 != -1) {
                textView2.setText(i3);
            }
            bottomSheetDialog.setContentView(inflate);
            if (runnable != null) {
                bottomSheetDialog.setOnShowListener(new DialogInterface.OnShowListener(this) {
                    /* class com.oneplus.settings.ui.OPCustomClockPreference.AnonymousClass4 */

                    public void onShow(DialogInterface dialogInterface) {
                        runnable.run();
                    }
                });
            }
            if (i4 != -1) {
                button.setText(i4);
            }
            button.setOnClickListener(new View.OnClickListener(this) {
                /* class com.oneplus.settings.ui.OPCustomClockPreference.AnonymousClass5 */

                public void onClick(View view) {
                    bottomSheetDialog.dismiss();
                }
            });
            BottomSheetBehavior.from((View) inflate.getParent()).setState(3);
            bottomSheetDialog.show();
        }
    }

    class ChooseStyleAdapter extends RecyclerView.Adapter<OPCustomItemEntityViewHolder> {
        ChooseStyleAdapter() {
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public OPCustomItemEntityViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new OPCustomItemEntityViewHolder(LayoutInflater.from(OPCustomClockPreference.this.getContext()).inflate(C0012R$layout.op_custom_clock_choose_item, (ViewGroup) null));
        }

        public void onBindViewHolder(OPCustomItemEntityViewHolder oPCustomItemEntityViewHolder, int i) {
            ItemEntity itemEntity = (ItemEntity) OPCustomClockPreference.this.mItemEntities.get(i);
            oPCustomItemEntityViewHolder.textView.setText(itemEntity.name);
            oPCustomItemEntityViewHolder.imageView.setImageResource(itemEntity.resId);
            if (itemEntity.selected) {
                oPCustomItemEntityViewHolder.imageViewMask.setVisibility(0);
                oPCustomItemEntityViewHolder.imageView.setSelected(true);
                oPCustomItemEntityViewHolder.textView.setSelected(true);
                OPCustomClockPreference.this.mCurrentVH = oPCustomItemEntityViewHolder;
            } else {
                oPCustomItemEntityViewHolder.imageViewMask.setVisibility(4);
                oPCustomItemEntityViewHolder.imageView.setSelected(false);
                oPCustomItemEntityViewHolder.textView.setSelected(false);
            }
            oPCustomItemEntityViewHolder.extra.update(itemEntity.type);
            oPCustomItemEntityViewHolder.itemView.setOnClickListener(new View.OnClickListener(i, itemEntity, oPCustomItemEntityViewHolder) {
                /* class com.oneplus.settings.ui.$$Lambda$OPCustomClockPreference$ChooseStyleAdapter$bsCHOKBpJvwXSJzNoxB5To7ci3A */
                public final /* synthetic */ int f$1;
                public final /* synthetic */ OPCustomClockPreference.ItemEntity f$2;
                public final /* synthetic */ OPCustomItemEntityViewHolder f$3;

                {
                    this.f$1 = r2;
                    this.f$2 = r3;
                    this.f$3 = r4;
                }

                public final void onClick(View view) {
                    OPCustomClockPreference.ChooseStyleAdapter.this.lambda$onBindViewHolder$0$OPCustomClockPreference$ChooseStyleAdapter(this.f$1, this.f$2, this.f$3, view);
                }
            });
        }

        /* access modifiers changed from: private */
        /* renamed from: lambda$onBindViewHolder$0 */
        public /* synthetic */ void lambda$onBindViewHolder$0$OPCustomClockPreference$ChooseStyleAdapter(int i, ItemEntity itemEntity, OPCustomItemEntityViewHolder oPCustomItemEntityViewHolder, View view) {
            OPCustomClockPreference.this.mSelectedIndex = i;
            OPCustomClockPreference.this.changeAdaptive(itemEntity.type);
            if (OPCustomClockPreference.this.mCurrentVH != null) {
                if (OPCustomClockPreference.this.mCurrentVH.imageViewMask != null) {
                    OPCustomClockPreference.this.mCurrentVH.imageViewMask.setVisibility(4);
                }
                if (OPCustomClockPreference.this.mCurrentVH.imageView != null) {
                    OPCustomClockPreference.this.mCurrentVH.imageView.setSelected(false);
                }
                if (OPCustomClockPreference.this.mCurrentVH.textView != null) {
                    OPCustomClockPreference.this.mCurrentVH.textView.setSelected(false);
                }
            }
            oPCustomItemEntityViewHolder.imageViewMask.setVisibility(0);
            oPCustomItemEntityViewHolder.imageView.setSelected(true);
            oPCustomItemEntityViewHolder.textView.setSelected(true);
            OPCustomClockPreference.this.mCurrentVH = oPCustomItemEntityViewHolder;
            int i2 = 0;
            while (i2 < OPCustomClockPreference.this.mItemEntities.size()) {
                ((ItemEntity) OPCustomClockPreference.this.mItemEntities.get(i2)).selected = i == i2;
                i2++;
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return OPCustomClockPreference.this.mItemEntities.size();
        }
    }

    /* access modifiers changed from: package-private */
    public static class ItemEntity {
        boolean hasInfo;
        String key_pref;
        String name;
        int resId;
        boolean selected;
        int type;

        public ItemEntity(String str, int i, int i2) {
            this.selected = false;
            this.hasInfo = false;
            this.name = str;
            this.resId = i;
            this.type = i2;
        }

        public ItemEntity(String str, int i, int i2, boolean z, String str2) {
            this(str, i, i2);
            this.hasInfo = z;
            this.key_pref = str2;
        }

        public String getMdmEventName() {
            int i = this.type;
            if (i != 11) {
                return i != 12 ? "" : "bitmoji";
            }
            return "insight";
        }

        public String getMdmLabel() {
            int i = this.type;
            if (i != 11) {
                return i != 12 ? "" : "bitmoji_amount";
            }
            return "insight_amount";
        }
    }

    /* access modifiers changed from: private */
    public static class FirstPreviewHelper {
        private Context mContext;

        public FirstPreviewHelper(Context context) {
            this.mContext = context;
        }

        public boolean isFirstPreview(String str) {
            if (!TextUtils.isEmpty(str)) {
                return this.mContext.getSharedPreferences("aod_clock_first_preview_prefs", 0).getBoolean(str, true);
            }
            return false;
        }

        public void previewDone(String str) {
            this.mContext.getSharedPreferences("aod_clock_first_preview_prefs", 0).edit().putBoolean(str, false).apply();
        }
    }
}
