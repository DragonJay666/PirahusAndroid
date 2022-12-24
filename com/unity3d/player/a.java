package com.unity3d.player;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import com.google.android.play.core.assetpacks.AssetPackLocation;
import com.google.android.play.core.assetpacks.AssetPackManager;
import com.google.android.play.core.assetpacks.AssetPackManagerFactory;
import com.google.android.play.core.assetpacks.AssetPackState;
import com.google.android.play.core.assetpacks.AssetPackStateUpdateListener;
import com.google.android.play.core.assetpacks.AssetPackStates;
import com.google.android.play.core.tasks.OnCompleteListener;
import com.google.android.play.core.tasks.OnSuccessListener;
import com.google.android.play.core.tasks.RuntimeExecutionException;
import com.google.android.play.core.tasks.Task;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

final class a implements d {
  private static a a;
  
  private AssetPackManager b;
  
  private HashSet c;
  
  private Object d;
  
  private a(Context paramContext) {
    if (a == null) {
      this.b = AssetPackManagerFactory.getInstance(paramContext);
      this.c = new HashSet();
      return;
    } 
    throw new RuntimeException("AssetPackManagerWrapper should be created only once. Use getInstance() instead.");
  }
  
  public static d a(Context paramContext) {
    if (a == null)
      a = new a(paramContext); 
    return a;
  }
  
  private void a(String paramString, IAssetPackManagerDownloadStatusCallback paramIAssetPackManagerDownloadStatusCallback, Looper paramLooper) {
    synchronized (a) {
      if (this.d == null) {
        b b = new b();
        this(this, paramIAssetPackManagerDownloadStatusCallback, paramLooper);
        this.b.registerListener(b);
        this.d = b;
      } else {
        ((b)this.d).a(paramIAssetPackManagerDownloadStatusCallback);
      } 
      this.c.add(paramString);
      this.b.fetch(Collections.singletonList(paramString));
      return;
    } 
  }
  
  public final Object a(IAssetPackManagerDownloadStatusCallback paramIAssetPackManagerDownloadStatusCallback) {
    b b = new b(paramIAssetPackManagerDownloadStatusCallback);
    this.b.registerListener(b);
    return b;
  }
  
  public final String a(String paramString) {
    AssetPackLocation assetPackLocation = this.b.getPackLocation(paramString);
    return (assetPackLocation == null) ? "" : assetPackLocation.assetsPath();
  }
  
  public final void a(Activity paramActivity, IAssetPackManagerMobileDataConfirmationCallback paramIAssetPackManagerMobileDataConfirmationCallback) {
    this.b.showCellularDataConfirmation(paramActivity).addOnSuccessListener(new c(paramIAssetPackManagerMobileDataConfirmationCallback));
  }
  
  public final void a(Object paramObject) {
    if (!(paramObject instanceof b))
      return; 
    this.b.unregisterListener((b)paramObject);
  }
  
  public final void a(String[] paramArrayOfString) {
    this.b.cancel(Arrays.asList(paramArrayOfString));
  }
  
  public final void a(String[] paramArrayOfString, IAssetPackManagerDownloadStatusCallback paramIAssetPackManagerDownloadStatusCallback) {
    int i = paramArrayOfString.length;
    for (byte b = 0; b < i; b++) {
      String str = paramArrayOfString[b];
      this.b.getPackStates(Collections.singletonList(str)).addOnCompleteListener(new d(paramIAssetPackManagerDownloadStatusCallback, str));
    } 
  }
  
  public final void a(String[] paramArrayOfString, IAssetPackManagerStatusQueryCallback paramIAssetPackManagerStatusQueryCallback) {
    this.b.getPackStates(Arrays.asList(paramArrayOfString)).addOnCompleteListener(new e(paramIAssetPackManagerStatusQueryCallback, paramArrayOfString));
  }
  
  public final void b(String paramString) {
    this.b.removePack(paramString);
  }
  
  private static final class a implements Runnable {
    private Set a;
    
    private String b;
    
    private int c;
    
    private long d;
    
    private long e;
    
    private int f;
    
    private int g;
    
    a(Set param1Set, String param1String, int param1Int1, long param1Long1, long param1Long2, int param1Int2, int param1Int3) {
      this.a = param1Set;
      this.b = param1String;
      this.c = param1Int1;
      this.d = param1Long1;
      this.e = param1Long2;
      this.f = param1Int2;
      this.g = param1Int3;
    }
    
