package com.unity3d.player;

import android.util.Log;

final class f {
  protected static boolean a = false;
  
  protected static void Log(int paramInt, String paramString) {
    if (a)
      return; 
    if (paramInt == 6)
      Log.e("Unity", paramString); 
    if (paramInt == 5)
      Log.w("Unity", paramString); 
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\f.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */