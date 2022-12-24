package com.unity3d.player;

import java.lang.invoke.MethodHandles;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Iterator;

final class ReflectionHelper {
  protected static boolean LOG = false;
  
  protected static final boolean LOGV = false;
  
  private static a[] a = new a[4096];
  
  private static long b;
  
  private static float a(Class paramClass1, Class paramClass2) {
    if (paramClass1.equals(paramClass2))
      return 1.0F; 
    if (!paramClass1.isPrimitive() && !paramClass2.isPrimitive()) {
      try {
        Class clazz = paramClass1.asSubclass(paramClass2);
        if (clazz != null)
          return 0.5F; 
      } catch (ClassCastException classCastException) {}
      try {
        paramClass1 = paramClass2.asSubclass(paramClass1);
        if (paramClass1 != null)
          return 0.1F; 
      } catch (ClassCastException classCastException) {}
    } 
    return 0.0F;
  }
  
  private static float a(Class paramClass, Class[] paramArrayOfClass1, Class[] paramArrayOfClass2) {
    int i;
    if (paramArrayOfClass2.length == 0)
      return 0.1F; 
    byte b = 0;
    if (paramArrayOfClass1 == null) {
      i = 0;
    } else {
      i = paramArrayOfClass1.length;
    } 
    if (i + 1 != paramArrayOfClass2.length)
      return 0.0F; 
    float f = 1.0F;
    if (paramArrayOfClass1 != null) {
      int j = paramArrayOfClass1.length;
      i = 0;
      f = 1.0F;
      while (b < j) {
        f *= a(paramArrayOfClass1[b], paramArrayOfClass2[i]);
        b++;
        i++;
      } 
    } 
    return f * a(paramClass, paramArrayOfClass2[paramArrayOfClass2.length - 1]);
  }
  
  private static Class a(String paramString, int[] paramArrayOfint) {
    while (paramArrayOfint[0] < paramString.length()) {
      int i = paramArrayOfint[0];
      paramArrayOfint[0] = i + 1;
      char c = paramString.charAt(i);
      if (c != '(' && c != ')') {
        if (c == 'L') {
          i = paramString.indexOf(';', paramArrayOfint[0]);
          if (i != -1) {
            paramString = paramString.substring(paramArrayOfint[0], i);
            paramArrayOfint[0] = i + 1;
            paramString = paramString.replace('/', '.');
            try {
              return Class.forName(paramString);
            } catch (ClassNotFoundException classNotFoundException) {}
            return null;
          } 
          break;
        } 
        if (c == 'Z')
          return boolean.class; 
        if (c == 'I')
          return int.class; 
        if (c == 'F')
          return float.class; 
        if (c == 'V')
          return void.class; 
        if (c == 'B')
          return byte.class; 
        if (c == 'C')
          return char.class; 
        if (c == 'S')
          return short.class; 
        if (c == 'J')
          return long.class; 
        if (c == 'D')
          return double.class; 
        if (c == '[')
          return Array.newInstance(a((String)classNotFoundException, paramArrayOfint), 0).getClass(); 
        StringBuilder stringBuilder = new StringBuilder("! parseType; ");
        stringBuilder.append(c);
        stringBuilder.append(" is not known!");
        f.Log(5, stringBuilder.toString());
        break;
      } 
    } 
    return null;
  }
  
  private static void a(a parama, Member paramMember) {
    // Byte code:
    //   0: ldc com/unity3d/player/ReflectionHelper
    //   2: monitorenter
    //   3: aload_0
    //   4: aload_1
    //   5: putfield a : Ljava/lang/reflect/Member;
    //   8: getstatic com/unity3d/player/ReflectionHelper.a : [Lcom/unity3d/player/ReflectionHelper$a;
    //   11: aload_0
    //   12: invokevirtual hashCode : ()I
    //   15: getstatic com/unity3d/player/ReflectionHelper.a : [Lcom/unity3d/player/ReflectionHelper$a;
    //   18: arraylength
    //   19: iconst_1
    //   20: isub
    //   21: iand
    //   22: aload_0
    //   23: aastore
    //   24: ldc com/unity3d/player/ReflectionHelper
    //   26: monitorexit
    //   27: return
    //   28: astore_0
    //   29: ldc com/unity3d/player/ReflectionHelper
    //   31: monitorexit
    //   32: aload_0
    //   33: athrow
    // Exception table:
    //   from	to	target	type
    //   3	24	28	finally
  }
  
