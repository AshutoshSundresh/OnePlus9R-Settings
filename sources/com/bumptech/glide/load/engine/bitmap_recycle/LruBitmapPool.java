package com.bumptech.glide.load.engine.bitmap_recycle;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.os.Build;
import android.util.Log;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class LruBitmapPool implements BitmapPool {
    private static final Bitmap.Config DEFAULT_CONFIG = Bitmap.Config.ARGB_8888;
    private final Set<Bitmap.Config> allowedConfigs;
    private long currentSize;
    private int evictions;
    private int hits;
    private long maxSize;
    private int misses;
    private int puts;
    private final LruPoolStrategy strategy;
    private final BitmapTracker tracker;

    /* access modifiers changed from: private */
    public interface BitmapTracker {
        void add(Bitmap bitmap);

        void remove(Bitmap bitmap);
    }

    LruBitmapPool(long j, LruPoolStrategy lruPoolStrategy, Set<Bitmap.Config> set) {
        this.maxSize = j;
        this.strategy = lruPoolStrategy;
        this.allowedConfigs = set;
        this.tracker = new NullBitmapTracker();
    }

    public LruBitmapPool(long j) {
        this(j, getDefaultStrategy(), getDefaultAllowedConfigs());
    }

    public long getMaxSize() {
        return this.maxSize;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public synchronized void put(Bitmap bitmap) {
        if (bitmap == null) {
            throw new NullPointerException("Bitmap must not be null");
        } else if (!bitmap.isRecycled()) {
            if (bitmap.isMutable() && ((long) this.strategy.getSize(bitmap)) <= this.maxSize) {
                if (this.allowedConfigs.contains(bitmap.getConfig())) {
                    int size = this.strategy.getSize(bitmap);
                    this.strategy.put(bitmap);
                    this.tracker.add(bitmap);
                    this.puts++;
                    this.currentSize += (long) size;
                    if (Log.isLoggable("LruBitmapPool", 2)) {
                        Log.v("LruBitmapPool", "Put bitmap in pool=" + this.strategy.logBitmap(bitmap));
                    }
                    dump();
                    evict();
                    return;
                }
            }
            if (Log.isLoggable("LruBitmapPool", 2)) {
                Log.v("LruBitmapPool", "Reject bitmap from pool, bitmap: " + this.strategy.logBitmap(bitmap) + ", is mutable: " + bitmap.isMutable() + ", is allowed config: " + this.allowedConfigs.contains(bitmap.getConfig()));
            }
            bitmap.recycle();
        } else {
            throw new IllegalStateException("Cannot pool recycled bitmap");
        }
    }

    private void evict() {
        trimToSize(this.maxSize);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public Bitmap get(int i, int i2, Bitmap.Config config) {
        Bitmap dirtyOrNull = getDirtyOrNull(i, i2, config);
        if (dirtyOrNull == null) {
            return createBitmap(i, i2, config);
        }
        dirtyOrNull.eraseColor(0);
        return dirtyOrNull;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public Bitmap getDirty(int i, int i2, Bitmap.Config config) {
        Bitmap dirtyOrNull = getDirtyOrNull(i, i2, config);
        return dirtyOrNull == null ? createBitmap(i, i2, config) : dirtyOrNull;
    }

    private static Bitmap createBitmap(int i, int i2, Bitmap.Config config) {
        if (config == null) {
            config = DEFAULT_CONFIG;
        }
        return Bitmap.createBitmap(i, i2, config);
    }

    @TargetApi(26)
    private static void assertNotHardwareConfig(Bitmap.Config config) {
        if (Build.VERSION.SDK_INT >= 26 && config == Bitmap.Config.HARDWARE) {
            throw new IllegalArgumentException("Cannot create a mutable Bitmap with config: " + config + ". Consider setting Downsampler#ALLOW_HARDWARE_CONFIG to false in your RequestOptions and/or in GlideBuilder.setDefaultRequestOptions");
        }
    }

    private synchronized Bitmap getDirtyOrNull(int i, int i2, Bitmap.Config config) {
        Bitmap bitmap;
        assertNotHardwareConfig(config);
        bitmap = this.strategy.get(i, i2, config != null ? config : DEFAULT_CONFIG);
        if (bitmap == null) {
            if (Log.isLoggable("LruBitmapPool", 3)) {
                Log.d("LruBitmapPool", "Missing bitmap=" + this.strategy.logBitmap(i, i2, config));
            }
            this.misses++;
        } else {
            this.hits++;
            this.currentSize -= (long) this.strategy.getSize(bitmap);
            this.tracker.remove(bitmap);
            normalize(bitmap);
        }
        if (Log.isLoggable("LruBitmapPool", 2)) {
            Log.v("LruBitmapPool", "Get bitmap=" + this.strategy.logBitmap(i, i2, config));
        }
        dump();
        return bitmap;
    }

    private static void normalize(Bitmap bitmap) {
        bitmap.setHasAlpha(true);
        maybeSetPreMultiplied(bitmap);
    }

    @TargetApi(19)
    private static void maybeSetPreMultiplied(Bitmap bitmap) {
        if (Build.VERSION.SDK_INT >= 19) {
            bitmap.setPremultiplied(true);
        }
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public void clearMemory() {
        if (Log.isLoggable("LruBitmapPool", 3)) {
            Log.d("LruBitmapPool", "clearMemory");
        }
        trimToSize(0);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    @SuppressLint({"InlinedApi"})
    public void trimMemory(int i) {
        if (Log.isLoggable("LruBitmapPool", 3)) {
            Log.d("LruBitmapPool", "trimMemory, level=" + i);
        }
        if (i >= 40 || (Build.VERSION.SDK_INT >= 23 && i >= 20)) {
            clearMemory();
        } else if (i >= 20 || i == 15) {
            trimToSize(getMaxSize() / 2);
        }
    }

    private synchronized void trimToSize(long j) {
        while (this.currentSize > j) {
            Bitmap removeLast = this.strategy.removeLast();
            if (removeLast == null) {
                if (Log.isLoggable("LruBitmapPool", 5)) {
                    Log.w("LruBitmapPool", "Size mismatch, resetting");
                    dumpUnchecked();
                }
                this.currentSize = 0;
                return;
            }
            this.tracker.remove(removeLast);
            this.currentSize -= (long) this.strategy.getSize(removeLast);
            this.evictions++;
            if (Log.isLoggable("LruBitmapPool", 3)) {
                Log.d("LruBitmapPool", "Evicting bitmap=" + this.strategy.logBitmap(removeLast));
            }
            dump();
            removeLast.recycle();
        }
    }

    private void dump() {
        if (Log.isLoggable("LruBitmapPool", 2)) {
            dumpUnchecked();
        }
    }

    private void dumpUnchecked() {
        Log.v("LruBitmapPool", "Hits=" + this.hits + ", misses=" + this.misses + ", puts=" + this.puts + ", evictions=" + this.evictions + ", currentSize=" + this.currentSize + ", maxSize=" + this.maxSize + "\nStrategy=" + this.strategy);
    }

    private static LruPoolStrategy getDefaultStrategy() {
        if (Build.VERSION.SDK_INT >= 19) {
            return new SizeConfigStrategy();
        }
        return new AttributeStrategy();
    }

    @TargetApi(26)
    private static Set<Bitmap.Config> getDefaultAllowedConfigs() {
        int i = Build.VERSION.SDK_INT;
        HashSet hashSet = new HashSet(Arrays.asList(Bitmap.Config.values()));
        if (i >= 19) {
            hashSet.add(null);
        }
        if (i >= 26) {
            hashSet.remove(Bitmap.Config.HARDWARE);
        }
        return Collections.unmodifiableSet(hashSet);
    }

    private static final class NullBitmapTracker implements BitmapTracker {
        @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool.BitmapTracker
        public void add(Bitmap bitmap) {
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool.BitmapTracker
        public void remove(Bitmap bitmap) {
        }

        NullBitmapTracker() {
        }
    }
}
