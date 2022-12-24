package com.unity3d.player;

import android.content.Context;

public class AudioVolumeHandler implements b.b {
  private b a;
  
  AudioVolumeHandler(Context paramContext) {
    b b1 = new b(paramContext);
    this.a = b1;
    b1.a(this);
  }
  
  public final void a() {
    this.a.a();
    this.a = null;
  }
  
  public final native void onAudioVolumeChanged(int paramInt);
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\AudioVolumeHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */