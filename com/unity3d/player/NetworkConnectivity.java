package com.unity3d.player;

import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;

public class NetworkConnectivity extends Activity {
  private final int a = 0;
  
  private final int b;
  
  private final int c;
  
  private int d;
  
  private ConnectivityManager e;
  
  private final ConnectivityManager.NetworkCallback f;
  
  public NetworkConnectivity(Context paramContext) {
    byte b = 1;
    this.b = 1;
    this.c = 2;
    this.d = 0;
    this.f = new ConnectivityManager.NetworkCallback(this) {
        final NetworkConnectivity a;
        
        public final void onAvailable(Network param1Network) {
          super.onAvailable(param1Network);
        }
        
        public final void onCapabilitiesChanged(Network param1Network, NetworkCapabilities param1NetworkCapabilities) {
          NetworkConnectivity networkConnectivity;
          byte b;
          super.onCapabilitiesChanged(param1Network, param1NetworkCapabilities);
          if (param1NetworkCapabilities.hasTransport(0)) {
            networkConnectivity = this.a;
            b = 1;
          } else {
            networkConnectivity = this.a;
            b = 2;
          } 
          NetworkConnectivity.a(networkConnectivity, b);
        }
        
        public final void onLost(Network param1Network) {
          super.onLost(param1Network);
          NetworkConnectivity.a(this.a, 0);
        }
        
        public final void onUnavailable() {
          super.onUnavailable();
          NetworkConnectivity.a(this.a, 0);
        }
      };
    ConnectivityManager connectivityManager = (ConnectivityManager)paramContext.getSystemService("connectivity");
    this.e = connectivityManager;
    connectivityManager.registerDefaultNetworkCallback(this.f);
    NetworkInfo networkInfo = this.e.getActiveNetworkInfo();
    if (networkInfo != null && networkInfo.isConnected()) {
      if (networkInfo.getType() != 0)
        b = 2; 
      this.d = b;
    } 
  }
  
  public final int a() {
    return this.d;
  }
  
  public final void b() {
    this.e.unregisterNetworkCallback(this.f);
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\NetworkConnectivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */