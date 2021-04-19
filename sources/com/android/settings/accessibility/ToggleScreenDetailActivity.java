package com.android.settings.accessibility;

import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import com.android.settings.C0010R$id;
import com.android.settings.accessibility.ToggleFeaturePreferenceFragment;
import com.oneplus.settings.BaseActivity;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class ToggleScreenDetailActivity extends BaseActivity {
    private ComponentName mComponentName;
    private CheckBox mHardwareTypeCheckBox;
    private CheckBox mSoftwareTypeCheckBox;
    private CheckBox mTripleTapTypeCheckBox;
    private int mUserShortcutType = 0;
    protected int mUserShortcutTypesCache = 0;
    private View mView;
    private boolean needTriple;

    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, com.oneplus.settings.BaseAppCompatActivity, com.oneplus.settings.BaseActivity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        String stringExtra = getIntent().getStringExtra("title");
        int intExtra = getIntent().getIntExtra("type", -1);
        int i = 0;
        boolean booleanExtra = getIntent().getBooleanExtra("checked", false);
        if (TextUtils.isEmpty(stringExtra) || intExtra == -1) {
            finish();
        }
        setTitle(stringExtra);
        this.mView = AccessibilityEditDialogUtils.createEditDialogContentView(this, 1);
        ((ViewGroup) findViewById(C0010R$id.content_frame)).addView(this.mView);
        if (intExtra == 1) {
            int userShortcutTypeFromSettings = ToggleScreenMagnificationPreferenceFragment.getUserShortcutTypeFromSettings(this);
            this.mUserShortcutType = userShortcutTypeFromSettings;
            if (userShortcutTypeFromSettings != 0) {
                setUserShortcutType(this, userShortcutTypeFromSettings);
            } else {
                this.mUserShortcutType = getUserShortcutTypes(this, 1);
            }
            this.needTriple = true;
        } else {
            ComponentName componentName = (ComponentName) getIntent().getParcelableExtra("component");
            this.mComponentName = componentName;
            if (componentName == null) {
                finish();
                return;
            }
            this.mUserShortcutType = AccessibilityUtil.getUserShortcutTypesFromSettings(this, componentName);
        }
        if (this.needTriple) {
            if (booleanExtra) {
                i = getUserShortcutTypes(this, 1);
            }
            this.mUserShortcutTypesCache = i;
        } else {
            if (booleanExtra) {
                i = getUserShortcutTypesComponent(this, 1);
            }
            this.mUserShortcutTypesCache = i;
        }
        initializeDialogCheckBox();
    }

    private void setDialogTextAreaClickListener(View view, CheckBox checkBox) {
        view.findViewById(C0010R$id.container).setOnClickListener(new View.OnClickListener(checkBox) {
            /* class com.android.settings.accessibility.$$Lambda$ToggleScreenDetailActivity$e25ZOiFvqKwN0BtYuAqkIYyeNfc */
            public final /* synthetic */ CheckBox f$1;

            {
                this.f$1 = r2;
            }

            public final void onClick(View view) {
                ToggleScreenDetailActivity.this.lambda$setDialogTextAreaClickListener$0$ToggleScreenDetailActivity(this.f$1, view);
            }
        });
    }

    /* access modifiers changed from: private */
    /* renamed from: lambda$setDialogTextAreaClickListener$0 */
    public /* synthetic */ void lambda$setDialogTextAreaClickListener$0$ToggleScreenDetailActivity(CheckBox checkBox, View view) {
        checkBox.toggle();
        updateUserShortcutType(false);
    }

    /* access modifiers changed from: protected */
    public int getUserShortcutTypesComponent(Context context, int i) {
        if (this.mComponentName == null) {
            return i;
        }
        Set set = (Set) SharedPreferenceUtils.getUserShortcutTypes(context).stream().filter(new Predicate(this.mComponentName.flattenToString()) {
            /* class com.android.settings.accessibility.$$Lambda$ToggleScreenDetailActivity$5PHPeB7JA4QRHF9Z1d_nDnEac */
            public final /* synthetic */ String f$0;

            {
                this.f$0 = r1;
            }

            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return ((String) obj).contains(this.f$0);
            }
        }).collect(Collectors.toSet());
        if (set.isEmpty()) {
            return i;
        }
        return new ToggleFeaturePreferenceFragment.AccessibilityUserShortcutType((String) set.toArray()[0]).getType();
    }

    /* access modifiers changed from: protected */
    public int getUserShortcutTypes(Context context, int i) {
        Set set = (Set) SharedPreferenceUtils.getUserShortcutTypes(context).stream().filter($$Lambda$ToggleScreenDetailActivity$zfW1l54guFrDDoquOZi2XvPQd64.INSTANCE).collect(Collectors.toSet());
        if (set.isEmpty()) {
            return i;
        }
        return new ToggleFeaturePreferenceFragment.AccessibilityUserShortcutType((String) set.toArray()[0]).getType();
    }

    private void initializeDialogCheckBox() {
        View findViewById = this.mView.findViewById(C0010R$id.software_shortcut);
        CheckBox checkBox = (CheckBox) findViewById.findViewById(C0010R$id.checkbox);
        this.mSoftwareTypeCheckBox = checkBox;
        setDialogTextAreaClickListener(findViewById, checkBox);
        View findViewById2 = this.mView.findViewById(C0010R$id.hardware_shortcut);
        CheckBox checkBox2 = (CheckBox) findViewById2.findViewById(C0010R$id.checkbox);
        this.mHardwareTypeCheckBox = checkBox2;
        setDialogTextAreaClickListener(findViewById2, checkBox2);
        View findViewById3 = this.mView.findViewById(C0010R$id.triple_tap_shortcut);
        CheckBox checkBox3 = (CheckBox) findViewById3.findViewById(C0010R$id.checkbox);
        this.mTripleTapTypeCheckBox = checkBox3;
        setDialogTextAreaClickListener(findViewById3, checkBox3);
        if (!this.needTriple) {
            findViewById3.setVisibility(8);
        }
        updateAlertDialogCheckState();
        ((Button) this.mView.findViewById(C0010R$id.save_button)).setOnClickListener(new View.OnClickListener() {
            /* class com.android.settings.accessibility.ToggleScreenDetailActivity.AnonymousClass1 */

            public void onClick(View view) {
                if (ToggleScreenDetailActivity.this.needTriple) {
                    ToggleScreenDetailActivity.this.updateUserShortcutType(true);
                    ToggleScreenDetailActivity toggleScreenDetailActivity = ToggleScreenDetailActivity.this;
                    ToggleScreenMagnificationPreferenceFragment.optInAllMagnificationValuesToSettings(toggleScreenDetailActivity, toggleScreenDetailActivity.mUserShortcutType);
                    ToggleScreenDetailActivity toggleScreenDetailActivity2 = ToggleScreenDetailActivity.this;
                    ToggleScreenMagnificationPreferenceFragment.optOutAllMagnificationValuesFromSettings(toggleScreenDetailActivity2, ~toggleScreenDetailActivity2.mUserShortcutType);
                } else {
                    ToggleScreenDetailActivity.this.callOnAlertDialogCheckboxClicked();
                }
                ToggleScreenDetailActivity.this.finish();
            }
        });
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void callOnAlertDialogCheckboxClicked() {
        if (this.mComponentName != null) {
            updateUserShortcutType(true);
            AccessibilityUtil.optInAllValuesToSettings(this, this.mUserShortcutType, this.mComponentName);
            AccessibilityUtil.optOutAllValuesFromSettings(this, ~this.mUserShortcutType, this.mComponentName);
        }
    }

    private void updateAlertDialogCheckState() {
        if (this.mUserShortcutTypesCache != 0) {
            updateCheckStatus(this.mSoftwareTypeCheckBox, 1);
            updateCheckStatus(this.mHardwareTypeCheckBox, 2);
            if (this.needTriple) {
                updateCheckStatus(this.mTripleTapTypeCheckBox, 4);
            }
        }
    }

    private void updateCheckStatus(CheckBox checkBox, int i) {
        checkBox.setChecked((this.mUserShortcutTypesCache & i) == i);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void updateUserShortcutType(boolean z) {
        boolean z2 = false;
        this.mUserShortcutTypesCache = 0;
        if (this.mSoftwareTypeCheckBox.isChecked()) {
            this.mUserShortcutTypesCache |= 1;
        }
        if (this.mHardwareTypeCheckBox.isChecked()) {
            this.mUserShortcutTypesCache |= 2;
        }
        if (this.mTripleTapTypeCheckBox.isChecked()) {
            this.mUserShortcutTypesCache |= 4;
        }
        if (z) {
            if (this.mUserShortcutTypesCache != 0) {
                z2 = true;
            }
            if (z2) {
                if (this.needTriple) {
                    setUserShortcutType(this, this.mUserShortcutTypesCache);
                } else {
                    setUserShortcutTypeComponent(this, this.mUserShortcutTypesCache);
                }
            }
            this.mUserShortcutType = this.mUserShortcutTypesCache;
        }
    }

    private void setUserShortcutType(Context context, int i) {
        Set userShortcutTypes = SharedPreferenceUtils.getUserShortcutTypes(context);
        if (userShortcutTypes.isEmpty()) {
            userShortcutTypes = new HashSet();
        } else {
            userShortcutTypes.removeAll((Set) userShortcutTypes.stream().filter($$Lambda$ToggleScreenDetailActivity$xI4V5dYk7N6Jyhe1PGpEp4oVqw.INSTANCE).collect(Collectors.toSet()));
        }
        userShortcutTypes.add(new ToggleFeaturePreferenceFragment.AccessibilityUserShortcutType("com.android.server.accessibility.MagnificationController", i).flattenToString());
        SharedPreferenceUtils.setUserShortcutType(context, userShortcutTypes);
    }

    private void setUserShortcutTypeComponent(Context context, int i) {
        if (this.mComponentName != null) {
            Set userShortcutTypes = SharedPreferenceUtils.getUserShortcutTypes(context);
            String flattenToString = this.mComponentName.flattenToString();
            if (userShortcutTypes.isEmpty()) {
                userShortcutTypes = new HashSet();
            } else {
                userShortcutTypes.removeAll((Set) userShortcutTypes.stream().filter(new Predicate(flattenToString) {
                    /* class com.android.settings.accessibility.$$Lambda$ToggleScreenDetailActivity$ADs7RHVCCObQI960fKzZBjnn8v0 */
                    public final /* synthetic */ String f$0;

                    {
                        this.f$0 = r1;
                    }

                    @Override // java.util.function.Predicate
                    public final boolean test(Object obj) {
                        return ((String) obj).contains(this.f$0);
                    }
                }).collect(Collectors.toSet()));
            }
            userShortcutTypes.add(new ToggleFeaturePreferenceFragment.AccessibilityUserShortcutType(flattenToString, i).flattenToString());
            SharedPreferenceUtils.setUserShortcutType(context, userShortcutTypes);
        }
    }
}
