package com.unity3d.player;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.OrientationEventListener;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowManager;
import android.widget.FrameLayout;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

public class UnityPlayer extends FrameLayout implements IUnityPlayerLifecycleEvents {
  private static final int ANR_TIMEOUT_SECONDS = 4;
  
  private static final String ARCORE_ENABLE_METADATA_NAME = "unity.arcore-enable";
  
  private static final String LAUNCH_FULLSCREEN = "unity.launch-fullscreen";
  
  private static final int RUN_STATE_CHANGED_MSG_CODE = 2269;
  
  private static final String SPLASH_ENABLE_METADATA_NAME = "unity.splash-enable";
  
  private static final String SPLASH_MODE_METADATA_NAME = "unity.splash-mode";
  
  public static Activity currentActivity;
  
  private Context mContext;
  
  private SurfaceView mGlView;
  
  private int mInitialScreenOrientation;
  
  private boolean mIsFullscreen;
  
  private BroadcastReceiver mKillingIsMyBusiness;
  
  private boolean mMainDisplayOverride;
  
  private int mNaturalOrientation;
  
  private OrientationEventListener mOrientationListener;
  
  private boolean mProcessKillRequested;
  
  private boolean mQuitting;
  
  i mSoftInputDialog;
  
  private m mState;
  
  private o mVideoPlayerProxy;
  
  private GoogleARCoreApi m_ARCoreApi;
  
  private boolean m_AddPhoneCallListener;
  
  private AudioVolumeHandler m_AudioVolumeHandler;
  
  private Camera2Wrapper m_Camera2Wrapper;
  
  private ClipboardManager m_ClipboardManager;
  
  private final ConcurrentLinkedQueue m_Events;
  
  private a m_FakeListener;
  
  private HFPStatus m_HFPStatus;
  
  e m_MainThread;
  
  private NetworkConnectivity m_NetworkConnectivity;
  
  private OrientationLockListener m_OrientationLockListener;
  
  private h m_PersistentUnitySurface;
  
  private c m_PhoneCallListener;
  
  private j m_SplashScreen;
  
  private TelephonyManager m_TelephonyManager;
  
  private IUnityPlayerLifecycleEvents m_UnityPlayerLifecycleEvents;
  
  private Uri m_launchUri;
  
  static {
    (new l()).a();
  }
  
  public UnityPlayer(Context paramContext) {
    this(paramContext, (IUnityPlayerLifecycleEvents)null);
  }
  
  public UnityPlayer(Context paramContext, IUnityPlayerLifecycleEvents paramIUnityPlayerLifecycleEvents) {
    super(paramContext);
    AlertDialog alertDialog;
    this.mInitialScreenOrientation = -1;
    this.mMainDisplayOverride = false;
    this.mIsFullscreen = true;
    this.mState = new m();
    this.m_Events = new ConcurrentLinkedQueue();
    this.mKillingIsMyBusiness = null;
    this.mOrientationListener = null;
    this.m_MainThread = new e((byte)0);
    this.m_AddPhoneCallListener = false;
    this.m_PhoneCallListener = new c((byte)0);
    this.m_ARCoreApi = null;
    this.m_FakeListener = new a(this);
    this.m_Camera2Wrapper = null;
    this.m_HFPStatus = null;
    this.m_AudioVolumeHandler = null;
    this.m_OrientationLockListener = null;
    this.m_launchUri = null;
    this.m_NetworkConnectivity = null;
    this.m_UnityPlayerLifecycleEvents = null;
    this.mProcessKillRequested = true;
    this.mSoftInputDialog = null;
    if (paramIUnityPlayerLifecycleEvents == null)
      paramIUnityPlayerLifecycleEvents = this; 
    this.m_UnityPlayerLifecycleEvents = paramIUnityPlayerLifecycleEvents;
    if (paramContext instanceof Activity) {
      Activity activity = (Activity)paramContext;
      currentActivity = activity;
      this.mInitialScreenOrientation = activity.getRequestedOrientation();
      this.m_launchUri = currentActivity.getIntent().getData();
    } 
    this.mContext = paramContext;
    EarlyEnableFullScreenIfEnabled(currentActivity);
    this.mNaturalOrientation = getNaturalOrientation((getResources().getConfiguration()).orientation);
    if (currentActivity != null && getSplashEnabled()) {
      j j1 = new j(this.mContext, j.a.a()[getSplashMode()]);
      this.m_SplashScreen = j1;
      addView(j1);
    } 
    if (currentActivity != null)
      this.m_PersistentUnitySurface = new h(this.mContext); 
    preloadJavaPlugins();
    String str = loadNative(getUnityNativeLibraryPath(paramContext));
    if (!m.c()) {
      f.Log(6, "Your hardware does not support this application.");
      AlertDialog.Builder builder = (new AlertDialog.Builder(this.mContext)).setTitle("Failure to initialize!").setPositiveButton("OK", new DialogInterface.OnClickListener(this) {
            final UnityPlayer a;
            
            public final void onClick(DialogInterface param1DialogInterface, int param1Int) {
              this.a.finish();
            }
          });
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Your hardware does not support this application.");
      stringBuilder.append("\n\n");
      stringBuilder.append(str);
      stringBuilder.append("\n\n Press OK to quit.");
      alertDialog = builder.setMessage(stringBuilder.toString()).create();
      alertDialog.setCancelable(false);
      alertDialog.show();
      return;
    } 
    initJni((Context)alertDialog);
    this.mState.c(true);
    SurfaceView surfaceView = CreateGlView();
    this.mGlView = surfaceView;
    surfaceView.setContentDescription(GetGlViewContentDescription((Context)alertDialog));
    addView((View)this.mGlView);
    bringChildToFront(this.m_SplashScreen);
    this.mQuitting = false;
    hideStatusBar();
    this.m_TelephonyManager = (TelephonyManager)this.mContext.getSystemService("phone");
    this.m_ClipboardManager = (ClipboardManager)this.mContext.getSystemService("clipboard");
    this.m_Camera2Wrapper = new Camera2Wrapper(this.mContext);
    this.m_HFPStatus = new HFPStatus(this.mContext);
    this.m_MainThread.start();
  }
  
  private SurfaceView CreateGlView() {
    SurfaceView surfaceView = new SurfaceView(this.mContext);
    surfaceView.setId(this.mContext.getResources().getIdentifier("unitySurfaceView", "id", this.mContext.getPackageName()));
    if (IsWindowTranslucent()) {
      surfaceView.getHolder().setFormat(-3);
      surfaceView.setZOrderOnTop(true);
    } else {
      surfaceView.getHolder().setFormat(-1);
    } 
    surfaceView.getHolder().addCallback(new SurfaceHolder.Callback(this) {
          final UnityPlayer a;
          
          public final void surfaceChanged(SurfaceHolder param1SurfaceHolder, int param1Int1, int param1Int2, int param1Int3) {
            this.a.updateGLDisplay(0, param1SurfaceHolder.getSurface());
            this.a.sendSurfaceChangedEvent();
          }
          
          public final void surfaceCreated(SurfaceHolder param1SurfaceHolder) {
            this.a.updateGLDisplay(0, param1SurfaceHolder.getSurface());
            if (this.a.m_PersistentUnitySurface != null)
              this.a.m_PersistentUnitySurface.a((ViewGroup)this.a); 
          }
          
          public final void surfaceDestroyed(SurfaceHolder param1SurfaceHolder) {
            if (this.a.m_PersistentUnitySurface != null)
              this.a.m_PersistentUnitySurface.a(this.a.mGlView); 
            this.a.updateGLDisplay(0, (Surface)null);
          }
        });
    surfaceView.setFocusable(true);
    surfaceView.setFocusableInTouchMode(true);
    return surfaceView;
  }
  
