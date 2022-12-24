package com.unity3d.player;

import android.os.Build;

public class PlatformSupport {
  static final boolean MARSHMALLOW_SUPPORT;
  
  static final boolean NOUGAT_SUPPORT;
  
  static {
    boolean bool2;
    int i = Build.VERSION.SDK_INT;
    boolean bool1 = true;
    if (i >= 23) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    MARSHMALLOW_SUPPORT = bool2;
    if (Build.VERSION.SDK_INT >= 24) {
      bool2 = bool1;
    } else {
      bool2 = false;
    } 
    NOUGAT_SUPPORT = bool2;
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\PlatformSupport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */