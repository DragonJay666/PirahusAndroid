package com.unity3d.player;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;

public class HFPStatus {
  private Context a;
  
  private BroadcastReceiver b = null;
  
  private Intent c = null;
  
  private boolean d = false;
  
  private AudioManager e = null;
  
  private boolean f = false;
  
  private int g = a.a;
  
  public HFPStatus(Context paramContext) {
    this.a = paramContext;
    this.e = (AudioManager)paramContext.getSystemService("audio");
    initHFPStatusJni();
  }
  
  private void b() {
    BroadcastReceiver broadcastReceiver = this.b;
    if (broadcastReceiver != null) {
      this.a.unregisterReceiver(broadcastReceiver);
      this.b = null;
      this.c = null;
    } 
    this.g = a.a;
  }
  
  private void c() {
    if (this.f) {
      this.f = false;
      this.e.stopBluetoothSco();
    } 
  }
  
  private final native void deinitHFPStatusJni();
  
  private final native void initHFPStatusJni();
  
  public final void a() {
    clearHFPStat();
    deinitHFPStatusJni();
  }
  
  protected void clearHFPStat() {
    b();
    c();
  }
  
  protected boolean getHFPStat() {
    return (this.g == a.b);
  }
  
  protected void requestHFPStat() {
    clearHFPStat();
    BroadcastReceiver broadcastReceiver = new BroadcastReceiver(this) {
        final HFPStatus a;
        
        public void onReceive(Context param1Context, Intent param1Intent) {
          if (param1Intent.getIntExtra("android.media.extra.SCO_AUDIO_STATE", -1) == 1) {
            HFPStatus.a(this.a, HFPStatus.a.b);
            HFPStatus.a(this.a);
            if (HFPStatus.b(this.a))
              HFPStatus.c(this.a).setMode(3); 
          } 
        }
      };
    this.b = broadcastReceiver;
    this.c = this.a.registerReceiver(broadcastReceiver, new IntentFilter("android.media.ACTION_SCO_AUDIO_STATE_UPDATED"));
    try {
      this.f = true;
      this.e.startBluetoothSco();
      return;
    } catch (NullPointerException nullPointerException) {
      f.Log(5, "startBluetoothSco() failed. no bluetooth device connected.");
      return;
    } 
  }
  
  protected void setHFPRecordingStat(boolean paramBoolean) {
    this.d = paramBoolean;
    if (!paramBoolean)
      this.e.setMode(0); 
  }
  
  enum a {
    a, b;
    
    private static final int[] c = new int[] { 1, 2 };
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\HFPStatus.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */