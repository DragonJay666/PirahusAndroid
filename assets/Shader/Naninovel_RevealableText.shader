//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Naninovel/RevealableText" {
Properties {
_MainTex ("Font Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
_LineClipRect ("Lines Clip Rect", Vector) = (0,0,0,0)
_CharClipRect ("Characters Clip Rect", Vector) = (0,0,0,0)
_CharFadeWidth ("Characters Fade Width", Float) = 0
_CharSlantAngle ("Characters Slate Angle", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 41638
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _LineClipRect;
uniform 	vec4 _CharClipRect;
uniform 	float _CharFadeWidth;
uniform 	float _CharSlantAngle;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0 = (-_CharSlantAngle) * 0.0174532924 + 1.57079506;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat0 = u_xlat0 / u_xlat1.x;
    u_xlat2.x = vs_TEXCOORD1.y + (-_CharClipRect.y);
    u_xlat0 = u_xlat2.x / u_xlat0;
    u_xlat2.x = (-vs_TEXCOORD1.x) + _CharClipRect.x;
    u_xlat0 = u_xlat0 + u_xlat2.x;
    u_xlat0 = u_xlat0 / _CharFadeWidth;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _LineClipRect.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_LineClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.y + 1.0;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxy, _ClipRect.xyxy).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat1 * vs_COLOR0;
    u_xlat4.x = u_xlat4.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat2.x = u_xlat2.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat2.x;
    u_xlatb4.x = vs_TEXCOORD1.y<_CharClipRect.w;
    SV_Target0.w = (u_xlatb4.x) ? u_xlat0 : u_xlat2.x;
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _LineClipRect;
uniform 	vec4 _CharClipRect;
uniform 	float _CharFadeWidth;
uniform 	float _CharSlantAngle;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0 = (-_CharSlantAngle) * 0.0174532924 + 1.57079506;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat0 = u_xlat0 / u_xlat1.x;
    u_xlat2.x = vs_TEXCOORD1.y + (-_CharClipRect.y);
    u_xlat0 = u_xlat2.x / u_xlat0;
    u_xlat2.x = (-vs_TEXCOORD1.x) + _CharClipRect.x;
    u_xlat0 = u_xlat0 + u_xlat2.x;
    u_xlat0 = u_xlat0 / _CharFadeWidth;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _LineClipRect.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_LineClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.y + 1.0;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxy, _ClipRect.xyxy).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat1 * vs_COLOR0;
    u_xlat4.x = u_xlat4.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat2.x = u_xlat2.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat2.x;
    u_xlatb4.x = vs_TEXCOORD1.y<_CharClipRect.w;
    SV_Target0.w = (u_xlatb4.x) ? u_xlat0 : u_xlat2.x;
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _LineClipRect;
uniform 	vec4 _CharClipRect;
uniform 	float _CharFadeWidth;
uniform 	float _CharSlantAngle;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0 = (-_CharSlantAngle) * 0.0174532924 + 1.57079506;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat0 = u_xlat0 / u_xlat1.x;
    u_xlat2.x = vs_TEXCOORD1.y + (-_CharClipRect.y);
    u_xlat0 = u_xlat2.x / u_xlat0;
    u_xlat2.x = (-vs_TEXCOORD1.x) + _CharClipRect.x;
    u_xlat0 = u_xlat0 + u_xlat2.x;
    u_xlat0 = u_xlat0 / _CharFadeWidth;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _LineClipRect.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_LineClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat2.xy = u_xlat2.xy * u_xlat1.xy;
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.y + 1.0;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxy, _ClipRect.xyxy).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat1 * vs_COLOR0;
    u_xlat4.x = u_xlat4.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat2.x = u_xlat2.x * u_xlat4.x;
    u_xlat0 = u_xlat0 * u_xlat2.x;
    u_xlatb4.x = vs_TEXCOORD1.y<_CharClipRect.w;
    SV_Target0.w = (u_xlatb4.x) ? u_xlat0 : u_xlat2.x;
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
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _LineClipRect;
uniform 	vec4 _CharClipRect;
uniform 	float _CharFadeWidth;
uniform 	float _CharSlantAngle;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0 = (-_CharSlantAngle) * 0.0174532924 + 1.57079506;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat0 = u_xlat0 / u_xlat1.x;
    u_xlat3.x = vs_TEXCOORD1.y + (-_CharClipRect.y);
    u_xlat0 = u_xlat3.x / u_xlat0;
    u_xlat3.x = (-vs_TEXCOORD1.x) + _CharClipRect.x;
    u_xlat0 = u_xlat0 + u_xlat3.x;
    u_xlat0 = u_xlat0 / _CharFadeWidth;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _LineClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_LineClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat3.x = (-u_xlat3.x) * u_xlat3.y + 1.0;
    u_xlatb6.xy = greaterThanEqual(vs_TEXCOORD1.xyxy, _ClipRect.xyxy).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.x = u_xlat6.y * u_xlat6.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat1 * vs_COLOR0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat0 = u_xlat0 * u_xlat3.x;
    u_xlatb6.x = vs_TEXCOORD1.y<_CharClipRect.w;
    u_xlat16_2 = (u_xlatb6.x) ? u_xlat0 : u_xlat3.x;
    u_xlat16_5 = u_xlat16_2 + -0.00100000005;
    SV_Target0.w = u_xlat16_2;
    u_xlatb0 = u_xlat16_5<0.0;
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _LineClipRect;
uniform 	vec4 _CharClipRect;
uniform 	float _CharFadeWidth;
uniform 	float _CharSlantAngle;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0 = (-_CharSlantAngle) * 0.0174532924 + 1.57079506;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat0 = u_xlat0 / u_xlat1.x;
    u_xlat3.x = vs_TEXCOORD1.y + (-_CharClipRect.y);
    u_xlat0 = u_xlat3.x / u_xlat0;
    u_xlat3.x = (-vs_TEXCOORD1.x) + _CharClipRect.x;
    u_xlat0 = u_xlat0 + u_xlat3.x;
    u_xlat0 = u_xlat0 / _CharFadeWidth;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _LineClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_LineClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat3.x = (-u_xlat3.x) * u_xlat3.y + 1.0;
    u_xlatb6.xy = greaterThanEqual(vs_TEXCOORD1.xyxy, _ClipRect.xyxy).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.x = u_xlat6.y * u_xlat6.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat1 * vs_COLOR0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat0 = u_xlat0 * u_xlat3.x;
    u_xlatb6.x = vs_TEXCOORD1.y<_CharClipRect.w;
    u_xlat16_2 = (u_xlatb6.x) ? u_xlat0 : u_xlat3.x;
    u_xlat16_5 = u_xlat16_2 + -0.00100000005;
    SV_Target0.w = u_xlat16_2;
    u_xlatb0 = u_xlat16_5<0.0;
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform 	vec4 _LineClipRect;
uniform 	vec4 _CharClipRect;
uniform 	float _CharFadeWidth;
uniform 	float _CharSlantAngle;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0 = (-_CharSlantAngle) * 0.0174532924 + 1.57079506;
    u_xlat1.x = cos(u_xlat0);
    u_xlat0 = sin(u_xlat0);
    u_xlat0 = u_xlat0 / u_xlat1.x;
    u_xlat3.x = vs_TEXCOORD1.y + (-_CharClipRect.y);
    u_xlat0 = u_xlat3.x / u_xlat0;
    u_xlat3.x = (-vs_TEXCOORD1.x) + _CharClipRect.x;
    u_xlat0 = u_xlat0 + u_xlat3.x;
    u_xlat0 = u_xlat0 / _CharFadeWidth;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _LineClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_LineClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat3.x = (-u_xlat3.x) * u_xlat3.y + 1.0;
    u_xlatb6.xy = greaterThanEqual(vs_TEXCOORD1.xyxy, _ClipRect.xyxy).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.x = u_xlat6.y * u_xlat6.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat1 * vs_COLOR0;
    u_xlat6.x = u_xlat6.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat0 = u_xlat0 * u_xlat3.x;
    u_xlatb6.x = vs_TEXCOORD1.y<_CharClipRect.w;
    u_xlat16_2 = (u_xlatb6.x) ? u_xlat0 : u_xlat3.x;
    u_xlat16_5 = u_xlat16_2 + -0.00100000005;
    SV_Target0.w = u_xlat16_2;
    u_xlatb0 = u_xlat16_5<0.0;
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
}