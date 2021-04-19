package com.oneplus.settings.utils;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.database.Cursor;
import android.graphics.ImageDecoder;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.settings.C0007R$dimen;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0010R$id;
import com.android.settings.C0012R$layout;
import com.android.settings.C0017R$string;

public class OpBitmojiAodHelper {
    private OnBitmojiAvatarChangedListener mAvatarListener;
    private ContentObserver mBitmojiObserver = new ContentObserver(new Handler()) {
        /* class com.oneplus.settings.utils.OpBitmojiAodHelper.AnonymousClass2 */

        public void onChange(boolean z, Uri uri) {
            if (OpBitmojiAodHelper.this.mAvatarListener != null) {
                OpBitmojiAodHelper.this.mAvatarListener.onBitmojiAvatarChanged();
            }
        }
    };
    private View.OnClickListener mClickListener = new View.OnClickListener() {
        /* class com.oneplus.settings.utils.OpBitmojiAodHelper.AnonymousClass3 */

        public void onClick(View view) {
            int bitmojiStatus = OpBitmojiAodHelper.this.getBitmojiStatus();
            if (bitmojiStatus == 0) {
                try {
                    OpBitmojiAodHelper.this.mContext.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.bitstrips.imoji")));
                } catch (ActivityNotFoundException unused) {
                    if (OPUtils.isO2()) {
                        OpBitmojiAodHelper.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/store/apps/details?id=com.bitstrips.imoji")));
                    }
                }
            } else if (bitmojiStatus == 2) {
                Intent intent = new Intent();
                intent.setComponent(ComponentName.unflattenFromString("com.bitstrips.imoji/.ui.LandingActivity"));
                OpBitmojiAodHelper.this.startActivity(intent);
            } else if (bitmojiStatus == 3) {
                Intent intent2 = new Intent();
                intent2.setComponent(ComponentName.unflattenFromString("com.android.systemui/com.oneplus.aod.utils.bitmoji.OpBitmojiConnectedEntry"));
                OpBitmojiAodHelper.this.startActivity(intent2);
            } else if (bitmojiStatus == 4) {
                OpBitmojiAodHelper.this.mContext.getContentResolver().call(OpBitmojiAodHelper.this.getUri(new String[]{"*"}), "bitmojiDownload", (String) null, (Bundle) null);
            }
        }
    };
    private Context mContext;
    private LayoutInflater mInflater;
    private boolean mRegistered;

    public interface OnBitmojiAvatarChangedListener {
        void onBitmojiAvatarChanged();
    }

