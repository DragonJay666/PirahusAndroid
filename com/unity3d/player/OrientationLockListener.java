package com.unity3d.player;

import android.content.Context;
import android.provider.Settings;

public class OrientationLockListener implements k.a {
  private k a;
  
  private Context b;
  
  OrientationLockListener(Context paramContext) {
    this.b = paramContext;
    this.a = new k(paramContext);
    nativeUpdateOrientationLockState(Settings.System.getInt(this.b.getContentResolver(), "accelerometer_rotation", 0));
    this.a.a(this, "accelerometer_rotation");
  }
  
  public final void a() {
    this.a.a();
    this.a = null;
  }
  
  public final void b() {
    nativeUpdateOrientationLockState(Settings.System.getInt(this.b.getContentResolver(), "accelerometer_rotation", 0));
  }
  
  public final native void nativeUpdateOrientationLockState(int paramInt);
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\OrientationLockListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */