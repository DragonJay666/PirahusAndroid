package com.unity3d.player;

import android.app.Activity;
import android.content.pm.ApplicationInfo;

public class MultiWindowSupport {
  private static final String RESIZABLE_WINDOW = "unity.allow-resizable-window";
  
  private static boolean s_LastMultiWindowMode = false;
  
  public static boolean getAllowResizableWindow(Activity paramActivity) {
    try {
      ApplicationInfo applicationInfo = paramActivity.getPackageManager().getApplicationInfo(paramActivity.getPackageName(), 128);
      if (isInMultiWindowMode(paramActivity)) {
        boolean bool = applicationInfo.metaData.getBoolean("unity.allow-resizable-window");
        if (bool)
          return true; 
      } 
    } catch (Exception exception) {}
    return false;
  }
  
  static boolean isInMultiWindowMode(Activity paramActivity) {
    return PlatformSupport.NOUGAT_SUPPORT ? paramActivity.isInMultiWindowMode() : false;
  }
  
  public static boolean isMultiWindowModeChangedToTrue(Activity paramActivity) {
    return (!s_LastMultiWindowMode && isInMultiWindowMode(paramActivity));
  }
  
  public static void saveMultiWindowMode(Activity paramActivity) {
    s_LastMultiWindowMode = isInMultiWindowMode(paramActivity);
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\MultiWindowSupport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */