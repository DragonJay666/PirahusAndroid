package com.unity3d.player;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

final class o {
  private UnityPlayer a = null;
  
  private Context b = null;
  
  private a c;
  
  private final Semaphore d = new Semaphore(0);
  
  private final Lock e = new ReentrantLock();
  
  private n f = null;
  
  private int g = 2;
  
  private boolean h = false;
  
  private boolean i = false;
  
  o(UnityPlayer paramUnityPlayer) {
    this.a = paramUnityPlayer;
  }
  
  private void d() {
    n n1 = this.f;
    if (n1 != null) {
      this.a.removeViewFromPlayer((View)n1);
      this.i = false;
      this.f.destroyPlayer();
      this.f = null;
      a a1 = this.c;
      if (a1 != null)
        a1.a(); 
    } 
  }
  
  public final void a() {
    this.e.lock();
    n n1 = this.f;
    if (n1 != null)
      if (this.g == 0) {
        n1.CancelOnPrepare();
      } else if (this.i) {
        boolean bool = n1.a();
        this.h = bool;
        if (!bool)
          this.f.pause(); 
      }  
    this.e.unlock();
  }
  
  public final boolean a(Context paramContext, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, long paramLong1, long paramLong2, a parama) {
    Runnable runnable;
    this.e.lock();
    this.c = parama;
    this.b = paramContext;
    this.d.drainPermits();
    this.g = 2;
    runOnUiThread(new Runnable(this, paramString, paramInt1, paramInt2, paramInt3, paramBoolean, paramLong1, paramLong2) {
          final String a;
          
          final int b;
          
          final int c;
          
          final int d;
          
          final boolean e;
          
          final long f;
          
          final long g;
          
          final o h;
          
          public final void run() {
            if (o.a(this.h) != null) {
              f.Log(5, "Video already playing");
              o.a(this.h, 2);
              o.b(this.h).release();
              return;
            } 
            o.a(this.h, new n(o.c(this.h), this.a, this.b, this.c, this.d, this.e, this.f, this.g, new n.a(this) {
                    final o.null a;
                    
                    public final void a(int param2Int) {
                      o.d(this.a.h).lock();
                      o.a(this.a.h, param2Int);
                      if (param2Int == 3 && o.e(this.a.h))
                        this.a.h.runOnUiThread(new Runnable(this) {
                              final o.null.null a;
                              
                              public final void run() {
                                o.f(this.a.a.h);
                                o.g(this.a.a.h).resume();
                              }
                            }); 
                      if (param2Int != 0)
                        o.b(this.a.h).release(); 
                      o.d(this.a.h).unlock();
                    }
                  }));
            if (o.a(this.h) != null)
              o.g(this.h).addView((View)o.a(this.h)); 
          }
        });
    paramBoolean = false;
    try {
      this.e.unlock();
      this.d.acquire();
      this.e.lock();
      paramInt1 = this.g;
      if (paramInt1 != 2)
        paramBoolean = true; 
    } catch (InterruptedException interruptedException) {}
    runOnUiThread(new Runnable(this) {
          final o a;
          
          public final void run() {
            o.g(this.a).pause();
          }
        });
    if (paramBoolean && this.g != 3) {
      runnable = new Runnable(this) {
          final o a;
          
          public final void run() {
            if (o.a(this.a) != null) {
              o.g(this.a).addViewToPlayer((View)o.a(this.a), true);
              o.h(this.a);
              o.a(this.a).requestFocus();
            } 
          }
        };
    } else {
      runnable = new Runnable(this) {
          final o a;
          
          public final void run() {
            o.f(this.a);
            o.g(this.a).resume();
          }
        };
    } 
    runOnUiThread(runnable);
    this.e.unlock();
    return paramBoolean;
  }
  
  public final void b() {
    this.e.lock();
    n n1 = this.f;
    if (n1 != null && this.i && !this.h)
      n1.start(); 
    this.e.unlock();
  }
  
  public final void c() {
    this.e.lock();
    n n1 = this.f;
    if (n1 != null)
      n1.updateVideoLayout(); 
    this.e.unlock();
  }
  
  protected final void runOnUiThread(Runnable paramRunnable) {
    Context context = this.b;
    if (context instanceof Activity) {
      ((Activity)context).runOnUiThread(paramRunnable);
      return;
    } 
    f.Log(5, "Not running from an Activity; Ignoring execution request...");
  }
  
  public static interface a {
    void a();
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\o.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */