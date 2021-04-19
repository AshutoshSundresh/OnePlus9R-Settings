package com.oneplus.security.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.oneplus.security.network.calibrate.AutoCalibrateService;
import com.oneplus.security.utils.LogUtils;

public class BootDataTimeReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        LogUtils.d("AutoCalibrateReceiver", "Received broadcast action = " + action);
        Intent intent2 = new Intent(context, AutoCalibrateService.class);
        intent2.putExtra("key_auto_calibrate_service_task", 0);
        context.startService(intent2);
    }
}
