package okhttp3;

import androidx.constraintlayout.widget.R$styleable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public final class CipherSuite {
    private static final Map<String, CipherSuite> INSTANCES = new TreeMap(ORDER_BY_NAME);
    static final Comparator<String> ORDER_BY_NAME = new Comparator<String>() {
        /* class okhttp3.CipherSuite.AnonymousClass1 */

        public int compare(String str, String str2) {
            int min = Math.min(str.length(), str2.length());
            for (int i = 4; i < min; i++) {
                char charAt = str.charAt(i);
                char charAt2 = str2.charAt(i);
                if (charAt != charAt2) {
                    return charAt < charAt2 ? -1 : 1;
                }
            }
            int length = str.length();
            int length2 = str2.length();
            if (length != length2) {
                return length < length2 ? -1 : 1;
            }
            return 0;
        }
    };
    public static final CipherSuite TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA = of("TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA", 49161);
    public static final CipherSuite TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 = of("TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256", 49195);
    public static final CipherSuite TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA = of("TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA", 49162);
    public static final CipherSuite TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 = of("TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", 49196);
    public static final CipherSuite TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 = of("TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256", 52393);
    public static final CipherSuite TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA = of("TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA", 49171);
    public static final CipherSuite TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 = of("TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256", 49199);
    public static final CipherSuite TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA = of("TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA", 49172);
    public static final CipherSuite TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 = of("TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", 49200);
    public static final CipherSuite TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 = of("TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256", 52392);
    public static final CipherSuite TLS_RSA_WITH_3DES_EDE_CBC_SHA = of("SSL_RSA_WITH_3DES_EDE_CBC_SHA", 10);
    public static final CipherSuite TLS_RSA_WITH_AES_128_CBC_SHA = of("TLS_RSA_WITH_AES_128_CBC_SHA", 47);
    public static final CipherSuite TLS_RSA_WITH_AES_128_GCM_SHA256 = of("TLS_RSA_WITH_AES_128_GCM_SHA256", 156);
    public static final CipherSuite TLS_RSA_WITH_AES_256_CBC_SHA = of("TLS_RSA_WITH_AES_256_CBC_SHA", 53);
    public static final CipherSuite TLS_RSA_WITH_AES_256_GCM_SHA384 = of("TLS_RSA_WITH_AES_256_GCM_SHA384", 157);
    final String javaName;

    static {
        of("SSL_RSA_WITH_NULL_MD5", 1);
        of("SSL_RSA_WITH_NULL_SHA", 2);
        of("SSL_RSA_EXPORT_WITH_RC4_40_MD5", 3);
        of("SSL_RSA_WITH_RC4_128_MD5", 4);
        of("SSL_RSA_WITH_RC4_128_SHA", 5);
        of("SSL_RSA_EXPORT_WITH_DES40_CBC_SHA", 8);
        of("SSL_RSA_WITH_DES_CBC_SHA", 9);
        of("SSL_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA", 17);
        of("SSL_DHE_DSS_WITH_DES_CBC_SHA", 18);
        of("SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA", 19);
        of("SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA", 20);
        of("SSL_DHE_RSA_WITH_DES_CBC_SHA", 21);
        of("SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA", 22);
        of("SSL_DH_anon_EXPORT_WITH_RC4_40_MD5", 23);
        of("SSL_DH_anon_WITH_RC4_128_MD5", 24);
        of("SSL_DH_anon_EXPORT_WITH_DES40_CBC_SHA", 25);
        of("SSL_DH_anon_WITH_DES_CBC_SHA", 26);
        of("SSL_DH_anon_WITH_3DES_EDE_CBC_SHA", 27);
        of("TLS_KRB5_WITH_DES_CBC_SHA", 30);
        of("TLS_KRB5_WITH_3DES_EDE_CBC_SHA", 31);
        of("TLS_KRB5_WITH_RC4_128_SHA", 32);
        of("TLS_KRB5_WITH_DES_CBC_MD5", 34);
        of("TLS_KRB5_WITH_3DES_EDE_CBC_MD5", 35);
        of("TLS_KRB5_WITH_RC4_128_MD5", 36);
        of("TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA", 38);
        of("TLS_KRB5_EXPORT_WITH_RC4_40_SHA", 40);
        of("TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5", 41);
        of("TLS_KRB5_EXPORT_WITH_RC4_40_MD5", 43);
        of("TLS_DHE_DSS_WITH_AES_128_CBC_SHA", 50);
        of("TLS_DHE_RSA_WITH_AES_128_CBC_SHA", 51);
        of("TLS_DH_anon_WITH_AES_128_CBC_SHA", 52);
        of("TLS_DHE_DSS_WITH_AES_256_CBC_SHA", 56);
        of("TLS_DHE_RSA_WITH_AES_256_CBC_SHA", 57);
        of("TLS_DH_anon_WITH_AES_256_CBC_SHA", 58);
        of("TLS_RSA_WITH_NULL_SHA256", 59);
        of("TLS_RSA_WITH_AES_128_CBC_SHA256", 60);
        of("TLS_RSA_WITH_AES_256_CBC_SHA256", 61);
        of("TLS_DHE_DSS_WITH_AES_128_CBC_SHA256", 64);
        of("TLS_RSA_WITH_CAMELLIA_128_CBC_SHA", 65);
        of("TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA", 68);
        of("TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA", 69);
        of("TLS_DHE_RSA_WITH_AES_128_CBC_SHA256", R$styleable.Constraint_layout_goneMarginTop);
        of("TLS_DHE_DSS_WITH_AES_256_CBC_SHA256", 106);
        of("TLS_DHE_RSA_WITH_AES_256_CBC_SHA256", R$styleable.Constraint_progress);
        of("TLS_DH_anon_WITH_AES_128_CBC_SHA256", R$styleable.Constraint_transitionEasing);
        of("TLS_DH_anon_WITH_AES_256_CBC_SHA256", R$styleable.Constraint_transitionPathRotate);
        of("TLS_RSA_WITH_CAMELLIA_256_CBC_SHA", 132);
        of("TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA", 135);
        of("TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA", 136);
        of("TLS_PSK_WITH_RC4_128_SHA", 138);
        of("TLS_PSK_WITH_3DES_EDE_CBC_SHA", 139);
        of("TLS_PSK_WITH_AES_128_CBC_SHA", 140);
        of("TLS_PSK_WITH_AES_256_CBC_SHA", 141);
        of("TLS_RSA_WITH_SEED_CBC_SHA", 150);
        of("TLS_DHE_RSA_WITH_AES_128_GCM_SHA256", 158);
        of("TLS_DHE_RSA_WITH_AES_256_GCM_SHA384", 159);
        of("TLS_DHE_DSS_WITH_AES_128_GCM_SHA256", 162);
        of("TLS_DHE_DSS_WITH_AES_256_GCM_SHA384", 163);
        of("TLS_DH_anon_WITH_AES_128_GCM_SHA256", 166);
        of("TLS_DH_anon_WITH_AES_256_GCM_SHA384", 167);
        of("TLS_EMPTY_RENEGOTIATION_INFO_SCSV", 255);
        of("TLS_FALLBACK_SCSV", 22016);
        of("TLS_ECDH_ECDSA_WITH_NULL_SHA", 49153);
        of("TLS_ECDH_ECDSA_WITH_RC4_128_SHA", 49154);
        of("TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA", 49155);
        of("TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA", 49156);
        of("TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA", 49157);
        of("TLS_ECDHE_ECDSA_WITH_NULL_SHA", 49158);
        of("TLS_ECDHE_ECDSA_WITH_RC4_128_SHA", 49159);
        of("TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA", 49160);
        of("TLS_ECDH_RSA_WITH_NULL_SHA", 49163);
        of("TLS_ECDH_RSA_WITH_RC4_128_SHA", 49164);
        of("TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA", 49165);
        of("TLS_ECDH_RSA_WITH_AES_128_CBC_SHA", 49166);
        of("TLS_ECDH_RSA_WITH_AES_256_CBC_SHA", 49167);
        of("TLS_ECDHE_RSA_WITH_NULL_SHA", 49168);
        of("TLS_ECDHE_RSA_WITH_RC4_128_SHA", 49169);
        of("TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA", 49170);
        of("TLS_ECDH_anon_WITH_NULL_SHA", 49173);
        of("TLS_ECDH_anon_WITH_RC4_128_SHA", 49174);
        of("TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA", 49175);
        of("TLS_ECDH_anon_WITH_AES_128_CBC_SHA", 49176);
        of("TLS_ECDH_anon_WITH_AES_256_CBC_SHA", 49177);
        of("TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256", 49187);
        of("TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384", 49188);
        of("TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256", 49189);
        of("TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384", 49190);
        of("TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256", 49191);
        of("TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384", 49192);
        of("TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256", 49193);
        of("TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384", 49194);
        of("TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256", 49197);
        of("TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384", 49198);
        of("TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256", 49201);
        of("TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384", 49202);
        of("TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA", 49205);
        of("TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA", 49206);
    }

    public static synchronized CipherSuite forJavaName(String str) {
        CipherSuite cipherSuite;
        synchronized (CipherSuite.class) {
            cipherSuite = INSTANCES.get(str);
            if (cipherSuite == null) {
                cipherSuite = new CipherSuite(str);
                INSTANCES.put(str, cipherSuite);
            }
        }
        return cipherSuite;
    }

    static List<CipherSuite> forJavaNames(String... strArr) {
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            arrayList.add(forJavaName(str));
        }
        return Collections.unmodifiableList(arrayList);
    }

    private CipherSuite(String str) {
        if (str != null) {
            this.javaName = str;
            return;
        }
        throw null;
    }

    private static CipherSuite of(String str, int i) {
        return forJavaName(str);
    }

    public String toString() {
        return this.javaName;
    }
}
