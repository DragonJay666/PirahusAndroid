package com.unity3d.player;

import android.app.Activity;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageItemInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

public class UnityPermissions {
  private static final String SKIP_DIALOG_METADATA_NAME = "unityplayer.SkipPermissionsDialog";
  
  private static boolean checkInfoForMetadata(PackageItemInfo paramPackageItemInfo) {
    try {
      return paramPackageItemInfo.metaData.getBoolean("unityplayer.SkipPermissionsDialog");
    } catch (Exception exception) {
      return false;
    } 
  }
  
  public static boolean hasUserAuthorizedPermission(Activity paramActivity, String paramString) {
    return (paramActivity.checkCallingOrSelfPermission(paramString) == 0);
  }
  
  public static void requestUserPermissions(Activity paramActivity, String[] paramArrayOfString, IPermissionRequestCallbacks paramIPermissionRequestCallbacks) {
    if (!PlatformSupport.MARSHMALLOW_SUPPORT)
      return; 
    if (paramActivity != null && paramArrayOfString != null) {
      FragmentManager fragmentManager = paramActivity.getFragmentManager();
      if (fragmentManager.findFragmentByTag("96489") == null) {
        g g = new g(paramActivity, paramIPermissionRequestCallbacks);
        Bundle bundle = new Bundle();
        bundle.putStringArray("PermissionNames", paramArrayOfString);
        g.setArguments(bundle);
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.add(0, g, "96489");
        fragmentTransaction.commit();
      } 
    } 
  }
  
  public static boolean skipPermissionsDialog(Activity paramActivity) {
    if (!PlatformSupport.MARSHMALLOW_SUPPORT)
      return false; 
    try {
      PackageManager packageManager = paramActivity.getPackageManager();
      ActivityInfo activityInfo = packageManager.getActivityInfo(paramActivity.getComponentName(), 128);
      ApplicationInfo applicationInfo = packageManager.getApplicationInfo(paramActivity.getPackageName(), 128);
      if (!checkInfoForMetadata((PackageItemInfo)activityInfo)) {
        boolean bool = checkInfoForMetadata((PackageItemInfo)applicationInfo);
        if (bool)
          return true; 
      } else {
        return true;
      } 
    } catch (Exception exception) {}
    return false;
  }
  
  public static class ModalWaitForPermissionResponse implements IPermissionRequestCallbacks {
    private boolean haveResponse = false;
    
    public void onPermissionDenied(String param1String) {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: iconst_1
      //   4: putfield haveResponse : Z
      //   7: aload_0
      //   8: invokevirtual notify : ()V
      //   11: aload_0
      //   12: monitorexit
      //   13: return
      //   14: astore_1
      //   15: aload_0
      //   16: monitorexit
      //   17: aload_1
      //   18: athrow
      // Exception table:
      //   from	to	target	type
      //   2	11	14	finally
    }
    
    public void onPermissionDeniedAndDontAskAgain(String param1String) {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: iconst_1
      //   4: putfield haveResponse : Z
      //   7: aload_0
      //   8: invokevirtual notify : ()V
      //   11: aload_0
      //   12: monitorexit
      //   13: return
      //   14: astore_1
      //   15: aload_0
      //   16: monitorexit
      //   17: aload_1
      //   18: athrow
      // Exception table:
      //   from	to	target	type
      //   2	11	14	finally
    }
    
    public void onPermissionGranted(String param1String) {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: iconst_1
      //   4: putfield haveResponse : Z
      //   7: aload_0
      //   8: invokevirtual notify : ()V
      //   11: aload_0
      //   12: monitorexit
      //   13: return
      //   14: astore_1
      //   15: aload_0
      //   16: monitorexit
      //   17: aload_1
      //   18: athrow
      // Exception table:
      //   from	to	target	type
      //   2	11	14	finally
    }
    
    public void waitForResponse() {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield haveResponse : Z
      //   6: istore_1
      //   7: iload_1
      //   8: ifeq -> 14
      //   11: aload_0
      //   12: monitorexit
      //   13: return
      //   14: aload_0
      //   15: invokevirtual wait : ()V
      //   18: aload_0
      //   19: monitorexit
      //   20: return
      //   21: astore_2
      //   22: aload_0
      //   23: monitorexit
      //   24: aload_2
      //   25: athrow
      //   26: astore_2
      //   27: aload_0
      //   28: monitorexit
      //   29: return
      // Exception table:
      //   from	to	target	type
      //   2	7	26	java/lang/InterruptedException
      //   2	7	21	finally
      //   14	18	26	java/lang/InterruptedException
      //   14	18	21	finally
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\UnityPermissions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */