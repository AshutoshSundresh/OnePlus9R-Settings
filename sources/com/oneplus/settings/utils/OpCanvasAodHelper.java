package com.oneplus.settings.utils;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

public class OpCanvasAodHelper {
    private static final Uri mCanvasAodUri = Uri.parse("content://net.oneplus.launcher.canvas.CanvasProvider/canvasAODEnabled");
    private Context mContext;

    public OpCanvasAodHelper(Context context) {
        this.mContext = context;
    }

    public Intent getConfirmDialogIntent() {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.oneplus.canvasresources", "com.oneplus.canvasresources.canvaswallpaper.CanvasAodMessageDialog"));
        intent.putExtra("action_code", 0);
        return intent;
    }

    /* JADX WARNING: Removed duplicated region for block: B:16:0x003a  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x005e A[ADDED_TO_REGION] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean isCanvasAodEnabled() {
        /*
            r7 = this;
            java.lang.String r0 = "canvasAODEnabled"
            java.lang.String r1 = "OpCanvasAodHelper"
            r2 = 1
            r3 = 0
            android.content.Context r4 = r7.mContext     // Catch:{ Exception -> 0x0034 }
            android.content.ContentResolver r4 = r4.getContentResolver()     // Catch:{ Exception -> 0x0034 }
            android.net.Uri r5 = com.oneplus.settings.utils.OpCanvasAodHelper.mCanvasAodUri     // Catch:{ Exception -> 0x0034 }
            r6 = 0
            android.os.Bundle r4 = r4.call(r5, r0, r6, r6)     // Catch:{ Exception -> 0x0034 }
            if (r4 == 0) goto L_0x0031
            boolean r0 = r4.getBoolean(r0)     // Catch:{ Exception -> 0x0034 }
            if (r0 == 0) goto L_0x003f
            android.content.Context r7 = r7.mContext     // Catch:{ Exception -> 0x002f }
            android.content.ContentResolver r7 = r7.getContentResolver()     // Catch:{ Exception -> 0x002f }
            java.lang.String r4 = "canvas_aod_enabled"
            int r5 = android.app.ActivityManager.getCurrentUser()     // Catch:{ Exception -> 0x002f }
            int r7 = android.provider.Settings.Secure.getIntForUser(r7, r4, r2, r5)     // Catch:{ Exception -> 0x002f }
            if (r7 != r2) goto L_0x003f
            r7 = r2
            goto L_0x0040
        L_0x002f:
            r7 = move-exception
            goto L_0x0036
        L_0x0031:
            r7 = r3
            r0 = r7
            goto L_0x0040
        L_0x0034:
            r7 = move-exception
            r0 = r3
        L_0x0036:
            boolean r4 = android.os.Build.DEBUG_ONEPLUS
            if (r4 == 0) goto L_0x003f
            java.lang.String r4 = "isCanvasAodEnabled: occur error"
            android.util.Log.e(r1, r4, r7)
        L_0x003f:
            r7 = r3
        L_0x0040:
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            r4.<init>()
            java.lang.String r5 = "isCanvasAodEnabled: enabled="
            r4.append(r5)
            r4.append(r0)
            java.lang.String r5 = ", systemUIEnableCanvas= "
            r4.append(r5)
            r4.append(r7)
            java.lang.String r4 = r4.toString()
            android.util.Log.d(r1, r4)
            if (r0 == 0) goto L_0x0061
            if (r7 == 0) goto L_0x0061
            goto L_0x0062
        L_0x0061:
            r2 = r3
        L_0x0062:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.oneplus.settings.utils.OpCanvasAodHelper.isCanvasAodEnabled():boolean");
    }
}