  private void DisableStaticSplashScreen() {
    runOnUiThread(new Runnable(this) {
          final UnityPlayer a;
          
          public final void run() {
            UnityPlayer unityPlayer = this.a;
            unityPlayer.removeView(unityPlayer.m_SplashScreen);
            UnityPlayer.access$1002(this.a, (j)null);
          }
        });
  }
  
  private void EarlyEnableFullScreenIfEnabled(Activity paramActivity) {
    if (paramActivity != null && paramActivity.getWindow() != null && (getLaunchFullscreen() || paramActivity.getIntent().getBooleanExtra("android.intent.extra.VR_LAUNCH", false))) {
      View view = paramActivity.getWindow().getDecorView();
      if (view != null)
        view.setSystemUiVisibility(7); 
    } 
  }
  
  private String GetGlViewContentDescription(Context paramContext) {
    return paramContext.getResources().getString(paramContext.getResources().getIdentifier("game_view_content_description", "string", paramContext.getPackageName()));
  }
  
  private boolean IsWindowTranslucent() {
    Activity activity = currentActivity;
    if (activity == null)
      return false; 
    TypedArray typedArray = activity.getTheme().obtainStyledAttributes(new int[] { 16842840 });
    boolean bool = typedArray.getBoolean(0, false);
    typedArray.recycle();
    return bool;
  }
  
  public static void UnitySendMessage(String paramString1, String paramString2, String paramString3) {
    StringBuilder stringBuilder;
    if (!m.c()) {
      stringBuilder = new StringBuilder("Native libraries not loaded - dropping message for ");
      stringBuilder.append(paramString1);
      stringBuilder.append(".");
      stringBuilder.append(paramString2);
      f.Log(5, stringBuilder.toString());
      return;
    } 
    try {
      nativeUnitySendMessage(paramString1, paramString2, stringBuilder.getBytes("UTF-8"));
    } catch (UnsupportedEncodingException unsupportedEncodingException) {}
  }
  
  private void checkResumePlayer() {
    boolean bool;
    Activity activity = currentActivity;
    if (activity != null) {
      bool = MultiWindowSupport.getAllowResizableWindow(activity);
    } else {
      bool = false;
    } 
    if (!this.mState.e(bool))
      return; 
    this.mState.d(true);
    queueGLThreadEvent(new Runnable(this) {
          final UnityPlayer a;
          
          public final void run() {
            this.a.nativeResume();
            this.a.runOnUiThread(new Runnable(this) {
                  final UnityPlayer.null a;
                  
                  public final void run() {
                    if (this.a.a.m_PersistentUnitySurface != null)
                      this.a.a.m_PersistentUnitySurface.b((ViewGroup)this.a.a); 
                  }
                });
          }
        });
    this.m_MainThread.b();
  }
  
  private void finish() {
    Context context = this.mContext;
    if (context instanceof Activity && !((Activity)context).isFinishing())
      ((Activity)this.mContext).finish(); 
  }
  
  private boolean getARCoreEnabled() {
    try {
      return (getApplicationInfo()).metaData.getBoolean("unity.arcore-enable");
    } catch (Exception exception) {
      return false;
    } 
  }
  
  private ApplicationInfo getApplicationInfo() {
    return this.mContext.getPackageManager().getApplicationInfo(this.mContext.getPackageName(), 128);
  }
  
  private boolean getLaunchFullscreen() {
    try {
      return (getApplicationInfo()).metaData.getBoolean("unity.launch-fullscreen");
    } catch (Exception exception) {
      return false;
    } 
  }
  
  private int getNaturalOrientation(int paramInt) {
    int k = ((WindowManager)this.mContext.getSystemService("window")).getDefaultDisplay().getRotation();
    return (((k == 0 || k == 2) && paramInt == 2) || ((k == 1 || k == 3) && paramInt == 1)) ? 0 : 1;
  }
  
  private String getProcessName() {
    int k = Process.myPid();
    List list = ((ActivityManager)this.mContext.getSystemService("activity")).getRunningAppProcesses();
    if (list == null)
      return null; 
    for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : list) {
      if (runningAppProcessInfo.pid == k)
        return runningAppProcessInfo.processName; 
    } 
    return null;
  }
  
  private boolean getSplashEnabled() {
    try {
      return (getApplicationInfo()).metaData.getBoolean("unity.splash-enable");
    } catch (Exception exception) {
      return false;
    } 
  }
  
  private static String getUnityNativeLibraryPath(Context paramContext) {
    return (paramContext.getApplicationInfo()).nativeLibraryDir;
  }
  
  private void hideStatusBar() {
    Context context = this.mContext;
    if (context instanceof Activity)
      ((Activity)context).getWindow().setFlags(1024, 1024); 
  }
  
  private final native void initJni(Context paramContext);
  
  private static String loadNative(String paramString) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(paramString);
    stringBuilder.append("/libmain.so");
    String str = stringBuilder.toString();
    try {
      System.load(str);
    } catch (UnsatisfiedLinkError unsatisfiedLinkError) {
      try {
        System.loadLibrary("main");
        if (NativeLoader.load(paramString)) {
          m.a();
          return "";
        } 
        f.Log(6, "NativeLoader.load failure, Unity libraries were not loaded.");
        return "NativeLoader.load failure, Unity libraries were not loaded.";
      } catch (UnsatisfiedLinkError unsatisfiedLinkError1) {
        return logLoadLibMainError(str, unsatisfiedLinkError1.toString());
      } 
    } catch (SecurityException securityException) {}
    if (NativeLoader.load((String)securityException)) {
      m.a();
      return "";
    } 
    f.Log(6, "NativeLoader.load failure, Unity libraries were not loaded.");
    return "NativeLoader.load failure, Unity libraries were not loaded.";
  }
  
  private static String logLoadLibMainError(String paramString1, String paramString2) {
    StringBuilder stringBuilder = new StringBuilder("Failed to load 'libmain.so'\n\n");
    stringBuilder.append(paramString2);
    String str = stringBuilder.toString();
    f.Log(6, str);
    return str;
  }
  
  private final native void nativeApplicationUnload();
  
  private final native boolean nativeDone();
  
  private final native void nativeFocusChanged(boolean paramBoolean);
  
  private final native boolean nativeInjectEvent(InputEvent paramInputEvent);
  
  private final native boolean nativeIsAutorotationOn();
  
  private final native void nativeLowMemory();
  
  private final native void nativeMuteMasterAudio(boolean paramBoolean);
  
  private final native void nativeOrientationChanged(int paramInt1, int paramInt2);
  
  private final native boolean nativePause();
  
  private final native void nativeRecreateGfxState(int paramInt, Surface paramSurface);
  
  private final native boolean nativeRender();
  
  private final native void nativeReportKeyboardConfigChanged();
  
  private final native void nativeRestartActivityIndicator();
  
  private final native void nativeResume();
  
  private final native void nativeSendSurfaceChangedEvent();
  
  private final native void nativeSetInputArea(int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  private final native void nativeSetInputSelection(int paramInt1, int paramInt2);
  
  private final native void nativeSetInputString(String paramString);
  
  private final native void nativeSetKeyboardIsVisible(boolean paramBoolean);
  
  private final native void nativeSetLaunchURL(String paramString);
  
  private final native void nativeSoftInputCanceled();
  
  private final native void nativeSoftInputClosed();
  
  private final native void nativeSoftInputLostFocus();
  
  private static native void nativeUnitySendMessage(String paramString1, String paramString2, byte[] paramArrayOfbyte);
  
  private void pauseUnity() {
    reportSoftInputStr((String)null, 1, true);
    if (!this.mState.f())
      return; 
    if (m.c()) {
      Runnable runnable;
      Semaphore semaphore = new Semaphore(0);
      if (isFinishing()) {
        runnable = new Runnable(this, semaphore) {
            final Semaphore a;
            
            final UnityPlayer b;
            
            public final void run() {
              this.b.shutdown();
              this.a.release();
            }
          };
      } else {
        runnable = new Runnable(this, semaphore) {
            final Semaphore a;
            
            final UnityPlayer b;
            
            public final void run() {
              if (this.b.nativePause()) {
                UnityPlayer.access$2002(this.b, true);
                this.b.shutdown();
                this.a.release(2);
                return;
              } 
              this.a.release();
            }
          };
      } 
      this.m_MainThread.a(runnable);
      try {
        if (!semaphore.tryAcquire(4L, TimeUnit.SECONDS))
          f.Log(5, "Timeout while trying to pause the Unity Engine."); 
      } catch (InterruptedException interruptedException) {
        f.Log(5, "UI thread got interrupted while trying to pause the Unity Engine.");
      } 
      if (semaphore.drainPermits() > 0)
        destroy(); 
    } 
    this.mState.d(false);
    this.mState.b(true);
    if (this.m_AddPhoneCallListener)
      this.m_TelephonyManager.listen(this.m_PhoneCallListener, 0); 
  }
  
  private static void preloadJavaPlugins() {
    try {
      Class.forName("com.unity3d.JavaPluginPreloader");
      return;
    } catch (ClassNotFoundException classNotFoundException) {
    
    } catch (LinkageError linkageError) {
      StringBuilder stringBuilder = new StringBuilder("Java class preloading failed: ");
      stringBuilder.append(linkageError.getMessage());
      f.Log(6, stringBuilder.toString());
    } 
  }
  
  private void queueGLThreadEvent(f paramf) {
    if (isFinishing())
      return; 
    queueGLThreadEvent(paramf);
  }
  
  private void queueGLThreadEvent(Runnable paramRunnable) {
    if (!m.c())
      return; 
    if (Thread.currentThread() == this.m_MainThread) {
      paramRunnable.run();
      return;
    } 
    this.m_Events.add(paramRunnable);
  }
  
  private void sendSurfaceChangedEvent() {
    if (m.c() && this.mState.e()) {
      Runnable runnable = new Runnable(this) {
          final UnityPlayer a;
          
          public final void run() {
            this.a.nativeSendSurfaceChangedEvent();
          }
        };
      this.m_MainThread.d(runnable);
    } 
  }
  
  private void shutdown() {
    this.mProcessKillRequested = nativeDone();
    this.mState.c(false);
  }
  
  private void swapViews(View paramView1, View paramView2) {
    boolean bool;
    if (!this.mState.d()) {
      pause();
      bool = true;
    } else {
      bool = false;
    } 
    if (paramView1 != null) {
      ViewParent viewParent = paramView1.getParent();
      if (!(viewParent instanceof UnityPlayer) || (UnityPlayer)viewParent != this) {
        if (viewParent instanceof ViewGroup)
          ((ViewGroup)viewParent).removeView(paramView1); 
        addView(paramView1);
        bringChildToFront(paramView1);
        paramView1.setVisibility(0);
      } 
    } 
    if (paramView2 != null && paramView2.getParent() == this) {
      paramView2.setVisibility(8);
      removeView(paramView2);
    } 
    if (bool)
      resume(); 
  }
  
  private static void unloadNative() {
    if (!m.c())
      return; 
    if (NativeLoader.unload()) {
      m.b();
      return;
    } 
    throw new UnsatisfiedLinkError("Unable to unload libraries from libmain.so");
  }
  
  private boolean updateDisplayInternal(int paramInt, Surface paramSurface) {
    if (!m.c() || !this.mState.e())
      return false; 
    Semaphore semaphore = new Semaphore(0);
    Runnable runnable = new Runnable(this, paramInt, paramSurface, semaphore) {
        final int a;
        
        final Surface b;
        
        final Semaphore c;
        
        final UnityPlayer d;
        
        public final void run() {
          this.d.nativeRecreateGfxState(this.a, this.b);
          this.c.release();
        }
      };
    if (paramInt == 0) {
      e e1 = this.m_MainThread;
      if (paramSurface == null) {
        e1.b(runnable);
      } else {
        e1.c(runnable);
      } 
    } else {
      runnable.run();
    } 
    if (paramSurface == null && paramInt == 0)
      try {
        if (!semaphore.tryAcquire(4L, TimeUnit.SECONDS))
          f.Log(5, "Timeout while trying detaching primary window."); 
      } catch (InterruptedException interruptedException) {
        f.Log(5, "UI thread got interrupted while trying to detach the primary window from the Unity Engine.");
      }  
    return true;
  }
  
  private void updateGLDisplay(int paramInt, Surface paramSurface) {
    if (this.mMainDisplayOverride)
      return; 
    updateDisplayInternal(paramInt, paramSurface);
  }
  
  protected void addPhoneCallListener() {
    this.m_AddPhoneCallListener = true;
    this.m_TelephonyManager.listen(this.m_PhoneCallListener, 32);
  }
  
  public boolean addViewToPlayer(View paramView, boolean paramBoolean) {
    // Byte code:
    //   0: iload_2
    //   1: ifeq -> 12
    //   4: aload_0
    //   5: getfield mGlView : Landroid/view/SurfaceView;
    //   8: astore_3
    //   9: goto -> 14
    //   12: aconst_null
    //   13: astore_3
    //   14: aload_0
    //   15: aload_1
    //   16: aload_3
    //   17: invokespecial swapViews : (Landroid/view/View;Landroid/view/View;)V
    //   20: aload_1
    //   21: invokevirtual getParent : ()Landroid/view/ViewParent;
    //   24: astore_1
    //   25: iconst_1
    //   26: istore #4
    //   28: aload_1
    //   29: aload_0
    //   30: if_acmpne -> 39
    //   33: iconst_1
    //   34: istore #5
    //   36: goto -> 42
    //   39: iconst_0
    //   40: istore #5
    //   42: iload_2
    //   43: ifeq -> 62
    //   46: aload_0
    //   47: getfield mGlView : Landroid/view/SurfaceView;
    //   50: invokevirtual getParent : ()Landroid/view/ViewParent;
    //   53: ifnonnull -> 62
    //   56: iconst_1
    //   57: istore #6
    //   59: goto -> 65
    //   62: iconst_0
    //   63: istore #6
    //   65: aload_0
    //   66: getfield mGlView : Landroid/view/SurfaceView;
    //   69: invokevirtual getParent : ()Landroid/view/ViewParent;
    //   72: aload_0
    //   73: if_acmpne -> 82
    //   76: iconst_1
    //   77: istore #7
    //   79: goto -> 85
    //   82: iconst_0
    //   83: istore #7
    //   85: iload #5
    //   87: ifeq -> 109
    //   90: iload #4
    //   92: istore_2
    //   93: iload #6
    //   95: ifne -> 111
    //   98: iload #7
    //   100: ifeq -> 109
    //   103: iload #4
    //   105: istore_2
    //   106: goto -> 111
    //   109: iconst_0
    //   110: istore_2
    //   111: iload_2
    //   112: ifne -> 146
    //   115: iload #5
    //   117: ifne -> 128
    //   120: bipush #6
    //   122: ldc_w 'addViewToPlayer: Failure adding view to hierarchy'
    //   125: invokestatic Log : (ILjava/lang/String;)V
    //   128: iload #6
    //   130: ifne -> 146
    //   133: iload #7
    //   135: ifne -> 146
    //   138: bipush #6
    //   140: ldc_w 'addViewToPlayer: Failure removing old view from hierarchy'
    //   143: invokestatic Log : (ILjava/lang/String;)V
    //   146: iload_2
    //   147: ireturn
  }
  
  public void configurationChanged(Configuration paramConfiguration) {
    SurfaceView surfaceView = this.mGlView;
    if (surfaceView instanceof SurfaceView)
      surfaceView.getHolder().setSizeFromLayout(); 
    o o1 = this.mVideoPlayerProxy;
    if (o1 != null)
      o1.c(); 
  }
  
  public void destroy() {
    h h1 = this.m_PersistentUnitySurface;
    if (h1 != null) {
      h1.a();
      this.m_PersistentUnitySurface = null;
    } 
    Camera2Wrapper camera2Wrapper = this.m_Camera2Wrapper;
    if (camera2Wrapper != null) {
      camera2Wrapper.a();
      this.m_Camera2Wrapper = null;
    } 
    HFPStatus hFPStatus = this.m_HFPStatus;
    if (hFPStatus != null) {
      hFPStatus.a();
      this.m_HFPStatus = null;
    } 
    NetworkConnectivity networkConnectivity = this.m_NetworkConnectivity;
    if (networkConnectivity != null) {
      networkConnectivity.b();
      this.m_NetworkConnectivity = null;
    } 
    this.mQuitting = true;
    if (!this.mState.d())
      pause(); 
    this.m_MainThread.a();
    try {
      this.m_MainThread.join(4000L);
    } catch (InterruptedException interruptedException) {
      this.m_MainThread.interrupt();
    } 
    BroadcastReceiver broadcastReceiver = this.mKillingIsMyBusiness;
    if (broadcastReceiver != null)
      this.mContext.unregisterReceiver(broadcastReceiver); 
    this.mKillingIsMyBusiness = null;
    if (m.c())
      removeAllViews(); 
    if (this.mProcessKillRequested) {
      this.m_UnityPlayerLifecycleEvents.onUnityPlayerQuitted();
      kill();
    } 
    unloadNative();
  }
  
  protected void disableLogger() {
    f.a = true;
  }
  
  public boolean displayChanged(int paramInt, Surface paramSurface) {
    if (paramInt == 0) {
      boolean bool;
      if (paramSurface != null) {
        bool = true;
      } else {
        bool = false;
      } 
      this.mMainDisplayOverride = bool;
      runOnUiThread(new Runnable(this) {
            final UnityPlayer a;
            
            public final void run() {
              if (this.a.mMainDisplayOverride) {
                UnityPlayer unityPlayer1 = this.a;
                unityPlayer1.removeView((View)unityPlayer1.mGlView);
                return;
              } 
              UnityPlayer unityPlayer = this.a;
              unityPlayer.addView((View)unityPlayer.mGlView);
            }
          });
    } 
    return updateDisplayInternal(paramInt, paramSurface);
  }
  
  protected void executeGLThreadJobs() {
    while (true) {
      Runnable runnable = this.m_Events.poll();
      if (runnable != null) {
        runnable.run();
        continue;
      } 
      break;
    } 
  }
  
  protected String getClipboardText() {
    String str;
    ClipData clipData = this.m_ClipboardManager.getPrimaryClip();
    if (clipData != null) {
      str = clipData.getItemAt(0).coerceToText(this.mContext).toString();
    } else {
      str = "";
    } 
    return str;
  }
  
  protected String getKeyboardLayout() {
    i i1 = this.mSoftInputDialog;
    return (i1 == null) ? null : i1.a();
  }
  
  protected String getLaunchURL() {
    Uri uri = this.m_launchUri;
    return (uri != null) ? uri.toString() : null;
  }
  
  protected int getNetworkConnectivity() {
    if (PlatformSupport.NOUGAT_SUPPORT) {
      if (this.m_NetworkConnectivity == null)
        this.m_NetworkConnectivity = new NetworkConnectivity(this.mContext); 
      return this.m_NetworkConnectivity.a();
    } 
    return 0;
  }
  
  public String getNetworkProxySettings(String paramString) {
    if (paramString.startsWith("http:")) {
      str = "http.proxyHost";
      paramString = "http.proxyPort";
    } else if (paramString.startsWith("https:")) {
      str = "https.proxyHost";
      paramString = "https.proxyPort";
    } else {
      return null;
    } 
    String str = System.getProperties().getProperty(str);
    if (str != null && !"".equals(str)) {
      StringBuilder stringBuilder = new StringBuilder(str);
      paramString = System.getProperties().getProperty(paramString);
      if (paramString != null && !"".equals(paramString)) {
        stringBuilder.append(":");
        stringBuilder.append(paramString);
      } 
      paramString = System.getProperties().getProperty("http.nonProxyHosts");
      if (paramString != null && !"".equals(paramString)) {
        stringBuilder.append('\n');
        stringBuilder.append(paramString);
      } 
      return stringBuilder.toString();
    } 
    return null;
  }
  
  public Bundle getSettings() {
    return Bundle.EMPTY;
  }
  
  protected int getSplashMode() {
    try {
      return (getApplicationInfo()).metaData.getInt("unity.splash-mode");
    } catch (Exception exception) {
      return 0;
    } 
  }
  
  protected int getUaaLLaunchProcessType() {
    String str = getProcessName();
    return (str != null && !str.equals(this.mContext.getPackageName())) ? 1 : 0;
  }
  
  public View getView() {
    return (View)this;
  }
  
  protected void hideSoftInput() {
    postOnUiThread(new Runnable(this) {
          final UnityPlayer a;
          
          public final void run() {
            this.a.reportSoftInputArea(new Rect());
            this.a.reportSoftInputIsVisible(false);
            if (this.a.mSoftInputDialog != null) {
              this.a.mSoftInputDialog.dismiss();
              this.a.mSoftInputDialog = null;
              this.a.nativeReportKeyboardConfigChanged();
            } 
          }
        });
  }
  
  public void init(int paramInt, boolean paramBoolean) {}
  
  protected boolean initializeGoogleAr() {
    if (this.m_ARCoreApi == null && currentActivity != null && getARCoreEnabled()) {
      GoogleARCoreApi googleARCoreApi = new GoogleARCoreApi();
      this.m_ARCoreApi = googleARCoreApi;
      googleARCoreApi.initializeARCore(currentActivity);
      if (!this.mState.d())
        this.m_ARCoreApi.resumeARCore(); 
    } 
    return false;
  }
  
  public boolean injectEvent(InputEvent paramInputEvent) {
    return !m.c() ? false : nativeInjectEvent(paramInputEvent);
  }
  
  protected boolean isFinishing() {
    if (!this.mQuitting) {
      boolean bool;
      Context context = this.mContext;
      if (context instanceof Activity && ((Activity)context).isFinishing()) {
        bool = true;
      } else {
        bool = false;
      } 
      this.mQuitting = bool;
      if (!bool)
        return false; 
    } 
    return true;
  }
  
  protected boolean isUaaLUseCase() {
    String str = ((Activity)this.mContext).getCallingPackage();
    return (str != null && str.equals(this.mContext.getPackageName()));
  }
  
  protected void kill() {
    Process.killProcess(Process.myPid());
  }
  
  protected boolean loadLibrary(String paramString) {
    try {
      System.loadLibrary(paramString);
      return true;
    } catch (UnsatisfiedLinkError|Exception unsatisfiedLinkError) {
      return false;
    } 
  }
  
  public void lowMemory() {
    if (!m.c())
      return; 
    queueGLThreadEvent(new Runnable(this) {
          final UnityPlayer a;
          
          public final void run() {
            this.a.nativeLowMemory();
          }
        });
  }
  
  public void newIntent(Intent paramIntent) {
    this.m_launchUri = paramIntent.getData();
    this.m_MainThread.e();
  }
  
  public boolean onGenericMotionEvent(MotionEvent paramMotionEvent) {
    return injectEvent((InputEvent)paramMotionEvent);
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent) {
    return injectEvent((InputEvent)paramKeyEvent);
  }
  
  public boolean onKeyLongPress(int paramInt, KeyEvent paramKeyEvent) {
    return injectEvent((InputEvent)paramKeyEvent);
  }
  
  public boolean onKeyMultiple(int paramInt1, int paramInt2, KeyEvent paramKeyEvent) {
    return injectEvent((InputEvent)paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent) {
    return injectEvent((InputEvent)paramKeyEvent);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent) {
    return injectEvent((InputEvent)paramMotionEvent);
  }
  
  public void onUnityPlayerQuitted() {}
  
  public void onUnityPlayerUnloaded() {}
  
  public void pause() {
    GoogleARCoreApi googleARCoreApi = this.m_ARCoreApi;
    if (googleARCoreApi != null)
      googleARCoreApi.pauseARCore(); 
    o o1 = this.mVideoPlayerProxy;
    if (o1 != null)
      o1.a(); 
    AudioVolumeHandler audioVolumeHandler = this.m_AudioVolumeHandler;
    if (audioVolumeHandler != null) {
      audioVolumeHandler.a();
      this.m_AudioVolumeHandler = null;
    } 
    OrientationLockListener orientationLockListener = this.m_OrientationLockListener;
    if (orientationLockListener != null) {
      orientationLockListener.a();
      this.m_OrientationLockListener = null;
    } 
    pauseUnity();
  }
  
  protected void pauseJavaAndCallUnloadCallback() {
    runOnUiThread(new Runnable(this) {
          final UnityPlayer a;
          
          public final void run() {
            this.a.pause();
            this.a.windowFocusChanged(false);
            this.a.m_UnityPlayerLifecycleEvents.onUnityPlayerUnloaded();
          }
        });
  }
  
  void postOnUiThread(Runnable paramRunnable) {
    (new Handler(Looper.getMainLooper())).post(paramRunnable);
  }
  
  public void quit() {
    destroy();
  }
  
  public void removeViewFromPlayer(View paramView) {
    boolean bool2;
    boolean bool3;
    swapViews((View)this.mGlView, paramView);
    ViewParent viewParent = paramView.getParent();
    boolean bool1 = true;
    if (viewParent == null) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    if (this.mGlView.getParent() == this) {
      bool3 = true;
    } else {
      bool3 = false;
    } 
    if (!bool2 || !bool3)
      bool1 = false; 
    if (!bool1) {
      if (!bool2)
        f.Log(6, "removeViewFromPlayer: Failure removing view from hierarchy"); 
      if (!bool3)
        f.Log(6, "removeVireFromPlayer: Failure agging old view to hierarchy"); 
    } 
  }
  
  public void reportError(String paramString1, String paramString2) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(paramString1);
    stringBuilder.append(": ");
    stringBuilder.append(paramString2);
    f.Log(6, stringBuilder.toString());
  }
  
  protected void reportSoftInputArea(Rect paramRect) {
    queueGLThreadEvent(new f(this, paramRect) {
          final Rect a;
          
          final UnityPlayer b;
          
          public final void a() {
            this.b.nativeSetInputArea(this.a.left, this.a.top, this.a.right, this.a.bottom);
          }
        });
  }
  
  protected void reportSoftInputIsVisible(boolean paramBoolean) {
    queueGLThreadEvent(new f(this, paramBoolean) {
          final boolean a;
          
          final UnityPlayer b;
          
          public final void a() {
            this.b.nativeSetKeyboardIsVisible(this.a);
          }
        });
  }
  
  protected void reportSoftInputSelection(int paramInt1, int paramInt2) {
    queueGLThreadEvent(new f(this, paramInt1, paramInt2) {
          final int a;
          
          final int b;
          
          final UnityPlayer c;
          
          public final void a() {
            this.c.nativeSetInputSelection(this.a, this.b);
          }
        });
  }
  
  protected void reportSoftInputStr(String paramString, int paramInt, boolean paramBoolean) {
    if (paramInt == 1)
      hideSoftInput(); 
    queueGLThreadEvent(new f(this, paramBoolean, paramString, paramInt) {
          final boolean a;
          
          final String b;
          
          final int c;
          
          final UnityPlayer d;
          
          public final void a() {
            if (this.a) {
              this.d.nativeSoftInputCanceled();
            } else {
              String str = this.b;
              if (str != null)
                this.d.nativeSetInputString(str); 
            } 
            if (this.c == 1)
              this.d.nativeSoftInputClosed(); 
          }
        });
  }
  
  protected void requestUserAuthorization(String paramString) {
    if (paramString != null && !paramString.isEmpty() && currentActivity != null) {
      UnityPermissions.ModalWaitForPermissionResponse modalWaitForPermissionResponse = new UnityPermissions.ModalWaitForPermissionResponse();
      UnityPermissions.requestUserPermissions(currentActivity, new String[] { paramString }, modalWaitForPermissionResponse);
      modalWaitForPermissionResponse.waitForResponse();
    } 
  }
  
  public void resume() {
    GoogleARCoreApi googleARCoreApi = this.m_ARCoreApi;
    if (googleARCoreApi != null)
      googleARCoreApi.resumeARCore(); 
    this.mState.b(false);
    o o1 = this.mVideoPlayerProxy;
    if (o1 != null)
      o1.b(); 
    checkResumePlayer();
    if (m.c())
      nativeRestartActivityIndicator(); 
    if (this.m_AudioVolumeHandler == null)
      this.m_AudioVolumeHandler = new AudioVolumeHandler(this.mContext); 
    if (this.m_OrientationLockListener == null && m.c())
      this.m_OrientationLockListener = new OrientationLockListener(this.mContext); 
  }
  
  void runOnAnonymousThread(Runnable paramRunnable) {
    (new Thread(paramRunnable)).start();
  }
  
  void runOnUiThread(Runnable paramRunnable) {
    Context context = this.mContext;
    if (context instanceof Activity) {
      ((Activity)context).runOnUiThread(paramRunnable);
      return;
    } 
    f.Log(5, "Not running Unity from an Activity; ignored...");
  }
  
  protected void setCharacterLimit(int paramInt) {
    runOnUiThread(new Runnable(this, paramInt) {
          final int a;
          
          final UnityPlayer b;
          
          public final void run() {
            if (this.b.mSoftInputDialog != null)
              this.b.mSoftInputDialog.a(this.a); 
          }
        });
  }
  
  protected void setClipboardText(String paramString) {
    ClipData clipData = ClipData.newPlainText("Text", paramString);
    this.m_ClipboardManager.setPrimaryClip(clipData);
  }
  
  protected void setHideInputField(boolean paramBoolean) {
    runOnUiThread(new Runnable(this, paramBoolean) {
          final boolean a;
          
          final UnityPlayer b;
          
          public final void run() {
            if (this.b.mSoftInputDialog != null)
              this.b.mSoftInputDialog.a(this.a); 
          }
        });
  }
  
  protected void setSelection(int paramInt1, int paramInt2) {
    runOnUiThread(new Runnable(this, paramInt1, paramInt2) {
          final int a;
          
          final int b;
          
          final UnityPlayer c;
          
          public final void run() {
            if (this.c.mSoftInputDialog != null)
              this.c.mSoftInputDialog.a(this.a, this.b); 
          }
        });
  }
  
  protected void setSoftInputStr(String paramString) {
    runOnUiThread(new Runnable(this, paramString) {
          final String a;
          
          final UnityPlayer b;
          
          public final void run() {
            if (this.b.mSoftInputDialog != null && this.a != null)
              this.b.mSoftInputDialog.a(this.a); 
          }
        });
  }
  
  protected void showSoftInput(String paramString1, int paramInt1, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, String paramString2, int paramInt2, boolean paramBoolean5, boolean paramBoolean6) {
    postOnUiThread(new Runnable(this, this, paramString1, paramInt1, paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4, paramString2, paramInt2, paramBoolean5, paramBoolean6) {
          final UnityPlayer a;
          
          final String b;
          
          final int c;
          
          final boolean d;
          
          final boolean e;
          
          final boolean f;
          
          final boolean g;
          
          final String h;
          
          final int i;
          
          final boolean j;
          
          final boolean k;
          
          final UnityPlayer l;
          
          public final void run() {
            this.l.mSoftInputDialog = new i(this.l.mContext, this.a, this.b, this.c, this.d, this.e, this.f, this.h, this.i, this.j, this.k);
            this.l.mSoftInputDialog.setOnCancelListener(new DialogInterface.OnCancelListener(this) {
                  final UnityPlayer.null a;
                  
                  public final void onCancel(DialogInterface param2DialogInterface) {
                    this.a.l.nativeSoftInputLostFocus();
                    this.a.l.reportSoftInputStr((String)null, 1, false);
                  }
                });
            this.l.mSoftInputDialog.show();
            this.l.nativeReportKeyboardConfigChanged();
          }
        });
  }
  
  protected boolean showVideoPlayer(String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, int paramInt5) {
    if (this.mVideoPlayerProxy == null)
      this.mVideoPlayerProxy = new o(this); 
    paramBoolean = this.mVideoPlayerProxy.a(this.mContext, paramString, paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramInt5, new o.a(this) {
          final UnityPlayer a;
          
          public final void a() {
            UnityPlayer.access$3302(this.a, (o)null);
          }
        });
    if (paramBoolean)
      runOnUiThread(new Runnable(this) {
            final UnityPlayer a;
            
            public final void run() {
              if (this.a.nativeIsAutorotationOn() && this.a.mContext instanceof Activity)
                ((Activity)this.a.mContext).setRequestedOrientation(this.a.mInitialScreenOrientation); 
            }
          }); 
    return paramBoolean;
  }
  
  protected boolean skipPermissionsDialog() {
    Activity activity = currentActivity;
    return (activity != null) ? UnityPermissions.skipPermissionsDialog(activity) : false;
  }
  
  public boolean startOrientationListener(int paramInt) {
    if (this.mOrientationListener != null) {
      String str1 = "Orientation Listener already started.";
      f.Log(5, str1);
      return false;
    } 
    OrientationEventListener orientationEventListener = new OrientationEventListener(this, this.mContext, paramInt) {
        final UnityPlayer a;
        
        public final void onOrientationChanged(int param1Int) {
          this.a.m_MainThread.a(this.a.mNaturalOrientation, param1Int);
        }
      };
    this.mOrientationListener = orientationEventListener;
    if (orientationEventListener.canDetectOrientation()) {
      this.mOrientationListener.enable();
      return true;
    } 
    String str = "Orientation Listener cannot detect orientation.";
    f.Log(5, str);
    return false;
  }
  
  public boolean stopOrientationListener() {
    OrientationEventListener orientationEventListener = this.mOrientationListener;
    if (orientationEventListener == null) {
      f.Log(5, "Orientation Listener was not started.");
      return false;
    } 
    orientationEventListener.disable();
    this.mOrientationListener = null;
    return true;
  }
  
  protected void toggleGyroscopeSensor(boolean paramBoolean) {
    SensorManager sensorManager = (SensorManager)this.mContext.getSystemService("sensor");
    Sensor sensor = sensorManager.getDefaultSensor(11);
    if (paramBoolean) {
      sensorManager.registerListener(this.m_FakeListener, sensor, 1);
      return;
    } 
    sensorManager.unregisterListener(this.m_FakeListener);
  }
  
  public void unload() {
    nativeApplicationUnload();
  }
  
  public void windowFocusChanged(boolean paramBoolean) {
    this.mState.a(paramBoolean);
    if (this.mState.e()) {
      i i1 = this.mSoftInputDialog;
      if (i1 == null || i1.a) {
        if (paramBoolean) {
          this.m_MainThread.c();
        } else {
          this.m_MainThread.d();
        } 
        checkResumePlayer();
      } 
    } 
  }
  
  final class a implements SensorEventListener {
    final UnityPlayer a;
    
    a(UnityPlayer this$0) {}
    
    public final void onAccuracyChanged(Sensor param1Sensor, int param1Int) {}
    
    public final void onSensorChanged(SensorEvent param1SensorEvent) {}
  }
  
  enum b {
    a, b, c;
    
    private static final int[] d = new int[] { 1, 2, 3 };
  }
  
  private final class c extends PhoneStateListener {
    final UnityPlayer a;
    
    private c(UnityPlayer this$0) {}
    
    public final void onCallStateChanged(int param1Int, String param1String) {
      UnityPlayer unityPlayer = this.a;
      boolean bool = true;
      if (param1Int != 1)
        bool = false; 
      unityPlayer.nativeMuteMasterAudio(bool);
    }
  }
  
  enum d {
    a, b, c, d, e, f, g, h, i, j;
    
    private static final d[] k;
    
    static {
      d d1 = new d("ORIENTATION_ANGLE_CHANGE", 9);
      j = d1;
      k = new d[] { a, b, c, d, e, f, g, h, i, d1 };
    }
  }
  
  private final class e extends Thread {
    Handler a;
    
    boolean b = false;
    
    boolean c = false;
    
    int d = UnityPlayer.b.b;
    
    int e = 0;
    
    int f;
    
    int g;
    
    int h = 5;
    
    final UnityPlayer i;
    
    private e(UnityPlayer this$0) {}
    
    private void a(UnityPlayer.d param1d) {
      Handler handler = this.a;
      if (handler != null)
        Message.obtain(handler, 2269, param1d).sendToTarget(); 
    }
    
    public final void a() {
      a(UnityPlayer.d.c);
    }
    
    public final void a(int param1Int1, int param1Int2) {
      this.f = param1Int1;
      this.g = param1Int2;
      a(UnityPlayer.d.j);
    }
    
    public final void a(Runnable param1Runnable) {
      if (this.a == null)
        return; 
      a(UnityPlayer.d.a);
      Message.obtain(this.a, param1Runnable).sendToTarget();
    }
    
    public final void b() {
      a(UnityPlayer.d.b);
    }
    
    public final void b(Runnable param1Runnable) {
      if (this.a == null)
        return; 
      a(UnityPlayer.d.d);
      Message.obtain(this.a, param1Runnable).sendToTarget();
    }
    
    public final void c() {
      a(UnityPlayer.d.g);
    }
    
    public final void c(Runnable param1Runnable) {
      Handler handler = this.a;
      if (handler == null)
        return; 
      Message.obtain(handler, param1Runnable).sendToTarget();
      a(UnityPlayer.d.e);
    }
    
    public final void d() {
      a(UnityPlayer.d.f);
    }
    
    public final void d(Runnable param1Runnable) {
      Handler handler = this.a;
      if (handler != null)
        Message.obtain(handler, param1Runnable).sendToTarget(); 
    }
    
    public final void e() {
      a(UnityPlayer.d.i);
    }
    
    public final void run() {
      setName("UnityMain");
      Looper.prepare();
      this.a = new Handler(new Handler.Callback(this) {
            final UnityPlayer.e a;
            
            private void a() {
              if (this.a.d == UnityPlayer.b.c && this.a.c) {
                this.a.i.nativeFocusChanged(true);
                this.a.d = UnityPlayer.b.a;
              } 
            }
            
            public final boolean handleMessage(Message param2Message) {
              // Byte code:
              //   0: aload_1
              //   1: getfield what : I
              //   4: sipush #2269
              //   7: if_icmpeq -> 12
              //   10: iconst_0
              //   11: ireturn
              //   12: aload_1
              //   13: getfield obj : Ljava/lang/Object;
              //   16: checkcast com/unity3d/player/UnityPlayer$d
              //   19: astore_1
              //   20: aload_1
              //   21: getstatic com/unity3d/player/UnityPlayer$d.h : Lcom/unity3d/player/UnityPlayer$d;
              //   24: if_acmpne -> 173
              //   27: aload_0
              //   28: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   31: astore_1
              //   32: aload_1
              //   33: aload_1
              //   34: getfield e : I
              //   37: iconst_1
              //   38: isub
              //   39: putfield e : I
              //   42: aload_0
              //   43: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   46: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   49: invokevirtual executeGLThreadJobs : ()V
              //   52: aload_0
              //   53: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   56: getfield b : Z
              //   59: ifne -> 64
              //   62: iconst_1
              //   63: ireturn
              //   64: aload_0
              //   65: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   68: getfield c : Z
              //   71: ifne -> 76
              //   74: iconst_1
              //   75: ireturn
              //   76: aload_0
              //   77: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   80: getfield h : I
              //   83: iflt -> 134
              //   86: aload_0
              //   87: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   90: getfield h : I
              //   93: ifne -> 119
              //   96: aload_0
              //   97: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   100: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   103: invokestatic access$100 : (Lcom/unity3d/player/UnityPlayer;)Z
              //   106: ifeq -> 119
              //   109: aload_0
              //   110: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   113: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   116: invokestatic access$200 : (Lcom/unity3d/player/UnityPlayer;)V
              //   119: aload_0
              //   120: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   123: astore_1
              //   124: aload_1
              //   125: aload_1
              //   126: getfield h : I
              //   129: iconst_1
              //   130: isub
              //   131: putfield h : I
              //   134: aload_0
              //   135: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   138: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   141: invokevirtual isFinishing : ()Z
              //   144: ifne -> 390
              //   147: aload_0
              //   148: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   151: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   154: invokestatic access$300 : (Lcom/unity3d/player/UnityPlayer;)Z
              //   157: ifne -> 390
              //   160: aload_0
              //   161: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   164: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   167: invokestatic access$400 : (Lcom/unity3d/player/UnityPlayer;)V
              //   170: goto -> 390
              //   173: aload_1
              //   174: getstatic com/unity3d/player/UnityPlayer$d.c : Lcom/unity3d/player/UnityPlayer$d;
              //   177: if_acmpne -> 189
              //   180: invokestatic myLooper : ()Landroid/os/Looper;
              //   183: invokevirtual quit : ()V
              //   186: goto -> 390
              //   189: aload_1
              //   190: getstatic com/unity3d/player/UnityPlayer$d.b : Lcom/unity3d/player/UnityPlayer$d;
              //   193: if_acmpne -> 207
              //   196: aload_0
              //   197: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   200: iconst_1
              //   201: putfield b : Z
              //   204: goto -> 390
              //   207: aload_1
              //   208: getstatic com/unity3d/player/UnityPlayer$d.a : Lcom/unity3d/player/UnityPlayer$d;
              //   211: if_acmpne -> 225
              //   214: aload_0
              //   215: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   218: iconst_0
              //   219: putfield b : Z
              //   222: goto -> 390
              //   225: aload_1
              //   226: getstatic com/unity3d/player/UnityPlayer$d.d : Lcom/unity3d/player/UnityPlayer$d;
              //   229: if_acmpne -> 243
              //   232: aload_0
              //   233: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   236: iconst_0
              //   237: putfield c : Z
              //   240: goto -> 390
              //   243: aload_1
              //   244: getstatic com/unity3d/player/UnityPlayer$d.e : Lcom/unity3d/player/UnityPlayer$d;
              //   247: if_acmpne -> 265
              //   250: aload_0
              //   251: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   254: iconst_1
              //   255: putfield c : Z
              //   258: aload_0
              //   259: invokespecial a : ()V
              //   262: goto -> 390
              //   265: aload_1
              //   266: getstatic com/unity3d/player/UnityPlayer$d.f : Lcom/unity3d/player/UnityPlayer$d;
              //   269: if_acmpne -> 309
              //   272: aload_0
              //   273: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   276: getfield d : I
              //   279: getstatic com/unity3d/player/UnityPlayer$b.a : I
              //   282: if_icmpne -> 296
              //   285: aload_0
              //   286: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   289: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   292: iconst_0
              //   293: invokestatic access$000 : (Lcom/unity3d/player/UnityPlayer;Z)V
              //   296: aload_0
              //   297: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   300: getstatic com/unity3d/player/UnityPlayer$b.b : I
              //   303: putfield d : I
              //   306: goto -> 390
              //   309: aload_1
              //   310: getstatic com/unity3d/player/UnityPlayer$d.g : Lcom/unity3d/player/UnityPlayer$d;
              //   313: if_acmpne -> 329
              //   316: aload_0
              //   317: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   320: getstatic com/unity3d/player/UnityPlayer$b.c : I
              //   323: putfield d : I
              //   326: goto -> 258
              //   329: aload_1
              //   330: getstatic com/unity3d/player/UnityPlayer$d.i : Lcom/unity3d/player/UnityPlayer$d;
              //   333: if_acmpne -> 359
              //   336: aload_0
              //   337: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   340: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   343: aload_0
              //   344: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   347: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   350: invokevirtual getLaunchURL : ()Ljava/lang/String;
              //   353: invokestatic access$500 : (Lcom/unity3d/player/UnityPlayer;Ljava/lang/String;)V
              //   356: goto -> 390
              //   359: aload_1
              //   360: getstatic com/unity3d/player/UnityPlayer$d.j : Lcom/unity3d/player/UnityPlayer$d;
              //   363: if_acmpne -> 390
              //   366: aload_0
              //   367: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   370: getfield i : Lcom/unity3d/player/UnityPlayer;
              //   373: aload_0
              //   374: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   377: getfield f : I
              //   380: aload_0
              //   381: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   384: getfield g : I
              //   387: invokestatic access$600 : (Lcom/unity3d/player/UnityPlayer;II)V
              //   390: aload_0
              //   391: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   394: getfield b : Z
              //   397: ifeq -> 444
              //   400: aload_0
              //   401: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   404: getfield e : I
              //   407: ifgt -> 444
              //   410: aload_0
              //   411: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   414: getfield a : Landroid/os/Handler;
              //   417: sipush #2269
              //   420: getstatic com/unity3d/player/UnityPlayer$d.h : Lcom/unity3d/player/UnityPlayer$d;
              //   423: invokestatic obtain : (Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;
              //   426: invokevirtual sendToTarget : ()V
              //   429: aload_0
              //   430: getfield a : Lcom/unity3d/player/UnityPlayer$e;
              //   433: astore_1
              //   434: aload_1
              //   435: aload_1
              //   436: getfield e : I
              //   439: iconst_1
              //   440: iadd
              //   441: putfield e : I
              //   444: iconst_1
              //   445: ireturn
            }
          });
      Looper.loop();
    }
  }
  
  final class null implements Handler.Callback {
    final UnityPlayer.e a;
    
    null(UnityPlayer this$0) {}
    
    private void a() {
      if (this.a.d == UnityPlayer.b.c && this.a.c) {
        this.a.i.nativeFocusChanged(true);
        this.a.d = UnityPlayer.b.a;
      } 
    }
    
    public final boolean handleMessage(Message param1Message) {
      // Byte code:
      //   0: aload_1
      //   1: getfield what : I
      //   4: sipush #2269
      //   7: if_icmpeq -> 12
      //   10: iconst_0
      //   11: ireturn
      //   12: aload_1
      //   13: getfield obj : Ljava/lang/Object;
      //   16: checkcast com/unity3d/player/UnityPlayer$d
      //   19: astore_1
      //   20: aload_1
      //   21: getstatic com/unity3d/player/UnityPlayer$d.h : Lcom/unity3d/player/UnityPlayer$d;
      //   24: if_acmpne -> 173
      //   27: aload_0
      //   28: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   31: astore_1
      //   32: aload_1
      //   33: aload_1
      //   34: getfield e : I
      //   37: iconst_1
      //   38: isub
      //   39: putfield e : I
      //   42: aload_0
      //   43: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   46: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   49: invokevirtual executeGLThreadJobs : ()V
      //   52: aload_0
      //   53: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   56: getfield b : Z
      //   59: ifne -> 64
      //   62: iconst_1
      //   63: ireturn
      //   64: aload_0
      //   65: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   68: getfield c : Z
      //   71: ifne -> 76
      //   74: iconst_1
      //   75: ireturn
      //   76: aload_0
      //   77: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   80: getfield h : I
      //   83: iflt -> 134
      //   86: aload_0
      //   87: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   90: getfield h : I
      //   93: ifne -> 119
      //   96: aload_0
      //   97: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   100: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   103: invokestatic access$100 : (Lcom/unity3d/player/UnityPlayer;)Z
      //   106: ifeq -> 119
      //   109: aload_0
      //   110: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   113: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   116: invokestatic access$200 : (Lcom/unity3d/player/UnityPlayer;)V
      //   119: aload_0
      //   120: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   123: astore_1
      //   124: aload_1
      //   125: aload_1
      //   126: getfield h : I
      //   129: iconst_1
      //   130: isub
      //   131: putfield h : I
      //   134: aload_0
      //   135: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   138: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   141: invokevirtual isFinishing : ()Z
      //   144: ifne -> 390
      //   147: aload_0
      //   148: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   151: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   154: invokestatic access$300 : (Lcom/unity3d/player/UnityPlayer;)Z
      //   157: ifne -> 390
      //   160: aload_0
      //   161: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   164: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   167: invokestatic access$400 : (Lcom/unity3d/player/UnityPlayer;)V
      //   170: goto -> 390
      //   173: aload_1
      //   174: getstatic com/unity3d/player/UnityPlayer$d.c : Lcom/unity3d/player/UnityPlayer$d;
      //   177: if_acmpne -> 189
      //   180: invokestatic myLooper : ()Landroid/os/Looper;
      //   183: invokevirtual quit : ()V
      //   186: goto -> 390
      //   189: aload_1
      //   190: getstatic com/unity3d/player/UnityPlayer$d.b : Lcom/unity3d/player/UnityPlayer$d;
      //   193: if_acmpne -> 207
      //   196: aload_0
      //   197: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   200: iconst_1
      //   201: putfield b : Z
      //   204: goto -> 390
      //   207: aload_1
      //   208: getstatic com/unity3d/player/UnityPlayer$d.a : Lcom/unity3d/player/UnityPlayer$d;
      //   211: if_acmpne -> 225
      //   214: aload_0
      //   215: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   218: iconst_0
      //   219: putfield b : Z
      //   222: goto -> 390
      //   225: aload_1
      //   226: getstatic com/unity3d/player/UnityPlayer$d.d : Lcom/unity3d/player/UnityPlayer$d;
      //   229: if_acmpne -> 243
      //   232: aload_0
      //   233: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   236: iconst_0
      //   237: putfield c : Z
      //   240: goto -> 390
      //   243: aload_1
      //   244: getstatic com/unity3d/player/UnityPlayer$d.e : Lcom/unity3d/player/UnityPlayer$d;
      //   247: if_acmpne -> 265
      //   250: aload_0
      //   251: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   254: iconst_1
      //   255: putfield c : Z
      //   258: aload_0
      //   259: invokespecial a : ()V
      //   262: goto -> 390
      //   265: aload_1
      //   266: getstatic com/unity3d/player/UnityPlayer$d.f : Lcom/unity3d/player/UnityPlayer$d;
      //   269: if_acmpne -> 309
      //   272: aload_0
      //   273: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   276: getfield d : I
      //   279: getstatic com/unity3d/player/UnityPlayer$b.a : I
      //   282: if_icmpne -> 296
      //   285: aload_0
      //   286: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   289: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   292: iconst_0
      //   293: invokestatic access$000 : (Lcom/unity3d/player/UnityPlayer;Z)V
      //   296: aload_0
      //   297: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   300: getstatic com/unity3d/player/UnityPlayer$b.b : I
      //   303: putfield d : I
      //   306: goto -> 390
      //   309: aload_1
      //   310: getstatic com/unity3d/player/UnityPlayer$d.g : Lcom/unity3d/player/UnityPlayer$d;
      //   313: if_acmpne -> 329
      //   316: aload_0
      //   317: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   320: getstatic com/unity3d/player/UnityPlayer$b.c : I
      //   323: putfield d : I
      //   326: goto -> 258
      //   329: aload_1
      //   330: getstatic com/unity3d/player/UnityPlayer$d.i : Lcom/unity3d/player/UnityPlayer$d;
      //   333: if_acmpne -> 359
      //   336: aload_0
      //   337: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   340: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   343: aload_0
      //   344: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   347: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   350: invokevirtual getLaunchURL : ()Ljava/lang/String;
      //   353: invokestatic access$500 : (Lcom/unity3d/player/UnityPlayer;Ljava/lang/String;)V
      //   356: goto -> 390
      //   359: aload_1
      //   360: getstatic com/unity3d/player/UnityPlayer$d.j : Lcom/unity3d/player/UnityPlayer$d;
      //   363: if_acmpne -> 390
      //   366: aload_0
      //   367: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   370: getfield i : Lcom/unity3d/player/UnityPlayer;
      //   373: aload_0
      //   374: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   377: getfield f : I
      //   380: aload_0
      //   381: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   384: getfield g : I
      //   387: invokestatic access$600 : (Lcom/unity3d/player/UnityPlayer;II)V
      //   390: aload_0
      //   391: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   394: getfield b : Z
      //   397: ifeq -> 444
      //   400: aload_0
      //   401: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   404: getfield e : I
      //   407: ifgt -> 444
      //   410: aload_0
      //   411: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   414: getfield a : Landroid/os/Handler;
      //   417: sipush #2269
      //   420: getstatic com/unity3d/player/UnityPlayer$d.h : Lcom/unity3d/player/UnityPlayer$d;
      //   423: invokestatic obtain : (Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;
      //   426: invokevirtual sendToTarget : ()V
      //   429: aload_0
      //   430: getfield a : Lcom/unity3d/player/UnityPlayer$e;
      //   433: astore_1
      //   434: aload_1
      //   435: aload_1
      //   436: getfield e : I
      //   439: iconst_1
      //   440: iadd
      //   441: putfield e : I
      //   444: iconst_1
      //   445: ireturn
    }
  }
  
  private abstract class f implements Runnable {
    final UnityPlayer e;
    
    private f(UnityPlayer this$0) {}
    
    public abstract void a();
    
    public final void run() {
      if (!this.e.isFinishing())
        a(); 
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\UnityPlayer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */