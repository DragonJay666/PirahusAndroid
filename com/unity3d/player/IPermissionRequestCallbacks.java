package com.unity3d.player;

public interface IPermissionRequestCallbacks {
  void onPermissionDenied(String paramString);
  
  void onPermissionDeniedAndDontAskAgain(String paramString);
  
  void onPermissionGranted(String paramString);
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\IPermissionRequestCallbacks.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */