package com.unity3d.player;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.View;

public final class j extends View {
  final int a;
  
  final int b;
  
  Bitmap c;
  
  Bitmap d;
  
  public j(Context paramContext, int paramInt) {
    super(paramContext);
    this.a = paramInt;
    paramInt = getResources().getIdentifier("unity_static_splash", "drawable", getContext().getPackageName());
    this.b = paramInt;
    if (paramInt != 0)
      forceLayout(); 
  }
  
  public final void onDetachedFromWindow() {
    super.onDetachedFromWindow();
    Bitmap bitmap = this.c;
    if (bitmap != null) {
      bitmap.recycle();
      this.c = null;
    } 
    bitmap = this.d;
    if (bitmap != null) {
      bitmap.recycle();
      this.d = null;
    } 
  }
  
  public final void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    // Byte code:
    //   0: aload_0
    //   1: getfield b : I
    //   4: ifne -> 8
    //   7: return
    //   8: aload_0
    //   9: getfield c : Landroid/graphics/Bitmap;
    //   12: ifnonnull -> 47
    //   15: new android/graphics/BitmapFactory$Options
    //   18: dup
    //   19: invokespecial <init> : ()V
    //   22: astore #6
    //   24: aload #6
    //   26: iconst_0
    //   27: putfield inScaled : Z
    //   30: aload_0
    //   31: aload_0
    //   32: invokevirtual getResources : ()Landroid/content/res/Resources;
    //   35: aload_0
    //   36: getfield b : I
    //   39: aload #6
    //   41: invokestatic decodeResource : (Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   44: putfield c : Landroid/graphics/Bitmap;
    //   47: aload_0
    //   48: getfield c : Landroid/graphics/Bitmap;
    //   51: invokevirtual getWidth : ()I
    //   54: istore #5
    //   56: aload_0
    //   57: getfield c : Landroid/graphics/Bitmap;
    //   60: invokevirtual getHeight : ()I
    //   63: istore #4
    //   65: aload_0
    //   66: invokevirtual getWidth : ()I
    //   69: istore_3
    //   70: aload_0
    //   71: invokevirtual getHeight : ()I
    //   74: istore #7
    //   76: iload_3
    //   77: ifeq -> 394
    //   80: iload #7
    //   82: ifne -> 88
    //   85: goto -> 394
    //   88: iload #5
    //   90: i2f
    //   91: iload #4
    //   93: i2f
    //   94: fdiv
    //   95: fstore #8
    //   97: iload_3
    //   98: i2f
    //   99: fstore #9
    //   101: iload #7
    //   103: i2f
    //   104: fstore #10
    //   106: fload #9
    //   108: fload #10
    //   110: fdiv
    //   111: fload #8
    //   113: fcmpg
    //   114: ifgt -> 122
    //   117: iconst_1
    //   118: istore_2
    //   119: goto -> 124
    //   122: iconst_0
    //   123: istore_2
    //   124: getstatic com/unity3d/player/j$1.a : [I
    //   127: aload_0
    //   128: getfield a : I
    //   131: iconst_1
    //   132: isub
    //   133: iaload
    //   134: istore #11
    //   136: iload #11
    //   138: iconst_1
    //   139: if_icmpeq -> 205
    //   142: iload #11
    //   144: iconst_2
    //   145: if_icmpeq -> 163
    //   148: iload #11
    //   150: iconst_3
    //   151: if_icmpeq -> 163
    //   154: iload #5
    //   156: istore_2
    //   157: iload #4
    //   159: istore_3
    //   160: goto -> 244
    //   163: aload_0
    //   164: getfield a : I
    //   167: getstatic com/unity3d/player/j$a.c : I
    //   170: if_icmpne -> 179
    //   173: iconst_1
    //   174: istore #4
    //   176: goto -> 182
    //   179: iconst_0
    //   180: istore #4
    //   182: iload #4
    //   184: iload_2
    //   185: ixor
    //   186: ifeq -> 234
    //   189: fload #9
    //   191: fload #8
    //   193: fdiv
    //   194: f2i
    //   195: istore #4
    //   197: iload_3
    //   198: istore_2
    //   199: iload #4
    //   201: istore_3
    //   202: goto -> 244
    //   205: iload #5
    //   207: istore_2
    //   208: iload_3
    //   209: iload #5
    //   211: if_icmpge -> 224
    //   214: fload #9
    //   216: fload #8
    //   218: fdiv
    //   219: f2i
    //   220: istore #4
    //   222: iload_3
    //   223: istore_2
    //   224: iload #4
    //   226: istore_3
    //   227: iload #7
    //   229: iload #4
    //   231: if_icmpge -> 244
    //   234: fload #10
    //   236: fload #8
    //   238: fmul
    //   239: f2i
    //   240: istore_2
    //   241: iload #7
    //   243: istore_3
    //   244: aload_0
    //   245: getfield d : Landroid/graphics/Bitmap;
    //   248: astore #6
    //   250: aload #6
    //   252: ifnull -> 301
    //   255: aload #6
    //   257: invokevirtual getWidth : ()I
    //   260: iload_2
    //   261: if_icmpne -> 276
    //   264: aload_0
    //   265: getfield d : Landroid/graphics/Bitmap;
    //   268: invokevirtual getHeight : ()I
    //   271: iload_3
    //   272: if_icmpne -> 276
    //   275: return
    //   276: aload_0
    //   277: getfield d : Landroid/graphics/Bitmap;
    //   280: astore #6
    //   282: aload #6
    //   284: aload_0
    //   285: getfield c : Landroid/graphics/Bitmap;
    //   288: if_acmpeq -> 301
    //   291: aload #6
    //   293: invokevirtual recycle : ()V
    //   296: aload_0
    //   297: aconst_null
    //   298: putfield d : Landroid/graphics/Bitmap;
    //   301: aload_0
    //   302: getfield c : Landroid/graphics/Bitmap;
    //   305: iload_2
    //   306: iload_3
    //   307: iconst_1
    //   308: invokestatic createScaledBitmap : (Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    //   311: astore #6
    //   313: aload_0
    //   314: aload #6
    //   316: putfield d : Landroid/graphics/Bitmap;
    //   319: aload #6
    //   321: aload_0
    //   322: invokevirtual getResources : ()Landroid/content/res/Resources;
    //   325: invokevirtual getDisplayMetrics : ()Landroid/util/DisplayMetrics;
    //   328: getfield densityDpi : I
    //   331: invokevirtual setDensity : (I)V
    //   334: new android/graphics/drawable/ColorDrawable
    //   337: dup
    //   338: ldc -16777216
    //   340: invokespecial <init> : (I)V
    //   343: astore #6
    //   345: new android/graphics/drawable/BitmapDrawable
    //   348: dup
    //   349: aload_0
    //   350: invokevirtual getResources : ()Landroid/content/res/Resources;
    //   353: aload_0
    //   354: getfield d : Landroid/graphics/Bitmap;
    //   357: invokespecial <init> : (Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    //   360: astore #12
    //   362: aload #12
    //   364: bipush #17
    //   366: invokevirtual setGravity : (I)V
    //   369: aload_0
    //   370: new android/graphics/drawable/LayerDrawable
    //   373: dup
    //   374: iconst_2
    //   375: anewarray android/graphics/drawable/Drawable
    //   378: dup
    //   379: iconst_0
    //   380: aload #6
    //   382: aastore
    //   383: dup
    //   384: iconst_1
    //   385: aload #12
    //   387: aastore
    //   388: invokespecial <init> : ([Landroid/graphics/drawable/Drawable;)V
    //   391: invokevirtual setBackground : (Landroid/graphics/drawable/Drawable;)V
    //   394: return
  }
  
  enum a {
    a, b, c;
    
    private static final int[] d = new int[] { 1, 2, 3 };
    
    public static int[] a() {
      return (int[])d.clone();
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\j.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */