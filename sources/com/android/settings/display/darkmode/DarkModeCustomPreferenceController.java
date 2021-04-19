package com.android.settings.display.darkmode;

import android.app.UiModeManager;
import android.content.Context;
import android.content.IntentFilter;
import android.text.TextUtils;
import android.widget.Toast;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;
import com.android.settings.C0017R$string;
import com.android.settings.core.BasePreferenceController;
import com.android.settings.slices.SliceBackgroundWorker;
import com.google.android.material.picker.TimePicker;
import com.google.android.material.picker.TimePickerDialog;
import java.text.DateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.TimeZone;

public class DarkModeCustomPreferenceController extends BasePreferenceController {
    private static final String END_TIME_KEY = "dark_theme_end_time";
    private static final String START_TIME_KEY = "dark_theme_start_time";
    public static DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm a");
    private TimeFormatter mFormat;
    private DarkModeSettingsFragment mFragmet;
    private Preference mPreference;
    private DateFormat mTimeFormatter;
    private final UiModeManager mUiModeManager;

    @Override // com.android.settings.slices.Sliceable
    public /* bridge */ /* synthetic */ void copy() {
        super.copy();
    }

    @Override // com.android.settings.core.BasePreferenceController
    public int getAvailabilityStatus() {
        return 0;
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

    public DarkModeCustomPreferenceController(Context context, String str) {
        super(context, str);
        this.mFormat = new TimeFormatter(this.mContext);
        this.mUiModeManager = (UiModeManager) context.getSystemService(UiModeManager.class);
        DateFormat timeFormat = android.text.format.DateFormat.getTimeFormat(context);
        this.mTimeFormatter = timeFormat;
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    public DarkModeCustomPreferenceController(Context context, String str, DarkModeSettingsFragment darkModeSettingsFragment) {
        this(context, str);
        this.mFragmet = darkModeSettingsFragment;
        DateFormat timeFormat = android.text.format.DateFormat.getTimeFormat(context);
        this.mTimeFormatter = timeFormat;
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    public DarkModeCustomPreferenceController(Context context, String str, DarkModeSettingsFragment darkModeSettingsFragment, TimeFormatter timeFormatter) {
        this(context, str, darkModeSettingsFragment);
        this.mFormat = timeFormatter;
        DateFormat timeFormat = android.text.format.DateFormat.getTimeFormat(context);
        this.mTimeFormatter = timeFormat;
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    public TimePickerDialog getDialog() {
        LocalTime localTime;
        if (TextUtils.equals(getPreferenceKey(), START_TIME_KEY)) {
            localTime = this.mUiModeManager.getCustomNightModeStart();
        } else {
            localTime = this.mUiModeManager.getCustomNightModeEnd();
        }
        return new TimePickerDialog(this.mContext, new TimePickerDialog.OnTimeSetListener() {
            /* class com.android.settings.display.darkmode.$$Lambda$DarkModeCustomPreferenceController$KLPwvFP3y4ehkWxFoUCgDK4_PM */

            @Override // com.google.android.material.picker.TimePickerDialog.OnTimeSetListener
            public final void onTimeSet(TimePicker timePicker, int i, int i2) {
                DarkModeCustomPreferenceController.this.lambda$getDialog$0$DarkModeCustomPreferenceController(timePicker, i, i2);
            }
        }, localTime.getHour(), localTime.getMinute(), this.mFormat.is24HourFormat());
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$getDialog$0 */
    public /* synthetic */ void lambda$getDialog$0$DarkModeCustomPreferenceController(TimePicker timePicker, int i, int i2) {
        LocalTime of = LocalTime.of(i, i2);
        if (TextUtils.equals(getPreferenceKey(), START_TIME_KEY)) {
            if (String.valueOf(this.mUiModeManager.getCustomNightModeEnd()).equals(String.valueOf(of))) {
                Toast.makeText(this.mContext, C0017R$string.timepower_time_duplicate, 1).show();
            } else {
                this.mUiModeManager.setCustomNightModeStart(of);
            }
        } else if (String.valueOf(this.mUiModeManager.getCustomNightModeStart()).equals(String.valueOf(of))) {
            Toast.makeText(this.mContext, C0017R$string.timepower_time_duplicate, 1).show();
        } else {
            this.mUiModeManager.setCustomNightModeEnd(of);
        }
        DarkModeSettingsFragment darkModeSettingsFragment = this.mFragmet;
        if (darkModeSettingsFragment != null) {
            darkModeSettingsFragment.refresh();
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.android.settingslib.core.AbstractPreferenceController
    public void refreshSummary(Preference preference) {
        LocalTime localTime;
        if (this.mUiModeManager.getNightMode() != 3) {
            preference.setVisible(false);
            return;
        }
        preference.setVisible(true);
        if (TextUtils.equals(getPreferenceKey(), START_TIME_KEY)) {
            localTime = this.mUiModeManager.getCustomNightModeStart();
        } else {
            localTime = this.mUiModeManager.getCustomNightModeEnd();
        }
        preference.setSummary(getFormattedTimeString(localTime));
    }

    private String getFormattedTimeString(LocalTime localTime) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeZone(this.mTimeFormatter.getTimeZone());
        instance.set(11, localTime.getHour());
        instance.set(12, localTime.getMinute());
        instance.set(13, 0);
        instance.set(14, 0);
        return this.mTimeFormatter.format(instance.getTime());
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.core.BasePreferenceController
    public void displayPreference(PreferenceScreen preferenceScreen) {
        super.displayPreference(preferenceScreen);
        this.mPreference = preferenceScreen.findPreference(getPreferenceKey());
        updateDisplay();
    }

    private void updateDisplay() {
        if (this.mUiModeManager.getNightMode() != 3) {
            this.mPreference.setVisible(false);
        } else {
            this.mPreference.setVisible(true);
        }
    }
}
