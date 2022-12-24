package com.google.androidgamesdk;

import android.app.Activity;
import android.hardware.display.DisplayManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class SwappyDisplayManager implements DisplayManager.DisplayListener {
  private final boolean DEBUG;
  
  private final String LOG_TAG;
  
  private final long ONE_MS_IN_NS;
  
  private final long ONE_S_IN_NS;
  
  private Activity mActivity;
  
  private long mCookie;
  
  private Display.Mode mCurrentMode;
  
  private a mLooper;
  
  private WindowManager mWindowManager;
  
  public SwappyDisplayManager(long paramLong, Activity paramActivity) {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial <init> : ()V
    //   4: aload_0
    //   5: ldc 'SwappyDisplayManager'
    //   7: putfield LOG_TAG : Ljava/lang/String;
    //   10: aload_0
    //   11: iconst_0
    //   12: putfield DEBUG : Z
    //   15: aload_0
    //   16: ldc2_w 1000000
    //   19: putfield ONE_MS_IN_NS : J
    //   22: aload_0
    //   23: ldc2_w 1000000000
    //   26: putfield ONE_S_IN_NS : J
    //   29: aload_3
    //   30: invokevirtual getPackageManager : ()Landroid/content/pm/PackageManager;
    //   33: aload_3
    //   34: invokevirtual getIntent : ()Landroid/content/Intent;
    //   37: invokevirtual getComponent : ()Landroid/content/ComponentName;
    //   40: sipush #128
    //   43: invokevirtual getActivityInfo : (Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    //   46: astore #4
    //   48: aload #4
    //   50: getfield metaData : Landroid/os/Bundle;
    //   53: ifnull -> 94
    //   56: aload #4
    //   58: getfield metaData : Landroid/os/Bundle;
    //   61: ldc 'android.app.lib_name'
    //   63: invokevirtual getString : (Ljava/lang/String;)Ljava/lang/String;
    //   66: astore #4
    //   68: aload #4
    //   70: ifnull -> 94
    //   73: aload #4
    //   75: invokestatic loadLibrary : (Ljava/lang/String;)V
    //   78: goto -> 94
    //   81: astore #4
    //   83: ldc 'SwappyDisplayManager'
    //   85: aload #4
    //   87: invokevirtual getMessage : ()Ljava/lang/String;
    //   90: invokestatic e : (Ljava/lang/String;Ljava/lang/String;)I
    //   93: pop
    //   94: aload_0
    //   95: lload_1
    //   96: putfield mCookie : J
    //   99: aload_0
    //   100: aload_3
    //   101: putfield mActivity : Landroid/app/Activity;
    //   104: aload_3
    //   105: ldc android/view/WindowManager
    //   107: invokevirtual getSystemService : (Ljava/lang/Class;)Ljava/lang/Object;
    //   110: checkcast android/view/WindowManager
    //   113: astore_3
    //   114: aload_0
    //   115: aload_3
    //   116: putfield mWindowManager : Landroid/view/WindowManager;
    //   119: aload_3
    //   120: invokeinterface getDefaultDisplay : ()Landroid/view/Display;
    //   125: astore_3
    //   126: aload_0
    //   127: aload_3
    //   128: invokevirtual getMode : ()Landroid/view/Display$Mode;
    //   131: putfield mCurrentMode : Landroid/view/Display$Mode;
    //   134: aload_0
    //   135: aload_3
    //   136: invokespecial updateSupportedRefreshRates : (Landroid/view/Display;)V
    //   139: aload_0
    //   140: getfield mActivity : Landroid/app/Activity;
    //   143: ldc android/hardware/display/DisplayManager
    //   145: invokevirtual getSystemService : (Ljava/lang/Class;)Ljava/lang/Object;
    //   148: checkcast android/hardware/display/DisplayManager
    //   151: astore_3
    //   152: aload_0
    //   153: monitorenter
    //   154: new com/google/androidgamesdk/SwappyDisplayManager$a
    //   157: astore #4
    //   159: aload #4
    //   161: aload_0
    //   162: iconst_0
    //   163: invokespecial <init> : (Lcom/google/androidgamesdk/SwappyDisplayManager;B)V
    //   166: aload_0
    //   167: aload #4
    //   169: putfield mLooper : Lcom/google/androidgamesdk/SwappyDisplayManager$a;
    //   172: aload #4
    //   174: invokevirtual start : ()V
    //   177: aload_3
    //   178: aload_0
    //   179: aload_0
    //   180: getfield mLooper : Lcom/google/androidgamesdk/SwappyDisplayManager$a;
    //   183: getfield a : Landroid/os/Handler;
    //   186: invokevirtual registerDisplayListener : (Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V
    //   189: aload_0
    //   190: monitorexit
    //   191: return
    //   192: astore_3
    //   193: aload_0
    //   194: monitorexit
    //   195: aload_3
    //   196: athrow
    // Exception table:
    //   from	to	target	type
    //   29	68	81	finally
    //   73	78	81	finally
    //   154	191	192	finally
    //   193	195	192	finally
  }
  
  private boolean modeMatchesCurrentResolution(Display.Mode paramMode) {
    return (paramMode.getPhysicalHeight() == this.mCurrentMode.getPhysicalHeight() && paramMode.getPhysicalWidth() == this.mCurrentMode.getPhysicalWidth());
  }
  
  private native void nOnRefreshPeriodChanged(long paramLong1, long paramLong2, long paramLong3, long paramLong4);
  
  private native void nSetSupportedRefreshPeriods(long paramLong, long[] paramArrayOflong, int[] paramArrayOfint);
  
  private void updateSupportedRefreshRates(Display paramDisplay) {
    Display.Mode[] arrayOfMode = paramDisplay.getSupportedModes();
    byte b1 = 0;
    int i = 0;
    int j;
    for (j = 0; i < arrayOfMode.length; j = k) {
      int k = j;
      if (modeMatchesCurrentResolution(arrayOfMode[i]))
        k = j + 1; 
      i++;
    } 
    long[] arrayOfLong = new long[j];
    int[] arrayOfInt = new int[j];
    j = 0;
    byte b2 = b1;
    while (b2 < arrayOfMode.length) {
      i = j;
      if (modeMatchesCurrentResolution(arrayOfMode[b2])) {
        arrayOfLong[j] = (long)(1.0E9F / arrayOfMode[b2].getRefreshRate());
        arrayOfInt[j] = arrayOfMode[b2].getModeId();
        i = j + 1;
      } 
      b2++;
      j = i;
    } 
    nSetSupportedRefreshPeriods(this.mCookie, arrayOfLong, arrayOfInt);
  }
  
  public void onDisplayAdded(int paramInt) {}
  
  public void onDisplayChanged(int paramInt) {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield mWindowManager : Landroid/view/WindowManager;
    //   6: invokeinterface getDefaultDisplay : ()Landroid/view/Display;
    //   11: astore_2
    //   12: aload_2
    //   13: invokevirtual getRefreshRate : ()F
    //   16: fstore_3
    //   17: aload_2
    //   18: invokevirtual getMode : ()Landroid/view/Display$Mode;
    //   21: astore #4
    //   23: aload #4
    //   25: invokevirtual getPhysicalWidth : ()I
    //   28: istore #5
    //   30: aload_0
    //   31: getfield mCurrentMode : Landroid/view/Display$Mode;
    //   34: invokevirtual getPhysicalWidth : ()I
    //   37: istore_1
    //   38: iconst_1
    //   39: istore #6
    //   41: iload #5
    //   43: iload_1
    //   44: if_icmpeq -> 52
    //   47: iconst_1
    //   48: istore_1
    //   49: goto -> 54
    //   52: iconst_0
    //   53: istore_1
    //   54: aload #4
    //   56: invokevirtual getPhysicalHeight : ()I
    //   59: aload_0
    //   60: getfield mCurrentMode : Landroid/view/Display$Mode;
    //   63: invokevirtual getPhysicalHeight : ()I
    //   66: if_icmpeq -> 75
    //   69: iconst_1
    //   70: istore #5
    //   72: goto -> 78
    //   75: iconst_0
    //   76: istore #5
    //   78: fload_3
    //   79: aload_0
    //   80: getfield mCurrentMode : Landroid/view/Display$Mode;
    //   83: invokevirtual getRefreshRate : ()F
    //   86: fcmpl
    //   87: ifeq -> 93
    //   90: goto -> 96
    //   93: iconst_0
    //   94: istore #6
    //   96: aload_0
    //   97: aload #4
    //   99: putfield mCurrentMode : Landroid/view/Display$Mode;
    //   102: iload_1
    //   103: iload #5
    //   105: ior
    //   106: ifeq -> 114
    //   109: aload_0
    //   110: aload_2
    //   111: invokespecial updateSupportedRefreshRates : (Landroid/view/Display;)V
    //   114: iload #6
    //   116: ifeq -> 167
    //   119: aload_2
    //   120: invokevirtual getAppVsyncOffsetNanos : ()J
    //   123: lstore #7
    //   125: aload_0
    //   126: getfield mWindowManager : Landroid/view/WindowManager;
    //   129: invokeinterface getDefaultDisplay : ()Landroid/view/Display;
    //   134: invokevirtual getPresentationDeadlineNanos : ()J
    //   137: lstore #9
    //   139: ldc 1.0E9
    //   141: fload_3
    //   142: fdiv
    //   143: f2l
    //   144: lstore #11
    //   146: aload_0
    //   147: aload_0
    //   148: getfield mCookie : J
    //   151: lload #11
    //   153: lload #7
    //   155: lload #11
    //   157: lload #9
    //   159: ldc2_w 1000000
    //   162: lsub
    //   163: lsub
    //   164: invokespecial nOnRefreshPeriodChanged : (JJJJ)V
    //   167: aload_0
    //   168: monitorexit
    //   169: return
    //   170: astore_2
    //   171: aload_0
    //   172: monitorexit
    //   173: aload_2
    //   174: athrow
    // Exception table:
    //   from	to	target	type
    //   2	38	170	finally
    //   54	69	170	finally
    //   78	90	170	finally
    //   96	102	170	finally
    //   109	114	170	finally
    //   119	139	170	finally
    //   146	167	170	finally
    //   167	169	170	finally
    //   171	173	170	finally
  }
  
  public void onDisplayRemoved(int paramInt) {}
  
  public void setPreferredDisplayModeId(int paramInt) {
    this.mActivity.runOnUiThread(new Runnable(this, paramInt) {
          final int a;
          
          final SwappyDisplayManager b;
          
          public final void run() {
            Window window = this.b.mActivity.getWindow();
            WindowManager.LayoutParams layoutParams = window.getAttributes();
            layoutParams.preferredDisplayModeId = this.a;
            window.setAttributes(layoutParams);
          }
        });
  }
  
  public void terminate() {
    this.mLooper.a.getLooper().quit();
  }
  
  private final class a extends Thread {
    public Handler a;
    
    final SwappyDisplayManager b;
    
    private Lock c;
    
    private Condition d;
    
    private a(SwappyDisplayManager this$0) {
      ReentrantLock reentrantLock = new ReentrantLock();
      this.c = reentrantLock;
      this.d = reentrantLock.newCondition();
    }
    
    public final void run() {
      Log.i("SwappyDisplayManager", "Starting looper thread");
      this.c.lock();
      Looper.prepare();
      this.a = new Handler();
      this.d.signal();
      this.c.unlock();
      Looper.loop();
      Log.i("SwappyDisplayManager", "Terminating looper thread");
    }
    
    public final void start() {
      this.c.lock();
      super.start();
      try {
        this.d.await();
      } catch (InterruptedException interruptedException) {
        interruptedException.printStackTrace();
      } 
      this.c.unlock();
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\com\google\androidgamesdk\SwappyDisplayManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */