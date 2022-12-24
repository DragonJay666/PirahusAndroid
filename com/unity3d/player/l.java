package com.unity3d.player;

final class l implements Thread.UncaughtExceptionHandler {
  private volatile Thread.UncaughtExceptionHandler a;
  
  final boolean a() {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: invokestatic getDefaultUncaughtExceptionHandler : ()Ljava/lang/Thread$UncaughtExceptionHandler;
    //   5: astore_1
    //   6: aload_1
    //   7: aload_0
    //   8: if_acmpne -> 17
    //   11: iconst_0
    //   12: istore_2
    //   13: aload_0
    //   14: monitorexit
    //   15: iload_2
    //   16: ireturn
    //   17: aload_0
    //   18: aload_1
    //   19: putfield a : Ljava/lang/Thread$UncaughtExceptionHandler;
    //   22: aload_0
    //   23: invokestatic setDefaultUncaughtExceptionHandler : (Ljava/lang/Thread$UncaughtExceptionHandler;)V
    //   26: iconst_1
    //   27: istore_2
    //   28: goto -> 13
    //   31: astore_1
    //   32: aload_0
    //   33: monitorexit
    //   34: aload_1
    //   35: athrow
    // Exception table:
    //   from	to	target	type
    //   2	6	31	finally
    //   17	26	31	finally
  }
  
  public final void uncaughtException(Thread paramThread, Throwable paramThrowable) {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new java/lang/Error
    //   5: astore_3
    //   6: new java/lang/StringBuilder
    //   9: astore #4
    //   11: aload #4
    //   13: invokespecial <init> : ()V
    //   16: aload #4
    //   18: ldc 'FATAL EXCEPTION [%s]\\n'
    //   20: iconst_1
    //   21: anewarray java/lang/Object
    //   24: dup
    //   25: iconst_0
    //   26: aload_1
    //   27: invokevirtual getName : ()Ljava/lang/String;
    //   30: aastore
    //   31: invokestatic format : (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   34: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   37: pop
    //   38: aload #4
    //   40: ldc 'Unity version     : %s\\n'
    //   42: iconst_1
    //   43: anewarray java/lang/Object
    //   46: dup
    //   47: iconst_0
    //   48: ldc '2021.3.6f1'
    //   50: aastore
    //   51: invokestatic format : (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   54: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   57: pop
    //   58: aload #4
    //   60: ldc 'Device model      : %s %s\\n'
    //   62: iconst_2
    //   63: anewarray java/lang/Object
    //   66: dup
    //   67: iconst_0
    //   68: getstatic android/os/Build.MANUFACTURER : Ljava/lang/String;
    //   71: aastore
    //   72: dup
    //   73: iconst_1
    //   74: getstatic android/os/Build.MODEL : Ljava/lang/String;
    //   77: aastore
    //   78: invokestatic format : (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   81: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   84: pop
    //   85: aload #4
    //   87: ldc 'Device fingerprint: %s\\n'
    //   89: iconst_1
    //   90: anewarray java/lang/Object
    //   93: dup
    //   94: iconst_0
    //   95: getstatic android/os/Build.FINGERPRINT : Ljava/lang/String;
    //   98: aastore
    //   99: invokestatic format : (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   102: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   105: pop
    //   106: aload #4
    //   108: ldc 'Build Type        : %s\\n'
    //   110: iconst_1
    //   111: anewarray java/lang/Object
    //   114: dup
    //   115: iconst_0
    //   116: ldc 'Release'
    //   118: aastore
    //   119: invokestatic format : (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   122: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   125: pop
    //   126: aload #4
    //   128: ldc 'Scripting Backend : %s\\n'
    //   130: iconst_1
    //   131: anewarray java/lang/Object
    //   134: dup
    //   135: iconst_0
    //   136: ldc 'Mono'
    //   138: aastore
    //   139: invokestatic format : (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   142: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   145: pop
    //   146: aload #4
    //   148: ldc 'ABI               : %s\\n'
    //   150: iconst_1
    //   151: anewarray java/lang/Object
    //   154: dup
    //   155: iconst_0
    //   156: getstatic android/os/Build.CPU_ABI : Ljava/lang/String;
    //   159: aastore
    //   160: invokestatic format : (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   163: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   166: pop
    //   167: aload #4
    //   169: ldc 'Strip Engine Code : %s\\n'
    //   171: iconst_1
    //   172: anewarray java/lang/Object
    //   175: dup
    //   176: iconst_0
    //   177: iconst_0
    //   178: invokestatic valueOf : (Z)Ljava/lang/Boolean;
    //   181: aastore
    //   182: invokestatic format : (Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   185: invokevirtual append : (Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   188: pop
    //   189: aload_3
    //   190: aload #4
    //   192: invokevirtual toString : ()Ljava/lang/String;
    //   195: invokespecial <init> : (Ljava/lang/String;)V
    //   198: aload_3
    //   199: iconst_0
    //   200: anewarray java/lang/StackTraceElement
    //   203: invokevirtual setStackTrace : ([Ljava/lang/StackTraceElement;)V
    //   206: aload_3
    //   207: aload_2
    //   208: invokevirtual initCause : (Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   211: pop
    //   212: aload_0
    //   213: getfield a : Ljava/lang/Thread$UncaughtExceptionHandler;
    //   216: aload_1
    //   217: aload_3
    //   218: invokeinterface uncaughtException : (Ljava/lang/Thread;Ljava/lang/Throwable;)V
    //   223: aload_0
    //   224: monitorexit
    //   225: return
    //   226: astore_3
    //   227: aload_0
    //   228: getfield a : Ljava/lang/Thread$UncaughtExceptionHandler;
    //   231: aload_1
    //   232: aload_2
    //   233: invokeinterface uncaughtException : (Ljava/lang/Thread;Ljava/lang/Throwable;)V
    //   238: aload_0
    //   239: monitorexit
    //   240: return
    //   241: astore_1
    //   242: aload_0
    //   243: monitorexit
    //   244: aload_1
    //   245: athrow
    // Exception table:
    //   from	to	target	type
    //   2	223	226	finally
    //   227	238	241	finally
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\l.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */