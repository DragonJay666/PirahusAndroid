package com.unity3d.player;

import android.app.Activity;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.util.Log;
import android.view.Display;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.MediaController;
import java.io.FileInputStream;
import java.io.IOException;

public final class n extends FrameLayout implements MediaPlayer.OnBufferingUpdateListener, MediaPlayer.OnCompletionListener, MediaPlayer.OnPreparedListener, MediaPlayer.OnVideoSizeChangedListener, SurfaceHolder.Callback, MediaController.MediaPlayerControl {
  private static boolean a = false;
  
  private final Context b;
  
  private final SurfaceView c;
  
  private final SurfaceHolder d;
  
  private final String e;
  
  private final int f;
  
  private final int g;
  
  private final boolean h;
  
  private final long i;
  
  private final long j;
  
  private final FrameLayout k;
  
  private final Display l;
  
  private int m;
  
  private int n;
  
  private int o;
  
  private int p;
  
  private MediaPlayer q;
  
  private MediaController r;
  
  private boolean s = false;
  
  private boolean t = false;
  
  private int u = 0;
  
  private boolean v = false;
  
  private boolean w = false;
  
  private a x;
  
  private b y;
  
  private volatile int z = 0;
  
  protected n(Context paramContext, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, long paramLong1, long paramLong2, a parama) {
    super(paramContext);
    this.x = parama;
    this.b = paramContext;
    this.k = this;
    SurfaceView surfaceView = new SurfaceView(paramContext);
    this.c = surfaceView;
    SurfaceHolder surfaceHolder = surfaceView.getHolder();
    this.d = surfaceHolder;
    surfaceHolder.addCallback(this);
    this.k.setBackgroundColor(paramInt1);
    this.k.addView((View)this.c);
    this.l = ((WindowManager)this.b.getSystemService("window")).getDefaultDisplay();
    this.e = paramString;
    this.f = paramInt2;
    this.g = paramInt3;
    this.h = paramBoolean;
    this.i = paramLong1;
    this.j = paramLong2;
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("fileName: ");
      stringBuilder.append(this.e);
      b(stringBuilder.toString());
    } 
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("backgroundColor: ");
      stringBuilder.append(paramInt1);
      b(stringBuilder.toString());
    } 
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("controlMode: ");
      stringBuilder.append(this.f);
      b(stringBuilder.toString());
    } 
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("scalingMode: ");
      stringBuilder.append(this.g);
      b(stringBuilder.toString());
    } 
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("isURL: ");
      stringBuilder.append(this.h);
      b(stringBuilder.toString());
    } 
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("videoOffset: ");
      stringBuilder.append(this.i);
      b(stringBuilder.toString());
    } 
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("videoLength: ");
      stringBuilder.append(this.j);
      b(stringBuilder.toString());
    } 
    setFocusable(true);
    setFocusableInTouchMode(true);
  }
  
  private void a(int paramInt) {
    this.z = paramInt;
    a a1 = this.x;
    if (a1 != null)
      a1.a(this.z); 
  }
  
  private static void b(String paramString) {
    StringBuilder stringBuilder = new StringBuilder("VideoPlayer: ");
    stringBuilder.append(paramString);
    Log.i("Video", stringBuilder.toString());
  }
  
  private void c() {
    MediaPlayer mediaPlayer = this.q;
    if (mediaPlayer != null) {
      mediaPlayer.setDisplay(this.d);
      if (!this.v) {
        if (a)
          b("Resuming playback"); 
        this.q.start();
      } 
      return;
    } 
    a(0);
    doCleanUp();
    try {
      mediaPlayer = new MediaPlayer();
      this();
      this.q = mediaPlayer;
      if (this.h) {
        mediaPlayer.setDataSource(this.b, Uri.parse(this.e));
      } else {
        Thread thread1;
        if (this.j != 0L) {
          FileInputStream fileInputStream = new FileInputStream();
          this(this.e);
          this.q.setDataSource(fileInputStream.getFD(), this.i, this.j);
        } else {
          AssetManager assetManager = getResources().getAssets();
          try {
            AssetFileDescriptor assetFileDescriptor = assetManager.openFd(this.e);
            this.q.setDataSource(assetFileDescriptor.getFileDescriptor(), assetFileDescriptor.getStartOffset(), assetFileDescriptor.getLength());
            assetFileDescriptor.close();
          } catch (IOException iOException) {
            FileInputStream fileInputStream = new FileInputStream();
            this(this.e);
            this.q.setDataSource(fileInputStream.getFD());
            fileInputStream.close();
          } 
          this.q.setDisplay(this.d);
          this.q.setScreenOnWhilePlaying(true);
          this.q.setOnBufferingUpdateListener(this);
          this.q.setOnCompletionListener(this);
          this.q.setOnPreparedListener(this);
          this.q.setOnVideoSizeChangedListener(this);
          this.q.setAudioStreamType(3);
          this.q.prepareAsync();
          b b2 = new b();
          this(this, this);
          this.y = b2;
          thread1 = new Thread();
          this(this.y);
          thread1.start();
        } 
        thread1.close();
      } 
      this.q.setDisplay(this.d);
      this.q.setScreenOnWhilePlaying(true);
      this.q.setOnBufferingUpdateListener(this);
      this.q.setOnCompletionListener(this);
      this.q.setOnPreparedListener(this);
      this.q.setOnVideoSizeChangedListener(this);
      this.q.setAudioStreamType(3);
      this.q.prepareAsync();
      b b1 = new b();
      this(this, this);
      this.y = b1;
      Thread thread = new Thread();
      this(this.y);
      thread.start();
    } catch (Exception exception) {
      if (a) {
        StringBuilder stringBuilder = new StringBuilder("error: ");
        stringBuilder.append(exception.getMessage());
        stringBuilder.append(exception);
        b(stringBuilder.toString());
      } 
      a(2);
      return;
    } 
  }
  
  private void d() {
    if (isPlaying())
      return; 
    a(1);
    if (a)
      b("startVideoPlayback"); 
    updateVideoLayout();
    if (!this.v)
      start(); 
  }
  
  public final void CancelOnPrepare() {
    a(2);
  }
  
  final boolean a() {
    return this.v;
  }
  
  public final boolean canPause() {
    return true;
  }
  
  public final boolean canSeekBackward() {
    return true;
  }
  
  public final boolean canSeekForward() {
    return true;
  }
  
  protected final void destroyPlayer() {
    if (a)
      b("destroyPlayer"); 
    if (!this.v)
      pause(); 
    doCleanUp();
  }
  
  protected final void doCleanUp() {
    b b1 = this.y;
    if (b1 != null) {
      b1.a();
      this.y = null;
    } 
    MediaPlayer mediaPlayer = this.q;
    if (mediaPlayer != null) {
      mediaPlayer.release();
      this.q = null;
    } 
    this.o = 0;
    this.p = 0;
    this.t = false;
    this.s = false;
  }
  
  public final int getAudioSessionId() {
    MediaPlayer mediaPlayer = this.q;
    return (mediaPlayer == null) ? 0 : mediaPlayer.getAudioSessionId();
  }
  
  public final int getBufferPercentage() {
    return this.h ? this.u : 100;
  }
  
  public final int getCurrentPosition() {
    MediaPlayer mediaPlayer = this.q;
    return (mediaPlayer == null) ? 0 : mediaPlayer.getCurrentPosition();
  }
  
  public final int getDuration() {
    MediaPlayer mediaPlayer = this.q;
    return (mediaPlayer == null) ? 0 : mediaPlayer.getDuration();
  }
  
  public final boolean isPlaying() {
    boolean bool;
    if (this.t && this.s) {
      bool = true;
    } else {
      bool = false;
    } 
    MediaPlayer mediaPlayer = this.q;
    return (mediaPlayer == null) ? (!bool) : ((mediaPlayer.isPlaying() || !bool));
  }
  
  public final void onBufferingUpdate(MediaPlayer paramMediaPlayer, int paramInt) {
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("onBufferingUpdate percent:");
      stringBuilder.append(paramInt);
      b(stringBuilder.toString());
    } 
    this.u = paramInt;
  }
  
  public final void onCompletion(MediaPlayer paramMediaPlayer) {
    if (a)
      b("onCompletion called"); 
    destroyPlayer();
    a(3);
  }
  
  public final boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent) {
    if (paramInt == 4 || (this.f == 2 && paramInt != 0 && !paramKeyEvent.isSystem())) {
      destroyPlayer();
      a(3);
      return true;
    } 
    MediaController mediaController = this.r;
    return (mediaController != null) ? mediaController.onKeyDown(paramInt, paramKeyEvent) : super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public final void onPrepared(MediaPlayer paramMediaPlayer) {
    if (a)
      b("onPrepared called"); 
    b b1 = this.y;
    if (b1 != null) {
      b1.a();
      this.y = null;
    } 
    int i = this.f;
    if (i == 0 || i == 1) {
      MediaController mediaController = new MediaController(this.b);
      this.r = mediaController;
      mediaController.setMediaPlayer(this);
      this.r.setAnchorView((View)this);
      this.r.setEnabled(true);
      Context context = this.b;
      if (context instanceof Activity) {
        Activity activity = (Activity)context;
        this.r.setSystemUiVisibility(activity.getWindow().getDecorView().getSystemUiVisibility());
      } 
      this.r.show();
    } 
    this.t = true;
    if (true && this.s)
      d(); 
  }
  
  public final boolean onTouchEvent(MotionEvent paramMotionEvent) {
    int i = paramMotionEvent.getAction();
    if (this.f == 2 && (i & 0xFF) == 0) {
      destroyPlayer();
      a(3);
      return true;
    } 
    MediaController mediaController = this.r;
    return (mediaController != null) ? mediaController.onTouchEvent(paramMotionEvent) : super.onTouchEvent(paramMotionEvent);
  }
  
  public final void onVideoSizeChanged(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2) {
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("onVideoSizeChanged called ");
      stringBuilder.append(paramInt1);
      stringBuilder.append("x");
      stringBuilder.append(paramInt2);
      b(stringBuilder.toString());
    } 
    if (paramInt1 == 0 || paramInt2 == 0) {
      if (a) {
        StringBuilder stringBuilder = new StringBuilder("invalid video width(");
        stringBuilder.append(paramInt1);
        stringBuilder.append(") or height(");
        stringBuilder.append(paramInt2);
        stringBuilder.append(")");
        b(stringBuilder.toString());
      } 
      return;
    } 
    this.s = true;
    this.o = paramInt1;
    this.p = paramInt2;
    if (this.t && true)
      d(); 
  }
  
  public final void pause() {
    MediaPlayer mediaPlayer = this.q;
    if (mediaPlayer == null)
      return; 
    if (this.w)
      mediaPlayer.pause(); 
    this.v = true;
  }
  
  public final void seekTo(int paramInt) {
    MediaPlayer mediaPlayer = this.q;
    if (mediaPlayer == null)
      return; 
    mediaPlayer.seekTo(paramInt);
  }
  
  public final void start() {
    if (a)
      b("Start"); 
    MediaPlayer mediaPlayer = this.q;
    if (mediaPlayer == null)
      return; 
    if (this.w)
      mediaPlayer.start(); 
    this.v = false;
  }
  
  public final void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3) {
    if (a) {
      StringBuilder stringBuilder = new StringBuilder("surfaceChanged called ");
      stringBuilder.append(paramInt1);
      stringBuilder.append(" ");
      stringBuilder.append(paramInt2);
      stringBuilder.append("x");
      stringBuilder.append(paramInt3);
      b(stringBuilder.toString());
    } 
    if (this.m != paramInt2 || this.n != paramInt3) {
      this.m = paramInt2;
      this.n = paramInt3;
      if (this.w)
        updateVideoLayout(); 
    } 
  }
  
  public final void surfaceCreated(SurfaceHolder paramSurfaceHolder) {
    if (a)
      b("surfaceCreated called"); 
    this.w = true;
    c();
  }
  
  public final void surfaceDestroyed(SurfaceHolder paramSurfaceHolder) {
    if (a)
      b("surfaceDestroyed called"); 
    this.w = false;
  }
  
  protected final void updateVideoLayout() {
    // Byte code:
    //   0: getstatic com/unity3d/player/n.a : Z
    //   3: ifeq -> 12
    //   6: ldc_w 'updateVideoLayout'
    //   9: invokestatic b : (Ljava/lang/String;)V
    //   12: aload_0
    //   13: getfield q : Landroid/media/MediaPlayer;
    //   16: ifnonnull -> 20
    //   19: return
    //   20: aload_0
    //   21: getfield m : I
    //   24: ifeq -> 34
    //   27: aload_0
    //   28: getfield n : I
    //   31: ifne -> 81
    //   34: aload_0
    //   35: getfield b : Landroid/content/Context;
    //   38: ldc 'window'
    //   40: invokevirtual getSystemService : (Ljava/lang/String;)Ljava/lang/Object;
    //   43: checkcast android/view/WindowManager
    //   46: astore_1
    //   47: new android/util/DisplayMetrics
    //   50: dup
    //   51: invokespecial <init> : ()V
    //   54: astore_2
    //   55: aload_1
    //   56: invokeinterface getDefaultDisplay : ()Landroid/view/Display;
    //   61: aload_2
    //   62: invokevirtual getMetrics : (Landroid/util/DisplayMetrics;)V
    //   65: aload_0
    //   66: aload_2
    //   67: getfield widthPixels : I
    //   70: putfield m : I
    //   73: aload_0
    //   74: aload_2
    //   75: getfield heightPixels : I
    //   78: putfield n : I
    //   81: aload_0
    //   82: getfield m : I
    //   85: istore_3
    //   86: aload_0
    //   87: getfield n : I
    //   90: istore #4
    //   92: aload_0
    //   93: getfield s : Z
    //   96: ifeq -> 222
    //   99: aload_0
    //   100: getfield o : I
    //   103: istore #5
    //   105: iload #5
    //   107: i2f
    //   108: fstore #6
    //   110: aload_0
    //   111: getfield p : I
    //   114: istore #7
    //   116: fload #6
    //   118: iload #7
    //   120: i2f
    //   121: fdiv
    //   122: fstore #8
    //   124: iload_3
    //   125: i2f
    //   126: iload #4
    //   128: i2f
    //   129: fdiv
    //   130: fstore #6
    //   132: aload_0
    //   133: getfield g : I
    //   136: istore #9
    //   138: iload #9
    //   140: iconst_1
    //   141: if_icmpne -> 182
    //   144: fload #6
    //   146: fload #8
    //   148: fcmpg
    //   149: ifgt -> 166
    //   152: iload_3
    //   153: i2f
    //   154: fload #8
    //   156: fdiv
    //   157: f2i
    //   158: istore #10
    //   160: iload_3
    //   161: istore #11
    //   163: goto -> 248
    //   166: iload #4
    //   168: i2f
    //   169: fload #8
    //   171: fmul
    //   172: f2i
    //   173: istore #11
    //   175: iload #4
    //   177: istore #10
    //   179: goto -> 248
    //   182: iload #9
    //   184: iconst_2
    //   185: if_icmpne -> 199
    //   188: fload #6
    //   190: fload #8
    //   192: fcmpl
    //   193: iflt -> 166
    //   196: goto -> 152
    //   199: iload_3
    //   200: istore #11
    //   202: iload #4
    //   204: istore #10
    //   206: iload #9
    //   208: ifne -> 248
    //   211: iload #5
    //   213: istore #11
    //   215: iload #7
    //   217: istore #10
    //   219: goto -> 248
    //   222: iload_3
    //   223: istore #11
    //   225: iload #4
    //   227: istore #10
    //   229: getstatic com/unity3d/player/n.a : Z
    //   232: ifeq -> 248
    //   235: ldc_w 'updateVideoLayout: Video size is not known yet'
    //   238: invokestatic b : (Ljava/lang/String;)V
    //   241: iload #4
    //   243: istore #10
    //   245: iload_3
    //   246: istore #11
    //   248: aload_0
    //   249: getfield m : I
    //   252: iload #11
    //   254: if_icmpne -> 266
    //   257: aload_0
    //   258: getfield n : I
    //   261: iload #10
    //   263: if_icmpeq -> 338
    //   266: getstatic com/unity3d/player/n.a : Z
    //   269: ifeq -> 312
    //   272: new java/lang/StringBuilder
    //   275: dup
    //   276: ldc_w 'frameWidth = '
    //   279: invokespecial <init> : (Ljava/lang/String;)V
    //   282: astore_2
    //   283: aload_2
    //   284: iload #11
    //   286: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   289: pop
    //   290: aload_2
    //   291: ldc_w '; frameHeight = '
    //   294: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   297: pop
    //   298: aload_2
    //   299: iload #10
    //   301: invokevirtual append : (I)Ljava/lang/StringBuilder;
    //   304: pop
    //   305: aload_2
    //   306: invokevirtual toString : ()Ljava/lang/String;
    //   309: invokestatic b : (Ljava/lang/String;)V
    //   312: new android/widget/FrameLayout$LayoutParams
    //   315: dup
    //   316: iload #11
    //   318: iload #10
    //   320: bipush #17
    //   322: invokespecial <init> : (III)V
    //   325: astore_2
    //   326: aload_0
    //   327: getfield k : Landroid/widget/FrameLayout;
    //   330: aload_0
    //   331: getfield c : Landroid/view/SurfaceView;
    //   334: aload_2
    //   335: invokevirtual updateViewLayout : (Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    //   338: return
  }
  
  public static interface a {
    void a(int param1Int);
  }
  
  public final class b implements Runnable {
    final n a;
    
    private n b;
    
    private boolean c;
    
    public b(n this$0, n param1n1) {
      this.b = param1n1;
      this.c = false;
    }
    
    public final void a() {
      this.c = true;
    }
    
    public final void run() {
      try {
        Thread.sleep(5000L);
      } catch (InterruptedException interruptedException) {
        Thread.currentThread().interrupt();
      } 
      if (!this.c) {
        if (n.b())
          n.a("Stopping the video player due to timeout."); 
        this.b.CancelOnPrepare();
      } 
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\n.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */