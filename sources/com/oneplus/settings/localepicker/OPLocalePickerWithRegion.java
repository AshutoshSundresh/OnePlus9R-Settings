package com.oneplus.settings.localepicker;

import android.app.ListFragment;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import androidx.appcompat.widget.SearchView;
import com.android.internal.app.LocaleHelper;
import com.android.internal.app.LocalePicker;
import com.android.internal.app.LocaleStore;
import com.android.internal.app.SuggestedLocaleAdapter;
import com.android.settings.C0008R$drawable;
import com.android.settings.C0010R$id;
import com.android.settings.C0013R$menu;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

public class OPLocalePickerWithRegion extends ListFragment implements SearchView.OnQueryTextListener {
    private SuggestedLocaleAdapter mAdapter;
    private int mFirstVisiblePosition = 0;
    private LocaleSelectedListener mListener;
    private Set<LocaleStore.LocaleInfo> mLocaleList;
    private LocaleStore.LocaleInfo mParentLocale;
    private CharSequence mPreviousSearch = null;
    private boolean mPreviousSearchHadFocus = false;
    private SearchView mSearchView = null;
    private int mTopDistance = 0;
    private boolean mTranslatedOnly = false;

    public interface LocaleSelectedListener {
        void onLocaleSelected(LocaleStore.LocaleInfo localeInfo);
    }

    @Override // androidx.appcompat.widget.SearchView.OnQueryTextListener
    public boolean onQueryTextSubmit(String str) {
        return false;
    }

    private static OPLocalePickerWithRegion createCountryPicker(Context context, LocaleSelectedListener localeSelectedListener, LocaleStore.LocaleInfo localeInfo, boolean z) {
        OPLocalePickerWithRegion oPLocalePickerWithRegion = new OPLocalePickerWithRegion();
        if (oPLocalePickerWithRegion.setListener(context, localeSelectedListener, localeInfo, z)) {
            return oPLocalePickerWithRegion;
        }
        return null;
    }

    public static OPLocalePickerWithRegion createLanguagePicker(Context context, LocaleSelectedListener localeSelectedListener, boolean z) {
        OPLocalePickerWithRegion oPLocalePickerWithRegion = new OPLocalePickerWithRegion();
        oPLocalePickerWithRegion.setListener(context, localeSelectedListener, null, z);
        return oPLocalePickerWithRegion;
    }

    private boolean setListener(Context context, LocaleSelectedListener localeSelectedListener, LocaleStore.LocaleInfo localeInfo, boolean z) {
        this.mParentLocale = localeInfo;
        this.mListener = localeSelectedListener;
        this.mTranslatedOnly = z;
        setRetainInstance(true);
        HashSet hashSet = new HashSet();
        if (!z) {
            Collections.addAll(hashSet, LocalePicker.getLocales().toLanguageTags().split(","));
        }
        if (localeInfo != null) {
            Set<LocaleStore.LocaleInfo> levelLocales = LocaleStore.getLevelLocales(context, hashSet, localeInfo, true);
            this.mLocaleList = levelLocales;
            if (levelLocales.size() <= 1) {
                if (localeSelectedListener == null || this.mLocaleList.size() != 1) {
                    return false;
                }
                localeSelectedListener.onLocaleSelected(this.mLocaleList.iterator().next());
                return false;
            }
        } else {
            this.mLocaleList = LocaleStore.getLevelLocales(context, hashSet, (LocaleStore.LocaleInfo) null, true);
        }
        return true;
    }

    private void returnToParentFrame() {
        getFragmentManager().popBackStack("localeListEditor", 1);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        boolean z = true;
        setHasOptionsMenu(true);
        if (this.mLocaleList == null) {
            returnToParentFrame();
            return;
        }
        if (this.mParentLocale == null) {
            z = false;
        }
        Locale locale = z ? this.mParentLocale.getLocale() : Locale.getDefault();
        this.mAdapter = new SuggestedLocaleAdapter(this.mLocaleList, z);
        this.mAdapter.sort(new LocaleHelper.LocaleInfoComparator(locale, z));
        setListAdapter(this.mAdapter);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return super.onOptionsItemSelected(menuItem);
        }
        getFragmentManager().popBackStack();
        return true;
    }

    public void onResume() {
        super.onResume();
        if (this.mParentLocale != null) {
            getActivity().setTitle(this.mParentLocale.getFullNameNative());
        } else {
            getActivity().setTitle(17040434);
        }
        getListView().requestFocus();
    }

    public void onPause() {
        super.onPause();
        SearchView searchView = this.mSearchView;
        int i = 0;
        if (searchView != null) {
            this.mPreviousSearchHadFocus = searchView.hasFocus();
            this.mPreviousSearch = this.mSearchView.getQuery();
        } else {
            this.mPreviousSearchHadFocus = false;
            this.mPreviousSearch = null;
        }
        ListView listView = getListView();
        View childAt = listView.getChildAt(0);
        this.mFirstVisiblePosition = listView.getFirstVisiblePosition();
        if (childAt != null) {
            i = childAt.getTop() - listView.getPaddingTop();
        }
        this.mTopDistance = i;
    }

    public void onListItemClick(ListView listView, View view, int i, long j) {
        LocaleStore.LocaleInfo localeInfo = (LocaleStore.LocaleInfo) getListAdapter().getItem(i);
        if (localeInfo.getParent() != null) {
            LocaleSelectedListener localeSelectedListener = this.mListener;
            if (localeSelectedListener != null) {
                localeSelectedListener.onLocaleSelected(localeInfo);
            }
            returnToParentFrame();
            return;
        }
        OPLocalePickerWithRegion createCountryPicker = createCountryPicker(getContext(), this.mListener, localeInfo, this.mTranslatedOnly);
        if (createCountryPicker != null) {
            getFragmentManager().beginTransaction().setTransition(4097).replace(getId(), createCountryPicker).addToBackStack(null).commit();
        } else {
            returnToParentFrame();
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        if (this.mParentLocale == null) {
            menuInflater.inflate(C0013R$menu.op_language_selection_list, menu);
            MenuItem findItem = menu.findItem(C0010R$id.locale_search_menu);
            if (findItem != null) {
                findItem.setIcon(C0008R$drawable.op_ic_menu_search);
                SearchView searchView = (SearchView) findItem.getActionView();
                this.mSearchView = searchView;
                if (searchView != null) {
                    searchView.setQueryHint(getText(17041208));
                    this.mSearchView.setOnQueryTextListener(this);
                    if (!TextUtils.isEmpty(this.mPreviousSearch)) {
                        findItem.expandActionView();
                        this.mSearchView.setIconified(false);
                        this.mSearchView.setActivated(true);
                        if (this.mPreviousSearchHadFocus) {
                            this.mSearchView.requestFocus();
                        }
                        this.mSearchView.setQuery(this.mPreviousSearch, true);
                    } else {
                        this.mSearchView.setQuery(null, false);
                    }
                }
            }
            getListView().setSelectionFromTop(this.mFirstVisiblePosition, this.mTopDistance);
        }
    }

    @Override // androidx.appcompat.widget.SearchView.OnQueryTextListener
    public boolean onQueryTextChange(String str) {
        SuggestedLocaleAdapter suggestedLocaleAdapter = this.mAdapter;
        if (suggestedLocaleAdapter == null) {
            return false;
        }
        suggestedLocaleAdapter.getFilter().filter(str);
        return false;
    }
}
