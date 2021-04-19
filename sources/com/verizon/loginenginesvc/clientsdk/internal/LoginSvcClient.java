package com.verizon.loginenginesvc.clientsdk.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import com.verizon.loginenginesvc.ILoginEngineService;
import com.verizon.loginenginesvc.IResponseCallback;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class LoginSvcClient {
    private Runnable mBindTimeoutRunnable = new Runnable() {
        /* class com.verizon.loginenginesvc.clientsdk.internal.LoginSvcClient.AnonymousClass3 */

        public void run() {
            LoginSvcClient.this.cleanup();
            LoginSvcClient.this.handleTimeout();
        }
    };
    private ServiceConnection mConnection = new ServiceConnection() {
        /* class com.verizon.loginenginesvc.clientsdk.internal.LoginSvcClient.AnonymousClass1 */

        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            LoginSvcClient.this.mHandler.removeCallbacks(LoginSvcClient.this.mBindTimeoutRunnable);
            LoginSvcClient.this.mService = ILoginEngineService.Stub.asInterface(iBinder);
            LoginSvcClient.this.performServiceRequest();
        }

        public void onServiceDisconnected(ComponentName componentName) {
            LoginSvcClient.this.handleBindError("service disconnected");
        }

        public void onBindingDied(ComponentName componentName) {
            LoginSvcClient.this.handleBindError("binding died");
        }

        public void onNullBinding(ComponentName componentName) {
            LoginSvcClient.this.handleBindError("null binding");
        }
    };
    protected final Context mContext;
    private final Handler mHandler;
    private boolean mInProgress = false;
    private ILoginEngineService mService = null;
    private IResponseCallback.Stub mSvcCallback = new IResponseCallback.Stub() {
        /* class com.verizon.loginenginesvc.clientsdk.internal.LoginSvcClient.AnonymousClass2 */

        @Override // com.verizon.loginenginesvc.IResponseCallback
        public void onResponse(String str) {
            LoginSvcClient.this.handleServiceResponse(str);
        }
    };
    private Integer mTargetSubscriptionId;
    private Runnable mTimeoutRunnable = new Runnable() {
        /* class com.verizon.loginenginesvc.clientsdk.internal.LoginSvcClient.AnonymousClass4 */

        public void run() {
            LoginSvcClient.this.cleanup();
            LoginSvcClient.this.handleTimeout();
        }
    };

    /* access modifiers changed from: protected */
    public abstract String getOperationName();

    /* access modifiers changed from: protected */
    public abstract void handleError(String str, Throwable th);

    /* access modifiers changed from: protected */
    public abstract void handleResponse(JSONObject jSONObject);

    /* access modifiers changed from: protected */
    public abstract void handleTimeout();

    protected LoginSvcClient(Context context, Integer num, Looper looper) {
        this.mContext = context;
        this.mTargetSubscriptionId = num;
        this.mHandler = new Handler(looper == null ? context.getMainLooper() : looper);
    }

    public synchronized void sendRequest(long j) {
        if (!this.mInProgress) {
            ComponentName serviceComponentName = getServiceComponentName();
            if (serviceComponentName == null) {
                postError("service not found", null);
                return;
            }
            this.mInProgress = true;
            this.mHandler.postDelayed(this.mTimeoutRunnable, j);
            if (j >= 2000) {
                j = 2000;
            }
            performBind(serviceComponentName, j);
        }
    }

    public synchronized void cancelRequest() {
        cleanup();
    }

    private String serializeRequest() {
        try {
            return buildJsonRequest().toString(2);
        } catch (JSONException e) {
            throw new IllegalArgumentException("error serializing request to JSON", e);
        }
    }

    /* access modifiers changed from: protected */
    public JSONObject buildJsonRequest() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("version", 1);
        jSONObject.put("calling-package", this.mContext.getPackageName());
        jSONObject.put("operation", getOperationName());
        Integer num = this.mTargetSubscriptionId;
        if (num != null) {
            jSONObject.put("subscription-id", num.intValue());
        }
        return jSONObject;
    }

    private JSONObject deserializeResponse(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        if (jSONObject.has("result-code")) {
            return jSONObject;
        }
        throw new IllegalArgumentException("missing response parameter: 'result-code'");
    }

    private synchronized void performBind(ComponentName componentName, long j) {
        Intent intent = new Intent();
        intent.setComponent(componentName);
        intent.setAction(ILoginEngineService.class.getName());
        this.mContext.bindService(intent, this.mConnection, 1);
        this.mHandler.postDelayed(this.mBindTimeoutRunnable, j);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private synchronized void performServiceRequest() {
        try {
            this.mService.request(serializeRequest(), this.mSvcCallback);
        } catch (RemoteException unused) {
        } catch (RuntimeException e) {
            postError("runtime exception performing query: " + e.getMessage(), e);
        }
        return;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private synchronized void handleServiceResponse(String str) {
        cleanup();
        try {
            final JSONObject deserializeResponse = deserializeResponse(str);
            this.mHandler.post(new Runnable() {
                /* class com.verizon.loginenginesvc.clientsdk.internal.LoginSvcClient.AnonymousClass5 */

                public void run() {
                    LoginSvcClient.this.handleResponse(deserializeResponse);
                }
            });
        } catch (IllegalArgumentException | JSONException e) {
            postError("error processing response: " + e.getMessage(), e);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void handleBindError(String str) {
        cleanup();
        postError(str, null);
    }

    private void postError(final String str, final Throwable th) {
        this.mHandler.post(new Runnable() {
            /* class com.verizon.loginenginesvc.clientsdk.internal.LoginSvcClient.AnonymousClass6 */

            public void run() {
                LoginSvcClient.this.handleError(str, th);
            }
        });
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private synchronized void cleanup() {
        this.mHandler.removeCallbacks(this.mBindTimeoutRunnable);
        this.mHandler.removeCallbacks(this.mTimeoutRunnable);
        if (this.mService != null) {
            this.mContext.unbindService(this.mConnection);
            this.mService = null;
        }
        this.mInProgress = false;
    }

    /* access modifiers changed from: protected */
    public ComponentName getServiceComponentName() {
        return Settings.findService(this.mContext);
    }
}
