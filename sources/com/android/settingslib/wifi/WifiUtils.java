package com.android.settingslib.wifi;

import android.content.Context;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.os.SystemClock;
import com.android.settingslib.R$string;
import java.util.Iterator;
import java.util.Map;

public class WifiUtils {
    public static String buildLoggingSummary(AccessPoint accessPoint, WifiConfiguration wifiConfiguration) {
        StringBuilder sb = new StringBuilder();
        WifiInfo info = accessPoint.getInfo();
        if (accessPoint.isActive() && info != null) {
            sb.append(" f=" + Integer.toString(info.getFrequency()));
        }
        sb.append(" " + getVisibilityStatus(accessPoint));
        if (!(wifiConfiguration == null || wifiConfiguration.getNetworkSelectionStatus().getNetworkSelectionStatus() == 0)) {
            sb.append(" (" + wifiConfiguration.getNetworkSelectionStatus().getNetworkStatusString());
            if (wifiConfiguration.getNetworkSelectionStatus().getDisableTime() > 0) {
                long currentTimeMillis = (System.currentTimeMillis() - wifiConfiguration.getNetworkSelectionStatus().getDisableTime()) / 1000;
                long j = currentTimeMillis % 60;
                long j2 = (currentTimeMillis / 60) % 60;
                long j3 = (j2 / 60) % 60;
                sb.append(", ");
                if (j3 > 0) {
                    sb.append(Long.toString(j3) + "h ");
                }
                sb.append(Long.toString(j2) + "m ");
                sb.append(Long.toString(j) + "s ");
            }
            sb.append(")");
        }
        if (wifiConfiguration != null) {
            WifiConfiguration.NetworkSelectionStatus networkSelectionStatus = wifiConfiguration.getNetworkSelectionStatus();
            for (int i = 0; i <= WifiConfiguration.NetworkSelectionStatus.getMaxNetworkSelectionDisableReason(); i++) {
                if (networkSelectionStatus.getDisableReasonCounter(i) != 0) {
                    sb.append(" ");
                    sb.append(WifiConfiguration.NetworkSelectionStatus.getNetworkSelectionDisableReasonString(i));
                    sb.append("=");
                    sb.append(networkSelectionStatus.getDisableReasonCounter(i));
                }
            }
        }
        return sb.toString();
    }