  private static boolean a(a parama) {
    // Byte code:
    //   0: ldc com/unity3d/player/ReflectionHelper
    //   2: monitorenter
    //   3: getstatic com/unity3d/player/ReflectionHelper.a : [Lcom/unity3d/player/ReflectionHelper$a;
    //   6: aload_0
    //   7: invokevirtual hashCode : ()I
    //   10: getstatic com/unity3d/player/ReflectionHelper.a : [Lcom/unity3d/player/ReflectionHelper$a;
    //   13: arraylength
    //   14: iconst_1
    //   15: isub
    //   16: iand
    //   17: aaload
    //   18: astore_1
    //   19: aload_0
    //   20: aload_1
    //   21: invokevirtual equals : (Ljava/lang/Object;)Z
    //   24: istore_2
    //   25: iload_2
    //   26: ifne -> 34
    //   29: ldc com/unity3d/player/ReflectionHelper
    //   31: monitorexit
    //   32: iconst_0
    //   33: ireturn
    //   34: aload_0
    //   35: aload_1
    //   36: getfield a : Ljava/lang/reflect/Member;
    //   39: putfield a : Ljava/lang/reflect/Member;
    //   42: ldc com/unity3d/player/ReflectionHelper
    //   44: monitorexit
    //   45: iconst_1
    //   46: ireturn
    //   47: astore_0
    //   48: ldc com/unity3d/player/ReflectionHelper
    //   50: monitorexit
    //   51: aload_0
    //   52: athrow
    // Exception table:
    //   from	to	target	type
    //   3	25	47	finally
    //   34	42	47	finally
  }
  
  private static Class[] a(String paramString) {
    int[] arrayOfInt = new int[1];
    byte b = 0;
    arrayOfInt[0] = 0;
    ArrayList<Class<?>> arrayList = new ArrayList();
    while (arrayOfInt[0] < paramString.length()) {
      Class<?> clazz = a(paramString, arrayOfInt);
      if (clazz != null)
        arrayList.add(clazz); 
    } 
    Class[] arrayOfClass = new Class[arrayList.size()];
    Iterator<Class<?>> iterator = arrayList.iterator();
    while (iterator.hasNext()) {
      arrayOfClass[b] = iterator.next();
      b++;
    } 
    return arrayOfClass;
  }
  
  protected static void endUnityLaunch() {
    b++;
  }
  
  protected static Constructor getConstructorID(Class paramClass, String paramString) {
    Constructor constructor;
    a a1 = new a(paramClass, "", paramString);
    if (a(a1)) {
      constructor = (Constructor)a1.a;
    } else {
      Class[] arrayOfClass = a(paramString);
      float f = 0.0F;
      Constructor[] arrayOfConstructor = (Constructor[])paramClass.getConstructors();
      int i = arrayOfConstructor.length;
      byte b = 0;
      Constructor constructor1 = null;
      while (true) {
        constructor = constructor1;
        if (b < i) {
          constructor = arrayOfConstructor[b];
          float f1 = a(void.class, constructor.getParameterTypes(), arrayOfClass);
          float f2 = f;
          if (f1 > f) {
            constructor1 = constructor;
            constructor = constructor1;
            if (f1 != 1.0F) {
              f2 = f1;
            } else {
              break;
            } 
          } 
          b++;
          f = f2;
          continue;
        } 
        break;
      } 
      a(a1, constructor);
    } 
    if (constructor != null)
      return constructor; 
    StringBuilder stringBuilder = new StringBuilder("<init>");
    stringBuilder.append(paramString);
    stringBuilder.append(" in class ");
    stringBuilder.append(paramClass.getName());
    throw new NoSuchMethodError(stringBuilder.toString());
  }
  
  protected static Field getFieldID(Class paramClass, String paramString1, String paramString2, boolean paramBoolean) {
    Field field;
    String str;
    Class clazz = paramClass;
    a a1 = new a(clazz, paramString1, paramString2);
    if (a(a1)) {
      field = (Field)a1.a;
    } else {
      Field field1;
      Class[] arrayOfClass = a(paramString2);
      float f = 0.0F;
      paramClass = null;
      while (true) {
        Class clazz1 = paramClass;
        if (clazz != null) {
          Field field2;
          float f1;
          Field[] arrayOfField = clazz.getDeclaredFields();
          int i = arrayOfField.length;
          byte b = 0;
          clazz1 = paramClass;
          while (true) {
            f1 = f;
            paramClass = clazz1;
            if (b < i) {
              Field field4 = arrayOfField[b];
              float f2 = f;
              paramClass = clazz1;
              if (paramBoolean == Modifier.isStatic(field4.getModifiers())) {
                f2 = f;
                paramClass = clazz1;
                if (field4.getName().compareTo(paramString1) == 0) {
                  f1 = a(field4.getType(), (Class[])null, arrayOfClass);
                  f2 = f;
                  paramClass = clazz1;
                  if (f1 > f) {
                    field2 = field4;
                    if (f1 != 1.0F) {
                      f2 = f1;
                    } else {
                      break;
                    } 
                  } 
                } 
              } 
              b++;
              f = f2;
              Field field3 = field2;
              continue;
            } 
            break;
          } 
          field1 = field2;
          if (f1 != 1.0F) {
            field1 = field2;
            if (!clazz.isPrimitive()) {
              field1 = field2;
              if (!clazz.isInterface()) {
                field1 = field2;
                if (!clazz.equals(Object.class)) {
                  field1 = field2;
                  if (!clazz.equals(void.class)) {
                    clazz = clazz.getSuperclass();
                    f = f1;
                    continue;
                  } 
                } 
              } 
            } 
          } 
        } 
        break;
      } 
      a(a1, field1);
      field = field1;
    } 
    if (field == null) {
      if (paramBoolean) {
        str = "static";
      } else {
        str = "non-static";
      } 
      throw new NoSuchFieldError(String.format("no %s field with name='%s' signature='%s' in class L%s;", new Object[] { str, paramString1, paramString2, clazz.getName() }));
    } 
    return (Field)str;
  }
  