    public OpBitmojiAodHelper(Context context) {
        this.mContext = context;
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    public static boolean isBitmojiAodSupported() {
        return OPUtils.isMEARom() && !OPUtils.isH2();
    }

    public int getBitmojiStatus() {
        Cursor query = this.mContext.getContentResolver().query(getUri("bitmojiStatus"), null, null, null);
        if (query == null) {
            return 0;
        }
        try {
            if (query.moveToNext()) {
                int i = query.getInt(query.getColumnIndexOrThrow("status"));
                Log.d("OpBitmojiAodHelper", "getBitmojiAodStatus " + i);
                return i;
            }
            query.close();
            return 0;
        } finally {
            query.close();
        }
    }

    public Drawable getAvatar() {
        if (getBitmojiStatus() == 1) {
            try {
                return ImageDecoder.decodeDrawable(ImageDecoder.createSource(this.mContext.getContentResolver(), getAvatarUri()));
            } catch (Exception e) {
                Log.w("OpBitmojiAodHelper", "getAvatar occur error", e);
            }
        }
        return this.mContext.getResources().getDrawable(C0008R$drawable.op_bitmoji_default_avatar);
    }

    public void handleStatus(ViewGroup viewGroup, Button button) {
        if (viewGroup != null) {
            int bitmojiStatus = getBitmojiStatus();
            if (viewGroup.getChildCount() > 0) {
                ViewGroup viewGroup2 = (ViewGroup) viewGroup.getChildAt(0);
                if (bitmojiStatus == 1) {
                    viewGroup.removeAllViews();
                    viewGroup.setVisibility(8);
                    if (button != null) {
                        button.setEnabled(true);
                        return;
                    }
                    return;
                }
                getButtonReady(viewGroup2, bitmojiStatus);
                getContentReady(viewGroup2, bitmojiStatus);
                if (button != null) {
                    button.setEnabled(false);
                }
            } else if (bitmojiStatus != 1) {
                OPDisplayDensityUtils oPDisplayDensityUtils = new OPDisplayDensityUtils(this.mContext);
                View inflate = this.mInflater.inflate(C0012R$layout.op_bitmoji_clock_guide_layout, (ViewGroup) null, false);
                View findViewById = inflate.findViewById(C0010R$id.info_image);
                LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) findViewById.getLayoutParams();
                layoutParams.width = oPDisplayDensityUtils.convertDpToFixedPx(this.mContext, C0007R$dimen.op_bitmoji_aod_guide_image_width);
                layoutParams.height = oPDisplayDensityUtils.convertDpToFixedPx(this.mContext, C0007R$dimen.op_bitmoji_aod_guide_image_height);
                findViewById.setLayoutParams(layoutParams);
                inflate.findViewById(C0010R$id.bitmoji_button).setOnClickListener(this.mClickListener);
                View findViewById2 = inflate.findViewById(C0010R$id.install_button);
                if (OPUtils.isO2()) {
                    ((ImageView) findViewById2).setImageResource(C0008R$drawable.download_from_playstore);
                }
                LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) findViewById2.getLayoutParams();
                layoutParams2.width = oPDisplayDensityUtils.convertDpToFixedPx(this.mContext, C0007R$dimen.op_bitmoji_aod_download_button_width);
                layoutParams2.height = oPDisplayDensityUtils.convertDpToFixedPx(this.mContext, C0007R$dimen.op_bitmoji_aod_download_button_height);
                findViewById2.setLayoutParams(layoutParams2);
                findViewById2.setOnClickListener(this.mClickListener);
                getButtonReady(inflate, bitmojiStatus);
                getContentReady(inflate, bitmojiStatus);
                viewGroup.addView(inflate, new ViewGroup.LayoutParams(-1, -2));
                viewGroup.setVisibility(0);
                button.setEnabled(false);
            }
        }
    }

    public void registerObserver(OnBitmojiAvatarChangedListener onBitmojiAvatarChangedListener) {
        if (!this.mRegistered) {
            try {
                this.mContext.getContentResolver().registerContentObserver(getAvatarUri(), true, this.mBitmojiObserver);
                this.mAvatarListener = onBitmojiAvatarChangedListener;
                this.mRegistered = true;
            } catch (Exception unused) {
            }
        }
    }

    public void unregisterObserver() {
        if (this.mRegistered) {
            this.mContext.getContentResolver().unregisterContentObserver(this.mBitmojiObserver);
            this.mAvatarListener = null;
            this.mRegistered = false;
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private Uri getUri(String... strArr) {
        Uri.Builder authority = new Uri.Builder().scheme("content").authority("com.oneplus.systemui.ContentProvider");
        for (String str : strArr) {
            authority.appendPath(str);
        }
        return authority.build();
    }

    public Uri getAvatarUri() {
        return getUri("bitmojiAvatar");
    }

    private void getButtonReady(View view, int i) {
        int i2;
        TextView textView = (TextView) view.findViewById(C0010R$id.bitmoji_button_text);
        if (textView != null) {
            if (i == 0) {
                i2 = C0017R$string.op_bitmoji_aod_guide_button;
            } else if (i == 2 || i == 3) {
                i2 = C0017R$string.op_bitmoji_aod_guide_connect;
            } else {
                i2 = i != 4 ? 0 : C0017R$string.op_bitmoji_aod_guide_download;
            }
            textView.setText(i2);
            View findViewById = view.findViewById(C0010R$id.bitmoji_button);
            View findViewById2 = view.findViewById(C0010R$id.install_button);
            if (!OPUtils.isO2() || i != 0) {
                findViewById.setVisibility(0);
                findViewById2.setVisibility(8);
                return;
            }
            findViewById.setVisibility(8);
            findViewById2.setVisibility(0);
        }
    }

    private void getContentReady(View view, int i) {
        TextView textView = (TextView) view.findViewById(C0010R$id.bitmoji_desp);
        if (textView != null) {
            int i2 = 0;
            if (i == 0) {
                i2 = C0017R$string.op_bitmoji_aod_guide_content1;
            } else if (i == 2 || i == 3 || i == 4) {
                i2 = C0017R$string.op_bitmoji_aod_guide_content2;
            }
            textView.setText(i2);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void startActivity(Intent intent) {
        try {
            this.mContext.startActivity(intent);
        } catch (ActivityNotFoundException unused) {
        }
    }
}