    public final void run() {
      Iterator<IAssetPackManagerDownloadStatusCallback> iterator = this.a.iterator();
      while (iterator.hasNext())
        ((IAssetPackManagerDownloadStatusCallback)iterator.next()).onStatusUpdate(this.b, this.c, this.d, this.e, this.f, this.g); 
    }
  }
  
  private final class b implements AssetPackStateUpdateListener {
    final a a;
    
    private HashSet b;
    
    private Looper c;
    
    public b(IAssetPackManagerDownloadStatusCallback param1IAssetPackManagerDownloadStatusCallback) {
      this(param1IAssetPackManagerDownloadStatusCallback, Looper.myLooper());
    }
    
    public b(IAssetPackManagerDownloadStatusCallback param1IAssetPackManagerDownloadStatusCallback, Looper param1Looper) {
      HashSet<IAssetPackManagerDownloadStatusCallback> hashSet = new HashSet();
      this.b = hashSet;
      hashSet.add(param1IAssetPackManagerDownloadStatusCallback);
      this.c = param1Looper;
    }
    
    private static Set a(HashSet param1HashSet) {
      return (Set)param1HashSet.clone();
    }
    
    private void a(AssetPackState param1AssetPackState) {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_1
      //   3: invokevirtual status : ()I
      //   6: iconst_4
      //   7: if_icmpeq -> 25
      //   10: aload_1
      //   11: invokevirtual status : ()I
      //   14: iconst_5
      //   15: if_icmpeq -> 25
      //   18: aload_1
      //   19: invokevirtual status : ()I
      //   22: ifne -> 83
      //   25: invokestatic a : ()Lcom/unity3d/player/a;
      //   28: astore_2
      //   29: aload_2
      //   30: monitorenter
      //   31: aload_0
      //   32: getfield a : Lcom/unity3d/player/a;
      //   35: invokestatic a : (Lcom/unity3d/player/a;)Ljava/util/HashSet;
      //   38: aload_1
      //   39: invokevirtual name : ()Ljava/lang/String;
      //   42: invokevirtual remove : (Ljava/lang/Object;)Z
      //   45: pop
      //   46: aload_0
      //   47: getfield a : Lcom/unity3d/player/a;
      //   50: invokestatic a : (Lcom/unity3d/player/a;)Ljava/util/HashSet;
      //   53: invokevirtual isEmpty : ()Z
      //   56: ifeq -> 81
      //   59: aload_0
      //   60: getfield a : Lcom/unity3d/player/a;
      //   63: aload_0
      //   64: getfield a : Lcom/unity3d/player/a;
      //   67: invokestatic b : (Lcom/unity3d/player/a;)Ljava/lang/Object;
      //   70: invokevirtual a : (Ljava/lang/Object;)V
      //   73: aload_0
      //   74: getfield a : Lcom/unity3d/player/a;
      //   77: invokestatic c : (Lcom/unity3d/player/a;)Ljava/lang/Object;
      //   80: pop
      //   81: aload_2
      //   82: monitorexit
      //   83: aload_0
      //   84: getfield b : Ljava/util/HashSet;
      //   87: invokevirtual size : ()I
      //   90: istore_3
      //   91: iload_3
      //   92: ifne -> 98
      //   95: aload_0
      //   96: monitorexit
      //   97: return
      //   98: new android/os/Handler
      //   101: astore_2
      //   102: aload_2
      //   103: aload_0
      //   104: getfield c : Landroid/os/Looper;
      //   107: invokespecial <init> : (Landroid/os/Looper;)V
      //   110: new com/unity3d/player/a$a
      //   113: astore #4
      //   115: aload #4
      //   117: aload_0
      //   118: getfield b : Ljava/util/HashSet;
      //   121: invokestatic a : (Ljava/util/HashSet;)Ljava/util/Set;
      //   124: aload_1
      //   125: invokevirtual name : ()Ljava/lang/String;
      //   128: aload_1
      //   129: invokevirtual status : ()I
      //   132: aload_1
      //   133: invokevirtual totalBytesToDownload : ()J
      //   136: aload_1
      //   137: invokevirtual bytesDownloaded : ()J
      //   140: aload_1
      //   141: invokevirtual transferProgressPercentage : ()I
      //   144: aload_1
      //   145: invokevirtual errorCode : ()I
      //   148: invokespecial <init> : (Ljava/util/Set;Ljava/lang/String;IJJII)V
      //   151: aload_2
      //   152: aload #4
      //   154: invokevirtual post : (Ljava/lang/Runnable;)Z
      //   157: pop
      //   158: aload_0
      //   159: monitorexit
      //   160: return
      //   161: astore_1
      //   162: aload_2
      //   163: monitorexit
      //   164: aload_1
      //   165: athrow
      //   166: astore_1
      //   167: aload_0
      //   168: monitorexit
      //   169: aload_1
      //   170: athrow
      // Exception table:
      //   from	to	target	type
      //   2	25	166	finally
      //   25	31	166	finally
      //   31	81	161	finally
      //   81	83	161	finally
      //   83	91	166	finally
      //   98	158	166	finally
      //   162	164	161	finally
      //   164	166	166	finally
    }
    
    public final void a(IAssetPackManagerDownloadStatusCallback param1IAssetPackManagerDownloadStatusCallback) {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield b : Ljava/util/HashSet;
      //   6: aload_1
      //   7: invokevirtual add : (Ljava/lang/Object;)Z
      //   10: pop
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
  }
  
  private static final class c implements OnSuccessListener {
    private IAssetPackManagerMobileDataConfirmationCallback a;
    
    private Looper b;
    
    public c(IAssetPackManagerMobileDataConfirmationCallback param1IAssetPackManagerMobileDataConfirmationCallback) {
      this.a = param1IAssetPackManagerMobileDataConfirmationCallback;
      this.b = Looper.myLooper();
    }
    
    private void a(Integer param1Integer) {
      if (this.a != null) {
        boolean bool;
        Handler handler = new Handler(this.b);
        IAssetPackManagerMobileDataConfirmationCallback iAssetPackManagerMobileDataConfirmationCallback = this.a;
        if (param1Integer.intValue() == -1) {
          bool = true;
        } else {
          bool = false;
        } 
        handler.post(new a(iAssetPackManagerMobileDataConfirmationCallback, bool));
      } 
    }
    
    private static final class a implements Runnable {
      private IAssetPackManagerMobileDataConfirmationCallback a;
      
      private boolean b;
      
      a(IAssetPackManagerMobileDataConfirmationCallback param2IAssetPackManagerMobileDataConfirmationCallback, boolean param2Boolean) {
        this.a = param2IAssetPackManagerMobileDataConfirmationCallback;
        this.b = param2Boolean;
      }
      
      public final void run() {
        this.a.onMobileDataConfirmationResult(this.b);
      }
    }
  }
  
  private static final class a implements Runnable {
    private IAssetPackManagerMobileDataConfirmationCallback a;
    
    private boolean b;
    
    a(IAssetPackManagerMobileDataConfirmationCallback param1IAssetPackManagerMobileDataConfirmationCallback, boolean param1Boolean) {
      this.a = param1IAssetPackManagerMobileDataConfirmationCallback;
      this.b = param1Boolean;
    }
    
    public final void run() {
      this.a.onMobileDataConfirmationResult(this.b);
    }
  }
  
  private static final class d implements OnCompleteListener {
    private IAssetPackManagerDownloadStatusCallback a;
    
    private Looper b;
    
    private String c;
    
    public d(IAssetPackManagerDownloadStatusCallback param1IAssetPackManagerDownloadStatusCallback, String param1String) {
      this.a = param1IAssetPackManagerDownloadStatusCallback;
      this.b = Looper.myLooper();
      this.c = param1String;
    }
    
    private void a(String param1String, int param1Int1, int param1Int2, long param1Long) {
      long l;
      if (param1Int1 == 4) {
        l = param1Long;
      } else {
        l = 0L;
      } 
      (new Handler(this.b)).post(new a.a(Collections.singleton(this.a), param1String, param1Int1, param1Long, l, 0, param1Int2));
    }
    