  protected static String getFieldSignature(Field paramField) {
    String str;
    Class<?> clazz = paramField.getType();
    if (clazz.isPrimitive()) {
      String str1 = clazz.getName();
      if ("boolean".equals(str1))
        return "Z"; 
      if ("byte".equals(str1))
        return "B"; 
      if ("char".equals(str1))
        return "C"; 
      if ("double".equals(str1))
        return "D"; 
      if ("float".equals(str1))
        return "F"; 
      if ("int".equals(str1))
        return "I"; 
      if ("long".equals(str1))
        return "J"; 
      str = str1;
      if ("short".equals(str1))
        str = "S"; 
      return str;
    } 
    if (str.isArray())
      return str.getName().replace('.', '/'); 
    StringBuilder stringBuilder = new StringBuilder("L");
    stringBuilder.append(str.getName().replace('.', '/'));
    stringBuilder.append(";");
    return stringBuilder.toString();
  }
  
  protected static Method getMethodID(Class paramClass, String paramString1, String paramString2, boolean paramBoolean) {
    Method method;
    String str;
    a a1 = new a(paramClass, paramString1, paramString2);
    if (a(a1)) {
      method = (Method)a1.a;
    } else {
      Method method1;
      Class[] arrayOfClass = a(paramString2);
      float f = 0.0F;
      Class clazz2 = null;
      Class clazz1 = paramClass;
      paramClass = clazz2;
      while (true) {
        clazz2 = paramClass;
        if (clazz1 != null) {
          Method method2;
          float f1;
          Method[] arrayOfMethod = clazz1.getDeclaredMethods();
          int i = arrayOfMethod.length;
          byte b = 0;
          clazz2 = paramClass;
          while (true) {
            f1 = f;
            paramClass = clazz2;
            if (b < i) {
              Method method4 = arrayOfMethod[b];
              float f2 = f;
              paramClass = clazz2;
              if (paramBoolean == Modifier.isStatic(method4.getModifiers())) {
                f2 = f;
                paramClass = clazz2;
                if (method4.getName().compareTo(paramString1) == 0) {
                  f1 = a(method4.getReturnType(), method4.getParameterTypes(), arrayOfClass);
                  f2 = f;
                  paramClass = clazz2;
                  if (f1 > f) {
                    method2 = method4;
                    if (f1 != 1.0F) {
                      f2 = f1;
                    } else {
                      break;
                    } 
                  } 
                } 
              } 
              b++;
              f = f2;
              Method method3 = method2;
              continue;
            } 
            break;
          } 
          method1 = method2;
          if (f1 != 1.0F) {
            method1 = method2;
            if (!clazz1.isPrimitive()) {
              method1 = method2;
              if (!clazz1.isInterface()) {
                method1 = method2;
                if (!clazz1.equals(Object.class)) {
                  method1 = method2;
                  if (!clazz1.equals(void.class)) {
                    clazz1 = clazz1.getSuperclass();
                    f = f1;
                    continue;
                  } 
                } 
              } 
            } 
          } 
        } 
        break;
      } 
      a(a1, method1);
      paramClass = clazz1;
      method = method1;
    } 
    if (method == null) {
      if (paramBoolean) {
        str = "static";
      } else {
        str = "non-static";
      } 
      throw new NoSuchMethodError(String.format("no %s method with name='%s' signature='%s' in class L%s;", new Object[] { str, paramString1, paramString2, paramClass.getName() }));
    } 
    return (Method)str;
  }
  
  private static native void nativeProxyFinalize(long paramLong);
  
