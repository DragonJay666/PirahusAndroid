//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Naninovel/FX/Digital Glitch" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_GlitchTex ("Glitch Texture", 2D) = "white" { }
_Intensity ("Glitch Intensity", Range(0.5, 2)) = 1
_ColorTint ("Color Tint", Color) = (0.2,0.2,0,0)
_BurnColors ("Burn Colors", Range(0, 1)) = 1
_DodgeColors ("Dodge Colors", Range(0, 1)) = 0
_PerformUVShifting ("Perform UV Shifting", Range(0, 1)) = 1
_PerformColorShifting ("Perform Color Shifting", Range(0, 1)) = 1
_PerformScreenShifting ("Perform Screen Shifting", Range(0, 1)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 1023
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	mediump vec4 _GlitchTex_ST;
uniform 	float _Intensity;
uniform 	mediump vec4 _ColorTint;
uniform 	mediump float _BurnColors;
uniform 	mediump float _DodgeColors;
uniform 	mediump float _PerformUVShifting;
uniform 	mediump float _PerformColorShifting;
uniform 	mediump float _PerformScreenShifting;
uniform 	float filterRadius;
uniform 	float flipUp;
uniform 	float flipDown;
uniform 	float displace;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GlitchTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat12;
bool u_xlatb12;
bool u_xlatb18;
float u_xlat20;
void main()
{
    u_xlat0.xy = _Time.yz * vec2(_Intensity);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat6.x = cos(u_xlat0.y);
    u_xlat12 = filterRadius * 0.100000001 + abs(u_xlat0.x);
    u_xlat0.x = (-filterRadius) * 0.100000001 + abs(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD0.y;
    u_xlatb12 = vs_TEXCOORD0.y<u_xlat12;
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat12 = filterRadius * 0.100000001 + abs(u_xlat6.x);
    u_xlat6.x = (-filterRadius) * 0.100000001 + abs(u_xlat6.x);
    u_xlatb6 = u_xlat6.x<vs_TEXCOORD0.y;
    u_xlatb12 = vs_TEXCOORD0.y<u_xlat12;
    u_xlatb6 = u_xlatb6 && u_xlatb12;
    u_xlatb0 = u_xlatb6 || u_xlatb0;
    u_xlat6.x = vs_TEXCOORD0.y + flipUp;
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlatb12 = vs_TEXCOORD0.y<flipUp;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.y;
    u_xlat12 = u_xlat6.x + (-flipDown);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlatb18 = flipDown<u_xlat6.x;
    u_xlat1.y = (u_xlatb18) ? u_xlat12 : u_xlat6.x;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat6.xy = vec2(vec2(displace, displace)) * vec2(_Intensity) + u_xlat1.xy;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat6.xy : vs_TEXCOORD0.xy;
    u_xlat12 = _Intensity * filterRadius;
    u_xlat12 = u_xlat12 * 0.00999999978;
    u_xlat0.xy = vec2(_PerformScreenShifting) * vec2(u_xlat12) + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
    u_xlat16_0 = vec4(vec4(_PerformUVShifting, _PerformUVShifting, _PerformUVShifting, _PerformUVShifting)) * u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = _ColorTint + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_1 = u_xlat16_0 * u_xlat16_1 + (-u_xlat16_0);
    u_xlat16_0 = vec4(vec4(_PerformColorShifting, _PerformColorShifting, _PerformColorShifting, _PerformColorShifting)) * u_xlat16_1 + u_xlat16_0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GlitchTex_ST.xy + _GlitchTex_ST.zw;
    u_xlat16_1 = texture(_GlitchTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz / u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat20 = floor(abs(filterRadius));
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_4.xyz;
    u_xlat3.w = u_xlat16_1.w;
    u_xlat16_4 = (-u_xlat16_0) * u_xlat16_1 + u_xlat3;
    u_xlat16_5 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_4 = vec4(_BurnColors) * u_xlat16_4 + u_xlat16_5;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = (-u_xlat16_5.xyz) + abs(u_xlat16_5.xyz);
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat3;
    u_xlat16_1 = vec4(vec4(_DodgeColors, _DodgeColors, _DodgeColors, _DodgeColors)) * u_xlat16_1 + u_xlat16_4;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = vec4(vec4(_PerformColorShifting, _PerformColorShifting, _PerformColorShifting, _PerformColorShifting)) * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	mediump vec4 _GlitchTex_ST;
uniform 	float _Intensity;
uniform 	mediump vec4 _ColorTint;
uniform 	mediump float _BurnColors;
uniform 	mediump float _DodgeColors;
uniform 	mediump float _PerformUVShifting;
uniform 	mediump float _PerformColorShifting;
uniform 	mediump float _PerformScreenShifting;
uniform 	float filterRadius;
uniform 	float flipUp;
uniform 	float flipDown;
uniform 	float displace;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GlitchTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat12;
bool u_xlatb12;
bool u_xlatb18;
float u_xlat20;
void main()
{
    u_xlat0.xy = _Time.yz * vec2(_Intensity);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat6.x = cos(u_xlat0.y);
    u_xlat12 = filterRadius * 0.100000001 + abs(u_xlat0.x);
    u_xlat0.x = (-filterRadius) * 0.100000001 + abs(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD0.y;
    u_xlatb12 = vs_TEXCOORD0.y<u_xlat12;
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat12 = filterRadius * 0.100000001 + abs(u_xlat6.x);
    u_xlat6.x = (-filterRadius) * 0.100000001 + abs(u_xlat6.x);
    u_xlatb6 = u_xlat6.x<vs_TEXCOORD0.y;
    u_xlatb12 = vs_TEXCOORD0.y<u_xlat12;
    u_xlatb6 = u_xlatb6 && u_xlatb12;
    u_xlatb0 = u_xlatb6 || u_xlatb0;
    u_xlat6.x = vs_TEXCOORD0.y + flipUp;
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlatb12 = vs_TEXCOORD0.y<flipUp;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.y;
    u_xlat12 = u_xlat6.x + (-flipDown);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlatb18 = flipDown<u_xlat6.x;
    u_xlat1.y = (u_xlatb18) ? u_xlat12 : u_xlat6.x;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat6.xy = vec2(vec2(displace, displace)) * vec2(_Intensity) + u_xlat1.xy;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat6.xy : vs_TEXCOORD0.xy;
    u_xlat12 = _Intensity * filterRadius;
    u_xlat12 = u_xlat12 * 0.00999999978;
    u_xlat0.xy = vec2(_PerformScreenShifting) * vec2(u_xlat12) + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
    u_xlat16_0 = vec4(vec4(_PerformUVShifting, _PerformUVShifting, _PerformUVShifting, _PerformUVShifting)) * u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = _ColorTint + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_1 = u_xlat16_0 * u_xlat16_1 + (-u_xlat16_0);
    u_xlat16_0 = vec4(vec4(_PerformColorShifting, _PerformColorShifting, _PerformColorShifting, _PerformColorShifting)) * u_xlat16_1 + u_xlat16_0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GlitchTex_ST.xy + _GlitchTex_ST.zw;
    u_xlat16_1 = texture(_GlitchTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz / u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat20 = floor(abs(filterRadius));
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_4.xyz;
    u_xlat3.w = u_xlat16_1.w;
    u_xlat16_4 = (-u_xlat16_0) * u_xlat16_1 + u_xlat3;
    u_xlat16_5 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_4 = vec4(_BurnColors) * u_xlat16_4 + u_xlat16_5;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = (-u_xlat16_5.xyz) + abs(u_xlat16_5.xyz);
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat3;
    u_xlat16_1 = vec4(vec4(_DodgeColors, _DodgeColors, _DodgeColors, _DodgeColors)) * u_xlat16_1 + u_xlat16_4;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = vec4(vec4(_PerformColorShifting, _PerformColorShifting, _PerformColorShifting, _PerformColorShifting)) * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	mediump vec4 _GlitchTex_ST;
uniform 	float _Intensity;
uniform 	mediump vec4 _ColorTint;
uniform 	mediump float _BurnColors;
uniform 	mediump float _DodgeColors;
uniform 	mediump float _PerformUVShifting;
uniform 	mediump float _PerformColorShifting;
uniform 	mediump float _PerformScreenShifting;
uniform 	float filterRadius;
uniform 	float flipUp;
uniform 	float flipDown;
uniform 	float displace;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GlitchTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat12;
bool u_xlatb12;
bool u_xlatb18;
float u_xlat20;
void main()
{
    u_xlat0.xy = _Time.yz * vec2(_Intensity);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat6.x = cos(u_xlat0.y);
    u_xlat12 = filterRadius * 0.100000001 + abs(u_xlat0.x);
    u_xlat0.x = (-filterRadius) * 0.100000001 + abs(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD0.y;
    u_xlatb12 = vs_TEXCOORD0.y<u_xlat12;
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat12 = filterRadius * 0.100000001 + abs(u_xlat6.x);
    u_xlat6.x = (-filterRadius) * 0.100000001 + abs(u_xlat6.x);
    u_xlatb6 = u_xlat6.x<vs_TEXCOORD0.y;
    u_xlatb12 = vs_TEXCOORD0.y<u_xlat12;
    u_xlatb6 = u_xlatb6 && u_xlatb12;
    u_xlatb0 = u_xlatb6 || u_xlatb0;
    u_xlat6.x = vs_TEXCOORD0.y + flipUp;
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlatb12 = vs_TEXCOORD0.y<flipUp;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.y;
    u_xlat12 = u_xlat6.x + (-flipDown);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlatb18 = flipDown<u_xlat6.x;
    u_xlat1.y = (u_xlatb18) ? u_xlat12 : u_xlat6.x;
    u_xlat1.x = vs_TEXCOORD0.x;
    u_xlat6.xy = vec2(vec2(displace, displace)) * vec2(_Intensity) + u_xlat1.xy;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat6.xy : vs_TEXCOORD0.xy;
    u_xlat12 = _Intensity * filterRadius;
    u_xlat12 = u_xlat12 * 0.00999999978;
    u_xlat0.xy = vec2(_PerformScreenShifting) * vec2(u_xlat12) + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
    u_xlat16_0 = vec4(vec4(_PerformUVShifting, _PerformUVShifting, _PerformUVShifting, _PerformUVShifting)) * u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = _ColorTint + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_1 = u_xlat16_0 * u_xlat16_1 + (-u_xlat16_0);
    u_xlat16_0 = vec4(vec4(_PerformColorShifting, _PerformColorShifting, _PerformColorShifting, _PerformColorShifting)) * u_xlat16_1 + u_xlat16_0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GlitchTex_ST.xy + _GlitchTex_ST.zw;
    u_xlat16_1 = texture(_GlitchTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz / u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat20 = floor(abs(filterRadius));
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_4.xyz;
    u_xlat3.w = u_xlat16_1.w;
    u_xlat16_4 = (-u_xlat16_0) * u_xlat16_1 + u_xlat3;
    u_xlat16_5 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_4 = vec4(_BurnColors) * u_xlat16_4 + u_xlat16_5;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = (-u_xlat16_5.xyz) + abs(u_xlat16_5.xyz);
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat3;
    u_xlat16_1 = vec4(vec4(_DodgeColors, _DodgeColors, _DodgeColors, _DodgeColors)) * u_xlat16_1 + u_xlat16_4;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_1;
    SV_Target0 = vec4(vec4(_PerformColorShifting, _PerformColorShifting, _PerformColorShifting, _PerformColorShifting)) * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
}