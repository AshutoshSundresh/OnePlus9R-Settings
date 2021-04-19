package com.bumptech.glide.request;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.DiskCacheStrategy;

public class RequestOptions extends BaseRequestOptions<RequestOptions> {
    public static RequestOptions diskCacheStrategyOf(DiskCacheStrategy diskCacheStrategy) {
        return (RequestOptions) new RequestOptions().diskCacheStrategy(diskCacheStrategy);
    }

    public static RequestOptions signatureOf(Key key) {
        return (RequestOptions) new RequestOptions().signature(key);
    }

    public static RequestOptions bitmapTransform(Transformation<Bitmap> transformation) {
        return (RequestOptions) new RequestOptions().transform(transformation);
    }

    public static RequestOptions decodeTypeOf(Class<?> cls) {
        return (RequestOptions) new RequestOptions().decode(cls);
    }
}
