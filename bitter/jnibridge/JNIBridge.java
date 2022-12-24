package bitter.jnibridge;

import java.lang.invoke.MethodHandles;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class JNIBridge {
  static native void delete(long paramLong);
  
  static void disableInterfaceProxy(Object paramObject) {
    if (paramObject != null)
      ((a)Proxy.getInvocationHandler(paramObject)).a(); 
  }
  
  static native Object invoke(long paramLong, Class paramClass, Method paramMethod, Object[] paramArrayOfObject);
  
  static Object newInterfaceProxy(long paramLong, Class[] paramArrayOfClass) {
    return Proxy.newProxyInstance(JNIBridge.class.getClassLoader(), paramArrayOfClass, new a(paramLong));
  }
  
  private static final class a implements InvocationHandler {
    private Object a = new Object[0];
    
    private long b;
    
    private Constructor c;
    
    public a(long param1Long) {
      this.b = param1Long;
      try {
        Constructor<MethodHandles.Lookup> constructor = MethodHandles.Lookup.class.getDeclaredConstructor(new Class[] { Class.class, int.class });
        this.c = constructor;
        constructor.setAccessible(true);
        return;
      } catch (NoClassDefFoundError noClassDefFoundError) {
        this.c = null;
        return;
      } catch (NoSuchMethodException noSuchMethodException) {
        this.c = null;
        return;
      } 
    }
    
    private Object a(Object param1Object, Method param1Method, Object[] param1ArrayOfObject) {
      Object[] arrayOfObject = param1ArrayOfObject;
      if (param1ArrayOfObject == null)
        arrayOfObject = new Object[0]; 
      Class<?> clazz = param1Method.getDeclaringClass();
      return ((MethodHandles.Lookup)this.c.newInstance(new Object[] { clazz, Integer.valueOf(2) })).in(clazz).unreflectSpecial(param1Method, clazz).bindTo(param1Object).invokeWithArguments(arrayOfObject);
    }
    
    public final void a() {
      synchronized (this.a) {
        this.b = 0L;
        return;
      } 
    }
    
    public final void finalize() {
      synchronized (this.a) {
        if (this.b == 0L)
          return; 
        JNIBridge.delete(this.b);
        return;
      } 
    }
    
    public final Object invoke(Object param1Object, Method param1Method, Object[] param1ArrayOfObject) {
      synchronized (this.a) {
        if (this.b == 0L)
          return null; 
        try {
          return JNIBridge.invoke(this.b, param1Method.getDeclaringClass(), param1Method, param1ArrayOfObject);
        } catch (NoSuchMethodError noSuchMethodError) {
          if (this.c != null) {
            if ((param1Method.getModifiers() & 0x400) == 0) {
              param1Object = a(param1Object, param1Method, param1ArrayOfObject);
              return param1Object;
            } 
            throw noSuchMethodError;
          } 
          System.err.println("JNIBridge error: Java interface default methods are only supported since Android Oreo");
          throw noSuchMethodError;
        } 
      } 
    }
  }
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\bitter\jnibridge\JNIBridge.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */