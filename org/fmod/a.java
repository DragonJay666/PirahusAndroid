package org.fmod;

import android.media.AudioRecord;
import android.util.Log;
import java.nio.ByteBuffer;

final class a implements Runnable {
  private final FMODAudioDevice a;
  
  private final ByteBuffer b;
  
  private final int c;
  
  private final int d;
  
  private final int e;
  
  private volatile Thread f;
  
  private volatile boolean g;
  
  private AudioRecord h;
  
  private boolean i;
  
  a(FMODAudioDevice paramFMODAudioDevice, int paramInt1, int paramInt2) {
    this.a = paramFMODAudioDevice;
    this.c = paramInt1;
    this.d = paramInt2;
    this.e = 2;
    this.b = ByteBuffer.allocateDirect(AudioRecord.getMinBufferSize(paramInt1, paramInt2, 2));
  }
  
  private void d() {
    AudioRecord audioRecord = this.h;
    if (audioRecord != null) {
      if (audioRecord.getState() == 1)
        this.h.stop(); 
      this.h.release();
      this.h = null;
    } 
    this.b.position(0);
    this.i = false;
  }
  
  public final int a() {
    return this.b.capacity();
  }
  
  public final void b() {
    if (this.f != null)
      c(); 
    this.g = true;
    this.f = new Thread(this);
    this.f.start();
  }
  
  public final void c() {
    while (this.f != null) {
      this.g = false;
      try {
        this.f.join();
        this.f = null;
      } catch (InterruptedException interruptedException) {}
    } 
  }
  
  public final void run() {
    int i = 3;
    while (this.g) {
      int j = i;
      if (!this.i) {
        j = i;
        if (i > 0) {
          d();
          AudioRecord audioRecord = new AudioRecord(1, this.c, this.d, this.e, this.b.capacity());
          this.h = audioRecord;
          j = audioRecord.getState();
          boolean bool = true;
          if (j != 1)
            bool = false; 
          this.i = bool;
          if (bool) {
            this.b.position(0);
            this.h.startRecording();
            j = 3;
          } else {
            StringBuilder stringBuilder = new StringBuilder("AudioRecord failed to initialize (status ");
            stringBuilder.append(this.h.getState());
            stringBuilder.append(")");
            Log.e("FMOD", stringBuilder.toString());
            j = i - 1;
            d();
          } 
        } 
      } 
      i = j;
      if (this.i) {
        i = j;
        if (this.h.getRecordingState() == 3) {
          AudioRecord audioRecord = this.h;
          ByteBuffer byteBuffer = this.b;
          i = audioRecord.read(byteBuffer, byteBuffer.capacity());
          this.a.fmodProcessMicData(this.b, i);
          this.b.position(0);
          i = j;
        } 
      } 
    } 
    d();
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\org\fmod\a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */