package com.unity3d.player;

import android.app.Activity;
import android.content.Context;

class PlayAssetDeliveryUnityWrapper {
  private static PlayAssetDeliveryUnityWrapper a;
  
  private d b;
  
  private PlayAssetDeliveryUnityWrapper(Context paramContext) {
    if (a == null)
      try {
        Class.forName("com.google.android.play.core.assetpacks.AssetPackManager");
        this.b = a(paramContext);
        return;
      } catch (ClassNotFoundException classNotFoundException) {
        this.b = null;
        return;
      }  
    throw new RuntimeException("PlayAssetDeliveryUnityWrapper should be created only once. Use getInstance() instead.");
  }
  
  private static d a(Context paramContext) {
    return a.a(paramContext);
  }
  
  private void a() {
    if (!playCoreApiMissing())
      return; 
    throw new RuntimeException("AssetPackManager API is not available! Make sure your gradle project includes \"com.google.android.play:core\" dependency.");
  }
  
  public static PlayAssetDeliveryUnityWrapper getInstance() {
    // Byte code:
    //   0: ldc com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   2: monitorenter
    //   3: getstatic com/unity3d/player/PlayAssetDeliveryUnityWrapper.a : Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    //   6: astore_0
    //   7: aload_0
    //   8: ifnonnull -> 35
    //   11: ldc com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   13: ldc2_w 3000
    //   16: invokevirtual wait : (J)V
    //   19: goto -> 3
    //   22: astore_0
    //   23: bipush #6
    //   25: aload_0
    //   26: invokevirtual getMessage : ()Ljava/lang/String;
    //   29: invokestatic Log : (ILjava/lang/String;)V
    //   32: goto -> 3
    //   35: getstatic com/unity3d/player/PlayAssetDeliveryUnityWrapper.a : Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    //   38: ifnull -> 50
    //   41: getstatic com/unity3d/player/PlayAssetDeliveryUnityWrapper.a : Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    //   44: astore_0
    //   45: ldc com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   47: monitorexit
    //   48: aload_0
    //   49: areturn
    //   50: new java/lang/RuntimeException
    //   53: astore_0
    //   54: aload_0
    //   55: ldc 'PlayAssetDeliveryUnityWrapper is not yet initialised.'
    //   57: invokespecial <init> : (Ljava/lang/String;)V
    //   60: aload_0
    //   61: athrow
    //   62: astore_0
    //   63: ldc com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   65: monitorexit
    //   66: aload_0
    //   67: athrow
    // Exception table:
    //   from	to	target	type
    //   3	7	62	finally
    //   11	19	22	java/lang/InterruptedException
    //   11	19	62	finally
    //   23	32	62	finally
    //   35	45	62	finally
    //   50	62	62	finally
  }
  
  public static PlayAssetDeliveryUnityWrapper init(Context paramContext) {
    // Byte code:
    //   0: ldc com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   2: monitorenter
    //   3: getstatic com/unity3d/player/PlayAssetDeliveryUnityWrapper.a : Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    //   6: ifnonnull -> 36
    //   9: new com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   12: astore_1
    //   13: aload_1
    //   14: aload_0
    //   15: invokespecial <init> : (Landroid/content/Context;)V
    //   18: aload_1
    //   19: putstatic com/unity3d/player/PlayAssetDeliveryUnityWrapper.a : Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    //   22: ldc com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   24: invokevirtual notifyAll : ()V
    //   27: getstatic com/unity3d/player/PlayAssetDeliveryUnityWrapper.a : Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    //   30: astore_0
    //   31: ldc com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   33: monitorexit
    //   34: aload_0
    //   35: areturn
    //   36: new java/lang/RuntimeException
    //   39: astore_0
    //   40: aload_0
    //   41: ldc 'PlayAssetDeliveryUnityWrapper.init() should be called only once. Use getInstance() instead.'
    //   43: invokespecial <init> : (Ljava/lang/String;)V
    //   46: aload_0
    //   47: athrow
    //   48: astore_0
    //   49: ldc com/unity3d/player/PlayAssetDeliveryUnityWrapper
    //   51: monitorexit
    //   52: aload_0
    //   53: athrow
    // Exception table:
    //   from	to	target	type
    //   3	31	48	finally
    //   36	48	48	finally
  }
  
  public void cancelAssetPackDownload(String paramString) {
    cancelAssetPackDownloads(new String[] { paramString });
  }
  
  public void cancelAssetPackDownloads(String[] paramArrayOfString) {
    a();
    this.b.a(paramArrayOfString);
  }
  
  public void downloadAssetPack(String paramString, IAssetPackManagerDownloadStatusCallback paramIAssetPackManagerDownloadStatusCallback) {
    downloadAssetPacks(new String[] { paramString }, paramIAssetPackManagerDownloadStatusCallback);
  }
  
  public void downloadAssetPacks(String[] paramArrayOfString, IAssetPackManagerDownloadStatusCallback paramIAssetPackManagerDownloadStatusCallback) {
    a();
    this.b.a(paramArrayOfString, paramIAssetPackManagerDownloadStatusCallback);
  }
  
  public String getAssetPackPath(String paramString) {
    a();
    return this.b.a(paramString);
  }
  
  public void getAssetPackState(String paramString, IAssetPackManagerStatusQueryCallback paramIAssetPackManagerStatusQueryCallback) {
    getAssetPackStates(new String[] { paramString }, paramIAssetPackManagerStatusQueryCallback);
  }
  
  public void getAssetPackStates(String[] paramArrayOfString, IAssetPackManagerStatusQueryCallback paramIAssetPackManagerStatusQueryCallback) {
    a();
    this.b.a(paramArrayOfString, paramIAssetPackManagerStatusQueryCallback);
  }
  
  public boolean playCoreApiMissing() {
    return (this.b == null);
  }
  
  public Object registerDownloadStatusListener(IAssetPackManagerDownloadStatusCallback paramIAssetPackManagerDownloadStatusCallback) {
    a();
    return this.b.a(paramIAssetPackManagerDownloadStatusCallback);
  }
  
  public void removeAssetPack(String paramString) {
    a();
    this.b.b(paramString);
  }
  
  public void requestToUseMobileData(Activity paramActivity, IAssetPackManagerMobileDataConfirmationCallback paramIAssetPackManagerMobileDataConfirmationCallback) {
    a();
    this.b.a(paramActivity, paramIAssetPackManagerMobileDataConfirmationCallback);
  }
  
  public void unregisterDownloadStatusListener(Object paramObject) {
    a();
    this.b.a(paramObject);
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\PlayAssetDeliveryUnityWrapper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */