package com.verizon.loginenginesvc;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public interface ILoginEngineService extends IInterface {
    void request(String str, IResponseCallback iResponseCallback) throws RemoteException;

    public static abstract class Stub extends Binder implements ILoginEngineService {
        public static ILoginEngineService asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.verizon.loginenginesvc.ILoginEngineService");
            if (queryLocalInterface == null || !(queryLocalInterface instanceof ILoginEngineService)) {
                return new Proxy(iBinder);
            }
            return (ILoginEngineService) queryLocalInterface;
        }

        /* access modifiers changed from: private */
        public static class Proxy implements ILoginEngineService {
            public static ILoginEngineService sDefaultImpl;
            private IBinder mRemote;

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            @Override // com.verizon.loginenginesvc.ILoginEngineService
            public void request(String str, IResponseCallback iResponseCallback) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.verizon.loginenginesvc.ILoginEngineService");
                    obtain.writeString(str);
                    obtain.writeStrongBinder(iResponseCallback != null ? iResponseCallback.asBinder() : null);
                    if (this.mRemote.transact(1, obtain, obtain2, 0) || Stub.getDefaultImpl() == null) {
                        obtain2.readException();
                        obtain2.recycle();
                        obtain.recycle();
                        return;
                    }
                    Stub.getDefaultImpl().request(str, iResponseCallback);
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static ILoginEngineService getDefaultImpl() {
            return Proxy.sDefaultImpl;
        }
    }
}