  private static native Object nativeProxyInvoke(long paramLong, String paramString, Object[] paramArrayOfObject);
  
  private static native void nativeProxyLogJNIInvokeException(long paramLong);
  
  protected static Object newProxyInstance(long paramLong, Class paramClass) {
    return newProxyInstance(paramLong, new Class[] { paramClass });
  }
  
  protected static Object newProxyInstance(long paramLong, Class[] paramArrayOfClass) {
    return Proxy.newProxyInstance(ReflectionHelper.class.getClassLoader(), paramArrayOfClass, new b(paramLong, paramArrayOfClass) {
          final long a;
          
          final Class[] b;
          
          private long c = ReflectionHelper.a();
          
          private long d;
          
          private boolean e;
          
          private Object a(Object param1Object, Method param1Method, Object[] param1ArrayOfObject) {
            Object[] arrayOfObject = param1ArrayOfObject;
            if (param1ArrayOfObject == null)
              try {
                arrayOfObject = new Object[0];
                Class<?> clazz1 = param1Method.getDeclaringClass();
                Constructor<MethodHandles.Lookup> constructor1 = MethodHandles.Lookup.class.getDeclaredConstructor(new Class[] { Class.class, int.class });
                constructor1.setAccessible(true);
                return ((MethodHandles.Lookup)constructor1.newInstance(new Object[] { clazz1, Integer.valueOf(2) })).in(clazz1).unreflectSpecial(param1Method, clazz1).bindTo(param1Object).invokeWithArguments(arrayOfObject);
              } catch (NoClassDefFoundError noClassDefFoundError) {
                f.Log(6, String.format("Java interface default methods are only supported since Android Oreo", new Object[0]));
                ReflectionHelper.a(this.d);
                return null;
              }  
            Class<?> clazz = param1Method.getDeclaringClass();
            Constructor<MethodHandles.Lookup> constructor = MethodHandles.Lookup.class.getDeclaredConstructor(new Class[] { Class.class, int.class });
            constructor.setAccessible(true);
            return ((MethodHandles.Lookup)constructor.newInstance(new Object[] { clazz, Integer.valueOf(2) })).in(clazz).unreflectSpecial(param1Method, clazz).bindTo(noClassDefFoundError).invokeWithArguments(arrayOfObject);
          }
          
          public final void a(long param1Long, boolean param1Boolean) {
            this.d = param1Long;
            this.e = param1Boolean;
          }
          
          protected final void finalize() {
            try {
              if (this.c == ReflectionHelper.a())
                ReflectionHelper.b(this.a); 
              return;
            } finally {
              super.finalize();
            } 
          }
          
          public final Object invoke(Object param1Object, Method param1Method, Object[] param1ArrayOfObject) {
            long l;
            if (this.c != ReflectionHelper.a()) {
              f.Log(6, "Scripting proxy object was destroyed, because Unity player was unloaded.");
              return null;
            } 
            this.d = 0L;
            this.e = false;
            Object object = ReflectionHelper.a(this.a, param1Method.getName(), param1ArrayOfObject);
            if (this.e) {
              if ((param1Method.getModifiers() & 0x400) == 0)
                return a(param1Object, param1Method, param1ArrayOfObject); 
              l = this.d;
            } else {
              l = this.d;
              if (l != 0L) {
                ReflectionHelper.a(l);
                return object;
              } 
              return object;
            } 
            ReflectionHelper.a(l);
            return object;
          }
        });
  }
  
  protected static void setNativeExceptionOnProxy(Object paramObject, long paramLong, boolean paramBoolean) {
    ((b)Proxy.getInvocationHandler(paramObject)).a(paramLong, paramBoolean);
  }
  
  private static final class a {
    public volatile Member a;
    
    private final Class b;
    
    private final String c;
    
    private final String d;
    
    private final int e;
    
    a(Class param1Class, String param1String1, String param1String2) {
      this.b = param1Class;
      this.c = param1String1;
      this.d = param1String2;
      this.e = ((param1Class.hashCode() + 527) * 31 + this.c.hashCode()) * 31 + this.d.hashCode();
    }
    
    public final boolean equals(Object param1Object) {
      if (param1Object == this)
        return true; 
      if (param1Object instanceof a) {
        param1Object = param1Object;
        if (this.e == ((a)param1Object).e && this.d.equals(((a)param1Object).d) && this.c.equals(((a)param1Object).c) && this.b.equals(((a)param1Object).b))
          return true; 
      } 
      return false;
    }
    
    public final int hashCode() {
      return this.e;
    }
  }
  
  protected static interface b extends InvocationHandler {
    void a(long param1Long, boolean param1Boolean);
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\ReflectionHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */