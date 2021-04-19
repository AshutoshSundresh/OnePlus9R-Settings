package com.android.settings.notification.app;

import android.app.NotificationChannelGroup;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.text.BidiFormatter;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.Log;
import android.widget.ImageView;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.OnLifecycleEvent;
import androidx.preference.Preference;
import com.android.settings.C0010R$id;
import com.android.settings.C0017R$string;
import com.android.settings.core.PreferenceControllerMixin;
import com.android.settings.dashboard.DashboardFragment;
import com.android.settings.notification.NotificationBackend;
import com.android.settings.widget.EntityHeaderController;
import com.android.settingslib.widget.LayoutPreference;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.resource.bitmap.CircleCrop;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;

public class HeaderPreferenceController extends NotificationPreferenceController implements PreferenceControllerMixin, LifecycleObserver {
    private final DashboardFragment mFragment;
    private EntityHeaderController mHeaderController;
    private boolean mInit;
    private boolean mStarted = false;

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public String getPreferenceKey() {
        return "pref_app_header";
    }

    public HeaderPreferenceController(Context context, DashboardFragment dashboardFragment) {
        super(context, null);
        this.mFragment = dashboardFragment;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController, com.android.settings.notification.app.NotificationPreferenceController
    public boolean isAvailable() {
        return this.mAppRow != null;
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public void updateState(Preference preference) {
        DashboardFragment dashboardFragment;
        Drawable drawable;
        if (this.mAppRow != null && (dashboardFragment = this.mFragment) != null) {
            Drawable drawable2 = null;
            FragmentActivity activity = this.mStarted ? dashboardFragment.getActivity() : null;
            if (activity == null || this.mInit) {
                Log.d("HeaderPreferenceController", "updateState return mInit = " + this.mInit);
                return;
            }
            this.mHeaderController = EntityHeaderController.newInstance(activity, this.mFragment, ((LayoutPreference) preference).findViewById(C0010R$id.entity_header));
            NotificationBackend.NotificationsSentState notificationsSentState = this.mAppRow.sentByApp;
            if (notificationsSentState.instantApp) {
                drawable = notificationsSentState.instantAppIcon;
            } else {
                try {
                    Log.d("HeaderPreferenceController", "updateState mAppRow.pkg = " + this.mAppRow.pkg);
                    PackageManager packageManager = ((NotificationPreferenceController) this).mContext.getPackageManager();
                    drawable2 = packageManager.getApplicationInfo(this.mAppRow.pkg, 0).loadIcon(packageManager);
                    Log.d("HeaderPreferenceController", "updateState drawable = " + drawable2);
                    Log.d("HeaderPreferenceController", "updateState mAppRow.icon = " + this.mAppRow.icon);
                } catch (PackageManager.NameNotFoundException e) {
                    e.printStackTrace();
                }
                drawable = drawable2;
            }
            if (drawable == null) {
                Log.d("HeaderPreferenceController", "updateState mAppRow.sentByApp.instantApp = " + this.mAppRow.sentByApp.instantApp);
                NotificationBackend.AppRow appRow = this.mAppRow;
                NotificationBackend.NotificationsSentState notificationsSentState2 = appRow.sentByApp;
                drawable = notificationsSentState2.instantApp ? notificationsSentState2.instantAppIcon : appRow.icon;
            }
            Drawable adaptiveIconDrawable = getAdaptiveIconDrawable(drawable);
            EntityHeaderController entityHeaderController = this.mHeaderController;
            entityHeaderController.setIcon(adaptiveIconDrawable);
            NotificationBackend.NotificationsSentState notificationsSentState3 = this.mAppRow.sentByApp;
            entityHeaderController.setLabel(notificationsSentState3.instantApp ? notificationsSentState3.instantAppName : getLabel());
            entityHeaderController.setSummary(getSummary());
            entityHeaderController.setPackageName(this.mAppRow.pkg);
            entityHeaderController.setUid(this.mAppRow.uid);
            entityHeaderController.setButtonActions(1, 0);
            entityHeaderController.setHasAppInfoLink(true);
            entityHeaderController.setRecyclerView(this.mFragment.getListView(), this.mFragment.getSettingsLifecycle());
            LayoutPreference done = entityHeaderController.done(activity, ((NotificationPreferenceController) this).mContext);
            this.mInit = true;
            done.findViewById(C0010R$id.entity_header).setVisibility(0);
            if (adaptiveIconDrawable instanceof LayerDrawable) {
                Log.d("HeaderPreferenceController", "updateState drawable instanceof LayerDrawable");
                Glide.with(((NotificationPreferenceController) this).mContext).load(adaptiveIconDrawable).apply((BaseRequestOptions<?>) RequestOptions.bitmapTransform(new CircleCrop())).into((ImageView) done.findViewById(C0010R$id.entity_header_icon));
            }
        }
    }

    public Drawable getAdaptiveIconDrawable(Drawable drawable) {
        try {
            if ((drawable instanceof BitmapDrawable) || !(drawable instanceof AdaptiveIconDrawable)) {
                return drawable;
            }
            return new LayerDrawable(new Drawable[]{((AdaptiveIconDrawable) drawable).getBackground(), ((AdaptiveIconDrawable) drawable).getForeground()});
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override // com.android.settingslib.core.AbstractPreferenceController
    public CharSequence getSummary() {
        if (this.mChannel == null || isDefaultChannel()) {
            return this.mChannelGroup != null ? this.mAppRow.label.toString() : "";
        }
        NotificationChannelGroup notificationChannelGroup = this.mChannelGroup;
        if (notificationChannelGroup == null || TextUtils.isEmpty(notificationChannelGroup.getName())) {
            return this.mAppRow.label.toString();
        }
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        BidiFormatter instance = BidiFormatter.getInstance();
        spannableStringBuilder.append((CharSequence) instance.unicodeWrap(this.mAppRow.label.toString()));
        spannableStringBuilder.append(instance.unicodeWrap(((NotificationPreferenceController) this).mContext.getText(C0017R$string.notification_header_divider_symbol_with_spaces)));
        spannableStringBuilder.append((CharSequence) instance.unicodeWrap(this.mChannelGroup.getName().toString()));
        return spannableStringBuilder.toString();
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    public void onStart() {
        this.mStarted = true;
        EntityHeaderController entityHeaderController = this.mHeaderController;
        if (entityHeaderController != null) {
            entityHeaderController.styleActionBar(this.mFragment.getActivity());
        }
    }

    /* access modifiers changed from: package-private */
    public CharSequence getLabel() {
        if (this.mChannel != null && !isDefaultChannel()) {
            return this.mChannel.getName();
        }
        NotificationChannelGroup notificationChannelGroup = this.mChannelGroup;
        if (notificationChannelGroup != null) {
            return notificationChannelGroup.getName();
        }
        return this.mAppRow.label;
    }
}