    static String getVisibilityStatus(AccessPoint accessPoint) {
        String str;
        StringBuilder sb;
        StringBuilder sb2;
        StringBuilder sb3;
        WifiInfo info = accessPoint.getInfo();
        StringBuilder sb4 = new StringBuilder();
        StringBuilder sb5 = new StringBuilder();
        StringBuilder sb6 = new StringBuilder();
        StringBuilder sb7 = new StringBuilder();
        StringBuilder sb8 = new StringBuilder();
        int i = 0;
        if (!accessPoint.isActive() || info == null) {
            str = null;
        } else {
            str = info.getBSSID();
            if (str != null) {
                sb4.append(" ");
                sb4.append(str);
            }
            sb4.append(" standard = ");
            sb4.append(info.getWifiStandard());
            sb4.append(" rssi=");
            sb4.append(info.getRssi());
            sb4.append(" ");
            sb4.append(" score=");
            sb4.append(info.getScore());
            if (accessPoint.getSpeed() != 0) {
                sb4.append(" speed=");
                sb4.append(accessPoint.getSpeedLabel());
            }
            sb4.append(String.format(" tx=%.1f,", Double.valueOf(info.getSuccessfulTxPacketsPerSecond())));
            sb4.append(String.format("%.1f,", Double.valueOf(info.getRetriedTxPacketsPerSecond())));
            sb4.append(String.format("%.1f ", Double.valueOf(info.getLostTxPacketsPerSecond())));
            sb4.append(String.format("rx=%.1f", Double.valueOf(info.getSuccessfulRxPacketsPerSecond())));
        }
        long elapsedRealtime = SystemClock.elapsedRealtime();
        Iterator<ScanResult> it = accessPoint.getScanResults().iterator();
        StringBuilder sb9 = sb7;
        int i2 = 0;
        int i3 = 0;
        int i4 = -127;
        int i5 = -127;
        int i6 = -127;
        int i7 = -127;
        int i8 = 0;
        while (it.hasNext()) {
            ScanResult next = it.next();
            if (next == null) {
                i5 = i5;
            } else {
                int i9 = next.frequency;
                if (i9 < 5935 || i9 > 7115) {
                    int i10 = next.frequency;
                    if (i10 < 4900 || i10 > 5900) {
                        int i11 = next.frequency;
                        if (i11 < 2400 || i11 > 2500) {
                            int i12 = next.frequency;
                            if (i12 < 58320 || i12 > 70200) {
                                sb = sb8;
                                sb2 = sb9;
                                i5 = i5;
                                i2 = i2;
                                sb9 = sb2;
                                it = it;
                                sb8 = sb;
                            } else {
                                i2++;
                                int i13 = next.level;
                                sb = sb8;
                                if (i13 <= i5) {
                                    i13 = i5;
                                }
                                if (i2 <= 4) {
                                    sb3 = sb9;
                                    sb3.append(verboseScanResultSummary(accessPoint, next, str, elapsedRealtime));
                                } else {
                                    sb3 = sb9;
                                }
                                i5 = i13;
                                sb2 = sb3;
                                sb9 = sb2;
                                it = it;
                                sb8 = sb;
                            }
                        } else {
                            i++;
                            int i14 = next.level;
                            if (i14 > i6) {
                                i6 = i14;
                            }
                            if (i <= 4) {
                                sb5.append(verboseScanResultSummary(accessPoint, next, str, elapsedRealtime));
                            }
                        }
                    } else {
                        i8++;
                        int i15 = next.level;
                        if (i15 > i7) {
                            i7 = i15;
                        }
                        if (i8 <= 4) {
                            sb6.append(verboseScanResultSummary(accessPoint, next, str, elapsedRealtime));
                        }
                    }
                } else {
                    i3++;
                    int i16 = next.level;
                    if (i16 > i4) {
                        i4 = i16;
                    }
                    if (i3 <= 4) {
                        sb8.append(verboseScanResultSummary(accessPoint, next, str, elapsedRealtime));
                    }
                }
                sb = sb8;
                sb2 = sb9;
                i5 = i5;
                i2 = i2;
                sb9 = sb2;
                it = it;
                sb8 = sb;
            }
        }
        sb4.append(" [");
        if (i > 0) {
            sb4.append("(");
            sb4.append(i);
            sb4.append(")");
            if (i > 4) {
                sb4.append("max=");
                sb4.append(i6);
                sb4.append(",");
            }
            sb4.append(sb5.toString());
        }
        sb4.append(";");
        if (i8 > 0) {
            sb4.append("(");
            sb4.append(i8);
            sb4.append(")");
            if (i8 > 4) {
                sb4.append("max=");
                sb4.append(i7);
                sb4.append(",");
            }
            sb4.append(sb6.toString());
        }
        sb4.append(";");
        if (i2 > 0) {
            sb4.append("(");
            sb4.append(i2);
            sb4.append(")");
            if (i2 > 4) {
                sb4.append("max=");
                sb4.append(i5);
                sb4.append(",");
            }
            sb4.append(sb9.toString());
        }
        sb4.append(";");
        if (i3 > 0) {
            sb4.append("(");
            sb4.append(i3);
            sb4.append(")");
            if (i3 > 4) {
                sb4.append("max=");
                sb4.append(i4);
                sb4.append(",");
            }
            sb4.append(sb8.toString());
        }
        sb4.append("]");
        return sb4.toString();
    }

    static String verboseScanResultSummary(AccessPoint accessPoint, ScanResult scanResult, String str, long j) {
        StringBuilder sb = new StringBuilder();
        sb.append(" \n{");
        sb.append(scanResult.BSSID);
        if (scanResult.BSSID.equals(str)) {
            sb.append("*");
        }
        sb.append("=");
        sb.append(scanResult.frequency);
        sb.append(",");
        sb.append(scanResult.level);
        int specificApSpeed = getSpecificApSpeed(scanResult, accessPoint.getScoredNetworkCache());
        if (specificApSpeed != 0) {
            sb.append(",");
            sb.append(accessPoint.getSpeedLabel(specificApSpeed));
        }
        sb.append(",");
        sb.append(((int) (j - (scanResult.timestamp / 1000))) / 1000);
        sb.append("s");
        sb.append("}");
        return sb.toString();
    }

    private static int getSpecificApSpeed(ScanResult scanResult, Map<String, TimestampedScoredNetwork> map) {
        TimestampedScoredNetwork timestampedScoredNetwork = map.get(scanResult.BSSID);
        if (timestampedScoredNetwork == null) {
            return 0;
        }
        return timestampedScoredNetwork.getScore().calculateBadge(scanResult.level);
    }

    public static String getMeteredLabel(Context context, WifiConfiguration wifiConfiguration) {
        if (wifiConfiguration.meteredOverride == 1 || (wifiConfiguration.meteredHint && !isMeteredOverridden(wifiConfiguration))) {
            return context.getString(R$string.wifi_metered_label);
        }
        return context.getString(R$string.wifi_unmetered_label);
    }

    public static boolean isMeteredOverridden(WifiConfiguration wifiConfiguration) {
        return wifiConfiguration.meteredOverride != 0;
    }
}
