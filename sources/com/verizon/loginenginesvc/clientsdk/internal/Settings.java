package com.verizon.loginenginesvc.clientsdk.internal;

import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.content.pm.Signature;
import java.util.Arrays;
import java.util.List;

public class Settings {
    private static final List<String> ALLOWED_SVC_CERTS = Arrays.asList("0B:A7:6D:BD:55:0A:4C:76:68:BD:7C:85:60:C1:2D:AF:95:14:CC:02", "A1:F6:F0:8B:5D:91:99:55:DD:51:DA:94:88:38:87:14:29:B1:E9:36", "03:FE:29:EF:A0:6C:0B:D8:64:3A:A1:A7:C3:EC:91:A1:A6:57:00:E6", "89:F8:F2:11:15:3C:A6:BB:DE:56:4C:8F:7F:17:2D:72:06:8F:A5:66");
    private static final ComponentName[] SVC_COMPONENTS = {new ComponentName("com.verizon.mips.services", "com.verizon.loginenginesvc.LoginEngineService"), new ComponentName("com.verizon.loginengine.unbranded", "com.verizon.loginenginesvc.LoginEngineService"), new ComponentName("com.motricity.verizon.ssoengine", "com.verizon.loginenginesvc.LoginEngineService")};

    public static ComponentName findService(Context context) {
        ComponentName[] componentNameArr = SVC_COMPONENTS;
        for (ComponentName componentName : componentNameArr) {
            if (isAvailable(context, componentName)) {
                return componentName;
            }
        }
        return null;
    }

    @SuppressLint({"PackageManagerGetSignatures"})
    private static boolean isAvailable(Context context, ComponentName componentName) {
        boolean z;
        if (componentName == null) {
            return false;
        }
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(componentName.getPackageName(), 68);
            if (packageInfo != null) {
                if (packageInfo.services != null) {
                    Signature[] signatureArr = packageInfo.signatures;
                    int length = signatureArr.length;
                    int i = 0;
                    while (true) {
                        if (i >= length) {
                            z = false;
                            break;
                        }
                        String certFingerprint = getCertFingerprint(signatureArr[i]);
                        if (certFingerprint != null && ALLOWED_SVC_CERTS.contains(certFingerprint)) {
                            z = true;
                            break;
                        }
                        i++;
                    }
                    if (!z) {
                        return false;
                    }
                    ServiceInfo[] serviceInfoArr = packageInfo.services;
                    for (ServiceInfo serviceInfo : serviceInfoArr) {
                        if ("com.verizon.loginenginesvc.LoginEngineService".equals(serviceInfo.name)) {
                            return serviceInfo.enabled;
                        }
                    }
                }
            }
        } catch (PackageManager.NameNotFoundException unused) {
        }
        return false;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:25:?, code lost:
        return null;
     */
    /* JADX WARNING: Removed duplicated region for block: B:21:? A[ExcHandler: IOException | NoSuchAlgorithmException | CertificateException (unused java.lang.Throwable), SYNTHETIC, Splitter:B:12:0x0059] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static java.lang.String getCertFingerprint(android.content.pm.Signature r10) {
        /*
        // Method dump skipped, instructions count: 105
        */
        throw new UnsupportedOperationException("Method not decompiled: com.verizon.loginenginesvc.clientsdk.internal.Settings.getCertFingerprint(android.content.pm.Signature):java.lang.String");
    }
}