    public final void onComplete(Task param1Task) {
      try {
        AssetPackStates assetPackStates = (AssetPackStates)param1Task.getResult();
        Map map = assetPackStates.packStates();
        if (map.size() == 0)
          return; 
        for (AssetPackState assetPackState : map.values()) {
          if (assetPackState.errorCode() != 0 || assetPackState.status() == 4 || assetPackState.status() == 5 || assetPackState.status() == 0) {
            a(assetPackState.name(), assetPackState.status(), assetPackState.errorCode(), assetPackStates.totalBytes());
            continue;
          } 
          a.a(a.a(), assetPackState.name(), this.a, this.b);
        } 
        return;
      } catch (RuntimeExecutionException runtimeExecutionException) {
        a(this.c, 0, runtimeExecutionException.getErrorCode(), 0L);
        return;
      } 
    }
  }
  
  private static final class e implements OnCompleteListener {
    private IAssetPackManagerStatusQueryCallback a;
    
    private Looper b;
    
    private String[] c;
    
    public e(IAssetPackManagerStatusQueryCallback param1IAssetPackManagerStatusQueryCallback, String[] param1ArrayOfString) {
      this.a = param1IAssetPackManagerStatusQueryCallback;
      this.b = Looper.myLooper();
      this.c = param1ArrayOfString;
    }
    
    public final void onComplete(Task param1Task) {
      if (this.a == null)
        return; 
      int i = 0;
      try {
        AssetPackStates assetPackStates = (AssetPackStates)param1Task.getResult();
        Map map = assetPackStates.packStates();
        int j = map.size();
        String[] arrayOfString = new String[j];
        int[] arrayOfInt1 = new int[j];
        int[] arrayOfInt2 = new int[j];
        for (AssetPackState assetPackState : map.values()) {
          arrayOfString[i] = assetPackState.name();
          arrayOfInt1[i] = assetPackState.status();
          arrayOfInt2[i] = assetPackState.errorCode();
          i++;
        } 
        (new Handler(this.b)).post(new a(this.a, assetPackStates.totalBytes(), arrayOfString, arrayOfInt1, arrayOfInt2));
        return;
      } catch (RuntimeExecutionException runtimeExecutionException) {
        String str = runtimeExecutionException.getMessage();
        for (String str1 : this.c) {
          if (str.contains(str1)) {
            Handler handler = new Handler(this.b);
            IAssetPackManagerStatusQueryCallback iAssetPackManagerStatusQueryCallback = this.a;
            i = runtimeExecutionException.getErrorCode();
            handler.post(new a(iAssetPackManagerStatusQueryCallback, 0L, new String[] { str1 }, new int[] { 0 }, new int[] { i }));
            return;
          } 
        } 
        String[] arrayOfString = this.c;
        int[] arrayOfInt2 = new int[arrayOfString.length];
        int[] arrayOfInt1 = new int[arrayOfString.length];
        for (i = 0; i < this.c.length; i++) {
          arrayOfInt2[i] = 0;
          arrayOfInt1[i] = runtimeExecutionException.getErrorCode();
        } 
        (new Handler(this.b)).post(new a(this.a, 0L, this.c, arrayOfInt2, arrayOfInt1));
        return;
      } 
    }
    
    private static final class a implements Runnable {
      private IAssetPackManagerStatusQueryCallback a;
      
      private long b;
      
      private String[] c;
      
      private int[] d;
      
      private int[] e;
      
      a(IAssetPackManagerStatusQueryCallback param2IAssetPackManagerStatusQueryCallback, long param2Long, String[] param2ArrayOfString, int[] param2ArrayOfint1, int[] param2ArrayOfint2) {
        this.a = param2IAssetPackManagerStatusQueryCallback;
        this.b = param2Long;
        this.c = param2ArrayOfString;
        this.d = param2ArrayOfint1;
        this.e = param2ArrayOfint2;
      }
      
      public final void run() {
        this.a.onStatusResult(this.b, this.c, this.d, this.e);
      }
    }
  }
  
  private static final class a implements Runnable {
    private IAssetPackManagerStatusQueryCallback a;
    
    private long b;
    
    private String[] c;
    
    private int[] d;
    
    private int[] e;
    
    a(IAssetPackManagerStatusQueryCallback param1IAssetPackManagerStatusQueryCallback, long param1Long, String[] param1ArrayOfString, int[] param1ArrayOfint1, int[] param1ArrayOfint2) {
      this.a = param1IAssetPackManagerStatusQueryCallback;
      this.b = param1Long;
      this.c = param1ArrayOfString;
      this.d = param1ArrayOfint1;
      this.e = param1ArrayOfint2;
    }
    
    public final void run() {
      this.a.onStatusResult(this.b, this.c, this.d, this.e);
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */