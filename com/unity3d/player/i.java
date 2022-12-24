package com.unity3d.player;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;

public final class i extends Dialog implements TextWatcher, View.OnClickListener {
  private static int d = 1627389952;
  
  private static int e = -1;
  
  boolean a;
  
  private Context b = null;
  
  private UnityPlayer c = null;
  
  private int f;
  
  public i(Context paramContext, UnityPlayer paramUnityPlayer, String paramString1, int paramInt1, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString2, int paramInt2, boolean paramBoolean4, boolean paramBoolean5) {
    super(paramContext);
    this.b = paramContext;
    this.c = paramUnityPlayer;
    Window window = getWindow();
    this.a = paramBoolean5;
    window.requestFeature(1);
    WindowManager.LayoutParams layoutParams = window.getAttributes();
    layoutParams.gravity = 80;
    layoutParams.x = 0;
    layoutParams.y = 0;
    window.setAttributes(layoutParams);
    window.setBackgroundDrawable((Drawable)new ColorDrawable(0));
    View view = createSoftInputView();
    setContentView(view);
    window.setLayout(-1, -2);
    window.clearFlags(2);
    window.clearFlags(134217728);
    window.clearFlags(67108864);
    if (!this.a) {
      window.addFlags(32);
      window.addFlags(262144);
    } 
    EditText editText = (EditText)findViewById(1057292289);
    Button button = (Button)findViewById(1057292290);
    a(editText, paramString1, paramInt1, paramBoolean1, paramBoolean2, paramBoolean3, paramString2, paramInt2);
    button.setOnClickListener(this);
    this.f = editText.getCurrentTextColor();
    a(paramBoolean4);
    this.c.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener(this, view) {
          final View a;
          
          final i b;
          
          public final void onGlobalLayout() {
            if (this.a.isShown()) {
              Rect rect2 = new Rect();
              i.a(this.b).getWindowVisibleDisplayFrame(rect2);
              int[] arrayOfInt = new int[2];
              i.a(this.b).getLocationOnScreen(arrayOfInt);
              Point point2 = new Point(rect2.left - arrayOfInt[0], rect2.height() - this.a.getHeight());
              Point point1 = new Point();
              this.b.getWindow().getWindowManager().getDefaultDisplay().getSize(point1);
              int j = i.a(this.b).getHeight();
              int k = point1.y;
              int m = i.a(this.b).getHeight() - point2.y;
              if (m != j - k + this.a.getHeight()) {
                i.a(this.b).reportSoftInputIsVisible(true);
              } else {
                i.a(this.b).reportSoftInputIsVisible(false);
              } 
              Rect rect1 = new Rect(point2.x, point2.y, this.a.getWidth(), m);
              i.a(this.b).reportSoftInputArea(rect1);
            } 
          }
        });
    editText.setOnFocusChangeListener(new View.OnFocusChangeListener(this) {
          final i a;
          
          public final void onFocusChange(View param1View, boolean param1Boolean) {
            if (param1Boolean)
              this.a.getWindow().setSoftInputMode(5); 
          }
        });
    editText.requestFocus();
  }
  
  private static int a(int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) {
    byte b;
    if (paramBoolean1) {
      j = 32768;
    } else {
      j = 524288;
    } 
    char c = Character.MIN_VALUE;
    if (paramBoolean2) {
      b = 131072;
    } else {
      b = 0;
    } 
    if (paramBoolean3)
      c = ''; 
    int j = j | b | c;
    if (paramInt < 0 || paramInt > 11)
      return j; 
    int[] arrayOfInt = new int[12];
    arrayOfInt[0] = 1;
    arrayOfInt[1] = 16385;
    arrayOfInt[2] = 12290;
    arrayOfInt[3] = 17;
    arrayOfInt[4] = 2;
    arrayOfInt[5] = 3;
    arrayOfInt[6] = 8289;
    arrayOfInt[7] = 33;
    arrayOfInt[8] = 1;
    arrayOfInt[9] = 16417;
    arrayOfInt[10] = 17;
    arrayOfInt[11] = 8194;
    return ((arrayOfInt[paramInt] & 0x2) != 0) ? arrayOfInt[paramInt] : (arrayOfInt[paramInt] | j);
  }
  
  private void a(EditText paramEditText, String paramString1, int paramInt1, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString2, int paramInt2) {
    paramEditText.setImeOptions(6);
    paramEditText.setText(paramString1);
    paramEditText.setHint(paramString2);
    paramEditText.setHintTextColor(d);
    paramEditText.setInputType(a(paramInt1, paramBoolean1, paramBoolean2, paramBoolean3));
    paramEditText.setImeOptions(33554432);
    if (paramInt2 > 0)
      paramEditText.setFilters(new InputFilter[] { (InputFilter)new InputFilter.LengthFilter(paramInt2) }); 
    paramEditText.addTextChangedListener(this);
    paramEditText.setSelection(paramEditText.getText().length());
    paramEditText.setClickable(true);
  }
  
  private void a(String paramString, boolean paramBoolean) {
    ((EditText)findViewById(1057292289)).setSelection(0, 0);
    this.c.reportSoftInputStr(paramString, 1, paramBoolean);
  }
  
  private String b() {
    EditText editText = (EditText)findViewById(1057292289);
    return (editText == null) ? null : editText.getText().toString();
  }
  
  public final String a() {
    InputMethodSubtype inputMethodSubtype = ((InputMethodManager)this.b.getSystemService("input_method")).getCurrentInputMethodSubtype();
    if (inputMethodSubtype == null)
      return null; 
    String str1 = inputMethodSubtype.getLocale();
    if (str1 != null && !str1.equals(""))
      return str1; 
    str1 = inputMethodSubtype.getMode();
    String str2 = inputMethodSubtype.getExtraValue();
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(str1);
    stringBuilder.append(" ");
    stringBuilder.append(str2);
    return stringBuilder.toString();
  }
  
  public final void a(int paramInt) {
    EditText editText = (EditText)findViewById(1057292289);
    if (editText != null) {
      if (paramInt > 0) {
        editText.setFilters(new InputFilter[] { (InputFilter)new InputFilter.LengthFilter(paramInt) });
        return;
      } 
      editText.setFilters(new InputFilter[0]);
    } 
  }
  
  public final void a(int paramInt1, int paramInt2) {
    EditText editText = (EditText)findViewById(1057292289);
    if (editText != null) {
      int j = editText.getText().length();
      paramInt2 += paramInt1;
      if (j >= paramInt2)
        editText.setSelection(paramInt1, paramInt2); 
    } 
  }
  
  public final void a(String paramString) {
    EditText editText = (EditText)findViewById(1057292289);
    if (editText != null) {
      editText.setText(paramString);
      editText.setSelection(paramString.length());
    } 
  }
  
  public final void a(boolean paramBoolean) {
    EditText editText = (EditText)findViewById(1057292289);
    Button button = (Button)findViewById(1057292290);
    View view = findViewById(1057292291);
    if (paramBoolean) {
      editText.setBackgroundColor(0);
      editText.setTextColor(0);
      editText.setCursorVisible(false);
      editText.setHighlightColor(0);
      editText.setOnClickListener(this);
      editText.setLongClickable(false);
      editText.setTextIsSelectable(false);
      button.setTextColor(0);
      view.setBackgroundColor(0);
      view.setOnClickListener(this);
      return;
    } 
    editText.setBackgroundColor(e);
    editText.setTextColor(this.f);
    editText.setCursorVisible(true);
    editText.setOnClickListener(null);
    editText.setLongClickable(true);
    editText.setTextIsSelectable(true);
    button.setClickable(true);
    button.setTextColor(this.f);
    view.setBackgroundColor(e);
    view.setOnClickListener(null);
  }
  
  public final void afterTextChanged(Editable paramEditable) {
    this.c.reportSoftInputStr(paramEditable.toString(), 0, false);
    EditText editText = (EditText)findViewById(1057292289);
    int j = editText.getSelectionStart();
    int k = editText.getSelectionEnd();
    this.c.reportSoftInputSelection(j, k - j);
  }
  
  public final void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  protected final View createSoftInputView() {
    RelativeLayout relativeLayout = new RelativeLayout(this.b);
    relativeLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
    relativeLayout.setBackgroundColor(e);
    relativeLayout.setId(1057292291);
    EditText editText = new EditText(this, this.b) {
        final i a;
        
        public final boolean onKeyPreIme(int param1Int, KeyEvent param1KeyEvent) {
          i i1;
          if (param1Int == 4) {
            i1 = this.a;
            i.a(i1, i.b(i1), true);
            return true;
          } 
          return (param1Int == 84) ? true : super.onKeyPreIme(param1Int, (KeyEvent)i1);
        }
        
        protected final void onSelectionChanged(int param1Int1, int param1Int2) {
          i.a(this.a).reportSoftInputSelection(param1Int1, param1Int2 - param1Int1);
        }
        
        public final void onWindowFocusChanged(boolean param1Boolean) {
          super.onWindowFocusChanged(param1Boolean);
          if (param1Boolean)
            ((InputMethodManager)i.c(this.a).getSystemService("input_method")).showSoftInput((View)this, 0); 
        }
      };
    RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
    layoutParams.addRule(15);
    layoutParams.addRule(0, 1057292290);
    editText.setLayoutParams((ViewGroup.LayoutParams)layoutParams);
    editText.setId(1057292289);
    relativeLayout.addView((View)editText);
    Button button = new Button(this.b);
    button.setText(this.b.getResources().getIdentifier("ok", "string", "android"));
    layoutParams = new RelativeLayout.LayoutParams(-2, -2);
    layoutParams.addRule(15);
    layoutParams.addRule(11);
    button.setLayoutParams((ViewGroup.LayoutParams)layoutParams);
    button.setId(1057292290);
    button.setBackgroundColor(0);
    relativeLayout.addView((View)button);
    ((EditText)relativeLayout.findViewById(1057292289)).setOnEditorActionListener(new TextView.OnEditorActionListener(this) {
          final i a;
          
          public final boolean onEditorAction(TextView param1TextView, int param1Int, KeyEvent param1KeyEvent) {
            if (param1Int == 6) {
              i i1 = this.a;
              i.a(i1, i.b(i1), false);
            } 
            return false;
          }
        });
    relativeLayout.setPadding(16, 16, 16, 16);
    return (View)relativeLayout;
  }
  
  public final boolean dispatchTouchEvent(MotionEvent paramMotionEvent) {
    return (!this.a && paramMotionEvent.getAction() == 4) ? true : super.dispatchTouchEvent(paramMotionEvent);
  }
  
  public final void onBackPressed() {
    a(b(), true);
  }
  
  public final void onClick(View paramView) {
    a(b(), false);
  }
  
  public final void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}


/* Location:              E:\PirahusAndroid2211\classes-dex2jar.jar!\co\\unity3d\player\i.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.1.3
 */