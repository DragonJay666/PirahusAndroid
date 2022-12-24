//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Naninovel/FX/DepthOfField" {
Properties {
_MainTex ("", 2D) = "" { }
_BlurTex ("", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 46645
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Distance;
uniform 	float _LensCoeff;
uniform 	mediump float _MaxCoC;
uniform 	mediump float _RcpMaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat14;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat0.zw).x;
    u_xlat14 = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat14) + u_xlat0.x;
    u_xlat1.x = unity_OrthoParams.w * u_xlat0.x + u_xlat14;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.y = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat2.zw).x;
    u_xlat14 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat14 = u_xlat21 * u_xlat14 + _ProjectionParams.y;
    u_xlat14 = (-u_xlat0.x) + u_xlat14;
    u_xlat1.z = unity_OrthoParams.w * u_xlat14 + u_xlat0.x;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.w = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat0 = u_xlat1 + (-vec4(_Distance));
    u_xlat0 = u_xlat0 * vec4(vec4(_LensCoeff, _LensCoeff, _LensCoeff, _LensCoeff));
    u_xlat0 = u_xlat0 / u_xlat1;
    u_xlat0 = max(u_xlat0, (-vec4(_MaxCoC)));
    u_xlat0 = min(u_xlat0, vec4(_MaxCoC));
    u_xlat1 = abs(u_xlat0) * vec4(vec4(_RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC));
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat0.w = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_4 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_4 = max(u_xlat16_3.x, u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 + 1.0;
    u_xlat16_4 = float(1.0) / u_xlat16_4;
    u_xlat4.y = u_xlat1.y * u_xlat16_4;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat16_5 = max(u_xlat16_2.z, u_xlat16_2.y);
    u_xlat16_5 = max(u_xlat16_2.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.x = u_xlat1.x * u_xlat16_5;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xxx + u_xlat3.xyz;
    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat16_5 = max(u_xlat16_6.z, u_xlat16_6.y);
    u_xlat16_5 = max(u_xlat16_5, u_xlat16_6.x);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.z = u_xlat1.z * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat4.zzz + u_xlat2.xyz;
    u_xlat16_5 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_5 = max(u_xlat16_3.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.w = u_xlat1.w * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat4.www + u_xlat1.xyz;
    u_xlat22 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat22);
    u_xlat22 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = abs(u_xlat0.w) * u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat2.x = u_xlat22 * -2.0 + 3.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0 = u_xlat0;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Distance;
uniform 	float _LensCoeff;
uniform 	mediump float _MaxCoC;
uniform 	mediump float _RcpMaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat14;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat0.zw).x;
    u_xlat14 = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat14) + u_xlat0.x;
    u_xlat1.x = unity_OrthoParams.w * u_xlat0.x + u_xlat14;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.y = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat2.zw).x;
    u_xlat14 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat14 = u_xlat21 * u_xlat14 + _ProjectionParams.y;
    u_xlat14 = (-u_xlat0.x) + u_xlat14;
    u_xlat1.z = unity_OrthoParams.w * u_xlat14 + u_xlat0.x;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.w = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat0 = u_xlat1 + (-vec4(_Distance));
    u_xlat0 = u_xlat0 * vec4(vec4(_LensCoeff, _LensCoeff, _LensCoeff, _LensCoeff));
    u_xlat0 = u_xlat0 / u_xlat1;
    u_xlat0 = max(u_xlat0, (-vec4(_MaxCoC)));
    u_xlat0 = min(u_xlat0, vec4(_MaxCoC));
    u_xlat1 = abs(u_xlat0) * vec4(vec4(_RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC));
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat0.w = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_4 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_4 = max(u_xlat16_3.x, u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 + 1.0;
    u_xlat16_4 = float(1.0) / u_xlat16_4;
    u_xlat4.y = u_xlat1.y * u_xlat16_4;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat16_5 = max(u_xlat16_2.z, u_xlat16_2.y);
    u_xlat16_5 = max(u_xlat16_2.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.x = u_xlat1.x * u_xlat16_5;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xxx + u_xlat3.xyz;
    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat16_5 = max(u_xlat16_6.z, u_xlat16_6.y);
    u_xlat16_5 = max(u_xlat16_5, u_xlat16_6.x);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.z = u_xlat1.z * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat4.zzz + u_xlat2.xyz;
    u_xlat16_5 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_5 = max(u_xlat16_3.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.w = u_xlat1.w * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat4.www + u_xlat1.xyz;
    u_xlat22 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat22);
    u_xlat22 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = abs(u_xlat0.w) * u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat2.x = u_xlat22 * -2.0 + 3.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0 = u_xlat0;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Distance;
uniform 	float _LensCoeff;
uniform 	mediump float _MaxCoC;
uniform 	mediump float _RcpMaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat14;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat0.zw).x;
    u_xlat14 = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat14) + u_xlat0.x;
    u_xlat1.x = unity_OrthoParams.w * u_xlat0.x + u_xlat14;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.y = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat2.zw).x;
    u_xlat14 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat14 = u_xlat21 * u_xlat14 + _ProjectionParams.y;
    u_xlat14 = (-u_xlat0.x) + u_xlat14;
    u_xlat1.z = unity_OrthoParams.w * u_xlat14 + u_xlat0.x;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.w = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat0 = u_xlat1 + (-vec4(_Distance));
    u_xlat0 = u_xlat0 * vec4(vec4(_LensCoeff, _LensCoeff, _LensCoeff, _LensCoeff));
    u_xlat0 = u_xlat0 / u_xlat1;
    u_xlat0 = max(u_xlat0, (-vec4(_MaxCoC)));
    u_xlat0 = min(u_xlat0, vec4(_MaxCoC));
    u_xlat1 = abs(u_xlat0) * vec4(vec4(_RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC));
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat0.w = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_4 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_4 = max(u_xlat16_3.x, u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 + 1.0;
    u_xlat16_4 = float(1.0) / u_xlat16_4;
    u_xlat4.y = u_xlat1.y * u_xlat16_4;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat16_5 = max(u_xlat16_2.z, u_xlat16_2.y);
    u_xlat16_5 = max(u_xlat16_2.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.x = u_xlat1.x * u_xlat16_5;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xxx + u_xlat3.xyz;
    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat16_5 = max(u_xlat16_6.z, u_xlat16_6.y);
    u_xlat16_5 = max(u_xlat16_5, u_xlat16_6.x);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.z = u_xlat1.z * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat4.zzz + u_xlat2.xyz;
    u_xlat16_5 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_5 = max(u_xlat16_3.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.w = u_xlat1.w * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat4.www + u_xlat1.xyz;
    u_xlat22 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat22);
    u_xlat22 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = abs(u_xlat0.w) * u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat2.x = u_xlat22 * -2.0 + 3.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0 = u_xlat0;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Distance;
uniform 	float _LensCoeff;
uniform 	mediump float _MaxCoC;
uniform 	mediump float _RcpMaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat14;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat0.zw).x;
    u_xlat14 = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat14) + u_xlat0.x;
    u_xlat1.x = unity_OrthoParams.w * u_xlat0.x + u_xlat14;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.y = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat2.zw).x;
    u_xlat14 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat14 = u_xlat21 * u_xlat14 + _ProjectionParams.y;
    u_xlat14 = (-u_xlat0.x) + u_xlat14;
    u_xlat1.z = unity_OrthoParams.w * u_xlat14 + u_xlat0.x;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.w = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat0 = u_xlat1 + (-vec4(_Distance));
    u_xlat0 = u_xlat0 * vec4(vec4(_LensCoeff, _LensCoeff, _LensCoeff, _LensCoeff));
    u_xlat0 = u_xlat0 / u_xlat1;
    u_xlat0 = max(u_xlat0, (-vec4(_MaxCoC)));
    u_xlat0 = min(u_xlat0, vec4(_MaxCoC));
    u_xlat1 = abs(u_xlat0) * vec4(vec4(_RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC));
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat0.w = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_4 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_4 = max(u_xlat16_3.x, u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 + 1.0;
    u_xlat16_4 = float(1.0) / u_xlat16_4;
    u_xlat4.y = u_xlat1.y * u_xlat16_4;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat16_5 = max(u_xlat16_2.z, u_xlat16_2.y);
    u_xlat16_5 = max(u_xlat16_2.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.x = u_xlat1.x * u_xlat16_5;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xxx + u_xlat3.xyz;
    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat16_5 = max(u_xlat16_6.z, u_xlat16_6.y);
    u_xlat16_5 = max(u_xlat16_5, u_xlat16_6.x);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.z = u_xlat1.z * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat4.zzz + u_xlat2.xyz;
    u_xlat16_5 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_5 = max(u_xlat16_3.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.w = u_xlat1.w * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat4.www + u_xlat1.xyz;
    u_xlat22 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat22);
    u_xlat22 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = abs(u_xlat0.w) * u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat2.x = u_xlat22 * -2.0 + 3.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Distance;
uniform 	float _LensCoeff;
uniform 	mediump float _MaxCoC;
uniform 	mediump float _RcpMaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat14;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat0.zw).x;
    u_xlat14 = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat14) + u_xlat0.x;
    u_xlat1.x = unity_OrthoParams.w * u_xlat0.x + u_xlat14;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.y = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat2.zw).x;
    u_xlat14 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat14 = u_xlat21 * u_xlat14 + _ProjectionParams.y;
    u_xlat14 = (-u_xlat0.x) + u_xlat14;
    u_xlat1.z = unity_OrthoParams.w * u_xlat14 + u_xlat0.x;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.w = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat0 = u_xlat1 + (-vec4(_Distance));
    u_xlat0 = u_xlat0 * vec4(vec4(_LensCoeff, _LensCoeff, _LensCoeff, _LensCoeff));
    u_xlat0 = u_xlat0 / u_xlat1;
    u_xlat0 = max(u_xlat0, (-vec4(_MaxCoC)));
    u_xlat0 = min(u_xlat0, vec4(_MaxCoC));
    u_xlat1 = abs(u_xlat0) * vec4(vec4(_RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC));
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat0.w = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_4 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_4 = max(u_xlat16_3.x, u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 + 1.0;
    u_xlat16_4 = float(1.0) / u_xlat16_4;
    u_xlat4.y = u_xlat1.y * u_xlat16_4;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat16_5 = max(u_xlat16_2.z, u_xlat16_2.y);
    u_xlat16_5 = max(u_xlat16_2.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.x = u_xlat1.x * u_xlat16_5;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xxx + u_xlat3.xyz;
    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat16_5 = max(u_xlat16_6.z, u_xlat16_6.y);
    u_xlat16_5 = max(u_xlat16_5, u_xlat16_6.x);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.z = u_xlat1.z * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat4.zzz + u_xlat2.xyz;
    u_xlat16_5 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_5 = max(u_xlat16_3.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.w = u_xlat1.w * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat4.www + u_xlat1.xyz;
    u_xlat22 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat22);
    u_xlat22 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = abs(u_xlat0.w) * u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat2.x = u_xlat22 * -2.0 + 3.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Distance;
uniform 	float _LensCoeff;
uniform 	mediump float _MaxCoC;
uniform 	mediump float _RcpMaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat14;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat0.zw).x;
    u_xlat14 = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat14) + u_xlat0.x;
    u_xlat1.x = unity_OrthoParams.w * u_xlat0.x + u_xlat14;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.y = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD1.xyxy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat7 = texture(_CameraDepthTexture, u_xlat2.zw).x;
    u_xlat14 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat14 = u_xlat21 * u_xlat14 + _ProjectionParams.y;
    u_xlat14 = (-u_xlat0.x) + u_xlat14;
    u_xlat1.z = unity_OrthoParams.w * u_xlat14 + u_xlat0.x;
    u_xlat0.x = (-u_xlat7) + 1.0;
    u_xlat7 = _ZBufferParams.z * u_xlat7 + _ZBufferParams.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat21 * u_xlat0.x + _ProjectionParams.y;
    u_xlat0.x = (-u_xlat7) + u_xlat0.x;
    u_xlat1.w = unity_OrthoParams.w * u_xlat0.x + u_xlat7;
    u_xlat0 = u_xlat1 + (-vec4(_Distance));
    u_xlat0 = u_xlat0 * vec4(vec4(_LensCoeff, _LensCoeff, _LensCoeff, _LensCoeff));
    u_xlat0 = u_xlat0 / u_xlat1;
    u_xlat0 = max(u_xlat0, (-vec4(_MaxCoC)));
    u_xlat0 = min(u_xlat0, vec4(_MaxCoC));
    u_xlat1 = abs(u_xlat0) * vec4(vec4(_RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC, _RcpMaxCoC));
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat0.w = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_4 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_4 = max(u_xlat16_3.x, u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 + 1.0;
    u_xlat16_4 = float(1.0) / u_xlat16_4;
    u_xlat4.y = u_xlat1.y * u_xlat16_4;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.yyy;
    u_xlat16_5 = max(u_xlat16_2.z, u_xlat16_2.y);
    u_xlat16_5 = max(u_xlat16_2.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.x = u_xlat1.x * u_xlat16_5;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat4.xxx + u_xlat3.xyz;
    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
    u_xlat16_5 = max(u_xlat16_6.z, u_xlat16_6.y);
    u_xlat16_5 = max(u_xlat16_5, u_xlat16_6.x);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.z = u_xlat1.z * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat4.zzz + u_xlat2.xyz;
    u_xlat16_5 = max(u_xlat16_3.z, u_xlat16_3.y);
    u_xlat16_5 = max(u_xlat16_3.x, u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 + 1.0;
    u_xlat16_5 = float(1.0) / u_xlat16_5;
    u_xlat4.w = u_xlat1.w * u_xlat16_5;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat4.www + u_xlat1.xyz;
    u_xlat22 = dot(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat22);
    u_xlat22 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = abs(u_xlat0.w) * u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat2.x = u_xlat22 * -2.0 + 3.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 124399
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.545454562,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.168554723,0.518758118,0.0,0.0);
ImmCB_0[3] = vec4(-0.441282034,0.320610106,0.0,0.0);
ImmCB_0[4] = vec4(-0.441281974,-0.320610195,0.0,0.0);
ImmCB_0[5] = vec4(0.168554798,-0.518758118,0.0,0.0);
ImmCB_0[6] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[7] = vec4(0.809017003,0.587785244,0.0,0.0);
ImmCB_0[8] = vec4(0.309016973,0.95105654,0.0,0.0);
ImmCB_0[9] = vec4(-0.309017032,0.95105648,0.0,0.0);
ImmCB_0[10] = vec4(-0.809017062,0.587785184,0.0,0.0);
ImmCB_0[11] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[12] = vec4(-0.809016943,-0.587785363,0.0,0.0);
ImmCB_0[13] = vec4(-0.309016645,-0.9510566,0.0,0.0);
ImmCB_0[14] = vec4(0.309017122,-0.95105648,0.0,0.0);
ImmCB_0[15] = vec4(0.809016943,-0.587785304,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<16 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.196349546;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.545454562,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.168554723,0.518758118,0.0,0.0);
ImmCB_0[3] = vec4(-0.441282034,0.320610106,0.0,0.0);
ImmCB_0[4] = vec4(-0.441281974,-0.320610195,0.0,0.0);
ImmCB_0[5] = vec4(0.168554798,-0.518758118,0.0,0.0);
ImmCB_0[6] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[7] = vec4(0.809017003,0.587785244,0.0,0.0);
ImmCB_0[8] = vec4(0.309016973,0.95105654,0.0,0.0);
ImmCB_0[9] = vec4(-0.309017032,0.95105648,0.0,0.0);
ImmCB_0[10] = vec4(-0.809017062,0.587785184,0.0,0.0);
ImmCB_0[11] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[12] = vec4(-0.809016943,-0.587785363,0.0,0.0);
ImmCB_0[13] = vec4(-0.309016645,-0.9510566,0.0,0.0);
ImmCB_0[14] = vec4(0.309017122,-0.95105648,0.0,0.0);
ImmCB_0[15] = vec4(0.809016943,-0.587785304,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<16 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.196349546;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.545454562,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.168554723,0.518758118,0.0,0.0);
ImmCB_0[3] = vec4(-0.441282034,0.320610106,0.0,0.0);
ImmCB_0[4] = vec4(-0.441281974,-0.320610195,0.0,0.0);
ImmCB_0[5] = vec4(0.168554798,-0.518758118,0.0,0.0);
ImmCB_0[6] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[7] = vec4(0.809017003,0.587785244,0.0,0.0);
ImmCB_0[8] = vec4(0.309016973,0.95105654,0.0,0.0);
ImmCB_0[9] = vec4(-0.309017032,0.95105648,0.0,0.0);
ImmCB_0[10] = vec4(-0.809017062,0.587785184,0.0,0.0);
ImmCB_0[11] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[12] = vec4(-0.809016943,-0.587785363,0.0,0.0);
ImmCB_0[13] = vec4(-0.309016645,-0.9510566,0.0,0.0);
ImmCB_0[14] = vec4(0.309017122,-0.95105648,0.0,0.0);
ImmCB_0[15] = vec4(0.809016943,-0.587785304,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<16 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.196349546;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 164694
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[22];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.533333361,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.332527906,0.41697681,0.0,0.0);
ImmCB_0[3] = vec4(-0.118677847,0.519961596,0.0,0.0);
ImmCB_0[4] = vec4(-0.480516732,0.231404707,0.0,0.0);
ImmCB_0[5] = vec4(-0.480516732,-0.231404677,0.0,0.0);
ImmCB_0[6] = vec4(-0.118677631,-0.519961655,0.0,0.0);
ImmCB_0[7] = vec4(0.332527846,-0.416976899,0.0,0.0);
ImmCB_0[8] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.90096885,0.433883756,0.0,0.0);
ImmCB_0[10] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[11] = vec4(0.222520977,0.974927902,0.0,0.0);
ImmCB_0[12] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[13] = vec4(-0.623489976,0.781831384,0.0,0.0);
ImmCB_0[14] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[15] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[17] = vec4(-0.623489618,-0.781831622,0.0,0.0);
ImmCB_0[18] = vec4(-0.222520545,-0.974928021,0.0,0.0);
ImmCB_0[19] = vec4(0.222521499,-0.974927783,0.0,0.0);
ImmCB_0[20] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[21] = vec4(0.90096885,-0.433883756,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<22 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.142799661;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[22];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.533333361,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.332527906,0.41697681,0.0,0.0);
ImmCB_0[3] = vec4(-0.118677847,0.519961596,0.0,0.0);
ImmCB_0[4] = vec4(-0.480516732,0.231404707,0.0,0.0);
ImmCB_0[5] = vec4(-0.480516732,-0.231404677,0.0,0.0);
ImmCB_0[6] = vec4(-0.118677631,-0.519961655,0.0,0.0);
ImmCB_0[7] = vec4(0.332527846,-0.416976899,0.0,0.0);
ImmCB_0[8] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.90096885,0.433883756,0.0,0.0);
ImmCB_0[10] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[11] = vec4(0.222520977,0.974927902,0.0,0.0);
ImmCB_0[12] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[13] = vec4(-0.623489976,0.781831384,0.0,0.0);
ImmCB_0[14] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[15] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[17] = vec4(-0.623489618,-0.781831622,0.0,0.0);
ImmCB_0[18] = vec4(-0.222520545,-0.974928021,0.0,0.0);
ImmCB_0[19] = vec4(0.222521499,-0.974927783,0.0,0.0);
ImmCB_0[20] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[21] = vec4(0.90096885,-0.433883756,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<22 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.142799661;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[22];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.533333361,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.332527906,0.41697681,0.0,0.0);
ImmCB_0[3] = vec4(-0.118677847,0.519961596,0.0,0.0);
ImmCB_0[4] = vec4(-0.480516732,0.231404707,0.0,0.0);
ImmCB_0[5] = vec4(-0.480516732,-0.231404677,0.0,0.0);
ImmCB_0[6] = vec4(-0.118677631,-0.519961655,0.0,0.0);
ImmCB_0[7] = vec4(0.332527846,-0.416976899,0.0,0.0);
ImmCB_0[8] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.90096885,0.433883756,0.0,0.0);
ImmCB_0[10] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[11] = vec4(0.222520977,0.974927902,0.0,0.0);
ImmCB_0[12] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[13] = vec4(-0.623489976,0.781831384,0.0,0.0);
ImmCB_0[14] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[15] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[17] = vec4(-0.623489618,-0.781831622,0.0,0.0);
ImmCB_0[18] = vec4(-0.222520545,-0.974928021,0.0,0.0);
ImmCB_0[19] = vec4(0.222521499,-0.974927783,0.0,0.0);
ImmCB_0[20] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[21] = vec4(0.90096885,-0.433883756,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<22 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.142799661;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 259431
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[43];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.363636374,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.226723567,0.284302384,0.0,0.0);
ImmCB_0[3] = vec4(-0.0809167102,0.354519248,0.0,0.0);
ImmCB_0[4] = vec4(-0.327625036,0.157775939,0.0,0.0);
ImmCB_0[5] = vec4(-0.327625036,-0.157775909,0.0,0.0);
ImmCB_0[6] = vec4(-0.0809165612,-0.354519278,0.0,0.0);
ImmCB_0[7] = vec4(0.226723522,-0.284302413,0.0,0.0);
ImmCB_0[8] = vec4(0.681818187,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.614296973,0.295829833,0.0,0.0);
ImmCB_0[10] = vec4(0.425106674,0.533066928,0.0,0.0);
ImmCB_0[11] = vec4(0.151718855,0.664723575,0.0,0.0);
ImmCB_0[12] = vec4(-0.151718825,0.664723575,0.0,0.0);
ImmCB_0[13] = vec4(-0.425106794,0.533066869,0.0,0.0);
ImmCB_0[14] = vec4(-0.614296973,0.295829862,0.0,0.0);
ImmCB_0[15] = vec4(-0.681818187,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.614296973,-0.295829833,0.0,0.0);
ImmCB_0[17] = vec4(-0.425106555,-0.533067048,0.0,0.0);
ImmCB_0[18] = vec4(-0.151718557,-0.664723635,0.0,0.0);
ImmCB_0[19] = vec4(0.151719198,-0.664723516,0.0,0.0);
ImmCB_0[20] = vec4(0.425106615,-0.533067048,0.0,0.0);
ImmCB_0[21] = vec4(0.614296973,-0.295829833,0.0,0.0);
ImmCB_0[22] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[23] = vec4(0.955572784,0.294755191,0.0,0.0);
ImmCB_0[24] = vec4(0.826238751,0.5633201,0.0,0.0);
ImmCB_0[25] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[26] = vec4(0.365340978,0.930873752,0.0,0.0);
ImmCB_0[27] = vec4(0.0747300014,0.997203827,0.0,0.0);
ImmCB_0[28] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[29] = vec4(-0.50000006,0.866025388,0.0,0.0);
ImmCB_0[30] = vec4(-0.733051956,0.680172682,0.0,0.0);
ImmCB_0[31] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[32] = vec4(-0.988830864,0.149042085,0.0,0.0);
ImmCB_0[33] = vec4(-0.988830805,-0.149042487,0.0,0.0);
ImmCB_0[34] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[35] = vec4(-0.733051836,-0.680172801,0.0,0.0);
ImmCB_0[36] = vec4(-0.499999911,-0.866025448,0.0,0.0);
ImmCB_0[37] = vec4(-0.222521007,-0.974927902,0.0,0.0);
ImmCB_0[38] = vec4(0.074730292,-0.997203767,0.0,0.0);
ImmCB_0[39] = vec4(0.365341485,-0.930873573,0.0,0.0);
ImmCB_0[40] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[41] = vec4(0.826238811,-0.563319981,0.0,0.0);
ImmCB_0[42] = vec4(0.955572903,-0.294754833,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<43 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.0730602965;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[43];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.363636374,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.226723567,0.284302384,0.0,0.0);
ImmCB_0[3] = vec4(-0.0809167102,0.354519248,0.0,0.0);
ImmCB_0[4] = vec4(-0.327625036,0.157775939,0.0,0.0);
ImmCB_0[5] = vec4(-0.327625036,-0.157775909,0.0,0.0);
ImmCB_0[6] = vec4(-0.0809165612,-0.354519278,0.0,0.0);
ImmCB_0[7] = vec4(0.226723522,-0.284302413,0.0,0.0);
ImmCB_0[8] = vec4(0.681818187,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.614296973,0.295829833,0.0,0.0);
ImmCB_0[10] = vec4(0.425106674,0.533066928,0.0,0.0);
ImmCB_0[11] = vec4(0.151718855,0.664723575,0.0,0.0);
ImmCB_0[12] = vec4(-0.151718825,0.664723575,0.0,0.0);
ImmCB_0[13] = vec4(-0.425106794,0.533066869,0.0,0.0);
ImmCB_0[14] = vec4(-0.614296973,0.295829862,0.0,0.0);
ImmCB_0[15] = vec4(-0.681818187,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.614296973,-0.295829833,0.0,0.0);
ImmCB_0[17] = vec4(-0.425106555,-0.533067048,0.0,0.0);
ImmCB_0[18] = vec4(-0.151718557,-0.664723635,0.0,0.0);
ImmCB_0[19] = vec4(0.151719198,-0.664723516,0.0,0.0);
ImmCB_0[20] = vec4(0.425106615,-0.533067048,0.0,0.0);
ImmCB_0[21] = vec4(0.614296973,-0.295829833,0.0,0.0);
ImmCB_0[22] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[23] = vec4(0.955572784,0.294755191,0.0,0.0);
ImmCB_0[24] = vec4(0.826238751,0.5633201,0.0,0.0);
ImmCB_0[25] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[26] = vec4(0.365340978,0.930873752,0.0,0.0);
ImmCB_0[27] = vec4(0.0747300014,0.997203827,0.0,0.0);
ImmCB_0[28] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[29] = vec4(-0.50000006,0.866025388,0.0,0.0);
ImmCB_0[30] = vec4(-0.733051956,0.680172682,0.0,0.0);
ImmCB_0[31] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[32] = vec4(-0.988830864,0.149042085,0.0,0.0);
ImmCB_0[33] = vec4(-0.988830805,-0.149042487,0.0,0.0);
ImmCB_0[34] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[35] = vec4(-0.733051836,-0.680172801,0.0,0.0);
ImmCB_0[36] = vec4(-0.499999911,-0.866025448,0.0,0.0);
ImmCB_0[37] = vec4(-0.222521007,-0.974927902,0.0,0.0);
ImmCB_0[38] = vec4(0.074730292,-0.997203767,0.0,0.0);
ImmCB_0[39] = vec4(0.365341485,-0.930873573,0.0,0.0);
ImmCB_0[40] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[41] = vec4(0.826238811,-0.563319981,0.0,0.0);
ImmCB_0[42] = vec4(0.955572903,-0.294754833,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<43 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.0730602965;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[43];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.363636374,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.226723567,0.284302384,0.0,0.0);
ImmCB_0[3] = vec4(-0.0809167102,0.354519248,0.0,0.0);
ImmCB_0[4] = vec4(-0.327625036,0.157775939,0.0,0.0);
ImmCB_0[5] = vec4(-0.327625036,-0.157775909,0.0,0.0);
ImmCB_0[6] = vec4(-0.0809165612,-0.354519278,0.0,0.0);
ImmCB_0[7] = vec4(0.226723522,-0.284302413,0.0,0.0);
ImmCB_0[8] = vec4(0.681818187,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.614296973,0.295829833,0.0,0.0);
ImmCB_0[10] = vec4(0.425106674,0.533066928,0.0,0.0);
ImmCB_0[11] = vec4(0.151718855,0.664723575,0.0,0.0);
ImmCB_0[12] = vec4(-0.151718825,0.664723575,0.0,0.0);
ImmCB_0[13] = vec4(-0.425106794,0.533066869,0.0,0.0);
ImmCB_0[14] = vec4(-0.614296973,0.295829862,0.0,0.0);
ImmCB_0[15] = vec4(-0.681818187,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.614296973,-0.295829833,0.0,0.0);
ImmCB_0[17] = vec4(-0.425106555,-0.533067048,0.0,0.0);
ImmCB_0[18] = vec4(-0.151718557,-0.664723635,0.0,0.0);
ImmCB_0[19] = vec4(0.151719198,-0.664723516,0.0,0.0);
ImmCB_0[20] = vec4(0.425106615,-0.533067048,0.0,0.0);
ImmCB_0[21] = vec4(0.614296973,-0.295829833,0.0,0.0);
ImmCB_0[22] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[23] = vec4(0.955572784,0.294755191,0.0,0.0);
ImmCB_0[24] = vec4(0.826238751,0.5633201,0.0,0.0);
ImmCB_0[25] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[26] = vec4(0.365340978,0.930873752,0.0,0.0);
ImmCB_0[27] = vec4(0.0747300014,0.997203827,0.0,0.0);
ImmCB_0[28] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[29] = vec4(-0.50000006,0.866025388,0.0,0.0);
ImmCB_0[30] = vec4(-0.733051956,0.680172682,0.0,0.0);
ImmCB_0[31] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[32] = vec4(-0.988830864,0.149042085,0.0,0.0);
ImmCB_0[33] = vec4(-0.988830805,-0.149042487,0.0,0.0);
ImmCB_0[34] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[35] = vec4(-0.733051836,-0.680172801,0.0,0.0);
ImmCB_0[36] = vec4(-0.499999911,-0.866025448,0.0,0.0);
ImmCB_0[37] = vec4(-0.222521007,-0.974927902,0.0,0.0);
ImmCB_0[38] = vec4(0.074730292,-0.997203767,0.0,0.0);
ImmCB_0[39] = vec4(0.365341485,-0.930873573,0.0,0.0);
ImmCB_0[40] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[41] = vec4(0.826238811,-0.563319981,0.0,0.0);
ImmCB_0[42] = vec4(0.955572903,-0.294754833,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<43 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.0730602965;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 306104
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[71];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.275862098,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.171997204,0.215677679,0.0,0.0);
ImmCB_0[3] = vec4(-0.0613850951,0.268945664,0.0,0.0);
ImmCB_0[4] = vec4(-0.248543158,0.119692102,0.0,0.0);
ImmCB_0[5] = vec4(-0.248543158,-0.11969208,0.0,0.0);
ImmCB_0[6] = vec4(-0.0613849834,-0.268945694,0.0,0.0);
ImmCB_0[7] = vec4(0.171997175,-0.215677708,0.0,0.0);
ImmCB_0[8] = vec4(0.517241359,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.466018349,0.224422619,0.0,0.0);
ImmCB_0[10] = vec4(0.322494715,0.40439558,0.0,0.0);
ImmCB_0[11] = vec4(0.115097053,0.504273057,0.0,0.0);
ImmCB_0[12] = vec4(-0.115097038,0.504273057,0.0,0.0);
ImmCB_0[13] = vec4(-0.322494805,0.404395521,0.0,0.0);
ImmCB_0[14] = vec4(-0.466018349,0.224422649,0.0,0.0);
ImmCB_0[15] = vec4(-0.517241359,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.466018349,-0.224422619,0.0,0.0);
ImmCB_0[17] = vec4(-0.322494626,-0.40439564,0.0,0.0);
ImmCB_0[18] = vec4(-0.11509683,-0.504273117,0.0,0.0);
ImmCB_0[19] = vec4(0.115097322,-0.504272997,0.0,0.0);
ImmCB_0[20] = vec4(0.322494656,-0.40439564,0.0,0.0);
ImmCB_0[21] = vec4(0.466018349,-0.224422619,0.0,0.0);
ImmCB_0[22] = vec4(0.758620679,0.0,0.0,0.0);
ImmCB_0[23] = vec4(0.724917293,0.223607376,0.0,0.0);
ImmCB_0[24] = vec4(0.626801789,0.427346289,0.0,0.0);
ImmCB_0[25] = vec4(0.472992241,0.593113542,0.0,0.0);
ImmCB_0[26] = vec4(0.277155221,0.706180096,0.0,0.0);
ImmCB_0[27] = vec4(0.0566917248,0.756499469,0.0,0.0);
ImmCB_0[28] = vec4(-0.168808997,0.73960048,0.0,0.0);
ImmCB_0[29] = vec4(-0.379310399,0.656984746,0.0,0.0);
ImmCB_0[30] = vec4(-0.556108356,0.515993059,0.0,0.0);
ImmCB_0[31] = vec4(-0.683493614,0.32915324,0.0,0.0);
ImmCB_0[32] = vec4(-0.750147521,0.113066405,0.0,0.0);
ImmCB_0[33] = vec4(-0.750147521,-0.113066711,0.0,0.0);
ImmCB_0[34] = vec4(-0.683493614,-0.32915318,0.0,0.0);
ImmCB_0[35] = vec4(-0.556108296,-0.515993178,0.0,0.0);
ImmCB_0[36] = vec4(-0.37931028,-0.656984806,0.0,0.0);
ImmCB_0[37] = vec4(-0.168809041,-0.73960048,0.0,0.0);
ImmCB_0[38] = vec4(0.0566919446,-0.75649941,0.0,0.0);
ImmCB_0[39] = vec4(0.277155608,-0.706179917,0.0,0.0);
ImmCB_0[40] = vec4(0.472992152,-0.593113661,0.0,0.0);
ImmCB_0[41] = vec4(0.626801848,-0.4273462,0.0,0.0);
ImmCB_0[42] = vec4(0.724917352,-0.223607108,0.0,0.0);
ImmCB_0[43] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[44] = vec4(0.974927902,0.222520933,0.0,0.0);
ImmCB_0[45] = vec4(0.90096885,0.433883756,0.0,0.0);
ImmCB_0[46] = vec4(0.781831503,0.623489797,0.0,0.0);
ImmCB_0[47] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[48] = vec4(0.433883637,0.900968909,0.0,0.0);
ImmCB_0[49] = vec4(0.222520977,0.974927902,0.0,0.0);
ImmCB_0[50] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[51] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[52] = vec4(-0.433883846,0.90096885,0.0,0.0);
ImmCB_0[53] = vec4(-0.623489976,0.781831384,0.0,0.0);
ImmCB_0[54] = vec4(-0.781831682,0.623489559,0.0,0.0);
ImmCB_0[55] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[56] = vec4(-0.974927902,0.222520933,0.0,0.0);
ImmCB_0[57] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[58] = vec4(-0.974927902,-0.222520873,0.0,0.0);
ImmCB_0[59] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[60] = vec4(-0.781831384,-0.623489916,0.0,0.0);
ImmCB_0[61] = vec4(-0.623489618,-0.781831622,0.0,0.0);
ImmCB_0[62] = vec4(-0.433883458,-0.900969028,0.0,0.0);
ImmCB_0[63] = vec4(-0.222520545,-0.974928021,0.0,0.0);
ImmCB_0[64] = vec4(0.0,-1.0,0.0,0.0);
ImmCB_0[65] = vec4(0.222521499,-0.974927783,0.0,0.0);
ImmCB_0[66] = vec4(0.433883488,-0.900968969,0.0,0.0);
ImmCB_0[67] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[68] = vec4(0.781831443,-0.623489857,0.0,0.0);
ImmCB_0[69] = vec4(0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[70] = vec4(0.974927902,-0.222520858,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<71 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.0442477837;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[71];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.275862098,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.171997204,0.215677679,0.0,0.0);
ImmCB_0[3] = vec4(-0.0613850951,0.268945664,0.0,0.0);
ImmCB_0[4] = vec4(-0.248543158,0.119692102,0.0,0.0);
ImmCB_0[5] = vec4(-0.248543158,-0.11969208,0.0,0.0);
ImmCB_0[6] = vec4(-0.0613849834,-0.268945694,0.0,0.0);
ImmCB_0[7] = vec4(0.171997175,-0.215677708,0.0,0.0);
ImmCB_0[8] = vec4(0.517241359,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.466018349,0.224422619,0.0,0.0);
ImmCB_0[10] = vec4(0.322494715,0.40439558,0.0,0.0);
ImmCB_0[11] = vec4(0.115097053,0.504273057,0.0,0.0);
ImmCB_0[12] = vec4(-0.115097038,0.504273057,0.0,0.0);
ImmCB_0[13] = vec4(-0.322494805,0.404395521,0.0,0.0);
ImmCB_0[14] = vec4(-0.466018349,0.224422649,0.0,0.0);
ImmCB_0[15] = vec4(-0.517241359,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.466018349,-0.224422619,0.0,0.0);
ImmCB_0[17] = vec4(-0.322494626,-0.40439564,0.0,0.0);
ImmCB_0[18] = vec4(-0.11509683,-0.504273117,0.0,0.0);
ImmCB_0[19] = vec4(0.115097322,-0.504272997,0.0,0.0);
ImmCB_0[20] = vec4(0.322494656,-0.40439564,0.0,0.0);
ImmCB_0[21] = vec4(0.466018349,-0.224422619,0.0,0.0);
ImmCB_0[22] = vec4(0.758620679,0.0,0.0,0.0);
ImmCB_0[23] = vec4(0.724917293,0.223607376,0.0,0.0);
ImmCB_0[24] = vec4(0.626801789,0.427346289,0.0,0.0);
ImmCB_0[25] = vec4(0.472992241,0.593113542,0.0,0.0);
ImmCB_0[26] = vec4(0.277155221,0.706180096,0.0,0.0);
ImmCB_0[27] = vec4(0.0566917248,0.756499469,0.0,0.0);
ImmCB_0[28] = vec4(-0.168808997,0.73960048,0.0,0.0);
ImmCB_0[29] = vec4(-0.379310399,0.656984746,0.0,0.0);
ImmCB_0[30] = vec4(-0.556108356,0.515993059,0.0,0.0);
ImmCB_0[31] = vec4(-0.683493614,0.32915324,0.0,0.0);
ImmCB_0[32] = vec4(-0.750147521,0.113066405,0.0,0.0);
ImmCB_0[33] = vec4(-0.750147521,-0.113066711,0.0,0.0);
ImmCB_0[34] = vec4(-0.683493614,-0.32915318,0.0,0.0);
ImmCB_0[35] = vec4(-0.556108296,-0.515993178,0.0,0.0);
ImmCB_0[36] = vec4(-0.37931028,-0.656984806,0.0,0.0);
ImmCB_0[37] = vec4(-0.168809041,-0.73960048,0.0,0.0);
ImmCB_0[38] = vec4(0.0566919446,-0.75649941,0.0,0.0);
ImmCB_0[39] = vec4(0.277155608,-0.706179917,0.0,0.0);
ImmCB_0[40] = vec4(0.472992152,-0.593113661,0.0,0.0);
ImmCB_0[41] = vec4(0.626801848,-0.4273462,0.0,0.0);
ImmCB_0[42] = vec4(0.724917352,-0.223607108,0.0,0.0);
ImmCB_0[43] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[44] = vec4(0.974927902,0.222520933,0.0,0.0);
ImmCB_0[45] = vec4(0.90096885,0.433883756,0.0,0.0);
ImmCB_0[46] = vec4(0.781831503,0.623489797,0.0,0.0);
ImmCB_0[47] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[48] = vec4(0.433883637,0.900968909,0.0,0.0);
ImmCB_0[49] = vec4(0.222520977,0.974927902,0.0,0.0);
ImmCB_0[50] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[51] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[52] = vec4(-0.433883846,0.90096885,0.0,0.0);
ImmCB_0[53] = vec4(-0.623489976,0.781831384,0.0,0.0);
ImmCB_0[54] = vec4(-0.781831682,0.623489559,0.0,0.0);
ImmCB_0[55] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[56] = vec4(-0.974927902,0.222520933,0.0,0.0);
ImmCB_0[57] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[58] = vec4(-0.974927902,-0.222520873,0.0,0.0);
ImmCB_0[59] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[60] = vec4(-0.781831384,-0.623489916,0.0,0.0);
ImmCB_0[61] = vec4(-0.623489618,-0.781831622,0.0,0.0);
ImmCB_0[62] = vec4(-0.433883458,-0.900969028,0.0,0.0);
ImmCB_0[63] = vec4(-0.222520545,-0.974928021,0.0,0.0);
ImmCB_0[64] = vec4(0.0,-1.0,0.0,0.0);
ImmCB_0[65] = vec4(0.222521499,-0.974927783,0.0,0.0);
ImmCB_0[66] = vec4(0.433883488,-0.900968969,0.0,0.0);
ImmCB_0[67] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[68] = vec4(0.781831443,-0.623489857,0.0,0.0);
ImmCB_0[69] = vec4(0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[70] = vec4(0.974927902,-0.222520858,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<71 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.0442477837;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
vec4 ImmCB_0[71];
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _RcpAspect;
uniform 	float _MaxCoC;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
int u_xlati12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.275862098,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.171997204,0.215677679,0.0,0.0);
ImmCB_0[3] = vec4(-0.0613850951,0.268945664,0.0,0.0);
ImmCB_0[4] = vec4(-0.248543158,0.119692102,0.0,0.0);
ImmCB_0[5] = vec4(-0.248543158,-0.11969208,0.0,0.0);
ImmCB_0[6] = vec4(-0.0613849834,-0.268945694,0.0,0.0);
ImmCB_0[7] = vec4(0.171997175,-0.215677708,0.0,0.0);
ImmCB_0[8] = vec4(0.517241359,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.466018349,0.224422619,0.0,0.0);
ImmCB_0[10] = vec4(0.322494715,0.40439558,0.0,0.0);
ImmCB_0[11] = vec4(0.115097053,0.504273057,0.0,0.0);
ImmCB_0[12] = vec4(-0.115097038,0.504273057,0.0,0.0);
ImmCB_0[13] = vec4(-0.322494805,0.404395521,0.0,0.0);
ImmCB_0[14] = vec4(-0.466018349,0.224422649,0.0,0.0);
ImmCB_0[15] = vec4(-0.517241359,0.0,0.0,0.0);
ImmCB_0[16] = vec4(-0.466018349,-0.224422619,0.0,0.0);
ImmCB_0[17] = vec4(-0.322494626,-0.40439564,0.0,0.0);
ImmCB_0[18] = vec4(-0.11509683,-0.504273117,0.0,0.0);
ImmCB_0[19] = vec4(0.115097322,-0.504272997,0.0,0.0);
ImmCB_0[20] = vec4(0.322494656,-0.40439564,0.0,0.0);
ImmCB_0[21] = vec4(0.466018349,-0.224422619,0.0,0.0);
ImmCB_0[22] = vec4(0.758620679,0.0,0.0,0.0);
ImmCB_0[23] = vec4(0.724917293,0.223607376,0.0,0.0);
ImmCB_0[24] = vec4(0.626801789,0.427346289,0.0,0.0);
ImmCB_0[25] = vec4(0.472992241,0.593113542,0.0,0.0);
ImmCB_0[26] = vec4(0.277155221,0.706180096,0.0,0.0);
ImmCB_0[27] = vec4(0.0566917248,0.756499469,0.0,0.0);
ImmCB_0[28] = vec4(-0.168808997,0.73960048,0.0,0.0);
ImmCB_0[29] = vec4(-0.379310399,0.656984746,0.0,0.0);
ImmCB_0[30] = vec4(-0.556108356,0.515993059,0.0,0.0);
ImmCB_0[31] = vec4(-0.683493614,0.32915324,0.0,0.0);
ImmCB_0[32] = vec4(-0.750147521,0.113066405,0.0,0.0);
ImmCB_0[33] = vec4(-0.750147521,-0.113066711,0.0,0.0);
ImmCB_0[34] = vec4(-0.683493614,-0.32915318,0.0,0.0);
ImmCB_0[35] = vec4(-0.556108296,-0.515993178,0.0,0.0);
ImmCB_0[36] = vec4(-0.37931028,-0.656984806,0.0,0.0);
ImmCB_0[37] = vec4(-0.168809041,-0.73960048,0.0,0.0);
ImmCB_0[38] = vec4(0.0566919446,-0.75649941,0.0,0.0);
ImmCB_0[39] = vec4(0.277155608,-0.706179917,0.0,0.0);
ImmCB_0[40] = vec4(0.472992152,-0.593113661,0.0,0.0);
ImmCB_0[41] = vec4(0.626801848,-0.4273462,0.0,0.0);
ImmCB_0[42] = vec4(0.724917352,-0.223607108,0.0,0.0);
ImmCB_0[43] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[44] = vec4(0.974927902,0.222520933,0.0,0.0);
ImmCB_0[45] = vec4(0.90096885,0.433883756,0.0,0.0);
ImmCB_0[46] = vec4(0.781831503,0.623489797,0.0,0.0);
ImmCB_0[47] = vec4(0.623489797,0.781831503,0.0,0.0);
ImmCB_0[48] = vec4(0.433883637,0.900968909,0.0,0.0);
ImmCB_0[49] = vec4(0.222520977,0.974927902,0.0,0.0);
ImmCB_0[50] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[51] = vec4(-0.222520947,0.974927902,0.0,0.0);
ImmCB_0[52] = vec4(-0.433883846,0.90096885,0.0,0.0);
ImmCB_0[53] = vec4(-0.623489976,0.781831384,0.0,0.0);
ImmCB_0[54] = vec4(-0.781831682,0.623489559,0.0,0.0);
ImmCB_0[55] = vec4(-0.90096885,0.433883816,0.0,0.0);
ImmCB_0[56] = vec4(-0.974927902,0.222520933,0.0,0.0);
ImmCB_0[57] = vec4(-1.0,0.0,0.0,0.0);
ImmCB_0[58] = vec4(-0.974927902,-0.222520873,0.0,0.0);
ImmCB_0[59] = vec4(-0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[60] = vec4(-0.781831384,-0.623489916,0.0,0.0);
ImmCB_0[61] = vec4(-0.623489618,-0.781831622,0.0,0.0);
ImmCB_0[62] = vec4(-0.433883458,-0.900969028,0.0,0.0);
ImmCB_0[63] = vec4(-0.222520545,-0.974928021,0.0,0.0);
ImmCB_0[64] = vec4(0.0,-1.0,0.0,0.0);
ImmCB_0[65] = vec4(0.222521499,-0.974927783,0.0,0.0);
ImmCB_0[66] = vec4(0.433883488,-0.900968969,0.0,0.0);
ImmCB_0[67] = vec4(0.623489678,-0.781831622,0.0,0.0);
ImmCB_0[68] = vec4(0.781831443,-0.623489857,0.0,0.0);
ImmCB_0[69] = vec4(0.90096885,-0.433883756,0.0,0.0);
ImmCB_0[70] = vec4(0.974927902,-0.222520858,0.0,0.0);
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = _MainTex_TexelSize.y + _MainTex_TexelSize.y;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_1.w = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_2.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<71 ; u_xlati_loop_1++)
    {
        u_xlat3.yz = vec2(vec2(_MaxCoC, _MaxCoC)) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat18 = dot(u_xlat3.yz, u_xlat3.yz);
        u_xlat18 = sqrt(u_xlat18);
        u_xlat3.x = u_xlat3.y * _RcpAspect;
        u_xlat3.xy = u_xlat3.xz + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4.x = min(u_xlat16_0, u_xlat16_3.w);
        u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
        u_xlat5 = (-u_xlat18) + u_xlat16_4.x;
        u_xlat5 = _MainTex_TexelSize.y * 2.0 + u_xlat5;
        u_xlat22 = u_xlat5 / u_xlat6;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + (-u_xlat16_3.w);
        u_xlat18 = _MainTex_TexelSize.y * 2.0 + u_xlat18;
        u_xlat18 = u_xlat18 / u_xlat6;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlatb21 = (-u_xlat16_3.w)>=_MainTex_TexelSize.y;
        u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
        u_xlat23 = u_xlat18 * u_xlat21;
        u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat22);
        u_xlat16_4.w = u_xlat22;
        u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(u_xlat23);
        u_xlat16_5.w = u_xlat23;
        u_xlat16_2 = u_xlat16_5 + u_xlat16_2;
    }
    u_xlatb6 = u_xlat16_1.w==0.0;
    u_xlat16_4.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_1.w + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_1.xyz / vec3(u_xlat16_19);
    u_xlatb6 = u_xlat16_2.w==0.0;
    u_xlat16_19 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_19 = u_xlat16_19 + u_xlat16_2.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_19);
    u_xlat0 = u_xlat16_0 + (-_MainTex_TexelSize.y);
    u_xlat6 = float(1.0) / _MainTex_TexelSize.y;
    u_xlat0 = u_xlat6 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat6 = u_xlat16_2.w * 0.0442477837;
    u_xlat16_19 = min(u_xlat0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19);
    u_xlat16_20 = min(u_xlat6, 1.0);
    u_xlat16_1.xyz = (-vec3(u_xlat16_19)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = (-u_xlat16_19) + 1.0;
    u_xlat16_7 = (-u_xlat16_20) + 1.0;
    SV_Target0.w = u_xlat16_7 * u_xlat16_1.x;
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 351705
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyyy) * vec4(1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_1;
    u_xlat1.xy = (-_MainTex_TexelSize.xy) * vec2(-1.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0 = u_xlat0 + u_xlat16_1;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat16_2 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_2 * vec4(4.0, 4.0, 4.0, 4.0) + u_xlat0;
    u_xlat0 = u_xlat16_1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat1 = _MainTex_TexelSize.xyyy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat0 + u_xlat16_2;
    u_xlat0 = u_xlat16_1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(1.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0 = u_xlat0 + u_xlat16_1;
    SV_Target0 = u_xlat0 * vec4(0.0625, 0.0625, 0.0625, 0.0625);
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyyy) * vec4(1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_1;
    u_xlat1.xy = (-_MainTex_TexelSize.xy) * vec2(-1.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0 = u_xlat0 + u_xlat16_1;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat16_2 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_2 * vec4(4.0, 4.0, 4.0, 4.0) + u_xlat0;
    u_xlat0 = u_xlat16_1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat1 = _MainTex_TexelSize.xyyy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat0 + u_xlat16_2;
    u_xlat0 = u_xlat16_1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(1.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0 = u_xlat0 + u_xlat16_1;
    SV_Target0 = u_xlat0 * vec4(0.0625, 0.0625, 0.0625, 0.0625);
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0 = (-_MainTex_TexelSize.xyyy) * vec4(1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = u_xlat16_0 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_1;
    u_xlat1.xy = (-_MainTex_TexelSize.xy) * vec2(-1.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0 = u_xlat0 + u_xlat16_1;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat16_2 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_2 * vec4(4.0, 4.0, 4.0, 4.0) + u_xlat0;
    u_xlat0 = u_xlat16_1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat1 = _MainTex_TexelSize.xyyy * vec4(-1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat0 + u_xlat16_2;
    u_xlat0 = u_xlat16_1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat0;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(1.0, 1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0 = u_xlat0 + u_xlat16_1;
    SV_Target0 = u_xlat0 * vec4(0.0625, 0.0625, 0.0625, 0.0625);
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 423406
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlurTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2 = texture(_BlurTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_2.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlurTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2 = texture(_BlurTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_2.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlurTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2 = texture(_BlurTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_2.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlurTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2 = texture(_BlurTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_2.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlurTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2 = texture(_BlurTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_2.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
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
    phase0_Output0_1 = in_TEXCOORD0.xyxy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlurTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2 = texture(_BlurTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_2.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
}