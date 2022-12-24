package com.unity3d.player;

class UnityCoreAssetPacksStatusCallbacks implements IAssetPackManagerDownloadStatusCallback, IAssetPackManagerStatusQueryCallback {
  private final native void nativeStatusQueryResult(String paramString, int paramInt1, int paramInt2);
  
  public void onStatusResult(long paramLong, String[] paramArrayOfString, int[] paramArrayOfint1, int[] paramArrayOfint2) {
    for (byte b = 0; b < paramArrayOfint1.length; b++)
      nativeStatusQueryResult(paramArrayOfString[b], paramArrayOfint1[b], paramArrayOfint2[b]); 
  }
  
  public void onStatusUpdate(String paramString, int paramInt1, long paramLong1, long paramLong2, int paramInt2, int paramInt3) {
    nativeStatusQueryResult(paramString, paramInt1, paramInt3);
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\UnityCoreAssetPacksStatusCallbacks.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */