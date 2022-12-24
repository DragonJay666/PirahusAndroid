package com.unity3d.player;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;

public class UnityPlayerActivity extends Activity implements IUnityPlayerLifecycleEvents {
  protected UnityPlayer mUnityPlayer;
  
  public boolean dispatchKeyEvent(KeyEvent paramKeyEvent) {
    return (paramKeyEvent.getAction() == 2) ? this.mUnityPlayer.injectEvent((InputEvent)paramKeyEvent) : super.dispatchKeyEvent(paramKeyEvent);
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration) {
    super.onConfigurationChanged(paramConfiguration);
    this.mUnityPlayer.configurationChanged(paramConfiguration);
  }
  
  protected void onCreate(Bundle paramBundle) {
    requestWindowFeature(1);
    super.onCreate(paramBundle);
    String str = updateUnityCommandLineArguments(getIntent().getStringExtra("unity"));
    getIntent().putExtra("unity", str);
    UnityPlayer unityPlayer = new UnityPlayer((Context)this, this);
    this.mUnityPlayer = unityPlayer;
    setContentView((View)unityPlayer);
    this.mUnityPlayer.requestFocus();
  }
  
  protected void onDestroy() {
    this.mUnityPlayer.destroy();
    super.onDestroy();
  }
  
  public boolean onGenericMotionEvent(MotionEvent paramMotionEvent) {
    return this.mUnityPlayer.injectEvent((InputEvent)paramMotionEvent);
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent) {
    return this.mUnityPlayer.injectEvent((InputEvent)paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent) {
    return this.mUnityPlayer.injectEvent((InputEvent)paramKeyEvent);
  }
  
  public void onLowMemory() {
    super.onLowMemory();
    this.mUnityPlayer.lowMemory();
  }
  
  protected void onNewIntent(Intent paramIntent) {
    setIntent(paramIntent);
    this.mUnityPlayer.newIntent(paramIntent);
  }
  
  protected void onPause() {
    super.onPause();
    MultiWindowSupport.saveMultiWindowMode(this);
    if (MultiWindowSupport.getAllowResizableWindow(this))
      return; 
    this.mUnityPlayer.pause();
  }
  
  protected void onResume() {
    super.onResume();
    if (MultiWindowSupport.getAllowResizableWindow(this) && !MultiWindowSupport.isMultiWindowModeChangedToTrue(this))
      return; 
    this.mUnityPlayer.resume();
  }
  
  protected void onStart() {
    super.onStart();
    if (!MultiWindowSupport.getAllowResizableWindow(this))
      return; 
    this.mUnityPlayer.resume();
  }
  
  protected void onStop() {
    super.onStop();
    if (!MultiWindowSupport.getAllowResizableWindow(this))
      return; 
    this.mUnityPlayer.pause();
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent) {
    return this.mUnityPlayer.injectEvent((InputEvent)paramMotionEvent);
  }
  
  public void onTrimMemory(int paramInt) {
    super.onTrimMemory(paramInt);
    if (paramInt == 15)
      this.mUnityPlayer.lowMemory(); 
  }
  
  public void onUnityPlayerQuitted() {}
  
  public void onUnityPlayerUnloaded() {
    moveTaskToBack(true);
  }
  
  public void onWindowFocusChanged(boolean paramBoolean) {
    super.onWindowFocusChanged(paramBoolean);
    this.mUnityPlayer.windowFocusChanged(paramBoolean);
  }
  
  protected String updateUnityCommandLineArguments(String paramString) {
    return paramString;
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\UnityPlayerActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */