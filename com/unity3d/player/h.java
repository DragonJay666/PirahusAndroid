package com.unity3d.player;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;

final class h implements Application.ActivityLifecycleCallbacks {
  WeakReference a = new WeakReference(null);
  
  Activity b;
  
  a c = null;
  
  h(Context paramContext) {
    if (paramContext instanceof Activity) {
      Activity activity = (Activity)paramContext;
      this.b = activity;
      activity.getApplication().registerActivityLifecycleCallbacks(this);
    } 
  }
  
  public final void a() {
    Activity activity = this.b;
    if (activity != null)
      activity.getApplication().unregisterActivityLifecycleCallbacks(this); 
  }
  
  public final void a(SurfaceView paramSurfaceView) {
    if (PlatformSupport.NOUGAT_SUPPORT && this.c == null) {
      a a1 = new a(this, (Context)this.b);
      this.c = a1;
      a1.a(paramSurfaceView);
    } 
  }
  
  public final void a(ViewGroup paramViewGroup) {
    a a1 = this.c;
    if (a1 != null && a1.getParent() == null) {
      paramViewGroup.addView(this.c);
      paramViewGroup.bringChildToFront(this.c);
    } 
  }
  
  public final void b(ViewGroup paramViewGroup) {
    a a1 = this.c;
    if (a1 != null && a1.getParent() != null)
      paramViewGroup.removeView(this.c); 
  }
  
  public final void onActivityCreated(Activity paramActivity, Bundle paramBundle) {}
  
  public final void onActivityDestroyed(Activity paramActivity) {}
  
  public final void onActivityPaused(Activity paramActivity) {}
  
  public final void onActivityResumed(Activity paramActivity) {
    this.a = new WeakReference<Activity>(paramActivity);
  }
  
  public final void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle) {}
  
  public final void onActivityStarted(Activity paramActivity) {}
  
  public final void onActivityStopped(Activity paramActivity) {}
  
  final class a extends View implements PixelCopy.OnPixelCopyFinishedListener {
    Bitmap a;
    
    final h b;
    
    a(h this$0, Context param1Context) {
      super(param1Context);
    }
    
    public final void a(SurfaceView param1SurfaceView) {
      Bitmap bitmap = Bitmap.createBitmap(param1SurfaceView.getWidth(), param1SurfaceView.getHeight(), Bitmap.Config.ARGB_8888);
      this.a = bitmap;
      PixelCopy.request(param1SurfaceView, bitmap, this, new Handler(Looper.getMainLooper()));
    }
    
    public final void onPixelCopyFinished(int param1Int) {
      if (param1Int == 0)
        setBackground((Drawable)new LayerDrawable(new Drawable[] { (Drawable)new ColorDrawable(-16777216), (Drawable)new BitmapDrawable(getResources(), this.a) })); 
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\h.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */