package org.fmod;

import android.media.AudioTrack;
import android.util.Log;
import java.nio.ByteBuffer;

public class FMODAudioDevice implements Runnable {
  private static int h = 0;
  
  private static int i = 1;
  
  private static int j = 2;
  
  private static int k = 3;
  
  private volatile Thread a = null;
  
  private volatile boolean b = false;
  
  private AudioTrack c = null;
  
  private boolean d = false;
  
  private ByteBuffer e = null;
  
  private byte[] f = null;
  
  private volatile a g;
  
  private native int fmodGetInfo(int paramInt);
  
  private native int fmodProcess(ByteBuffer paramByteBuffer);
  
  private void releaseAudioTrack() {
    AudioTrack audioTrack = this.c;
    if (audioTrack != null) {
      if (audioTrack.getState() == 1)
        this.c.stop(); 
      this.c.release();
      this.c = null;
    } 
    this.e = null;
    this.f = null;
    this.d = false;
  }
  
  public void close() {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual stop : ()V
    //   6: aload_0
    //   7: monitorexit
    //   8: return
    //   9: astore_1
    //   10: aload_0
    //   11: monitorexit
    //   12: aload_1
    //   13: athrow
    // Exception table:
    //   from	to	target	type
    //   2	6	9	finally
  }
  
  native int fmodProcessMicData(ByteBuffer paramByteBuffer, int paramInt);
  
  public boolean isRunning() {
    return (this.a != null && this.a.isAlive());
  }
  
  public void run() {
    int i = 3;
    while (this.b) {
      int j = i;
      if (!this.d) {
        j = i;
        if (i > 0) {
          boolean bool;
          releaseAudioTrack();
          int k = fmodGetInfo(h);
          int m = Math.round(AudioTrack.getMinBufferSize(k, 12, 2) * 1.1F) & 0xFFFFFFFC;
          int n = fmodGetInfo(i);
          j = fmodGetInfo(j) * n * 4;
          if (j <= m)
            j = m; 
          AudioTrack audioTrack = new AudioTrack(3, k, 12, 2, j, 1);
          this.c = audioTrack;
          if (audioTrack.getState() == 1) {
            bool = true;
          } else {
            bool = false;
          } 
          this.d = bool;
          if (bool) {
            ByteBuffer byteBuffer = ByteBuffer.allocateDirect(n * 2 * 2);
            this.e = byteBuffer;
            this.f = new byte[byteBuffer.capacity()];
            this.c.play();
            j = 3;
          } else {
            StringBuilder stringBuilder = new StringBuilder("AudioTrack failed to initialize (status ");
            stringBuilder.append(this.c.getState());
            stringBuilder.append(")");
            Log.e("FMOD", stringBuilder.toString());
            releaseAudioTrack();
            j = i - 1;
          } 
        } 
      } 
      i = j;
      if (this.d) {
        if (fmodGetInfo(k) == 1) {
          fmodProcess(this.e);
          ByteBuffer byteBuffer = this.e;
          byteBuffer.get(this.f, 0, byteBuffer.capacity());
          this.c.write(this.f, 0, this.e.capacity());
          this.e.position(0);
          i = j;
          continue;
        } 
        releaseAudioTrack();
        i = j;
      } 
    } 
    releaseAudioTrack();
  }
  
  public void start() {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield a : Ljava/lang/Thread;
    //   6: ifnull -> 13
    //   9: aload_0
    //   10: invokevirtual stop : ()V
    //   13: new java/lang/Thread
    //   16: astore_1
    //   17: aload_1
    //   18: aload_0
    //   19: ldc 'FMODAudioDevice'
    //   21: invokespecial <init> : (Ljava/lang/Runnable;Ljava/lang/String;)V
    //   24: aload_0
    //   25: aload_1
    //   26: putfield a : Ljava/lang/Thread;
    //   29: aload_0
    //   30: getfield a : Ljava/lang/Thread;
    //   33: bipush #10
    //   35: invokevirtual setPriority : (I)V
    //   38: aload_0
    //   39: iconst_1
    //   40: putfield b : Z
    //   43: aload_0
    //   44: getfield a : Ljava/lang/Thread;
    //   47: invokevirtual start : ()V
    //   50: aload_0
    //   51: getfield g : Lorg/fmod/a;
    //   54: ifnull -> 64
    //   57: aload_0
    //   58: getfield g : Lorg/fmod/a;
    //   61: invokevirtual b : ()V
    //   64: aload_0
    //   65: monitorexit
    //   66: return
    //   67: astore_1
    //   68: aload_0
    //   69: monitorexit
    //   70: aload_1
    //   71: athrow
    // Exception table:
    //   from	to	target	type
    //   2	13	67	finally
    //   13	64	67	finally
  }
  
  public int startAudioRecord(int paramInt1, int paramInt2, int paramInt3) {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield g : Lorg/fmod/a;
    //   6: ifnonnull -> 35
    //   9: new org/fmod/a
    //   12: astore #4
    //   14: aload #4
    //   16: aload_0
    //   17: iload_1
    //   18: iload_2
    //   19: invokespecial <init> : (Lorg/fmod/FMODAudioDevice;II)V
    //   22: aload_0
    //   23: aload #4
    //   25: putfield g : Lorg/fmod/a;
    //   28: aload_0
    //   29: getfield g : Lorg/fmod/a;
    //   32: invokevirtual b : ()V
    //   35: aload_0
    //   36: getfield g : Lorg/fmod/a;
    //   39: invokevirtual a : ()I
    //   42: istore_1
    //   43: aload_0
    //   44: monitorexit
    //   45: iload_1
    //   46: ireturn
    //   47: astore #4
    //   49: aload_0
    //   50: monitorexit
    //   51: aload #4
    //   53: athrow
    // Exception table:
    //   from	to	target	type
    //   2	35	47	finally
    //   35	43	47	finally
  }
  
  public void stop() {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield a : Ljava/lang/Thread;
    //   6: ifnull -> 29
    //   9: aload_0
    //   10: iconst_0
    //   11: putfield b : Z
    //   14: aload_0
    //   15: getfield a : Ljava/lang/Thread;
    //   18: invokevirtual join : ()V
    //   21: aload_0
    //   22: aconst_null
    //   23: putfield a : Ljava/lang/Thread;
    //   26: goto -> 2
    //   29: aload_0
    //   30: getfield g : Lorg/fmod/a;
    //   33: ifnull -> 43
    //   36: aload_0
    //   37: getfield g : Lorg/fmod/a;
    //   40: invokevirtual c : ()V
    //   43: aload_0
    //   44: monitorexit
    //   45: return
    //   46: astore_1
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_1
    //   50: athrow
    //   51: astore_1
    //   52: goto -> 2
    // Exception table:
    //   from	to	target	type
    //   2	14	46	finally
    //   14	26	51	java/lang/InterruptedException
    //   14	26	46	finally
    //   29	43	46	finally
  }
  
  public void stopAudioRecord() {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield g : Lorg/fmod/a;
    //   6: ifnull -> 21
    //   9: aload_0
    //   10: getfield g : Lorg/fmod/a;
    //   13: invokevirtual c : ()V
    //   16: aload_0
    //   17: aconst_null
    //   18: putfield g : Lorg/fmod/a;
    //   21: aload_0
    //   22: monitorexit
    //   23: return
    //   24: astore_1
    //   25: aload_0
    //   26: monitorexit
    //   27: aload_1
    //   28: athrow
    // Exception table:
    //   from	to	target	type
    //   2	21	24	finally
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\org\fmod\FMODAudioDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */