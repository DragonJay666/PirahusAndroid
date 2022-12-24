package com.unity3d.player;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.MeteringRectangle;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.media.Image;
import android.media.ImageReader;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Range;
import android.util.Size;
import android.util.SizeF;
import android.view.Surface;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

public final class c {
  private static CameraManager b;
  
  private static String[] c;
  
  private static Semaphore e = new Semaphore(1);
  
  private CameraCaptureSession.CaptureCallback A = new CameraCaptureSession.CaptureCallback(this) {
      final c a;
      
      public final void onCaptureCompleted(CameraCaptureSession param1CameraCaptureSession, CaptureRequest param1CaptureRequest, TotalCaptureResult param1TotalCaptureResult) {
        c.a(this.a, param1CaptureRequest.getTag());
      }
      
      public final void onCaptureFailed(CameraCaptureSession param1CameraCaptureSession, CaptureRequest param1CaptureRequest, CaptureFailure param1CaptureFailure) {
        StringBuilder stringBuilder = new StringBuilder("Camera2: Capture session failed ");
        stringBuilder.append(param1CaptureRequest.getTag());
        stringBuilder.append(" reason ");
        stringBuilder.append(param1CaptureFailure.getReason());
        f.Log(5, stringBuilder.toString());
        c.a(this.a, param1CaptureRequest.getTag());
      }
      
      public final void onCaptureSequenceAborted(CameraCaptureSession param1CameraCaptureSession, int param1Int) {}
      
      public final void onCaptureSequenceCompleted(CameraCaptureSession param1CameraCaptureSession, int param1Int, long param1Long) {}
    };
  
  private final CameraDevice.StateCallback B = new CameraDevice.StateCallback(this) {
      final c a;
      
      public final void onClosed(CameraDevice param1CameraDevice) {
        c.f().release();
      }
      
      public final void onDisconnected(CameraDevice param1CameraDevice) {
        f.Log(5, "Camera2: CameraDevice disconnected.");
        c.b(this.a, param1CameraDevice);
        c.f().release();
      }
      
      public final void onError(CameraDevice param1CameraDevice, int param1Int) {
        StringBuilder stringBuilder = new StringBuilder("Camera2: Error opeining CameraDevice ");
        stringBuilder.append(param1Int);
        f.Log(6, stringBuilder.toString());
        c.b(this.a, param1CameraDevice);
        c.f().release();
      }
      
      public final void onOpened(CameraDevice param1CameraDevice) {
        c.a(this.a, param1CameraDevice);
        c.f().release();
      }
    };
  
  private final ImageReader.OnImageAvailableListener C = new ImageReader.OnImageAvailableListener(this) {
      final c a;
      
      public final void onImageAvailable(ImageReader param1ImageReader) {
        if (c.f().tryAcquire()) {
          Image image = param1ImageReader.acquireNextImage();
          if (image != null) {
            Image.Plane[] arrayOfPlane = image.getPlanes();
            if (image.getFormat() == 35 && arrayOfPlane != null && arrayOfPlane.length == 3) {
              c.h(this.a).a(arrayOfPlane[0].getBuffer(), arrayOfPlane[1].getBuffer(), arrayOfPlane[2].getBuffer(), arrayOfPlane[0].getRowStride(), arrayOfPlane[1].getRowStride(), arrayOfPlane[1].getPixelStride());
            } else {
              f.Log(6, "Camera2: Wrong image format.");
            } 
            if (c.i(this.a) != null)
              c.i(this.a).close(); 
            c.a(this.a, image);
          } 
          c.f().release();
        } 
      }
    };
  
  private final SurfaceTexture.OnFrameAvailableListener D = new SurfaceTexture.OnFrameAvailableListener(this) {
      final c a;
      
      public final void onFrameAvailable(SurfaceTexture param1SurfaceTexture) {
        c.h(this.a).a(param1SurfaceTexture);
      }
    };
  
  private e a = null;
  
  private CameraDevice d;
  
  private HandlerThread f;
  
  private Handler g;
  
  private Rect h;
  
  private Rect i;
  
  private int j;
  
  private int k;
  
  private float l = -1.0F;
  
  private float m = -1.0F;
  
  private int n;
  
  private int o;
  
  private boolean p = false;
  
  private Range q;
  
  private ImageReader r = null;
  
  private Image s;
  
  private CaptureRequest.Builder t;
  
  private CameraCaptureSession u = null;
  
  private Object v = new Object();
  
  private int w;
  
  private SurfaceTexture x;
  
  private Surface y = null;
  
  private int z = a.c;
  
  protected c(e parame) {
    this.a = parame;
    g();
  }
  
  public static int a(Context paramContext) {
    return (c(paramContext)).length;
  }
  
  public static int a(Context paramContext, int paramInt) {
    try {
      return ((Integer)b(paramContext).getCameraCharacteristics(c(paramContext)[paramInt]).get(CameraCharacteristics.SENSOR_ORIENTATION)).intValue();
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
      return 0;
    } 
  }
  
  private static int a(Range[] paramArrayOfRange, int paramInt) {
    byte b = -1;
    double d = Double.MAX_VALUE;
    byte b1 = 0;
    while (b1 < paramArrayOfRange.length) {
      int i = ((Integer)paramArrayOfRange[b1].getLower()).intValue();
      int j = ((Integer)paramArrayOfRange[b1].getUpper()).intValue();
      float f = paramInt;
      if (f + 0.1F > i && f - 0.1F < j)
        return paramInt; 
      double d1 = Math.min(Math.abs(paramInt - i), Math.abs(paramInt - j));
      double d2 = d;
      if (d1 < d) {
        b = b1;
        d2 = d1;
      } 
      b1++;
      d = d2;
    } 
    if (paramInt > ((Integer)paramArrayOfRange[b].getUpper()).intValue()) {
      comparable = paramArrayOfRange[b].getUpper();
      return ((Integer)comparable).intValue();
    } 
    Comparable comparable = comparable[b].getLower();
    return ((Integer)comparable).intValue();
  }
  
  private static Rect a(Size[] paramArrayOfSize, double paramDouble1, double paramDouble2) {
    double d = Double.MAX_VALUE;
    byte b = 0;
    int i = 0;
    int j = 0;
    while (b < paramArrayOfSize.length) {
      int k = paramArrayOfSize[b].getWidth();
      int m = paramArrayOfSize[b].getHeight();
      double d1 = Math.abs(Math.log(paramDouble1 / k)) + Math.abs(Math.log(paramDouble2 / m));
      double d2 = d;
      if (d1 < d) {
        i = k;
        j = m;
        d2 = d1;
      } 
      b++;
      d = d2;
    } 
    return new Rect(0, 0, i, j);
  }
  
  private void a(CameraDevice paramCameraDevice) {
    synchronized (this.v) {
      this.u = null;
      paramCameraDevice.close();
      this.d = null;
      return;
    } 
  }
  
  private void a(Object paramObject) {
    if (paramObject == "Focus") {
      this.p = false;
      synchronized (this.v) {
        CameraCaptureSession cameraCaptureSession = this.u;
        if (cameraCaptureSession != null)
          try {
            this.t.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
            this.t.setTag("Regular");
            this.u.setRepeatingRequest(this.t.build(), this.A, this.g);
          } catch (CameraAccessException cameraAccessException) {
            StringBuilder stringBuilder = new StringBuilder();
            this("Camera2: CameraAccessException ");
            stringBuilder.append(cameraAccessException);
            f.Log(6, stringBuilder.toString());
          }  
        return;
      } 
    } 
    if (paramObject == "Cancel focus")
      synchronized (this.v) {
        if (this.u != null)
          j(); 
        return;
      }  
  }
  
  private static Size[] a(CameraCharacteristics paramCameraCharacteristics) {
    StreamConfigurationMap streamConfigurationMap = (StreamConfigurationMap)paramCameraCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
    if (streamConfigurationMap == null) {
      f.Log(6, "Camera2: configuration map is not available.");
      return null;
    } 
    Size[] arrayOfSize = streamConfigurationMap.getOutputSizes(35);
    return (arrayOfSize == null || arrayOfSize.length == 0) ? null : arrayOfSize;
  }
  
  private static CameraManager b(Context paramContext) {
    if (b == null)
      b = (CameraManager)paramContext.getSystemService("camera"); 
    return b;
  }
  
  private void b(CameraCharacteristics paramCameraCharacteristics) {
    int i = ((Integer)paramCameraCharacteristics.get(CameraCharacteristics.CONTROL_MAX_REGIONS_AF)).intValue();
    this.k = i;
    if (i > 0) {
      Rect rect = (Rect)paramCameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE);
      this.i = rect;
      float f1 = rect.width() / this.i.height();
      float f2 = this.h.width() / this.h.height();
      if (f2 > f1) {
        this.n = 0;
        this.o = (int)((this.i.height() - this.i.width() / f2) / 2.0F);
      } else {
        this.o = 0;
        this.n = (int)((this.i.width() - this.i.height() * f2) / 2.0F);
      } 
      this.j = Math.min(this.i.width(), this.i.height()) / 20;
    } 
  }
  
  public static boolean b(Context paramContext, int paramInt) {
    try {
      paramInt = ((Integer)b(paramContext).getCameraCharacteristics(c(paramContext)[paramInt]).get(CameraCharacteristics.LENS_FACING)).intValue();
      return (paramInt == 0);
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
      return false;
    } 
  }
  
  public static boolean c(Context paramContext, int paramInt) {
    try {
      paramInt = ((Integer)b(paramContext).getCameraCharacteristics(c(paramContext)[paramInt]).get(CameraCharacteristics.CONTROL_MAX_REGIONS_AF)).intValue();
      return (paramInt > 0);
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
      return false;
    } 
  }
  
  private static String[] c(Context paramContext) {
    if (c == null)
      try {
        c = b(paramContext).getCameraIdList();
      } catch (CameraAccessException cameraAccessException) {
        StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
        stringBuilder.append(cameraAccessException);
        f.Log(6, stringBuilder.toString());
        c = new String[0];
      }  
    return c;
  }
  
  public static int d(Context paramContext, int paramInt) {
    try {
      CameraCharacteristics cameraCharacteristics = b(paramContext).getCameraCharacteristics(c(paramContext)[paramInt]);
      float[] arrayOfFloat = (float[])cameraCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
      SizeF sizeF = (SizeF)cameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
      if (arrayOfFloat.length > 0) {
        float f1 = arrayOfFloat[0];
        float f2 = sizeF.getWidth();
        return (int)(f1 * 36.0F / f2);
      } 
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
    } 
    return 0;
  }
  
  public static int[] e(Context paramContext, int paramInt) {
    try {
      CameraCharacteristics cameraCharacteristics = b(paramContext).getCameraCharacteristics(c(paramContext)[paramInt]);
      Size[] arrayOfSize = a(cameraCharacteristics);
      if (arrayOfSize != null) {
        int[] arrayOfInt = new int[arrayOfSize.length * 2];
        for (paramInt = 0; paramInt < arrayOfSize.length; paramInt++) {
          int i = paramInt * 2;
          arrayOfInt[i] = arrayOfSize[paramInt].getWidth();
          arrayOfInt[i + 1] = arrayOfSize[paramInt].getHeight();
        } 
        return arrayOfInt;
      } 
      return null;
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
      return null;
    } 
  }
  
  private void g() {
    HandlerThread handlerThread = new HandlerThread("CameraBackground");
    this.f = handlerThread;
    handlerThread.start();
    this.g = new Handler(this.f.getLooper());
  }
  
  private void h() {
    this.f.quit();
    try {
      this.f.join(4000L);
      this.f = null;
      this.g = null;
      return;
    } catch (InterruptedException interruptedException) {
      this.f.interrupt();
      StringBuilder stringBuilder = new StringBuilder("Camera2: Interrupted while waiting for the background thread to finish ");
      stringBuilder.append(interruptedException);
      f.Log(6, stringBuilder.toString());
      return;
    } 
  }
  
  private void i() {
    try {
      if (!e.tryAcquire(4L, TimeUnit.SECONDS)) {
        f.Log(5, "Camera2: Timeout waiting to lock camera for closing.");
        return;
      } 
      this.d.close();
      try {
        if (!e.tryAcquire(4L, TimeUnit.SECONDS))
          f.Log(5, "Camera2: Timeout waiting to close camera."); 
      } catch (InterruptedException interruptedException) {
        StringBuilder stringBuilder = new StringBuilder("Camera2: Interrupted while waiting to close camera ");
        stringBuilder.append(interruptedException);
        f.Log(6, stringBuilder.toString());
      } 
      this.d = null;
      e.release();
      return;
    } catch (InterruptedException interruptedException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: Interrupted while trying to lock camera for closing ");
      stringBuilder.append(interruptedException);
      f.Log(6, stringBuilder.toString());
      return;
    } 
  }
  
  private void j() {
    try {
      if (this.k == 0 || this.l < 0.0F || this.l > 1.0F || this.m < 0.0F || this.m > 1.0F) {
        this.t.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(4));
        this.t.setTag("Regular");
        if (this.u != null)
          this.u.setRepeatingRequest(this.t.build(), this.A, this.g); 
        return;
      } 
      this.p = true;
      int i = (int)((this.i.width() - this.n * 2) * this.l + this.n);
      int j = (int)((this.i.height() - this.o * 2) * (1.0D - this.m) + this.o);
      i = Math.max(this.j + 1, Math.min(i, this.i.width() - this.j - 1));
      j = Math.max(this.j + 1, Math.min(j, this.i.height() - this.j - 1));
      CaptureRequest.Builder builder = this.t;
      CaptureRequest.Key key = CaptureRequest.CONTROL_AF_REGIONS;
      MeteringRectangle meteringRectangle = new MeteringRectangle();
      this(i - this.j, j - this.j, this.j * 2, this.j * 2, 999);
      builder.set(key, new MeteringRectangle[] { meteringRectangle });
      this.t.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
      this.t.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(1));
      this.t.setTag("Focus");
      this.u.capture(this.t.build(), this.A, this.g);
      return;
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
      return;
    } 
  }
  
  private void k() {
    try {
      if (this.u != null) {
        this.u.stopRepeating();
        this.t.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(2));
        this.t.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(0));
        this.t.setTag("Cancel focus");
        this.u.capture(this.t.build(), this.A, this.g);
      } 
      return;
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
      return;
    } 
  }
  
  public final Rect a() {
    return this.h;
  }
  
  public final boolean a(float paramFloat1, float paramFloat2) {
    if (this.k > 0) {
      if (!this.p) {
        this.l = paramFloat1;
        this.m = paramFloat2;
        synchronized (this.v) {
          if (this.u != null && this.z != a.b)
            k(); 
          return true;
        } 
      } 
      f.Log(5, "Camera2: Setting manual focus point already started.");
    } 
    return false;
  }
  
  public final boolean a(Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    try {
      CameraCharacteristics cameraCharacteristics = b.getCameraCharacteristics(c(paramContext)[paramInt1]);
      if (((Integer)cameraCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)).intValue() == 2) {
        f.Log(5, "Camera2: only LEGACY hardware level is supported.");
        return false;
      } 
      Size[] arrayOfSize = a(cameraCharacteristics);
      if (arrayOfSize != null && arrayOfSize.length != 0) {
        this.h = a(arrayOfSize, paramInt2, paramInt3);
        Range[] arrayOfRange = (Range[])cameraCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
        if (arrayOfRange == null || arrayOfRange.length == 0) {
          f.Log(6, "Camera2: target FPS ranges are not avialable.");
          return false;
        } 
        paramInt2 = a(arrayOfRange, paramInt4);
        this.q = new Range(Integer.valueOf(paramInt2), Integer.valueOf(paramInt2));
        try {
          if (!e.tryAcquire(4L, TimeUnit.SECONDS)) {
            f.Log(5, "Camera2: Timeout waiting to lock camera for opening.");
            return false;
          } 
          try {
            b.openCamera(c(paramContext)[paramInt1], this.B, this.g);
            try {
              if (!e.tryAcquire(4L, TimeUnit.SECONDS)) {
                f.Log(5, "Camera2: Timeout waiting to open camera.");
                return false;
              } 
              e.release();
            } catch (InterruptedException interruptedException) {
              StringBuilder stringBuilder = new StringBuilder("Camera2: Interrupted while waiting to open camera ");
              stringBuilder.append(interruptedException);
              f.Log(6, stringBuilder.toString());
            } 
            this.w = paramInt5;
            b(cameraCharacteristics);
            return (this.d != null);
          } catch (CameraAccessException cameraAccessException) {
            StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
            stringBuilder.append(cameraAccessException);
            f.Log(6, stringBuilder.toString());
            e.release();
            return false;
          } 
        } catch (InterruptedException interruptedException) {
          StringBuilder stringBuilder = new StringBuilder("Camera2: Interrupted while trying to lock camera for opening ");
          stringBuilder.append(interruptedException);
          f.Log(6, stringBuilder.toString());
          return false;
        } 
      } 
      return false;
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
      return false;
    } 
  }
  
  public final void b() {
    if (this.d != null) {
      e();
      i();
      this.A = null;
      this.y = null;
      this.x = null;
      Image image = this.s;
      if (image != null) {
        image.close();
        this.s = null;
      } 
      ImageReader imageReader = this.r;
      if (imageReader != null) {
        imageReader.close();
        this.r = null;
      } 
    } 
    h();
  }
  
  public final void c() {
    if (this.r == null) {
      ImageReader imageReader = ImageReader.newInstance(this.h.width(), this.h.height(), 35, 2);
      this.r = imageReader;
      imageReader.setOnImageAvailableListener(this.C, this.g);
      this.s = null;
      if (this.w != 0) {
        SurfaceTexture surfaceTexture = new SurfaceTexture(this.w);
        this.x = surfaceTexture;
        surfaceTexture.setDefaultBufferSize(this.h.width(), this.h.height());
        this.x.setOnFrameAvailableListener(this.D, this.g);
        this.y = new Surface(this.x);
      } 
    } 
    try {
      if (this.u != null) {
        if (this.z == a.b)
          this.u.setRepeatingRequest(this.t.build(), this.A, this.g); 
      } else {
        List<Surface> list;
        CameraDevice cameraDevice = this.d;
        if (this.y != null) {
          list = Arrays.asList(new Surface[] { this.y, this.r.getSurface() });
        } else {
          list = Arrays.asList(new Surface[] { this.r.getSurface() });
        } 
        CameraCaptureSession.StateCallback stateCallback = new CameraCaptureSession.StateCallback() {
            final c a;
            
            public final void onConfigureFailed(CameraCaptureSession param1CameraCaptureSession) {
              f.Log(6, "Camera2: CaptureSession configuration failed.");
            }
            
            public final void onConfigured(CameraCaptureSession param1CameraCaptureSession) {
              if (c.a(this.a) == null)
                return; 
              synchronized (c.b(this.a)) {
                c.a(this.a, param1CameraCaptureSession);
                try {
                  c.a(this.a, c.a(this.a).createCaptureRequest(1));
                  if (c.c(this.a) != null)
                    c.d(this.a).addTarget(c.c(this.a)); 
                  c.d(this.a).addTarget(c.e(this.a).getSurface());
                  c.d(this.a).set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, c.f(this.a));
                  c.g(this.a);
                } catch (CameraAccessException cameraAccessException) {
                  StringBuilder stringBuilder = new StringBuilder();
                  this("Camera2: CameraAccessException ");
                  stringBuilder.append(cameraAccessException);
                  String str = stringBuilder.toString();
                  f.Log(6, str);
                } catch (IllegalStateException illegalStateException) {
                  StringBuilder stringBuilder = new StringBuilder();
                  this("Camera2: IllegalStateException ");
                  stringBuilder.append(illegalStateException);
                  String str = stringBuilder.toString();
                  f.Log(6, str);
                } 
                return;
              } 
            }
          };
        super(this);
        cameraDevice.createCaptureSession(list, stateCallback, this.g);
      } 
      this.z = a.a;
      return;
    } catch (CameraAccessException cameraAccessException) {
      StringBuilder stringBuilder = new StringBuilder("Camera2: CameraAccessException ");
      stringBuilder.append(cameraAccessException);
      f.Log(6, stringBuilder.toString());
      return;
    } 
  }
  
  public final void d() {
    synchronized (this.v) {
      CameraCaptureSession cameraCaptureSession = this.u;
      if (cameraCaptureSession != null)
        try {
          this.u.stopRepeating();
          this.z = a.b;
        } catch (CameraAccessException cameraAccessException) {
          StringBuilder stringBuilder = new StringBuilder();
          this("Camera2: CameraAccessException ");
          stringBuilder.append(cameraAccessException);
          f.Log(6, stringBuilder.toString());
        }  
      return;
    } 
  }
  
  public final void e() {
    synchronized (this.v) {
      CameraCaptureSession cameraCaptureSession = this.u;
      if (cameraCaptureSession != null) {
        try {
          this.u.abortCaptures();
        } catch (CameraAccessException cameraAccessException) {
          StringBuilder stringBuilder = new StringBuilder();
          this("Camera2: CameraAccessException ");
          stringBuilder.append(cameraAccessException);
          f.Log(6, stringBuilder.toString());
        } 
        this.u.close();
        this.u = null;
        this.z = a.c;
      } 
      return;
    } 
  }
  
  private enum a {
    a, b, c;
    
    private static final int[] d = new int[] { 1, 2, 3 };
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\c.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */