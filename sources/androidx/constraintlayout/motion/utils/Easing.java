package androidx.constraintlayout.motion.utils;

import android.util.Log;
import java.util.Arrays;

public class Easing {
    public static String[] NAMED_EASING = {"standard", "accelerate", "decelerate", "linear"};
    static Easing sDefault = new Easing();
    String str = "identity";

    public double get(double d) {
        return d;
    }

    public double getDiff(double d) {
        return 1.0d;
    }

    public static Easing getInterpolator(String str2) {
        if (str2 == null) {
            return null;
        }
        if (str2.startsWith("cubic")) {
            return new CubicEasing(str2);
        }
        char c = 65535;
        switch (str2.hashCode()) {
            case -1354466595:
                if (str2.equals("accelerate")) {
                    c = 1;
                    break;
                }
                break;
            case -1263948740:
                if (str2.equals("decelerate")) {
                    c = 2;
                    break;
                }
                break;
            case -1102672091:
                if (str2.equals("linear")) {
                    c = 3;
                    break;
                }
                break;
            case 1312628413:
                if (str2.equals("standard")) {
                    c = 0;
                    break;
                }
                break;
        }
        if (c == 0) {
            return new CubicEasing("cubic(0.4, 0.0, 0.2, 1)");
        }
        if (c == 1) {
            return new CubicEasing("cubic(0.4, 0.05, 0.8, 0.7)");
        }
        if (c == 2) {
            return new CubicEasing("cubic(0.0, 0.0, 0.2, 0.95)");
        }
        if (c == 3) {
            return new CubicEasing("cubic(1, 1, 0, 0)");
        }
        Log.e("ConstraintSet", "transitionEasing syntax error syntax:transitionEasing=\"cubic(1.0,0.5,0.0,0.6)\" or " + Arrays.toString(NAMED_EASING));
        return sDefault;
    }

    public String toString() {
        return this.str;
    }

    static class CubicEasing extends Easing {
        private static double d_error = 1.0E-4d;
        private static double error = 0.01d;
        double x1;
        double x2;
        double y1;
        double y2;

        CubicEasing(String str) {
            this.str = str;
            int indexOf = str.indexOf(40);
            int indexOf2 = str.indexOf(44, indexOf);
            this.x1 = Double.parseDouble(str.substring(indexOf + 1, indexOf2).trim());
            int i = indexOf2 + 1;
            int indexOf3 = str.indexOf(44, i);
            this.y1 = Double.parseDouble(str.substring(i, indexOf3).trim());
            int i2 = indexOf3 + 1;
            int indexOf4 = str.indexOf(44, i2);
            this.x2 = Double.parseDouble(str.substring(i2, indexOf4).trim());
            int i3 = indexOf4 + 1;
            this.y2 = Double.parseDouble(str.substring(i3, str.indexOf(41, i3)).trim());
        }

        private double getX(double d) {
            double d2 = 1.0d - d;
            double d3 = 3.0d * d2;
            return (this.x1 * d2 * d3 * d) + (this.x2 * d3 * d * d) + (d * d * d);
        }

        private double getY(double d) {
            double d2 = 1.0d - d;
            double d3 = 3.0d * d2;
            return (this.y1 * d2 * d3 * d) + (this.y2 * d3 * d * d) + (d * d * d);
        }

        @Override // androidx.constraintlayout.motion.utils.Easing
        public double getDiff(double d) {
            double d2 = 0.5d;
            double d3 = 0.5d;
            while (d2 > d_error) {
                d2 *= 0.5d;
                d3 = getX(d3) < d ? d3 + d2 : d3 - d2;
            }
            double d4 = d3 - d2;
            double d5 = d3 + d2;
            return (getY(d5) - getY(d4)) / (getX(d5) - getX(d4));
        }

        @Override // androidx.constraintlayout.motion.utils.Easing
        public double get(double d) {
            if (d <= 0.0d) {
                return 0.0d;
            }
            if (d >= 1.0d) {
                return 1.0d;
            }
            double d2 = 0.5d;
            double d3 = 0.5d;
            while (d2 > error) {
                d2 *= 0.5d;
                d3 = getX(d3) < d ? d3 + d2 : d3 - d2;
            }
            double d4 = d3 - d2;
            double x = getX(d4);
            double d5 = d3 + d2;
            double x3 = getX(d5);
            double y = getY(d4);
            return (((getY(d5) - y) * (d - x)) / (x3 - x)) + y;
        }
    }
}
