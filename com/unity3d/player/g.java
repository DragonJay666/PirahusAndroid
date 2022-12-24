package com.unity3d.player;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

public final class g extends Fragment {
  private final IPermissionRequestCallbacks a = null;
  
  private final Activity b = null;
  
  private final Looper c = null;
  
  public g() {}
  
  public g(Activity paramActivity, IPermissionRequestCallbacks paramIPermissionRequestCallbacks) {}
  
  public final void onCreate(Bundle paramBundle) {
    super.onCreate(paramBundle);
    requestPermissions(getArguments().getStringArray("PermissionNames"), 96489);
  }
  
  public final void onRequestPermissionsResult(int paramInt, String[] paramArrayOfString, int[] paramArrayOfint) {
    if (paramInt != 96489)
      return; 
    if (paramArrayOfString.length == 0) {
      requestPermissions(getArguments().getStringArray("PermissionNames"), 96489);
      return;
    } 
    for (paramInt = 0; paramInt < paramArrayOfString.length && paramInt < paramArrayOfint.length; paramInt++) {
      IPermissionRequestCallbacks iPermissionRequestCallbacks = this.a;
      if (iPermissionRequestCallbacks != null && this.b != null && this.c != null)
        if (iPermissionRequestCallbacks instanceof UnityPermissions.ModalWaitForPermissionResponse) {
          iPermissionRequestCallbacks.onPermissionGranted(paramArrayOfString[paramInt]);
        } else {
          String str;
          if (paramArrayOfString[paramInt] == null) {
            str = "<null>";
          } else {
            str = paramArrayOfString[paramInt];
          } 
          (new Handler(this.c)).post(new a(this, this.a, str, paramArrayOfint[paramInt], this.b.shouldShowRequestPermissionRationale(str)));
        }  
    } 
    FragmentTransaction fragmentTransaction = getActivity().getFragmentManager().beginTransaction();
    fragmentTransaction.remove(this);
    fragmentTransaction.commit();
  }
  
  final class a implements Runnable {
    final g a;
    
    private IPermissionRequestCallbacks b;
    
    private String c;
    
    private int d;
    
    private boolean e;
    
    a(g this$0, IPermissionRequestCallbacks param1IPermissionRequestCallbacks, String param1String, int param1Int, boolean param1Boolean) {
      this.b = param1IPermissionRequestCallbacks;
      this.c = param1String;
      this.d = param1Int;
      this.e = param1Boolean;
    }
    
    public final void run() {
      int i = this.d;
      if (i == -1) {
        if (this.e) {
          this.b.onPermissionDenied(this.c);
          return;
        } 
        this.b.onPermissionDeniedAndDontAskAgain(this.c);
        return;
      } 
      if (i == 0)
        this.b.onPermissionGranted(this.c); 
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\g.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */