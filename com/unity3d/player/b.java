package com.unity3d.player;

import android.content.Context;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Handler;
import android.provider.Settings;

final class b {
  private final Context a;
  
  private final AudioManager b;
  
  private a c;
  
  public b(Context paramContext) {
    this.a = paramContext;
    this.b = (AudioManager)paramContext.getSystemService("audio");
  }
  
  public final void a() {
    if (this.c != null) {
      this.a.getContentResolver().unregisterContentObserver(this.c);
      this.c = null;
    } 
  }
  
  public final void a(b paramb) {
    this.c = new a(this, new Handler(), this.b, 3, paramb);
    this.a.getContentResolver().registerContentObserver(Settings.System.CONTENT_URI, true, this.c);
  }
  
  private final class a extends ContentObserver {
    final b a;
    
    private final b.b b;
    
    private final AudioManager c;
    
    private final int d;
    
    private int e;
    
    public a(b this$0, Handler param1Handler, AudioManager param1AudioManager, int param1Int, b.b param1b) {
      super(param1Handler);
      this.c = param1AudioManager;
      this.d = 3;
      this.b = param1b;
      this.e = param1AudioManager.getStreamVolume(3);
    }
    
    public final boolean deliverSelfNotifications() {
      return super.deliverSelfNotifications();
    }
    
    public final void onChange(boolean param1Boolean, Uri param1Uri) {
      AudioManager audioManager = this.c;
      if (audioManager != null && this.b != null) {
        int i = audioManager.getStreamVolume(this.d);
        if (i != this.e) {
          this.e = i;
          this.b.onAudioVolumeChanged(i);
        } 
      } 
    }
  }
  
  public static interface b {
    void onAudioVolumeChanged(int param1Int);
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\b.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */