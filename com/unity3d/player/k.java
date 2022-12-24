package com.unity3d.player;

import android.content.Context;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;

final class k {
  private Context a;
  
  private b b;
  
  public k(Context paramContext) {
    this.a = paramContext;
  }
  
  public final void a() {
    if (this.b != null) {
      this.a.getContentResolver().unregisterContentObserver(this.b);
      this.b = null;
    } 
  }
  
  public final void a(a parama, String paramString) {
    this.b = new b(this, new Handler(Looper.getMainLooper()), parama);
    this.a.getContentResolver().registerContentObserver(Settings.System.getUriFor(paramString), true, this.b);
  }
  
  public static interface a {
    void b();
  }
  
  private final class b extends ContentObserver {
    final k a;
    
    private k.a b;
    
    public b(k this$0, Handler param1Handler, k.a param1a) {
      super(param1Handler);
      this.b = param1a;
    }
    
    public final boolean deliverSelfNotifications() {
      return super.deliverSelfNotifications();
    }
    
    public final void onChange(boolean param1Boolean) {
      k.a a1 = this.b;
      if (a1 != null)
        a1.b(); 
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\k.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */