package com.unity3d.player;

import android.content.Context;
import android.graphics.Rect;
import android.hardware.Camera;

public class Camera2Wrapper implements e {
  private Context a;
  
  private c b = null;
  
  private final int c = 100;
  
  public Camera2Wrapper(Context paramContext) {
    this.a = paramContext;
    initCamera2Jni();
  }
  
  private static int a(float paramFloat) {
    return (int)Math.min(Math.max(paramFloat * 2000.0F - 1000.0F, -900.0F), 900.0F);
  }
  
  private final native void deinitCamera2Jni();
  
  private final native void initCamera2Jni();
  
  private final native void nativeFrameReady(Object paramObject1, Object paramObject2, Object paramObject3, int paramInt1, int paramInt2, int paramInt3);
  
  private final native void nativeSurfaceTextureReady(Object paramObject);
  
  public final void a() {
    deinitCamera2Jni();
    closeCamera2();
  }
  
  public final void a(Object paramObject) {
    nativeSurfaceTextureReady(paramObject);
  }
  
  public final void a(Object paramObject1, Object paramObject2, Object paramObject3, int paramInt1, int paramInt2, int paramInt3) {
    nativeFrameReady(paramObject1, paramObject2, paramObject3, paramInt1, paramInt2, paramInt3);
  }
  
  protected void closeCamera2() {
    c c1 = this.b;
    if (c1 != null)
      c1.b(); 
    this.b = null;
  }
  
  protected int getCamera2Count() {
    return c.a(this.a);
  }
  
  protected int getCamera2FocalLengthEquivalent(int paramInt) {
    return c.d(this.a, paramInt);
  }
  
  protected int[] getCamera2Resolutions(int paramInt) {
    return c.e(this.a, paramInt);
  }
  
  protected int getCamera2SensorOrientation(int paramInt) {
    return c.a(this.a, paramInt);
  }
  
  protected Object getCameraFocusArea(float paramFloat1, float paramFloat2) {
    int i = a(paramFloat1);
    int j = a(1.0F - paramFloat2);
    return new Camera.Area(new Rect(i - 100, j - 100, i + 100, j + 100), 1000);
  }
  
  protected Rect getFrameSizeCamera2() {
    c c1 = this.b;
    return (c1 != null) ? c1.a() : new Rect();
  }
  
  protected boolean initializeCamera2(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    if (this.b == null && UnityPlayer.currentActivity != null) {
      c c1 = new c(this);
      this.b = c1;
      return c1.a(this.a, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
    } 
    return false;
  }
  
  protected boolean isCamera2AutoFocusPointSupported(int paramInt) {
    return c.c(this.a, paramInt);
  }
  
  protected boolean isCamera2FrontFacing(int paramInt) {
    return c.b(this.a, paramInt);
  }
  
  protected void pauseCamera2() {
    c c1 = this.b;
    if (c1 != null)
      c1.d(); 
  }
  
  protected boolean setAutoFocusPoint(float paramFloat1, float paramFloat2) {
    c c1 = this.b;
    return (c1 != null) ? c1.a(paramFloat1, paramFloat2) : false;
  }
  
  protected void startCamera2() {
    c c1 = this.b;
    if (c1 != null)
      c1.c(); 
  }
  
  protected void stopCamera2() {
    c c1 = this.b;
    if (c1 != null)
      c1.e(); 
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\Camera2Wrapper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */