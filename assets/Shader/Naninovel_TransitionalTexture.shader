//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Naninovel/TransitionalTexture" {
Properties {
_MainTex ("Main Texture", 2D) = "black" { }
_TransitionTex ("Transition Texture", 2D) = "black" { }
_CloudsTex ("Clouds Texture", 2D) = "black" { }
_DissolveTex ("Dissolve Texture", 2D) = "black" { }
_TransitionProgress ("Transition Progress", Float) = 0
_TransitionParams ("Transition Parameters", Vector) = (1,1,1,1)
_TintColor ("Tint Color", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 34293
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat13;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlatb1 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xy = (-u_xlat0.xz) * u_xlat0.yw + vec2(1.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat1 = u_xlat0.yyyy * (-u_xlat10_1) + u_xlat10_1;
    u_xlat16_2 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat0.w) + u_xlat1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat13;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlatb1 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xy = (-u_xlat0.xz) * u_xlat0.yw + vec2(1.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat1 = u_xlat0.yyyy * (-u_xlat10_1) + u_xlat10_1;
    u_xlat16_2 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat0.w) + u_xlat1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat13;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlatb1 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xy = (-u_xlat0.xz) * u_xlat0.yw + vec2(1.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat1 = u_xlat0.yyyy * (-u_xlat10_1) + u_xlat10_1;
    u_xlat16_2 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat0.w) + u_xlat1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
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
Keywords { "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec4 u_xlatb1;
mediump vec4 u_xlat16_2;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlatb1 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xy = (-u_xlat0.xz) * u_xlat0.yw + vec2(1.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat1 = u_xlat0.yyyy * (-u_xlat10_1) + u_xlat10_1;
    u_xlat16_2 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec4 u_xlatb1;
mediump vec4 u_xlat16_2;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlatb1 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xy = (-u_xlat0.xz) * u_xlat0.yw + vec2(1.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat1 = u_xlat0.yyyy * (-u_xlat10_1) + u_xlat10_1;
    u_xlat16_2 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec4 u_xlatb1;
mediump vec4 u_xlat16_2;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlatb1 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0.xy = (-u_xlat0.xz) * u_xlat0.yw + vec2(1.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat1 = u_xlat0.yyyy * (-u_xlat10_1) + u_xlat10_1;
    u_xlat16_2 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat9) : u_xlat9;
    u_xlat3 = u_xlat6 * _TransitionParams.y;
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = u_xlat3 * _TransitionParams.x;
    u_xlat0.x = u_xlat3 * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat6) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat9) : u_xlat9;
    u_xlat3 = u_xlat6 * _TransitionParams.y;
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = u_xlat3 * _TransitionParams.x;
    u_xlat0.x = u_xlat3 * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat6) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat9) : u_xlat9;
    u_xlat3 = u_xlat6 * _TransitionParams.y;
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = u_xlat3 * _TransitionParams.x;
    u_xlat0.x = u_xlat3 * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat6) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb5;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat1.x = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1.x * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1.x * u_xlat3 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1.x;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1.x + u_xlat3;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat6 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb2 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat6) : u_xlat6;
    u_xlat2 = u_xlat4 * _TransitionParams.y;
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = u_xlat2 * _TransitionParams.x;
    u_xlat0.x = u_xlat2 * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat4) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb5;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat1.x = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1.x * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1.x * u_xlat3 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1.x;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1.x + u_xlat3;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat6 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb2 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat6) : u_xlat6;
    u_xlat2 = u_xlat4 * _TransitionParams.y;
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = u_xlat2 * _TransitionParams.x;
    u_xlat0.x = u_xlat2 * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat4) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
bool u_xlatb5;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat1.x = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1.x * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1.x * u_xlat3 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1.x;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1.x + u_xlat3;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat6 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb2 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat6) : u_xlat6;
    u_xlat2 = u_xlat4 * _TransitionParams.y;
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = u_xlat2 * _TransitionParams.x;
    u_xlat0.x = u_xlat2 * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat4) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_BANDEDSWIRL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _TransitionParams.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<_TransitionProgress;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _TransitionParams.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<_TransitionProgress;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _TransitionParams.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<_TransitionProgress;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _TransitionParams.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<_TransitionProgress;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _TransitionParams.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<_TransitionProgress;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _TransitionParams.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlatb0 = u_xlat0.x<_TransitionProgress;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_BLINDS" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat4.x = _TransitionParams.x * 2.0 + 0.707106769;
    u_xlat4.x = _TransitionProgress * u_xlat4.x + (-_TransitionParams.x);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat4.x = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat16_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat16_1.w + (-u_xlat10_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat10_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat4.x = _TransitionParams.x * 2.0 + 0.707106769;
    u_xlat4.x = _TransitionProgress * u_xlat4.x + (-_TransitionParams.x);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat4.x = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat16_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat16_1.w + (-u_xlat10_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat10_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat4.x = _TransitionParams.x * 2.0 + 0.707106769;
    u_xlat4.x = _TransitionProgress * u_xlat4.x + (-_TransitionParams.x);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat4.x = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat16_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat16_1.w + (-u_xlat10_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat10_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat3 = _TransitionParams.x * 2.0 + 0.707106769;
    u_xlat3 = _TransitionProgress * u_xlat3 + (-_TransitionParams.x);
    u_xlat0.x = (-u_xlat3) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat3 = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat16_1 + (-u_xlat10_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat10_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat3 = _TransitionParams.x * 2.0 + 0.707106769;
    u_xlat3 = _TransitionProgress * u_xlat3 + (-_TransitionParams.x);
    u_xlat0.x = (-u_xlat3) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat3 = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat16_1 + (-u_xlat10_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat10_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat3 = _TransitionParams.x * 2.0 + 0.707106769;
    u_xlat3 = _TransitionProgress * u_xlat3 + (-_TransitionParams.x);
    u_xlat0.x = (-u_xlat3) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat3 = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat16_1 + (-u_xlat10_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat10_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _TransitionProgress * 0.707106769;
    u_xlat3.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat9 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat3.xy = u_xlat3.xy / vec2(u_xlat9);
    u_xlatb1 = u_xlat9<u_xlat0.x;
    if(u_xlatb1){
        u_xlatb1 = abs(u_xlat3.y)<abs(u_xlat3.x);
        u_xlat1.x = (u_xlatb1) ? abs(u_xlat3.x) : abs(u_xlat3.y);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat4.xy = u_xlat3.xy * u_xlat1.xx;
        u_xlat1.x = min(u_xlat0.x, u_xlat1.x);
        u_xlat9 = u_xlat9 / u_xlat1.x;
        u_xlat1.xy = vec2(u_xlat9) * u_xlat4.xy + vec2(0.5, 0.5);
        u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
        u_xlat16_2.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
        u_xlat16_2.w = u_xlat10_1.w;
    } else {
        u_xlatb9 = abs(u_xlat3.y)<abs(u_xlat3.x);
        u_xlat9 = (u_xlatb9) ? abs(u_xlat3.x) : abs(u_xlat3.y);
        u_xlat1.xy = u_xlat3.xy * vec2(u_xlat9);
        u_xlat9 = (-_TransitionProgress) * 0.707106769 + u_xlat9;
        u_xlat0.xy = u_xlat0.xx * u_xlat3.xy + vec2(0.5, 0.5);
        u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = u_xlat0.x / u_xlat9;
        u_xlat0.xy = u_xlat0.xx * u_xlat1.xy + vec2(0.5, 0.5);
        u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
        u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
        u_xlat16_2.w = u_xlat16_0.w;
    }
    SV_Target0 = u_xlat16_2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _TransitionProgress * 0.707106769;
    u_xlat3.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat9 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat3.xy = u_xlat3.xy / vec2(u_xlat9);
    u_xlatb1 = u_xlat9<u_xlat0.x;
    if(u_xlatb1){
        u_xlatb1 = abs(u_xlat3.y)<abs(u_xlat3.x);
        u_xlat1.x = (u_xlatb1) ? abs(u_xlat3.x) : abs(u_xlat3.y);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat4.xy = u_xlat3.xy * u_xlat1.xx;
        u_xlat1.x = min(u_xlat0.x, u_xlat1.x);
        u_xlat9 = u_xlat9 / u_xlat1.x;
        u_xlat1.xy = vec2(u_xlat9) * u_xlat4.xy + vec2(0.5, 0.5);
        u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
        u_xlat16_2.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
        u_xlat16_2.w = u_xlat10_1.w;
    } else {
        u_xlatb9 = abs(u_xlat3.y)<abs(u_xlat3.x);
        u_xlat9 = (u_xlatb9) ? abs(u_xlat3.x) : abs(u_xlat3.y);
        u_xlat1.xy = u_xlat3.xy * vec2(u_xlat9);
        u_xlat9 = (-_TransitionProgress) * 0.707106769 + u_xlat9;
        u_xlat0.xy = u_xlat0.xx * u_xlat3.xy + vec2(0.5, 0.5);
        u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = u_xlat0.x / u_xlat9;
        u_xlat0.xy = u_xlat0.xx * u_xlat1.xy + vec2(0.5, 0.5);
        u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
        u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
        u_xlat16_2.w = u_xlat16_0.w;
    }
    SV_Target0 = u_xlat16_2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _TransitionProgress * 0.707106769;
    u_xlat3.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat9 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat3.xy = u_xlat3.xy / vec2(u_xlat9);
    u_xlatb1 = u_xlat9<u_xlat0.x;
    if(u_xlatb1){
        u_xlatb1 = abs(u_xlat3.y)<abs(u_xlat3.x);
        u_xlat1.x = (u_xlatb1) ? abs(u_xlat3.x) : abs(u_xlat3.y);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat4.xy = u_xlat3.xy * u_xlat1.xx;
        u_xlat1.x = min(u_xlat0.x, u_xlat1.x);
        u_xlat9 = u_xlat9 / u_xlat1.x;
        u_xlat1.xy = vec2(u_xlat9) * u_xlat4.xy + vec2(0.5, 0.5);
        u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
        u_xlat16_2.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
        u_xlat16_2.w = u_xlat10_1.w;
    } else {
        u_xlatb9 = abs(u_xlat3.y)<abs(u_xlat3.x);
        u_xlat9 = (u_xlatb9) ? abs(u_xlat3.x) : abs(u_xlat3.y);
        u_xlat1.xy = u_xlat3.xy * vec2(u_xlat9);
        u_xlat9 = (-_TransitionProgress) * 0.707106769 + u_xlat9;
        u_xlat0.xy = u_xlat0.xx * u_xlat3.xy + vec2(0.5, 0.5);
        u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = u_xlat0.x / u_xlat9;
        u_xlat0.xy = u_xlat0.xx * u_xlat1.xy + vec2(0.5, 0.5);
        u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
        u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
        u_xlat16_2.w = u_xlat16_0.w;
    }
    SV_Target0 = u_xlat16_2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
float u_xlat12;
float u_xlat14;
void main()
{
    u_xlat0 = _TransitionProgress * 0.707106769;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat12 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat4.xy = u_xlat4.xy / vec2(u_xlat12);
    u_xlatb1 = u_xlat12<u_xlat0;
    if(u_xlatb1){
        u_xlatb1 = abs(u_xlat4.y)<abs(u_xlat4.x);
        u_xlat1.x = (u_xlatb1) ? abs(u_xlat4.x) : abs(u_xlat4.y);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat5.xy = u_xlat4.xy * u_xlat1.xx;
        u_xlat1.x = min(u_xlat0, u_xlat1.x);
        u_xlat12 = u_xlat12 / u_xlat1.x;
        u_xlat1.xy = vec2(u_xlat12) * u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
        u_xlat16_1 = u_xlat10_1;
    } else {
        u_xlatb2 = abs(u_xlat4.y)<abs(u_xlat4.x);
        u_xlat2.x = (u_xlatb2) ? abs(u_xlat4.x) : abs(u_xlat4.y);
        u_xlat6.xy = u_xlat4.xy * u_xlat2.xx;
        u_xlat2.x = (-_TransitionProgress) * 0.707106769 + u_xlat2.x;
        u_xlat3.xy = vec2(u_xlat0) * u_xlat4.xy + vec2(0.5, 0.5);
        u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD0.xy;
        u_xlat14 = dot(u_xlat3.xy, u_xlat3.xy);
        u_xlat14 = sqrt(u_xlat14);
        u_xlat2.x = u_xlat14 / u_xlat2.x;
        u_xlat2.xy = u_xlat2.xx * u_xlat6.xy + vec2(0.5, 0.5);
        u_xlat16_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat16_1 = u_xlat16_1;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
float u_xlat12;
float u_xlat14;
void main()
{
    u_xlat0 = _TransitionProgress * 0.707106769;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat12 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat4.xy = u_xlat4.xy / vec2(u_xlat12);
    u_xlatb1 = u_xlat12<u_xlat0;
    if(u_xlatb1){
        u_xlatb1 = abs(u_xlat4.y)<abs(u_xlat4.x);
        u_xlat1.x = (u_xlatb1) ? abs(u_xlat4.x) : abs(u_xlat4.y);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat5.xy = u_xlat4.xy * u_xlat1.xx;
        u_xlat1.x = min(u_xlat0, u_xlat1.x);
        u_xlat12 = u_xlat12 / u_xlat1.x;
        u_xlat1.xy = vec2(u_xlat12) * u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
        u_xlat16_1 = u_xlat10_1;
    } else {
        u_xlatb2 = abs(u_xlat4.y)<abs(u_xlat4.x);
        u_xlat2.x = (u_xlatb2) ? abs(u_xlat4.x) : abs(u_xlat4.y);
        u_xlat6.xy = u_xlat4.xy * u_xlat2.xx;
        u_xlat2.x = (-_TransitionProgress) * 0.707106769 + u_xlat2.x;
        u_xlat3.xy = vec2(u_xlat0) * u_xlat4.xy + vec2(0.5, 0.5);
        u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD0.xy;
        u_xlat14 = dot(u_xlat3.xy, u_xlat3.xy);
        u_xlat14 = sqrt(u_xlat14);
        u_xlat2.x = u_xlat14 / u_xlat2.x;
        u_xlat2.xy = u_xlat2.xx * u_xlat6.xy + vec2(0.5, 0.5);
        u_xlat16_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat16_1 = u_xlat16_1;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
float u_xlat12;
float u_xlat14;
void main()
{
    u_xlat0 = _TransitionProgress * 0.707106769;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat12 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat4.xy = u_xlat4.xy / vec2(u_xlat12);
    u_xlatb1 = u_xlat12<u_xlat0;
    if(u_xlatb1){
        u_xlatb1 = abs(u_xlat4.y)<abs(u_xlat4.x);
        u_xlat1.x = (u_xlatb1) ? abs(u_xlat4.x) : abs(u_xlat4.y);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat5.xy = u_xlat4.xy * u_xlat1.xx;
        u_xlat1.x = min(u_xlat0, u_xlat1.x);
        u_xlat12 = u_xlat12 / u_xlat1.x;
        u_xlat1.xy = vec2(u_xlat12) * u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
        u_xlat16_1 = u_xlat10_1;
    } else {
        u_xlatb2 = abs(u_xlat4.y)<abs(u_xlat4.x);
        u_xlat2.x = (u_xlatb2) ? abs(u_xlat4.x) : abs(u_xlat4.y);
        u_xlat6.xy = u_xlat4.xy * u_xlat2.xx;
        u_xlat2.x = (-_TransitionProgress) * 0.707106769 + u_xlat2.x;
        u_xlat3.xy = vec2(u_xlat0) * u_xlat4.xy + vec2(0.5, 0.5);
        u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD0.xy;
        u_xlat14 = dot(u_xlat3.xy, u_xlat3.xy);
        u_xlat14 = sqrt(u_xlat14);
        u_xlat2.x = u_xlat14 / u_xlat2.x;
        u_xlat2.xy = u_xlat2.xx * u_xlat6.xy + vec2(0.5, 0.5);
        u_xlat16_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat16_1 = u_xlat16_1;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CIRCLESTRETCH" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump float u_xlat10_5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0 = _TransitionProgress + -0.5;
    u_xlat0 = u_xlat0 + u_xlat0;
    u_xlat10_5 = texture(_CloudsTex, vs_TEXCOORD0.xy).x;
    u_xlat10 = (-u_xlat10_5) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat10 + u_xlat10_5;
    u_xlat5 = dot(vec2(_TransitionProgress), vec2(u_xlat10_5));
    u_xlatb10 = _TransitionProgress<0.5;
    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
    u_xlatb0 = u_xlat0<0.5;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat10_3 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat1.w = (u_xlatb0) ? u_xlat16_1.w : u_xlat10_3.w;
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump float u_xlat10_5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0 = _TransitionProgress + -0.5;
    u_xlat0 = u_xlat0 + u_xlat0;
    u_xlat10_5 = texture(_CloudsTex, vs_TEXCOORD0.xy).x;
    u_xlat10 = (-u_xlat10_5) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat10 + u_xlat10_5;
    u_xlat5 = dot(vec2(_TransitionProgress), vec2(u_xlat10_5));
    u_xlatb10 = _TransitionProgress<0.5;
    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
    u_xlatb0 = u_xlat0<0.5;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat10_3 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat1.w = (u_xlatb0) ? u_xlat16_1.w : u_xlat10_3.w;
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump float u_xlat10_5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0 = _TransitionProgress + -0.5;
    u_xlat0 = u_xlat0 + u_xlat0;
    u_xlat10_5 = texture(_CloudsTex, vs_TEXCOORD0.xy).x;
    u_xlat10 = (-u_xlat10_5) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat10 + u_xlat10_5;
    u_xlat5 = dot(vec2(_TransitionProgress), vec2(u_xlat10_5));
    u_xlatb10 = _TransitionProgress<0.5;
    u_xlat0 = (u_xlatb10) ? u_xlat5 : u_xlat0;
    u_xlatb0 = u_xlat0<0.5;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat10_3 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat1.w = (u_xlatb0) ? u_xlat16_1.w : u_xlat10_3.w;
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
mediump float u_xlat10_3;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat10_3 = texture(_CloudsTex, vs_TEXCOORD0.xy).x;
    u_xlat6 = (-u_xlat10_3) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6 + u_xlat10_3;
    u_xlat3 = dot(vec2(_TransitionProgress), vec2(u_xlat10_3));
    u_xlatb6 = _TransitionProgress<0.5;
    u_xlat0.x = (u_xlatb6) ? u_xlat3 : u_xlat0.x;
    u_xlatb0 = u_xlat0.x<0.5;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
mediump float u_xlat10_3;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat10_3 = texture(_CloudsTex, vs_TEXCOORD0.xy).x;
    u_xlat6 = (-u_xlat10_3) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6 + u_xlat10_3;
    u_xlat3 = dot(vec2(_TransitionProgress), vec2(u_xlat10_3));
    u_xlatb6 = _TransitionProgress<0.5;
    u_xlat0.x = (u_xlatb6) ? u_xlat3 : u_xlat0.x;
    u_xlatb0 = u_xlat0.x<0.5;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
mediump float u_xlat10_3;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat10_3 = texture(_CloudsTex, vs_TEXCOORD0.xy).x;
    u_xlat6 = (-u_xlat10_3) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6 + u_xlat10_3;
    u_xlat3 = dot(vec2(_TransitionProgress), vec2(u_xlat10_3));
    u_xlatb6 = _TransitionProgress<0.5;
    u_xlat0.x = (u_xlatb6) ? u_xlat3 : u_xlat0.x;
    u_xlatb0 = u_xlat0.x<0.5;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CLOUDREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat10;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = phase0_Input0_2.y * 0.200000003 + u_xlat0.x;
    u_xlat3.y = fract(u_xlat0.x);
    u_xlat3.x = phase0_Input0_2.x * 0.200000003;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat3.xy).xy;
    u_xlat0 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1.x = _TransitionProgress * 2.0 + -1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat4 = _TransitionProgress + _TransitionProgress;
    u_xlatb7 = 0.5<_TransitionProgress;
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx + phase0_Input0_2;
    u_xlat0 = fract(u_xlat0);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat10;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = phase0_Input0_2.y * 0.200000003 + u_xlat0.x;
    u_xlat3.y = fract(u_xlat0.x);
    u_xlat3.x = phase0_Input0_2.x * 0.200000003;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat3.xy).xy;
    u_xlat0 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1.x = _TransitionProgress * 2.0 + -1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat4 = _TransitionProgress + _TransitionProgress;
    u_xlatb7 = 0.5<_TransitionProgress;
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx + phase0_Input0_2;
    u_xlat0 = fract(u_xlat0);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat10;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = phase0_Input0_2.y * 0.200000003 + u_xlat0.x;
    u_xlat3.y = fract(u_xlat0.x);
    u_xlat3.x = phase0_Input0_2.x * 0.200000003;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat3.xy).xy;
    u_xlat0 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1.x = _TransitionProgress * 2.0 + -1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat4 = _TransitionProgress + _TransitionProgress;
    u_xlatb7 = 0.5<_TransitionProgress;
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx + phase0_Input0_2;
    u_xlat0 = fract(u_xlat0);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
float u_xlat3;
bool u_xlatb5;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = phase0_Input0_2.y * 0.200000003 + u_xlat0.x;
    u_xlat2.y = fract(u_xlat0.x);
    u_xlat2.x = phase0_Input0_2.x * 0.200000003;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat2.xy).xy;
    u_xlat0 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1.x = _TransitionProgress * 2.0 + -1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat3 = _TransitionProgress + _TransitionProgress;
    u_xlatb5 = 0.5<_TransitionProgress;
    u_xlat1.x = (u_xlatb5) ? u_xlat1.x : u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx + phase0_Input0_2;
    u_xlat0 = fract(u_xlat0);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
float u_xlat3;
bool u_xlatb5;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = phase0_Input0_2.y * 0.200000003 + u_xlat0.x;
    u_xlat2.y = fract(u_xlat0.x);
    u_xlat2.x = phase0_Input0_2.x * 0.200000003;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat2.xy).xy;
    u_xlat0 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1.x = _TransitionProgress * 2.0 + -1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat3 = _TransitionProgress + _TransitionProgress;
    u_xlatb5 = 0.5<_TransitionProgress;
    u_xlat1.x = (u_xlatb5) ? u_xlat1.x : u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx + phase0_Input0_2;
    u_xlat0 = fract(u_xlat0);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
float u_xlat3;
bool u_xlatb5;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = phase0_Input0_2.y * 0.200000003 + u_xlat0.x;
    u_xlat2.y = fract(u_xlat0.x);
    u_xlat2.x = phase0_Input0_2.x * 0.200000003;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat2.xy).xy;
    u_xlat0 = u_xlat10_0.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1.x = _TransitionProgress * 2.0 + -1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat3 = _TransitionProgress + _TransitionProgress;
    u_xlatb5 = 0.5<_TransitionProgress;
    u_xlat1.x = (u_xlatb5) ? u_xlat1.x : u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat1.xxxx + phase0_Input0_2;
    u_xlat0 = fract(u_xlat0);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CRUMBLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0 = phase0_Input0_2.xyxy * _TransitionParams.xxxx;
    u_xlat1 = floor(u_xlat0.zwzw);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 + vec4(-0.0, -0.0, -1.0, -1.0);
    u_xlat1 = u_xlat1 + vec4(0.0, 0.0, 1.0, 1.0);
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat2 = u_xlat1.xzxz * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = u_xlat1.xzxz * u_xlat2;
    u_xlat3 = u_xlat2.zwzw * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat3 = floor(u_xlat3);
    u_xlat2 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat2;
    u_xlat1 = u_xlat1.yyww + u_xlat2;
    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat1 = u_xlat1 * vec4(0.024390243, 0.024390243, 0.024390243, 0.024390243);
    u_xlat1 = fract(u_xlat1);
    u_xlat2 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = floor(u_xlat2);
    u_xlat2 = u_xlat1.yxwz + (-u_xlat2.yxwz);
    u_xlat1 = abs(u_xlat1) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.xz = u_xlat2.yw;
    u_xlat3.yw = u_xlat1.xz;
    u_xlat2.yw = u_xlat1.yw;
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.y = dot(u_xlat3.zw, u_xlat3.zw);
    u_xlat1.z = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat1.w = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat1 = (-u_xlat1) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
    u_xlat2 = u_xlat1.zzww * u_xlat2;
    u_xlat1 = u_xlat1.xxyy * u_xlat3;
    u_xlat2.x = dot(u_xlat2.yx, u_xlat0.yz);
    u_xlat2.y = dot(u_xlat2.zw, u_xlat0.zw);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat1.zw, u_xlat0.xw);
    u_xlat8.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat2.xy = u_xlat0.xy * vec2(6.0, 6.0) + vec2(-15.0, -15.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xy + vec2(10.0, 10.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat0.xz = u_xlat0.xx * u_xlat8.xy + u_xlat1.xy;
    u_xlat8.x = (-u_xlat0.x) + u_xlat0.z;
    u_xlat0.x = u_xlat0.y * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 2.29999995 + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlatb0 = _TransitionProgress<u_xlat0.x;
    u_xlatb1 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlatb2 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat4.xy = (-u_xlat1.xz) * u_xlat1.yw + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat1 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlat10_2 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat2 = u_xlat4.yyyy * (-u_xlat10_2) + u_xlat10_2;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0 = phase0_Input0_2.xyxy * _TransitionParams.xxxx;
    u_xlat1 = floor(u_xlat0.zwzw);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 + vec4(-0.0, -0.0, -1.0, -1.0);
    u_xlat1 = u_xlat1 + vec4(0.0, 0.0, 1.0, 1.0);
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat2 = u_xlat1.xzxz * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = u_xlat1.xzxz * u_xlat2;
    u_xlat3 = u_xlat2.zwzw * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat3 = floor(u_xlat3);
    u_xlat2 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat2;
    u_xlat1 = u_xlat1.yyww + u_xlat2;
    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat1 = u_xlat1 * vec4(0.024390243, 0.024390243, 0.024390243, 0.024390243);
    u_xlat1 = fract(u_xlat1);
    u_xlat2 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = floor(u_xlat2);
    u_xlat2 = u_xlat1.yxwz + (-u_xlat2.yxwz);
    u_xlat1 = abs(u_xlat1) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.xz = u_xlat2.yw;
    u_xlat3.yw = u_xlat1.xz;
    u_xlat2.yw = u_xlat1.yw;
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.y = dot(u_xlat3.zw, u_xlat3.zw);
    u_xlat1.z = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat1.w = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat1 = (-u_xlat1) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
    u_xlat2 = u_xlat1.zzww * u_xlat2;
    u_xlat1 = u_xlat1.xxyy * u_xlat3;
    u_xlat2.x = dot(u_xlat2.yx, u_xlat0.yz);
    u_xlat2.y = dot(u_xlat2.zw, u_xlat0.zw);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat1.zw, u_xlat0.xw);
    u_xlat8.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat2.xy = u_xlat0.xy * vec2(6.0, 6.0) + vec2(-15.0, -15.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xy + vec2(10.0, 10.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat0.xz = u_xlat0.xx * u_xlat8.xy + u_xlat1.xy;
    u_xlat8.x = (-u_xlat0.x) + u_xlat0.z;
    u_xlat0.x = u_xlat0.y * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 2.29999995 + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlatb0 = _TransitionProgress<u_xlat0.x;
    u_xlatb1 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlatb2 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat4.xy = (-u_xlat1.xz) * u_xlat1.yw + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat1 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlat10_2 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat2 = u_xlat4.yyyy * (-u_xlat10_2) + u_xlat10_2;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0 = phase0_Input0_2.xyxy * _TransitionParams.xxxx;
    u_xlat1 = floor(u_xlat0.zwzw);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 + vec4(-0.0, -0.0, -1.0, -1.0);
    u_xlat1 = u_xlat1 + vec4(0.0, 0.0, 1.0, 1.0);
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat2 = u_xlat1.xzxz * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = u_xlat1.xzxz * u_xlat2;
    u_xlat3 = u_xlat2.zwzw * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat3 = floor(u_xlat3);
    u_xlat2 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat2;
    u_xlat1 = u_xlat1.yyww + u_xlat2;
    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat1 = u_xlat1 * vec4(0.024390243, 0.024390243, 0.024390243, 0.024390243);
    u_xlat1 = fract(u_xlat1);
    u_xlat2 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = floor(u_xlat2);
    u_xlat2 = u_xlat1.yxwz + (-u_xlat2.yxwz);
    u_xlat1 = abs(u_xlat1) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.xz = u_xlat2.yw;
    u_xlat3.yw = u_xlat1.xz;
    u_xlat2.yw = u_xlat1.yw;
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.y = dot(u_xlat3.zw, u_xlat3.zw);
    u_xlat1.z = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat1.w = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat1 = (-u_xlat1) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
    u_xlat2 = u_xlat1.zzww * u_xlat2;
    u_xlat1 = u_xlat1.xxyy * u_xlat3;
    u_xlat2.x = dot(u_xlat2.yx, u_xlat0.yz);
    u_xlat2.y = dot(u_xlat2.zw, u_xlat0.zw);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat1.zw, u_xlat0.xw);
    u_xlat8.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat2.xy = u_xlat0.xy * vec2(6.0, 6.0) + vec2(-15.0, -15.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xy + vec2(10.0, 10.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat0.xz = u_xlat0.xx * u_xlat8.xy + u_xlat1.xy;
    u_xlat8.x = (-u_xlat0.x) + u_xlat0.z;
    u_xlat0.x = u_xlat0.y * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 2.29999995 + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlatb0 = _TransitionProgress<u_xlat0.x;
    u_xlatb1 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlatb2 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat4.xy = (-u_xlat1.xz) * u_xlat1.yw + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat1 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlat10_2 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat2 = u_xlat4.yyyy * (-u_xlat10_2) + u_xlat10_2;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0 = phase0_Input0_2.xyxy * _TransitionParams.xxxx;
    u_xlat1 = floor(u_xlat0.zwzw);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 + vec4(-0.0, -0.0, -1.0, -1.0);
    u_xlat1 = u_xlat1 + vec4(0.0, 0.0, 1.0, 1.0);
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat2 = u_xlat1.xzxz * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = u_xlat1.xzxz * u_xlat2;
    u_xlat3 = u_xlat2.zwzw * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat3 = floor(u_xlat3);
    u_xlat2 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat2;
    u_xlat1 = u_xlat1.yyww + u_xlat2;
    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat1 = u_xlat1 * vec4(0.024390243, 0.024390243, 0.024390243, 0.024390243);
    u_xlat1 = fract(u_xlat1);
    u_xlat2 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = floor(u_xlat2);
    u_xlat2 = u_xlat1.yxwz + (-u_xlat2.yxwz);
    u_xlat1 = abs(u_xlat1) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.xz = u_xlat2.yw;
    u_xlat3.yw = u_xlat1.xz;
    u_xlat2.yw = u_xlat1.yw;
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.y = dot(u_xlat3.zw, u_xlat3.zw);
    u_xlat1.z = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat1.w = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat1 = (-u_xlat1) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
    u_xlat2 = u_xlat1.zzww * u_xlat2;
    u_xlat1 = u_xlat1.xxyy * u_xlat3;
    u_xlat2.x = dot(u_xlat2.yx, u_xlat0.yz);
    u_xlat2.y = dot(u_xlat2.zw, u_xlat0.zw);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat1.zw, u_xlat0.xw);
    u_xlat8.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat2.xy = u_xlat0.xy * vec2(6.0, 6.0) + vec2(-15.0, -15.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xy + vec2(10.0, 10.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat0.xz = u_xlat0.xx * u_xlat8.xy + u_xlat1.xy;
    u_xlat8.x = (-u_xlat0.x) + u_xlat0.z;
    u_xlat0.x = u_xlat0.y * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 2.29999995 + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlatb0 = _TransitionProgress<u_xlat0.x;
    u_xlatb1 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlatb2 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat4.xy = (-u_xlat1.xz) * u_xlat1.yw + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat1 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlat10_2 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat2 = u_xlat4.yyyy * (-u_xlat10_2) + u_xlat10_2;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0 = phase0_Input0_2.xyxy * _TransitionParams.xxxx;
    u_xlat1 = floor(u_xlat0.zwzw);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 + vec4(-0.0, -0.0, -1.0, -1.0);
    u_xlat1 = u_xlat1 + vec4(0.0, 0.0, 1.0, 1.0);
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat2 = u_xlat1.xzxz * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = u_xlat1.xzxz * u_xlat2;
    u_xlat3 = u_xlat2.zwzw * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat3 = floor(u_xlat3);
    u_xlat2 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat2;
    u_xlat1 = u_xlat1.yyww + u_xlat2;
    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat1 = u_xlat1 * vec4(0.024390243, 0.024390243, 0.024390243, 0.024390243);
    u_xlat1 = fract(u_xlat1);
    u_xlat2 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = floor(u_xlat2);
    u_xlat2 = u_xlat1.yxwz + (-u_xlat2.yxwz);
    u_xlat1 = abs(u_xlat1) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.xz = u_xlat2.yw;
    u_xlat3.yw = u_xlat1.xz;
    u_xlat2.yw = u_xlat1.yw;
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.y = dot(u_xlat3.zw, u_xlat3.zw);
    u_xlat1.z = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat1.w = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat1 = (-u_xlat1) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
    u_xlat2 = u_xlat1.zzww * u_xlat2;
    u_xlat1 = u_xlat1.xxyy * u_xlat3;
    u_xlat2.x = dot(u_xlat2.yx, u_xlat0.yz);
    u_xlat2.y = dot(u_xlat2.zw, u_xlat0.zw);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat1.zw, u_xlat0.xw);
    u_xlat8.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat2.xy = u_xlat0.xy * vec2(6.0, 6.0) + vec2(-15.0, -15.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xy + vec2(10.0, 10.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat0.xz = u_xlat0.xx * u_xlat8.xy + u_xlat1.xy;
    u_xlat8.x = (-u_xlat0.x) + u_xlat0.z;
    u_xlat0.x = u_xlat0.y * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 2.29999995 + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlatb0 = _TransitionProgress<u_xlat0.x;
    u_xlatb1 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlatb2 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat4.xy = (-u_xlat1.xz) * u_xlat1.yw + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat1 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlat10_2 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat2 = u_xlat4.yyyy * (-u_xlat10_2) + u_xlat10_2;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0 = phase0_Input0_2.xyxy * _TransitionParams.xxxx;
    u_xlat1 = floor(u_xlat0.zwzw);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 + vec4(-0.0, -0.0, -1.0, -1.0);
    u_xlat1 = u_xlat1 + vec4(0.0, 0.0, 1.0, 1.0);
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat2 = u_xlat1.xzxz * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = u_xlat1.xzxz * u_xlat2;
    u_xlat3 = u_xlat2.zwzw * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat3 = floor(u_xlat3);
    u_xlat2 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat2;
    u_xlat1 = u_xlat1.yyww + u_xlat2;
    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat1 * vec4(0.00346020772, 0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2 = floor(u_xlat2);
    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
    u_xlat1 = u_xlat1 * vec4(0.024390243, 0.024390243, 0.024390243, 0.024390243);
    u_xlat1 = fract(u_xlat1);
    u_xlat2 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = floor(u_xlat2);
    u_xlat2 = u_xlat1.yxwz + (-u_xlat2.yxwz);
    u_xlat1 = abs(u_xlat1) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.xz = u_xlat2.yw;
    u_xlat3.yw = u_xlat1.xz;
    u_xlat2.yw = u_xlat1.yw;
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.y = dot(u_xlat3.zw, u_xlat3.zw);
    u_xlat1.z = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat1.w = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat1 = (-u_xlat1) * vec4(0.853734732, 0.853734732, 0.853734732, 0.853734732) + vec4(1.79284286, 1.79284286, 1.79284286, 1.79284286);
    u_xlat2 = u_xlat1.zzww * u_xlat2;
    u_xlat1 = u_xlat1.xxyy * u_xlat3;
    u_xlat2.x = dot(u_xlat2.yx, u_xlat0.yz);
    u_xlat2.y = dot(u_xlat2.zw, u_xlat0.zw);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat1.zw, u_xlat0.xw);
    u_xlat8.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat9.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat2.xy = u_xlat0.xy * vec2(6.0, 6.0) + vec2(-15.0, -15.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xy + vec2(10.0, 10.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat9.xy;
    u_xlat0.xz = u_xlat0.xx * u_xlat8.xy + u_xlat1.xy;
    u_xlat8.x = (-u_xlat0.x) + u_xlat0.z;
    u_xlat0.x = u_xlat0.y * u_xlat8.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 2.29999995 + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlatb0 = _TransitionProgress<u_xlat0.x;
    u_xlatb1 = greaterThanEqual(phase0_Input0_2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlatb2 = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), phase0_Input0_2);
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat4.xy = (-u_xlat1.xz) * u_xlat1.yw + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_MainTex, phase0_Input0_2.xy);
    u_xlat1 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlat10_2 = texture(_TransitionTex, phase0_Input0_2.zw);
    u_xlat2 = u_xlat4.yyyy * (-u_xlat10_2) + u_xlat10_2;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_DISSOLVE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
mediump vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec2 u_xlat8;
bvec2 u_xlatb8;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 0.200000003;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _TransitionProgress + vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_TransitionProgress);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlatb2 = 0.0>=u_xlat0.w;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat0.xyz;
    u_xlat0.x = (-u_xlat0.w) + u_xlat10_1.w;
    u_xlat0.x = _TransitionProgress * u_xlat0.x + u_xlat0.w;
    u_xlat16_3.w = (u_xlatb2) ? u_xlat10_1.w : u_xlat0.x;
    SV_Target0 = u_xlat16_3 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
mediump vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec2 u_xlat8;
bvec2 u_xlatb8;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 0.200000003;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _TransitionProgress + vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_TransitionProgress);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlatb2 = 0.0>=u_xlat0.w;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat0.xyz;
    u_xlat0.x = (-u_xlat0.w) + u_xlat10_1.w;
    u_xlat0.x = _TransitionProgress * u_xlat0.x + u_xlat0.w;
    u_xlat16_3.w = (u_xlatb2) ? u_xlat10_1.w : u_xlat0.x;
    SV_Target0 = u_xlat16_3 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
mediump vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec2 u_xlat8;
bvec2 u_xlatb8;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 0.200000003;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _TransitionProgress + vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_TransitionProgress);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlatb2 = 0.0>=u_xlat0.w;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat0.xyz;
    u_xlat0.x = (-u_xlat0.w) + u_xlat10_1.w;
    u_xlat0.x = _TransitionProgress * u_xlat0.x + u_xlat0.w;
    u_xlat16_3.w = (u_xlatb2) ? u_xlat10_1.w : u_xlat0.x;
    SV_Target0 = u_xlat16_3 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 0.200000003;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _TransitionProgress + vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlatb6.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat0) + u_xlat1;
    u_xlat2 = vec4(_TransitionProgress) * u_xlat2 + u_xlat0;
    u_xlatb0 = 0.0>=u_xlat0.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 0.200000003;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _TransitionProgress + vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlatb6.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat0) + u_xlat1;
    u_xlat2 = vec4(_TransitionProgress) * u_xlat2 + u_xlat0;
    u_xlatb0 = 0.0>=u_xlat0.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x * 0.200000003;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _TransitionProgress + vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlatb6.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat0) + u_xlat1;
    u_xlat2 = vec4(_TransitionProgress) * u_xlat2 + u_xlat0;
    u_xlatb0 = 0.0>=u_xlat0.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_DROPFADE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.x = dot(_TransitionParams.yz, _TransitionParams.yz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _TransitionParams.yz;
    u_xlat8.xy = vs_TEXCOORD0.xy + (-vec2(_TransitionProgress));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat4.x = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat16_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat16_1.w + (-u_xlat10_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat10_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.x = dot(_TransitionParams.yz, _TransitionParams.yz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _TransitionParams.yz;
    u_xlat8.xy = vs_TEXCOORD0.xy + (-vec2(_TransitionProgress));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat4.x = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat16_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat16_1.w + (-u_xlat10_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat10_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat8;
void main()
{
    u_xlat0.x = dot(_TransitionParams.yz, _TransitionParams.yz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _TransitionParams.yz;
    u_xlat8.xy = vs_TEXCOORD0.xy + (-vec2(_TransitionProgress));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat4.x = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat16_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat16_1.w + (-u_xlat10_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat10_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat10_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = dot(_TransitionParams.yz, _TransitionParams.yz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _TransitionParams.yz;
    u_xlat6.xy = vs_TEXCOORD0.xy + (-vec2(_TransitionProgress));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat3 = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat16_1 + (-u_xlat10_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat10_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = dot(_TransitionParams.yz, _TransitionParams.yz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _TransitionParams.yz;
    u_xlat6.xy = vs_TEXCOORD0.xy + (-vec2(_TransitionProgress));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat3 = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat16_1 + (-u_xlat10_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat10_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = dot(_TransitionParams.yz, _TransitionParams.yz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * _TransitionParams.yz;
    u_xlat6.xy = vs_TEXCOORD0.xy + (-vec2(_TransitionProgress));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat0.x = u_xlat0.x + _TransitionParams.x;
    u_xlat3 = _TransitionParams.x + _TransitionParams.x;
    u_xlat0.x = u_xlat0.x / u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat16_1 + (-u_xlat10_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat10_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_LINEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = _TransitionProgress<0.5;
    u_xlat4 = (-_TransitionProgress) * 2.0 + 1.0;
    u_xlat8.xy = vec2(_TransitionProgress) + vec2(-0.5, -0.400000006);
    u_xlat8.x = u_xlat8.x + u_xlat8.x;
    u_xlat12 = u_xlat8.y * 5.0;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.x = (u_xlatb0) ? u_xlat4 : u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1000.0 + 5.0;
    u_xlat1 = u_xlat0.xxxx * phase0_Input0_2;
    u_xlat1 = roundEven(u_xlat1);
    u_xlat1 = u_xlat1 / u_xlat0.xxxx;
    u_xlat10_2 = texture(_TransitionTex, u_xlat1.zw);
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat16_3.xyz);
    u_xlat2.x = (-u_xlat16_1.w) + u_xlat10_2.w;
    u_xlat2.w = u_xlat12 * u_xlat2.x + u_xlat16_1.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_1.www + u_xlat0.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = _TransitionProgress<0.5;
    u_xlat4 = (-_TransitionProgress) * 2.0 + 1.0;
    u_xlat8.xy = vec2(_TransitionProgress) + vec2(-0.5, -0.400000006);
    u_xlat8.x = u_xlat8.x + u_xlat8.x;
    u_xlat12 = u_xlat8.y * 5.0;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.x = (u_xlatb0) ? u_xlat4 : u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1000.0 + 5.0;
    u_xlat1 = u_xlat0.xxxx * phase0_Input0_2;
    u_xlat1 = roundEven(u_xlat1);
    u_xlat1 = u_xlat1 / u_xlat0.xxxx;
    u_xlat10_2 = texture(_TransitionTex, u_xlat1.zw);
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat16_3.xyz);
    u_xlat2.x = (-u_xlat16_1.w) + u_xlat10_2.w;
    u_xlat2.w = u_xlat12 * u_xlat2.x + u_xlat16_1.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_1.www + u_xlat0.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = _TransitionProgress<0.5;
    u_xlat4 = (-_TransitionProgress) * 2.0 + 1.0;
    u_xlat8.xy = vec2(_TransitionProgress) + vec2(-0.5, -0.400000006);
    u_xlat8.x = u_xlat8.x + u_xlat8.x;
    u_xlat12 = u_xlat8.y * 5.0;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.x = (u_xlatb0) ? u_xlat4 : u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1000.0 + 5.0;
    u_xlat1 = u_xlat0.xxxx * phase0_Input0_2;
    u_xlat1 = roundEven(u_xlat1);
    u_xlat1 = u_xlat1 / u_xlat0.xxxx;
    u_xlat10_2 = texture(_TransitionTex, u_xlat1.zw);
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat16_3.xyz);
    u_xlat2.x = (-u_xlat16_1.w) + u_xlat10_2.w;
    u_xlat2.w = u_xlat12 * u_xlat2.x + u_xlat16_1.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_1.www + u_xlat0.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat3;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = _TransitionProgress<0.5;
    u_xlat3 = (-_TransitionProgress) * 2.0 + 1.0;
    u_xlat6.xy = vec2(_TransitionProgress) + vec2(-0.5, -0.400000006);
    u_xlat6.x = u_xlat6.x + u_xlat6.x;
    u_xlat9 = u_xlat6.y * 5.0;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.x = (u_xlatb0) ? u_xlat3 : u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1000.0 + 5.0;
    u_xlat1 = u_xlat0.xxxx * phase0_Input0_2;
    u_xlat1 = roundEven(u_xlat1);
    u_xlat1 = u_xlat1 / u_xlat0.xxxx;
    u_xlat10_2 = texture(_TransitionTex, u_xlat1.zw);
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat2 = (-u_xlat16_1) + u_xlat10_2;
    u_xlat0 = vec4(u_xlat9) * u_xlat2 + u_xlat16_1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat3;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = _TransitionProgress<0.5;
    u_xlat3 = (-_TransitionProgress) * 2.0 + 1.0;
    u_xlat6.xy = vec2(_TransitionProgress) + vec2(-0.5, -0.400000006);
    u_xlat6.x = u_xlat6.x + u_xlat6.x;
    u_xlat9 = u_xlat6.y * 5.0;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.x = (u_xlatb0) ? u_xlat3 : u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1000.0 + 5.0;
    u_xlat1 = u_xlat0.xxxx * phase0_Input0_2;
    u_xlat1 = roundEven(u_xlat1);
    u_xlat1 = u_xlat1 / u_xlat0.xxxx;
    u_xlat10_2 = texture(_TransitionTex, u_xlat1.zw);
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat2 = (-u_xlat16_1) + u_xlat10_2;
    u_xlat0 = vec4(u_xlat9) * u_xlat2 + u_xlat16_1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
float u_xlat3;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlatb0 = _TransitionProgress<0.5;
    u_xlat3 = (-_TransitionProgress) * 2.0 + 1.0;
    u_xlat6.xy = vec2(_TransitionProgress) + vec2(-0.5, -0.400000006);
    u_xlat6.x = u_xlat6.x + u_xlat6.x;
    u_xlat9 = u_xlat6.y * 5.0;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.x = (u_xlatb0) ? u_xlat3 : u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 1000.0 + 5.0;
    u_xlat1 = u_xlat0.xxxx * phase0_Input0_2;
    u_xlat1 = roundEven(u_xlat1);
    u_xlat1 = u_xlat1 / u_xlat0.xxxx;
    u_xlat10_2 = texture(_TransitionTex, u_xlat1.zw);
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat2 = (-u_xlat16_1) + u_xlat10_2;
    u_xlat0 = vec4(u_xlat9) * u_xlat2 + u_xlat16_1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_PIXELATE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
vec4 u_xlat3;
float u_xlat8;
int u_xlati8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat8 = _TransitionProgress * 0.0199999996;
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat1.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<24 ; u_xlati_loop_1++)
    {
        u_xlat12 = float(u_xlati_loop_1);
        u_xlat2.xy = (-u_xlat0.xy) * vec2(u_xlat12) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat1.xyz;
        u_xlat1.w = u_xlat1.w + u_xlat16_2.w;
    }
    u_xlat0 = u_xlat1 * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat3.w = (-u_xlat1.w) * 0.0416666679 + u_xlat10_2.w;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat3 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
vec4 u_xlat3;
float u_xlat8;
int u_xlati8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat8 = _TransitionProgress * 0.0199999996;
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat1.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<24 ; u_xlati_loop_1++)
    {
        u_xlat12 = float(u_xlati_loop_1);
        u_xlat2.xy = (-u_xlat0.xy) * vec2(u_xlat12) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat1.xyz;
        u_xlat1.w = u_xlat1.w + u_xlat16_2.w;
    }
    u_xlat0 = u_xlat1 * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat3.w = (-u_xlat1.w) * 0.0416666679 + u_xlat10_2.w;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat3 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
vec4 u_xlat3;
float u_xlat8;
int u_xlati8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat8 = _TransitionProgress * 0.0199999996;
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat1.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<24 ; u_xlati_loop_1++)
    {
        u_xlat12 = float(u_xlati_loop_1);
        u_xlat2.xy = (-u_xlat0.xy) * vec2(u_xlat12) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat1.xyz;
        u_xlat1.w = u_xlat1.w + u_xlat16_2.w;
    }
    u_xlat0 = u_xlat1 * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat3.w = (-u_xlat1.w) * 0.0416666679 + u_xlat10_2.w;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat3 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
float u_xlat6;
int u_xlati6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat6 = _TransitionProgress * 0.0199999996;
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat1.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<24 ; u_xlati_loop_1++)
    {
        u_xlat9 = float(u_xlati_loop_1);
        u_xlat2.xy = (-u_xlat0.xy) * vec2(u_xlat9) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat1 + u_xlat16_2;
    }
    u_xlat0 = u_xlat1 * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat1) * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679) + u_xlat10_2;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
float u_xlat6;
int u_xlati6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat6 = _TransitionProgress * 0.0199999996;
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat1.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<24 ; u_xlati_loop_1++)
    {
        u_xlat9 = float(u_xlati_loop_1);
        u_xlat2.xy = (-u_xlat0.xy) * vec2(u_xlat9) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat1 + u_xlat16_2;
    }
    u_xlat0 = u_xlat1 * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat1) * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679) + u_xlat10_2;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
float u_xlat6;
int u_xlati6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat6 = _TransitionProgress * 0.0199999996;
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat1.w = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<24 ; u_xlati_loop_1++)
    {
        u_xlat9 = float(u_xlati_loop_1);
        u_xlat2.xy = (-u_xlat0.xy) * vec2(u_xlat9) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat1 + u_xlat16_2;
    }
    u_xlat0 = u_xlat1 * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679);
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat1) * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679) + u_xlat10_2;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RADIALBLUR" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat5;
bool u_xlatb5;
float u_xlat8;
bool u_xlatb9;
float u_xlat12;
mediump float u_xlat10_12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat8 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat8);
    u_xlat12 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat1.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat12 * u_xlat12;
    u_xlat5 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat5 = u_xlat1.x * u_xlat5 + 0.180141002;
    u_xlat5 = u_xlat1.x * u_xlat5 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat5 + 0.999866009;
    u_xlat5 = u_xlat12 * u_xlat1.x;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat1.x + u_xlat5;
    u_xlatb1 = u_xlat0.x<(-u_xlat0.x);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.x, u_xlat0.y);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat5 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb5 = u_xlat5>=(-u_xlat5);
    u_xlatb1 = u_xlatb5 && u_xlatb1;
    u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
    u_xlat12 = u_xlat12 + 3.14159203;
    u_xlat1.x = u_xlat12 * 0.159154981;
    u_xlat12 = u_xlat8 * 0.200000003;
    u_xlat12 = _TransitionProgress * 0.333333343 + u_xlat12;
    u_xlat12 = u_xlat12 + _RandomSeed.xxxy.z;
    u_xlat1.y = fract(u_xlat12);
    u_xlat10_12 = texture(_CloudsTex, u_xlat1.xy).x;
    u_xlat12 = u_xlat10_12 * 2.0 + -1.0;
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat1.x = (-_TransitionProgress) + 1.0;
    u_xlat1.x = min(u_xlat1.x, 0.300000012);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat8;
    u_xlat1.xy = u_xlat0.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat2.x = min(_TransitionProgress, 0.300000012);
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat8 = u_xlat12 * u_xlat8 + u_xlat8;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat8) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat5;
bool u_xlatb5;
float u_xlat8;
bool u_xlatb9;
float u_xlat12;
mediump float u_xlat10_12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat8 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat8);
    u_xlat12 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat1.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat12 * u_xlat12;
    u_xlat5 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat5 = u_xlat1.x * u_xlat5 + 0.180141002;
    u_xlat5 = u_xlat1.x * u_xlat5 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat5 + 0.999866009;
    u_xlat5 = u_xlat12 * u_xlat1.x;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat1.x + u_xlat5;
    u_xlatb1 = u_xlat0.x<(-u_xlat0.x);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.x, u_xlat0.y);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat5 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb5 = u_xlat5>=(-u_xlat5);
    u_xlatb1 = u_xlatb5 && u_xlatb1;
    u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
    u_xlat12 = u_xlat12 + 3.14159203;
    u_xlat1.x = u_xlat12 * 0.159154981;
    u_xlat12 = u_xlat8 * 0.200000003;
    u_xlat12 = _TransitionProgress * 0.333333343 + u_xlat12;
    u_xlat12 = u_xlat12 + _RandomSeed.xxxy.z;
    u_xlat1.y = fract(u_xlat12);
    u_xlat10_12 = texture(_CloudsTex, u_xlat1.xy).x;
    u_xlat12 = u_xlat10_12 * 2.0 + -1.0;
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat1.x = (-_TransitionProgress) + 1.0;
    u_xlat1.x = min(u_xlat1.x, 0.300000012);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat8;
    u_xlat1.xy = u_xlat0.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat2.x = min(_TransitionProgress, 0.300000012);
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat8 = u_xlat12 * u_xlat8 + u_xlat8;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat8) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat5;
bool u_xlatb5;
float u_xlat8;
bool u_xlatb9;
float u_xlat12;
mediump float u_xlat10_12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat8 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat8);
    u_xlat12 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat1.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat12 * u_xlat12;
    u_xlat5 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat5 = u_xlat1.x * u_xlat5 + 0.180141002;
    u_xlat5 = u_xlat1.x * u_xlat5 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat5 + 0.999866009;
    u_xlat5 = u_xlat12 * u_xlat1.x;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat1.x + u_xlat5;
    u_xlatb1 = u_xlat0.x<(-u_xlat0.x);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.x, u_xlat0.y);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat5 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb5 = u_xlat5>=(-u_xlat5);
    u_xlatb1 = u_xlatb5 && u_xlatb1;
    u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
    u_xlat12 = u_xlat12 + 3.14159203;
    u_xlat1.x = u_xlat12 * 0.159154981;
    u_xlat12 = u_xlat8 * 0.200000003;
    u_xlat12 = _TransitionProgress * 0.333333343 + u_xlat12;
    u_xlat12 = u_xlat12 + _RandomSeed.xxxy.z;
    u_xlat1.y = fract(u_xlat12);
    u_xlat10_12 = texture(_CloudsTex, u_xlat1.xy).x;
    u_xlat12 = u_xlat10_12 * 2.0 + -1.0;
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat1.x = (-_TransitionProgress) + 1.0;
    u_xlat1.x = min(u_xlat1.x, 0.300000012);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat8;
    u_xlat1.xy = u_xlat0.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat2.x = min(_TransitionProgress, 0.300000012);
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat8 = u_xlat12 * u_xlat8 + u_xlat8;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat8) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat2;
float u_xlat4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
mediump float u_xlat10_9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat6 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
    u_xlat9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.x<(-u_xlat0.x);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.x, u_xlat0.y);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat4 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb4 = u_xlat4>=(-u_xlat4);
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
    u_xlat9 = u_xlat9 + 3.14159203;
    u_xlat1.x = u_xlat9 * 0.159154981;
    u_xlat9 = u_xlat6 * 0.200000003;
    u_xlat9 = _TransitionProgress * 0.333333343 + u_xlat9;
    u_xlat9 = u_xlat9 + _RandomSeed.xxxy.z;
    u_xlat1.y = fract(u_xlat9);
    u_xlat10_9 = texture(_CloudsTex, u_xlat1.xy).x;
    u_xlat9 = u_xlat10_9 * 2.0 + -1.0;
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.x = (-_TransitionProgress) + 1.0;
    u_xlat1.x = min(u_xlat1.x, 0.300000012);
    u_xlat1.x = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6 + u_xlat6;
    u_xlat1.xy = u_xlat0.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat2 = min(_TransitionProgress, 0.300000012);
    u_xlat9 = u_xlat9 * u_xlat2;
    u_xlat6 = u_xlat9 * u_xlat6 + u_xlat6;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat2;
float u_xlat4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
mediump float u_xlat10_9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat6 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
    u_xlat9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.x<(-u_xlat0.x);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.x, u_xlat0.y);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat4 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb4 = u_xlat4>=(-u_xlat4);
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
    u_xlat9 = u_xlat9 + 3.14159203;
    u_xlat1.x = u_xlat9 * 0.159154981;
    u_xlat9 = u_xlat6 * 0.200000003;
    u_xlat9 = _TransitionProgress * 0.333333343 + u_xlat9;
    u_xlat9 = u_xlat9 + _RandomSeed.xxxy.z;
    u_xlat1.y = fract(u_xlat9);
    u_xlat10_9 = texture(_CloudsTex, u_xlat1.xy).x;
    u_xlat9 = u_xlat10_9 * 2.0 + -1.0;
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.x = (-_TransitionProgress) + 1.0;
    u_xlat1.x = min(u_xlat1.x, 0.300000012);
    u_xlat1.x = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6 + u_xlat6;
    u_xlat1.xy = u_xlat0.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat2 = min(_TransitionProgress, 0.300000012);
    u_xlat9 = u_xlat9 * u_xlat2;
    u_xlat6 = u_xlat9 * u_xlat6 + u_xlat6;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat2;
float u_xlat4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
mediump float u_xlat10_9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat6 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
    u_xlat9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.x<(-u_xlat0.x);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.x, u_xlat0.y);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat4 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb4 = u_xlat4>=(-u_xlat4);
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
    u_xlat9 = u_xlat9 + 3.14159203;
    u_xlat1.x = u_xlat9 * 0.159154981;
    u_xlat9 = u_xlat6 * 0.200000003;
    u_xlat9 = _TransitionProgress * 0.333333343 + u_xlat9;
    u_xlat9 = u_xlat9 + _RandomSeed.xxxy.z;
    u_xlat1.y = fract(u_xlat9);
    u_xlat10_9 = texture(_CloudsTex, u_xlat1.xy).x;
    u_xlat9 = u_xlat10_9 * 2.0 + -1.0;
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.x = (-_TransitionProgress) + 1.0;
    u_xlat1.x = min(u_xlat1.x, 0.300000012);
    u_xlat1.x = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6 + u_xlat6;
    u_xlat1.xy = u_xlat0.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat2 = min(_TransitionProgress, 0.300000012);
    u_xlat9 = u_xlat9 * u_xlat2;
    u_xlat6 = u_xlat9 * u_xlat6 + u_xlat6;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RADIALWIGGLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat8;
bool u_xlatb9;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = inversesqrt(u_xlat8);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat12 * u_xlat12;
    u_xlat5 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat5 = u_xlat1.x * u_xlat5 + 0.180141002;
    u_xlat5 = u_xlat1.x * u_xlat5 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat5 + 0.999866009;
    u_xlat5 = u_xlat12 * u_xlat1.x;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat1.x + u_xlat5;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb4 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb4;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat12) : u_xlat12;
    u_xlat0.x = u_xlat0.x + 3.14159203;
    u_xlat0.x = u_xlat0.x * 0.159154981;
    u_xlat12 = _TransitionProgress * 0.200000003 + _RandomSeed.xxxy.z;
    u_xlat0.y = fract(u_xlat12);
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat4 = _TransitionProgress * 0.707106769;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + u_xlat4;
    u_xlatb0 = u_xlat8<u_xlat0.x;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat8;
bool u_xlatb9;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = inversesqrt(u_xlat8);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat12 * u_xlat12;
    u_xlat5 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat5 = u_xlat1.x * u_xlat5 + 0.180141002;
    u_xlat5 = u_xlat1.x * u_xlat5 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat5 + 0.999866009;
    u_xlat5 = u_xlat12 * u_xlat1.x;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat1.x + u_xlat5;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb4 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb4;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat12) : u_xlat12;
    u_xlat0.x = u_xlat0.x + 3.14159203;
    u_xlat0.x = u_xlat0.x * 0.159154981;
    u_xlat12 = _TransitionProgress * 0.200000003 + _RandomSeed.xxxy.z;
    u_xlat0.y = fract(u_xlat12);
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat4 = _TransitionProgress * 0.707106769;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + u_xlat4;
    u_xlatb0 = u_xlat8<u_xlat0.x;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat8;
bool u_xlatb9;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = inversesqrt(u_xlat8);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.x = u_xlat12 * u_xlat12;
    u_xlat5 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat5 = u_xlat1.x * u_xlat5 + 0.180141002;
    u_xlat5 = u_xlat1.x * u_xlat5 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat5 + 0.999866009;
    u_xlat5 = u_xlat12 * u_xlat1.x;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat1.x + u_xlat5;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb4 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb4;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat12) : u_xlat12;
    u_xlat0.x = u_xlat0.x + 3.14159203;
    u_xlat0.x = u_xlat0.x * 0.159154981;
    u_xlat12 = _TransitionProgress * 0.200000003 + _RandomSeed.xxxy.z;
    u_xlat0.y = fract(u_xlat12);
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat4 = _TransitionProgress * 0.707106769;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + u_xlat4;
    u_xlatb0 = u_xlat8<u_xlat0.x;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = inversesqrt(u_xlat6);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat9) : u_xlat9;
    u_xlat0.x = u_xlat0.x + 3.14159203;
    u_xlat0.x = u_xlat0.x * 0.159154981;
    u_xlat9 = _TransitionProgress * 0.200000003 + _RandomSeed.xxxy.z;
    u_xlat0.y = fract(u_xlat9);
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat3 = _TransitionProgress * 0.707106769;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + u_xlat3;
    u_xlatb0 = u_xlat6<u_xlat0.x;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = inversesqrt(u_xlat6);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat9) : u_xlat9;
    u_xlat0.x = u_xlat0.x + 3.14159203;
    u_xlat0.x = u_xlat0.x * 0.159154981;
    u_xlat9 = _TransitionProgress * 0.200000003 + _RandomSeed.xxxy.z;
    u_xlat0.y = fract(u_xlat9);
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat3 = _TransitionProgress * 0.707106769;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + u_xlat3;
    u_xlatb0 = u_xlat6<u_xlat0.x;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb7;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = inversesqrt(u_xlat6);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat9) : u_xlat9;
    u_xlat0.x = u_xlat0.x + 3.14159203;
    u_xlat0.x = u_xlat0.x * 0.159154981;
    u_xlat9 = _TransitionProgress * 0.200000003 + _RandomSeed.xxxy.z;
    u_xlat0.y = fract(u_xlat9);
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat3 = _TransitionProgress * 0.707106769;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + u_xlat3;
    u_xlatb0 = u_xlat6<u_xlat0.x;
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RANDOMCIRCLEREVEAL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
vec2 u_xlat6;
float u_xlat10;
void main()
{
    u_xlat0.x = (-_TransitionProgress) + 1.0;
    u_xlat3 = _TransitionProgress * _TransitionParams.y;
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat3 = _TransitionParams.x * u_xlat1.x + (-u_xlat3);
    u_xlat3 = cos(u_xlat3);
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat3 = u_xlat3 * _TransitionProgress;
    u_xlat3 = u_xlat3 * _TransitionParams.z + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * _TransitionParams.z + u_xlat1.x;
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat6.xy * u_xlat0.xx + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat6.xy * vec2(u_xlat3) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
vec2 u_xlat6;
float u_xlat10;
void main()
{
    u_xlat0.x = (-_TransitionProgress) + 1.0;
    u_xlat3 = _TransitionProgress * _TransitionParams.y;
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat3 = _TransitionParams.x * u_xlat1.x + (-u_xlat3);
    u_xlat3 = cos(u_xlat3);
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat3 = u_xlat3 * _TransitionProgress;
    u_xlat3 = u_xlat3 * _TransitionParams.z + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * _TransitionParams.z + u_xlat1.x;
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat6.xy * u_xlat0.xx + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat6.xy * vec2(u_xlat3) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
vec2 u_xlat6;
float u_xlat10;
void main()
{
    u_xlat0.x = (-_TransitionProgress) + 1.0;
    u_xlat3 = _TransitionProgress * _TransitionParams.y;
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat3 = _TransitionParams.x * u_xlat1.x + (-u_xlat3);
    u_xlat3 = cos(u_xlat3);
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat3 = u_xlat3 * _TransitionProgress;
    u_xlat3 = u_xlat3 * _TransitionParams.z + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * _TransitionParams.z + u_xlat1.x;
    u_xlat6.xy = u_xlat6.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat6.xy * u_xlat0.xx + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat6.xy * vec2(u_xlat3) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_2.xyz);
    u_xlat10 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat10 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = (-_TransitionProgress) + 1.0;
    u_xlat2 = _TransitionProgress * _TransitionParams.y;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat2 = _TransitionParams.x * u_xlat1.x + (-u_xlat2);
    u_xlat2 = cos(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat2 = u_xlat2 * _TransitionProgress;
    u_xlat2 = u_xlat2 * _TransitionParams.z + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * _TransitionParams.z + u_xlat1.x;
    u_xlat4.xy = u_xlat4.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat4.xy * u_xlat0.xx + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat2) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = (-_TransitionProgress) + 1.0;
    u_xlat2 = _TransitionProgress * _TransitionParams.y;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat2 = _TransitionParams.x * u_xlat1.x + (-u_xlat2);
    u_xlat2 = cos(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat2 = u_xlat2 * _TransitionProgress;
    u_xlat2 = u_xlat2 * _TransitionParams.z + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * _TransitionParams.z + u_xlat1.x;
    u_xlat4.xy = u_xlat4.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat4.xy * u_xlat0.xx + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat2) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = (-_TransitionProgress) + 1.0;
    u_xlat2 = _TransitionProgress * _TransitionParams.y;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat2 = _TransitionParams.x * u_xlat1.x + (-u_xlat2);
    u_xlat2 = cos(u_xlat2);
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat2 = u_xlat2 * _TransitionProgress;
    u_xlat2 = u_xlat2 * _TransitionParams.z + u_xlat1.x;
    u_xlat0.x = u_xlat0.x * _TransitionParams.z + u_xlat1.x;
    u_xlat4.xy = u_xlat4.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat4.xy * u_xlat0.xx + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat2) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_RIPPLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
float u_xlat6;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat5.y = fract(u_xlat0.x);
    u_xlat5.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat5.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
    u_xlat10.xy = (-u_xlat0.yx) + vs_TEXCOORD0.yx;
    u_xlat1.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat10.xy = u_xlat10.xy / u_xlat1.xx;
    u_xlat6 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat11 = min(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6 = u_xlat6 * u_xlat11;
    u_xlat11 = u_xlat6 * u_xlat6;
    u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
    u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat11 * u_xlat6;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb2 = abs(u_xlat10.y)<abs(u_xlat10.x);
    u_xlat16 = u_xlatb2 ? u_xlat16 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat11 + u_xlat16;
    u_xlatb11 = u_xlat10.y<(-u_xlat10.y);
    u_xlat11 = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat11 + u_xlat6;
    u_xlat11 = min(u_xlat10.y, u_xlat10.x);
    u_xlat10.x = max(u_xlat10.y, u_xlat10.x);
    u_xlatb10 = u_xlat10.x>=(-u_xlat10.x);
    u_xlatb15 = u_xlat11<(-u_xlat11);
    u_xlatb10 = u_xlatb10 && u_xlatb15;
    u_xlat10.x = (u_xlatb10) ? (-u_xlat6) : u_xlat6;
    u_xlat10.x = _TransitionProgress * 6.28318405 + u_xlat10.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat0.xy = u_xlat3.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_4.xyz);
    u_xlat16 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat16 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
float u_xlat6;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat5.y = fract(u_xlat0.x);
    u_xlat5.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat5.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
    u_xlat10.xy = (-u_xlat0.yx) + vs_TEXCOORD0.yx;
    u_xlat1.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat10.xy = u_xlat10.xy / u_xlat1.xx;
    u_xlat6 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat11 = min(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6 = u_xlat6 * u_xlat11;
    u_xlat11 = u_xlat6 * u_xlat6;
    u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
    u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat11 * u_xlat6;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb2 = abs(u_xlat10.y)<abs(u_xlat10.x);
    u_xlat16 = u_xlatb2 ? u_xlat16 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat11 + u_xlat16;
    u_xlatb11 = u_xlat10.y<(-u_xlat10.y);
    u_xlat11 = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat11 + u_xlat6;
    u_xlat11 = min(u_xlat10.y, u_xlat10.x);
    u_xlat10.x = max(u_xlat10.y, u_xlat10.x);
    u_xlatb10 = u_xlat10.x>=(-u_xlat10.x);
    u_xlatb15 = u_xlat11<(-u_xlat11);
    u_xlatb10 = u_xlatb10 && u_xlatb15;
    u_xlat10.x = (u_xlatb10) ? (-u_xlat6) : u_xlat6;
    u_xlat10.x = _TransitionProgress * 6.28318405 + u_xlat10.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat0.xy = u_xlat3.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_4.xyz);
    u_xlat16 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat16 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
float u_xlat6;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat5.y = fract(u_xlat0.x);
    u_xlat5.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat5.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
    u_xlat10.xy = (-u_xlat0.yx) + vs_TEXCOORD0.yx;
    u_xlat1.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat10.xy = u_xlat10.xy / u_xlat1.xx;
    u_xlat6 = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat11 = min(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6 = u_xlat6 * u_xlat11;
    u_xlat11 = u_xlat6 * u_xlat6;
    u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
    u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat11 * u_xlat6;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb2 = abs(u_xlat10.y)<abs(u_xlat10.x);
    u_xlat16 = u_xlatb2 ? u_xlat16 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat11 + u_xlat16;
    u_xlatb11 = u_xlat10.y<(-u_xlat10.y);
    u_xlat11 = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat11 + u_xlat6;
    u_xlat11 = min(u_xlat10.y, u_xlat10.x);
    u_xlat10.x = max(u_xlat10.y, u_xlat10.x);
    u_xlatb10 = u_xlat10.x>=(-u_xlat10.x);
    u_xlatb15 = u_xlat11<(-u_xlat11);
    u_xlatb10 = u_xlatb10 && u_xlatb15;
    u_xlat10.x = (u_xlatb10) ? (-u_xlat6) : u_xlat6;
    u_xlat10.x = _TransitionProgress * 6.28318405 + u_xlat10.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat0.xy = u_xlat3.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_4.xyz);
    u_xlat16 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat16 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat4.y = fract(u_xlat0.x);
    u_xlat4.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat4.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
    u_xlat8.xy = (-u_xlat0.yx) + vs_TEXCOORD0.yx;
    u_xlat1.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat8.xy = u_xlat8.xy / u_xlat1.xx;
    u_xlat5 = max(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = min(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5 = u_xlat5 * u_xlat9;
    u_xlat9 = u_xlat5 * u_xlat5;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat9 * u_xlat5;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb2 = abs(u_xlat8.y)<abs(u_xlat8.x);
    u_xlat13 = u_xlatb2 ? u_xlat13 : float(0.0);
    u_xlat5 = u_xlat5 * u_xlat9 + u_xlat13;
    u_xlatb9 = u_xlat8.y<(-u_xlat8.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat5 = u_xlat9 + u_xlat5;
    u_xlat9 = min(u_xlat8.y, u_xlat8.x);
    u_xlat8.x = max(u_xlat8.y, u_xlat8.x);
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
    u_xlatb12 = u_xlat9<(-u_xlat9);
    u_xlatb8 = u_xlatb8 && u_xlatb12;
    u_xlat8.x = (u_xlatb8) ? (-u_xlat5) : u_xlat5;
    u_xlat8.x = _TransitionProgress * 6.28318405 + u_xlat8.x;
    u_xlat2 = sin(u_xlat8.x);
    u_xlat3.x = cos(u_xlat8.x);
    u_xlat3.y = u_xlat2;
    u_xlat0.xy = u_xlat3.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat4.y = fract(u_xlat0.x);
    u_xlat4.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat4.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
    u_xlat8.xy = (-u_xlat0.yx) + vs_TEXCOORD0.yx;
    u_xlat1.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat8.xy = u_xlat8.xy / u_xlat1.xx;
    u_xlat5 = max(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = min(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5 = u_xlat5 * u_xlat9;
    u_xlat9 = u_xlat5 * u_xlat5;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat9 * u_xlat5;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb2 = abs(u_xlat8.y)<abs(u_xlat8.x);
    u_xlat13 = u_xlatb2 ? u_xlat13 : float(0.0);
    u_xlat5 = u_xlat5 * u_xlat9 + u_xlat13;
    u_xlatb9 = u_xlat8.y<(-u_xlat8.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat5 = u_xlat9 + u_xlat5;
    u_xlat9 = min(u_xlat8.y, u_xlat8.x);
    u_xlat8.x = max(u_xlat8.y, u_xlat8.x);
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
    u_xlatb12 = u_xlat9<(-u_xlat9);
    u_xlatb8 = u_xlatb8 && u_xlatb12;
    u_xlat8.x = (u_xlatb8) ? (-u_xlat5) : u_xlat5;
    u_xlat8.x = _TransitionProgress * 6.28318405 + u_xlat8.x;
    u_xlat2 = sin(u_xlat8.x);
    u_xlat3.x = cos(u_xlat8.x);
    u_xlat3.y = u_xlat2;
    u_xlat0.xy = u_xlat3.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat4.y = fract(u_xlat0.x);
    u_xlat4.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat4.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
    u_xlat8.xy = (-u_xlat0.yx) + vs_TEXCOORD0.yx;
    u_xlat1.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat8.xy = u_xlat8.xy / u_xlat1.xx;
    u_xlat5 = max(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = min(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5 = u_xlat5 * u_xlat9;
    u_xlat9 = u_xlat5 * u_xlat5;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat9 * u_xlat5;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb2 = abs(u_xlat8.y)<abs(u_xlat8.x);
    u_xlat13 = u_xlatb2 ? u_xlat13 : float(0.0);
    u_xlat5 = u_xlat5 * u_xlat9 + u_xlat13;
    u_xlatb9 = u_xlat8.y<(-u_xlat8.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat5 = u_xlat9 + u_xlat5;
    u_xlat9 = min(u_xlat8.y, u_xlat8.x);
    u_xlat8.x = max(u_xlat8.y, u_xlat8.x);
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
    u_xlatb12 = u_xlat9<(-u_xlat9);
    u_xlatb8 = u_xlatb8 && u_xlatb12;
    u_xlat8.x = (u_xlatb8) ? (-u_xlat5) : u_xlat5;
    u_xlat8.x = _TransitionProgress * 6.28318405 + u_xlat8.x;
    u_xlat2 = sin(u_xlat8.x);
    u_xlat3.x = cos(u_xlat8.x);
    u_xlat3.y = u_xlat2;
    u_xlat0.xy = u_xlat3.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_ROTATECRUMBLE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
float u_xlat4;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.800000012;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat4 = _TransitionProgress * 2.0 + 1.0;
    u_xlat2.xyz = vec3(u_xlat4) * u_xlat16_2.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.w = u_xlat4 * u_xlat16_1.w;
    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat2.xyz);
    u_xlat3.w = (-u_xlat2.w) + u_xlat10_1.w;
    u_xlat0 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlatb1 = 0.800000012<_TransitionProgress;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
float u_xlat4;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.800000012;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat4 = _TransitionProgress * 2.0 + 1.0;
    u_xlat2.xyz = vec3(u_xlat4) * u_xlat16_2.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.w = u_xlat4 * u_xlat16_1.w;
    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat2.xyz);
    u_xlat3.w = (-u_xlat2.w) + u_xlat10_1.w;
    u_xlat0 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlatb1 = 0.800000012<_TransitionProgress;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
float u_xlat4;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.800000012;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat4 = _TransitionProgress * 2.0 + 1.0;
    u_xlat2.xyz = vec3(u_xlat4) * u_xlat16_2.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.w = u_xlat4 * u_xlat16_1.w;
    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat2.xyz);
    u_xlat3.w = (-u_xlat2.w) + u_xlat10_1.w;
    u_xlat0 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlatb1 = 0.800000012<_TransitionProgress;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.800000012;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = _TransitionProgress * 2.0 + 1.0;
    u_xlat2 = vec4(u_xlat3) * u_xlat16_2;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat1 = u_xlat10_1 + (-u_xlat2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
    u_xlatb1 = 0.800000012<_TransitionProgress;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.800000012;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = _TransitionProgress * 2.0 + 1.0;
    u_xlat2 = vec4(u_xlat3) * u_xlat16_2;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat1 = u_xlat10_1 + (-u_xlat2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
    u_xlatb1 = 0.800000012<_TransitionProgress;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat0.x = _TransitionProgress + -0.800000012;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = _TransitionProgress * 2.0 + 1.0;
    u_xlat2 = vec4(u_xlat3) * u_xlat16_2;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat1 = u_xlat10_1 + (-u_xlat2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
    u_xlatb1 = 0.800000012<_TransitionProgress;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SATURATE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat10_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat4;
bvec2 u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xx;
    u_xlat6 = _TransitionProgress * _TransitionParams.x + 1.0;
    u_xlat4.x = u_xlat6 * u_xlat4.x;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xx + vec2(0.5, 0.5);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.y + 1.0;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_0 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlatb1.x = 0.0>=u_xlat10_0.w;
    if(u_xlatb1.x){
        u_xlat10_0 = texture(_TransitionTex, vs_TEXCOORD1.xy);
        u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
        u_xlat10_0.xyz = u_xlat16_0.xyz;
    } else {
        u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
        u_xlat10_0.xyz = u_xlat16_0.xyz;
    }
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat10_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat4;
bvec2 u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xx;
    u_xlat6 = _TransitionProgress * _TransitionParams.x + 1.0;
    u_xlat4.x = u_xlat6 * u_xlat4.x;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xx + vec2(0.5, 0.5);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.y + 1.0;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_0 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlatb1.x = 0.0>=u_xlat10_0.w;
    if(u_xlatb1.x){
        u_xlat10_0 = texture(_TransitionTex, vs_TEXCOORD1.xy);
        u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
        u_xlat10_0.xyz = u_xlat16_0.xyz;
    } else {
        u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
        u_xlat10_0.xyz = u_xlat16_0.xyz;
    }
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat10_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat4;
bvec2 u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xx;
    u_xlat6 = _TransitionProgress * _TransitionParams.x + 1.0;
    u_xlat4.x = u_xlat6 * u_xlat4.x;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xx + vec2(0.5, 0.5);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.y + 1.0;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_0 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlatb1.x = 0.0>=u_xlat10_0.w;
    if(u_xlatb1.x){
        u_xlat10_0 = texture(_TransitionTex, vs_TEXCOORD1.xy);
        u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
        u_xlat10_0.xyz = u_xlat16_0.xyz;
    } else {
        u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
        u_xlat10_0.xyz = u_xlat16_0.xyz;
    }
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat4;
bvec2 u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xx;
    u_xlat6 = _TransitionProgress * _TransitionParams.x + 1.0;
    u_xlat4.x = u_xlat6 * u_xlat4.x;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xx + vec2(0.5, 0.5);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.y + 1.0;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_0 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlatb1.x = 0.0>=u_xlat10_0.w;
    if(u_xlatb1.x){
        u_xlat10_0 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    }
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat4;
bvec2 u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xx;
    u_xlat6 = _TransitionProgress * _TransitionParams.x + 1.0;
    u_xlat4.x = u_xlat6 * u_xlat4.x;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xx + vec2(0.5, 0.5);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.y + 1.0;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_0 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlatb1.x = 0.0>=u_xlat10_0.w;
    if(u_xlatb1.x){
        u_xlat10_0 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    }
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat4;
bvec2 u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xx;
    u_xlat6 = _TransitionProgress * _TransitionParams.x + 1.0;
    u_xlat4.x = u_xlat6 * u_xlat4.x;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xx + vec2(0.5, 0.5);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.y + 1.0;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_0 = u_xlat4.xxxx * (-u_xlat16_1) + u_xlat16_1;
    u_xlatb1.x = 0.0>=u_xlat10_0.w;
    if(u_xlatb1.x){
        u_xlat10_0 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    }
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SHRINK" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.xy = _TransitionParams.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat0.xy;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xy = (-u_xlat0.xy) + u_xlat8.xy;
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlatb8 = u_xlat8.x!=0.0;
    u_xlat1.xy = fract(u_xlat0.xy);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat0 = (bool(u_xlatb8)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.xy = _TransitionParams.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat0.xy;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xy = (-u_xlat0.xy) + u_xlat8.xy;
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlatb8 = u_xlat8.x!=0.0;
    u_xlat1.xy = fract(u_xlat0.xy);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat0 = (bool(u_xlatb8)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
bool u_xlatb8;
void main()
{
    u_xlat0.xy = _TransitionParams.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat8.xy = u_xlat0.xy;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xy = (-u_xlat0.xy) + u_xlat8.xy;
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlatb8 = u_xlat8.x!=0.0;
    u_xlat1.xy = fract(u_xlat0.xy);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat0 = (bool(u_xlatb8)) ? u_xlat1 : u_xlat2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = _TransitionParams.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat0.xy;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat6.xy;
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlatb6 = u_xlat6.x!=0.0;
    u_xlat1.xy = fract(u_xlat0.xy);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat0 = (bool(u_xlatb6)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = _TransitionParams.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat0.xy;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat6.xy;
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlatb6 = u_xlat6.x!=0.0;
    u_xlat1.xy = fract(u_xlat0.xy);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat0 = (bool(u_xlatb6)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = _TransitionParams.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat0.xy;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat6.xy;
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlatb6 = u_xlat6.x!=0.0;
    u_xlat1.xy = fract(u_xlat0.xy);
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, u_xlat1.xy);
    u_xlat0 = (bool(u_xlatb6)) ? u_xlat1 : u_xlat2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SLIDEIN" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat11;
bool u_xlatb11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx * _TransitionParams.yy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.yx);
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat10.xy = u_xlat10.xy / u_xlat1.xx;
    u_xlat6.x = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat11 = min(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6.x = u_xlat6.x * u_xlat11;
    u_xlat11 = u_xlat6.x * u_xlat6.x;
    u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
    u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat11 * u_xlat6.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb2.x = abs(u_xlat10.y)<abs(u_xlat10.x);
    u_xlat16 = u_xlatb2.x ? u_xlat16 : float(0.0);
    u_xlat6.x = u_xlat6.x * u_xlat11 + u_xlat16;
    u_xlatb11 = u_xlat10.y<(-u_xlat10.y);
    u_xlat11 = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat11 + u_xlat6.x;
    u_xlat11 = min(u_xlat10.y, u_xlat10.x);
    u_xlat10.x = max(u_xlat10.y, u_xlat10.x);
    u_xlatb10 = u_xlat10.x>=(-u_xlat10.x);
    u_xlatb15 = u_xlat11<(-u_xlat11);
    u_xlatb10 = u_xlatb10 && u_xlatb15;
    u_xlat10.x = (u_xlatb10) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat6.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb2.xy = greaterThanEqual(u_xlat6.xyxx, (-u_xlat6.xyxx)).xy;
    u_xlat6.xy = fract(abs(u_xlat6.xy));
    {
        vec2 hlslcc_movcTemp = u_xlat6;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat6.x : (-u_xlat6.x);
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat6.y : (-u_xlat6.y);
        u_xlat6 = hlslcc_movcTemp;
    }
    u_xlatb6.xy = lessThan(u_xlat6.xyxx, vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat15 = (u_xlatb6.x) ? (-_TransitionParams.x) : _TransitionParams.x;
    u_xlat15 = (u_xlatb6.y) ? (-u_xlat15) : u_xlat15;
    u_xlat6.x = (-u_xlat1.x) + 0.5;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat15 = u_xlat15 * u_xlat6.x;
    u_xlat10.x = u_xlat15 * _TransitionProgress + u_xlat10.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat10.xy = u_xlat3.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.x = float(1.0) / _TransitionParams.y;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat10.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_4.xyz);
    u_xlat16 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat16 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat11;
bool u_xlatb11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx * _TransitionParams.yy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.yx);
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat10.xy = u_xlat10.xy / u_xlat1.xx;
    u_xlat6.x = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat11 = min(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6.x = u_xlat6.x * u_xlat11;
    u_xlat11 = u_xlat6.x * u_xlat6.x;
    u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
    u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat11 * u_xlat6.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb2.x = abs(u_xlat10.y)<abs(u_xlat10.x);
    u_xlat16 = u_xlatb2.x ? u_xlat16 : float(0.0);
    u_xlat6.x = u_xlat6.x * u_xlat11 + u_xlat16;
    u_xlatb11 = u_xlat10.y<(-u_xlat10.y);
    u_xlat11 = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat11 + u_xlat6.x;
    u_xlat11 = min(u_xlat10.y, u_xlat10.x);
    u_xlat10.x = max(u_xlat10.y, u_xlat10.x);
    u_xlatb10 = u_xlat10.x>=(-u_xlat10.x);
    u_xlatb15 = u_xlat11<(-u_xlat11);
    u_xlatb10 = u_xlatb10 && u_xlatb15;
    u_xlat10.x = (u_xlatb10) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat6.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb2.xy = greaterThanEqual(u_xlat6.xyxx, (-u_xlat6.xyxx)).xy;
    u_xlat6.xy = fract(abs(u_xlat6.xy));
    {
        vec2 hlslcc_movcTemp = u_xlat6;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat6.x : (-u_xlat6.x);
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat6.y : (-u_xlat6.y);
        u_xlat6 = hlslcc_movcTemp;
    }
    u_xlatb6.xy = lessThan(u_xlat6.xyxx, vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat15 = (u_xlatb6.x) ? (-_TransitionParams.x) : _TransitionParams.x;
    u_xlat15 = (u_xlatb6.y) ? (-u_xlat15) : u_xlat15;
    u_xlat6.x = (-u_xlat1.x) + 0.5;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat15 = u_xlat15 * u_xlat6.x;
    u_xlat10.x = u_xlat15 * _TransitionProgress + u_xlat10.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat10.xy = u_xlat3.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.x = float(1.0) / _TransitionParams.y;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat10.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_4.xyz);
    u_xlat16 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat16 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat11;
bool u_xlatb11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx * _TransitionParams.yy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.yx);
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat10.xy = u_xlat10.xy / u_xlat1.xx;
    u_xlat6.x = max(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat11 = min(abs(u_xlat10.y), abs(u_xlat10.x));
    u_xlat6.x = u_xlat6.x * u_xlat11;
    u_xlat11 = u_xlat6.x * u_xlat6.x;
    u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
    u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat11 * u_xlat6.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb2.x = abs(u_xlat10.y)<abs(u_xlat10.x);
    u_xlat16 = u_xlatb2.x ? u_xlat16 : float(0.0);
    u_xlat6.x = u_xlat6.x * u_xlat11 + u_xlat16;
    u_xlatb11 = u_xlat10.y<(-u_xlat10.y);
    u_xlat11 = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat11 + u_xlat6.x;
    u_xlat11 = min(u_xlat10.y, u_xlat10.x);
    u_xlat10.x = max(u_xlat10.y, u_xlat10.x);
    u_xlatb10 = u_xlat10.x>=(-u_xlat10.x);
    u_xlatb15 = u_xlat11<(-u_xlat11);
    u_xlatb10 = u_xlatb10 && u_xlatb15;
    u_xlat10.x = (u_xlatb10) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat6.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb2.xy = greaterThanEqual(u_xlat6.xyxx, (-u_xlat6.xyxx)).xy;
    u_xlat6.xy = fract(abs(u_xlat6.xy));
    {
        vec2 hlslcc_movcTemp = u_xlat6;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat6.x : (-u_xlat6.x);
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat6.y : (-u_xlat6.y);
        u_xlat6 = hlslcc_movcTemp;
    }
    u_xlatb6.xy = lessThan(u_xlat6.xyxx, vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat15 = (u_xlatb6.x) ? (-_TransitionParams.x) : _TransitionParams.x;
    u_xlat15 = (u_xlatb6.y) ? (-u_xlat15) : u_xlat15;
    u_xlat6.x = (-u_xlat1.x) + 0.5;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat15 = u_xlat15 * u_xlat6.x;
    u_xlat10.x = u_xlat15 * _TransitionProgress + u_xlat10.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat10.xy = u_xlat3.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.x = float(1.0) / _TransitionParams.y;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat10.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_4.xyz);
    u_xlat16 = (-u_xlat16_0.w) + u_xlat10_1.w;
    u_xlat2.w = _TransitionProgress * u_xlat16 + u_xlat16_0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat5;
bvec2 u_xlatb5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat9;
bool u_xlatb9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx * _TransitionParams.yy;
    u_xlat8.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.yx);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat8.xy = u_xlat8.xy / u_xlat1.xx;
    u_xlat5.x = max(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat9 = min(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5.x = u_xlat5.x * u_xlat9;
    u_xlat9 = u_xlat5.x * u_xlat5.x;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat9 * u_xlat5.x;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb2.x = abs(u_xlat8.y)<abs(u_xlat8.x);
    u_xlat13 = u_xlatb2.x ? u_xlat13 : float(0.0);
    u_xlat5.x = u_xlat5.x * u_xlat9 + u_xlat13;
    u_xlatb9 = u_xlat8.y<(-u_xlat8.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat5.x = u_xlat9 + u_xlat5.x;
    u_xlat9 = min(u_xlat8.y, u_xlat8.x);
    u_xlat8.x = max(u_xlat8.y, u_xlat8.x);
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
    u_xlatb12 = u_xlat9<(-u_xlat9);
    u_xlatb8 = u_xlatb8 && u_xlatb12;
    u_xlat8.x = (u_xlatb8) ? (-u_xlat5.x) : u_xlat5.x;
    u_xlat5.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb2.xy = greaterThanEqual(u_xlat5.xyxx, (-u_xlat5.xyxx)).xy;
    u_xlat5.xy = fract(abs(u_xlat5.xy));
    {
        vec2 hlslcc_movcTemp = u_xlat5;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat5.x : (-u_xlat5.x);
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat5.y : (-u_xlat5.y);
        u_xlat5 = hlslcc_movcTemp;
    }
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat12 = (u_xlatb5.x) ? (-_TransitionParams.x) : _TransitionParams.x;
    u_xlat12 = (u_xlatb5.y) ? (-u_xlat12) : u_xlat12;
    u_xlat5.x = (-u_xlat1.x) + 0.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat12 = u_xlat12 * u_xlat5.x;
    u_xlat8.x = u_xlat12 * _TransitionProgress + u_xlat8.x;
    u_xlat2 = sin(u_xlat8.x);
    u_xlat3.x = cos(u_xlat8.x);
    u_xlat3.y = u_xlat2;
    u_xlat8.xy = u_xlat3.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.x = float(1.0) / _TransitionParams.y;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat8.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat5;
bvec2 u_xlatb5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat9;
bool u_xlatb9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx * _TransitionParams.yy;
    u_xlat8.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.yx);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat8.xy = u_xlat8.xy / u_xlat1.xx;
    u_xlat5.x = max(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat9 = min(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5.x = u_xlat5.x * u_xlat9;
    u_xlat9 = u_xlat5.x * u_xlat5.x;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat9 * u_xlat5.x;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb2.x = abs(u_xlat8.y)<abs(u_xlat8.x);
    u_xlat13 = u_xlatb2.x ? u_xlat13 : float(0.0);
    u_xlat5.x = u_xlat5.x * u_xlat9 + u_xlat13;
    u_xlatb9 = u_xlat8.y<(-u_xlat8.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat5.x = u_xlat9 + u_xlat5.x;
    u_xlat9 = min(u_xlat8.y, u_xlat8.x);
    u_xlat8.x = max(u_xlat8.y, u_xlat8.x);
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
    u_xlatb12 = u_xlat9<(-u_xlat9);
    u_xlatb8 = u_xlatb8 && u_xlatb12;
    u_xlat8.x = (u_xlatb8) ? (-u_xlat5.x) : u_xlat5.x;
    u_xlat5.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb2.xy = greaterThanEqual(u_xlat5.xyxx, (-u_xlat5.xyxx)).xy;
    u_xlat5.xy = fract(abs(u_xlat5.xy));
    {
        vec2 hlslcc_movcTemp = u_xlat5;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat5.x : (-u_xlat5.x);
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat5.y : (-u_xlat5.y);
        u_xlat5 = hlslcc_movcTemp;
    }
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat12 = (u_xlatb5.x) ? (-_TransitionParams.x) : _TransitionParams.x;
    u_xlat12 = (u_xlatb5.y) ? (-u_xlat12) : u_xlat12;
    u_xlat5.x = (-u_xlat1.x) + 0.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat12 = u_xlat12 * u_xlat5.x;
    u_xlat8.x = u_xlat12 * _TransitionProgress + u_xlat8.x;
    u_xlat2 = sin(u_xlat8.x);
    u_xlat3.x = cos(u_xlat8.x);
    u_xlat3.y = u_xlat2;
    u_xlat8.xy = u_xlat3.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.x = float(1.0) / _TransitionParams.y;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat8.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
float u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat5;
bvec2 u_xlatb5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat9;
bool u_xlatb9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx * _TransitionParams.yy;
    u_xlat8.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.yx);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat8.xy = u_xlat8.xy / u_xlat1.xx;
    u_xlat5.x = max(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat9 = min(abs(u_xlat8.y), abs(u_xlat8.x));
    u_xlat5.x = u_xlat5.x * u_xlat9;
    u_xlat9 = u_xlat5.x * u_xlat5.x;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat9 * u_xlat5.x;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb2.x = abs(u_xlat8.y)<abs(u_xlat8.x);
    u_xlat13 = u_xlatb2.x ? u_xlat13 : float(0.0);
    u_xlat5.x = u_xlat5.x * u_xlat9 + u_xlat13;
    u_xlatb9 = u_xlat8.y<(-u_xlat8.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat5.x = u_xlat9 + u_xlat5.x;
    u_xlat9 = min(u_xlat8.y, u_xlat8.x);
    u_xlat8.x = max(u_xlat8.y, u_xlat8.x);
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
    u_xlatb12 = u_xlat9<(-u_xlat9);
    u_xlatb8 = u_xlatb8 && u_xlatb12;
    u_xlat8.x = (u_xlatb8) ? (-u_xlat5.x) : u_xlat5.x;
    u_xlat5.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb2.xy = greaterThanEqual(u_xlat5.xyxx, (-u_xlat5.xyxx)).xy;
    u_xlat5.xy = fract(abs(u_xlat5.xy));
    {
        vec2 hlslcc_movcTemp = u_xlat5;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat5.x : (-u_xlat5.x);
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat5.y : (-u_xlat5.y);
        u_xlat5 = hlslcc_movcTemp;
    }
    u_xlatb5.xy = lessThan(u_xlat5.xyxx, vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat12 = (u_xlatb5.x) ? (-_TransitionParams.x) : _TransitionParams.x;
    u_xlat12 = (u_xlatb5.y) ? (-u_xlat12) : u_xlat12;
    u_xlat5.x = (-u_xlat1.x) + 0.5;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat12 = u_xlat12 * u_xlat5.x;
    u_xlat8.x = u_xlat12 * _TransitionProgress + u_xlat8.x;
    u_xlat2 = sin(u_xlat8.x);
    u_xlat3.x = cos(u_xlat8.x);
    u_xlat3.y = u_xlat2;
    u_xlat8.xy = u_xlat3.xy * u_xlat1.xx + vec2(0.5, 0.5);
    u_xlat1.x = float(1.0) / _TransitionParams.y;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat8.xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = (-u_xlat16_0) + u_xlat10_1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat16_0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SWIRLGRID" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat8;
bvec2 u_xlatb8;
float u_xlat9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat8.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _TransitionParams.x;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat12);
    u_xlat1.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat5 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat5 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat5 * 0.0208350997 + -0.0851330012;
    u_xlat9 = u_xlat5 * u_xlat9 + 0.180141002;
    u_xlat9 = u_xlat5 * u_xlat9 + -0.330299497;
    u_xlat5 = u_xlat5 * u_xlat9 + 0.999866009;
    u_xlat9 = u_xlat5 * u_xlat1.x;
    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
    u_xlatb13 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat5 + u_xlat9;
    u_xlatb5 = u_xlat0.y<(-u_xlat0.y);
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat5 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb4 = u_xlat5<(-u_xlat5);
    u_xlatb0 = u_xlatb0 && u_xlatb4;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat0.x = u_xlat8.x * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat12) + vec2(0.5, 0.5);
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb1.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat1.xxxx * (-u_xlat10_2) + u_xlat10_2;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat0.w) + u_xlat1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat8;
bvec2 u_xlatb8;
float u_xlat9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat8.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _TransitionParams.x;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat12);
    u_xlat1.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat5 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat5 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat5 * 0.0208350997 + -0.0851330012;
    u_xlat9 = u_xlat5 * u_xlat9 + 0.180141002;
    u_xlat9 = u_xlat5 * u_xlat9 + -0.330299497;
    u_xlat5 = u_xlat5 * u_xlat9 + 0.999866009;
    u_xlat9 = u_xlat5 * u_xlat1.x;
    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
    u_xlatb13 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat5 + u_xlat9;
    u_xlatb5 = u_xlat0.y<(-u_xlat0.y);
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat5 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb4 = u_xlat5<(-u_xlat5);
    u_xlatb0 = u_xlatb0 && u_xlatb4;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat0.x = u_xlat8.x * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat12) + vec2(0.5, 0.5);
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb1.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat1.xxxx * (-u_xlat10_2) + u_xlat10_2;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat0.w) + u_xlat1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
bool u_xlatb4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat8;
bvec2 u_xlatb8;
float u_xlat9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat8.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _TransitionParams.x;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat12);
    u_xlat1.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat5 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat5 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat5 * 0.0208350997 + -0.0851330012;
    u_xlat9 = u_xlat5 * u_xlat9 + 0.180141002;
    u_xlat9 = u_xlat5 * u_xlat9 + -0.330299497;
    u_xlat5 = u_xlat5 * u_xlat9 + 0.999866009;
    u_xlat9 = u_xlat5 * u_xlat1.x;
    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
    u_xlatb13 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat5 + u_xlat9;
    u_xlatb5 = u_xlat0.y<(-u_xlat0.y);
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat5 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb4 = u_xlat5<(-u_xlat5);
    u_xlatb0 = u_xlatb0 && u_xlatb4;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat0.x = u_xlat8.x * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat12) + vec2(0.5, 0.5);
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb1.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat1.xxxx * (-u_xlat10_2) + u_xlat10_2;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + (-u_xlat16_3.xyz);
    u_xlat13 = (-u_xlat0.w) + u_xlat1.w;
    u_xlat2.w = _TransitionProgress * u_xlat13 + u_xlat0.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat1.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bool u_xlatb3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
bvec2 u_xlatb6;
float u_xlat7;
float u_xlat9;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _TransitionParams.x;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat9);
    u_xlat1.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat4 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = u_xlat1.x * u_xlat4;
    u_xlat4 = u_xlat1.x * u_xlat1.x;
    u_xlat7 = u_xlat4 * 0.0208350997 + -0.0851330012;
    u_xlat7 = u_xlat4 * u_xlat7 + 0.180141002;
    u_xlat7 = u_xlat4 * u_xlat7 + -0.330299497;
    u_xlat4 = u_xlat4 * u_xlat7 + 0.999866009;
    u_xlat7 = u_xlat4 * u_xlat1.x;
    u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
    u_xlatb10 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat7 = u_xlatb10 ? u_xlat7 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat4 + u_xlat7;
    u_xlatb4 = u_xlat0.y<(-u_xlat0.y);
    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat4 + u_xlat1.x;
    u_xlat4 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat4<(-u_xlat4);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat0.x = u_xlat6.x * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat9) + vec2(0.5, 0.5);
    u_xlatb6.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb1.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat1.xxxx * (-u_xlat10_2) + u_xlat10_2;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bool u_xlatb3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
bvec2 u_xlatb6;
float u_xlat7;
float u_xlat9;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _TransitionParams.x;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat9);
    u_xlat1.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat4 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = u_xlat1.x * u_xlat4;
    u_xlat4 = u_xlat1.x * u_xlat1.x;
    u_xlat7 = u_xlat4 * 0.0208350997 + -0.0851330012;
    u_xlat7 = u_xlat4 * u_xlat7 + 0.180141002;
    u_xlat7 = u_xlat4 * u_xlat7 + -0.330299497;
    u_xlat4 = u_xlat4 * u_xlat7 + 0.999866009;
    u_xlat7 = u_xlat4 * u_xlat1.x;
    u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
    u_xlatb10 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat7 = u_xlatb10 ? u_xlat7 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat4 + u_xlat7;
    u_xlatb4 = u_xlat0.y<(-u_xlat0.y);
    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat4 + u_xlat1.x;
    u_xlat4 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat4<(-u_xlat4);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat0.x = u_xlat6.x * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat9) + vec2(0.5, 0.5);
    u_xlatb6.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb1.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat1.xxxx * (-u_xlat10_2) + u_xlat10_2;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bool u_xlatb3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
bvec2 u_xlatb6;
float u_xlat7;
float u_xlat9;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _TransitionParams.x;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat9);
    u_xlat1.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat4 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat1.x = u_xlat1.x * u_xlat4;
    u_xlat4 = u_xlat1.x * u_xlat1.x;
    u_xlat7 = u_xlat4 * 0.0208350997 + -0.0851330012;
    u_xlat7 = u_xlat4 * u_xlat7 + 0.180141002;
    u_xlat7 = u_xlat4 * u_xlat7 + -0.330299497;
    u_xlat4 = u_xlat4 * u_xlat7 + 0.999866009;
    u_xlat7 = u_xlat4 * u_xlat1.x;
    u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
    u_xlatb10 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat7 = u_xlatb10 ? u_xlat7 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat4 + u_xlat7;
    u_xlatb4 = u_xlat0.y<(-u_xlat0.y);
    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat4 + u_xlat1.x;
    u_xlat4 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb3 = u_xlat4<(-u_xlat4);
    u_xlatb0 = u_xlatb0 && u_xlatb3;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat0.x = u_xlat6.x * _TransitionProgress + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat9) + vec2(0.5, 0.5);
    u_xlatb6.xy = greaterThanEqual(u_xlat0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat0 = u_xlat0.xxxx * (-u_xlat16_2) + u_xlat16_2;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb1.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat1.xxxx * (-u_xlat10_2) + u_xlat10_2;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = vec4(_TransitionProgress) * u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_SWIRL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WATER" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat4.y = fract(u_xlat0.x);
    u_xlat4.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat4.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(_TransitionProgress);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat3.xyz;
    u_xlatb3 = 0.0<u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat10_2.w;
    u_xlat0.x = _TransitionProgress * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_1.w = (u_xlatb3) ? u_xlat0.x : u_xlat10_2.w;
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WATER" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat4.y = fract(u_xlat0.x);
    u_xlat4.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat4.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(_TransitionProgress);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat3.xyz;
    u_xlatb3 = 0.0<u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat10_2.w;
    u_xlat0.x = _TransitionProgress * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_1.w = (u_xlatb3) ? u_xlat0.x : u_xlat10_2.w;
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WATER" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat4.y = fract(u_xlat0.x);
    u_xlat4.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat4.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat10_2 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat10_2.www + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(_TransitionProgress);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_0.www + u_xlat3.xyz;
    u_xlatb3 = 0.0<u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.x = (-u_xlat16_0.w) + u_xlat10_2.w;
    u_xlat0.x = _TransitionProgress * u_xlat0.x + u_xlat16_0.w;
    u_xlat16_1.w = (u_xlatb3) ? u_xlat0.x : u_xlat10_2.w;
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WATER" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WATER" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WATER" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WATER" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat3.y = fract(u_xlat0.x);
    u_xlat3.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat3.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_0) + u_xlat1;
    u_xlat2 = vec4(_TransitionProgress) * u_xlat2 + u_xlat16_0;
    u_xlatb0 = 0.0<u_xlat16_0.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WATER" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat3.y = fract(u_xlat0.x);
    u_xlat3.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat3.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_0) + u_xlat1;
    u_xlat2 = vec4(_TransitionProgress) * u_xlat2 + u_xlat16_0;
    u_xlatb0 = 0.0<u_xlat16_0.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WATER" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec2 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = min(_RandomSeed.xxxy.z, 0.899999976);
    u_xlat0.x = vs_TEXCOORD0.y * 0.100000001 + u_xlat0.x;
    u_xlat3.y = fract(u_xlat0.x);
    u_xlat3.x = vs_TEXCOORD0.x * 0.100000001;
    u_xlat10_0.xy = texture(_CloudsTex, u_xlat3.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_TransitionProgress) + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_0) + u_xlat1;
    u_xlat2 = vec4(_TransitionProgress) * u_xlat2 + u_xlat16_0;
    u_xlatb0 = 0.0<u_xlat16_0.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WATER" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WATER" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WATER" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = phase0_Input0_2.x;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + _TransitionProgress;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = (-u_xlat0.xx) + phase0_Input0_2.yw;
    u_xlat1.y = fract(u_xlat0.x);
    u_xlat1.x = fract(phase0_Input0_2.x);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.z = phase0_Input0_2.z;
    u_xlat2 = texture(_TransitionTex, u_xlat0.zy);
    u_xlatb0 = 0.0<u_xlat0.x;
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = phase0_Input0_2.x;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + _TransitionProgress;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = (-u_xlat0.xx) + phase0_Input0_2.yw;
    u_xlat1.y = fract(u_xlat0.x);
    u_xlat1.x = fract(phase0_Input0_2.x);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.z = phase0_Input0_2.z;
    u_xlat2 = texture(_TransitionTex, u_xlat0.zy);
    u_xlatb0 = 0.0<u_xlat0.x;
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = phase0_Input0_2.x;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + _TransitionProgress;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = (-u_xlat0.xx) + phase0_Input0_2.yw;
    u_xlat1.y = fract(u_xlat0.x);
    u_xlat1.x = fract(phase0_Input0_2.x);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.z = phase0_Input0_2.z;
    u_xlat2 = texture(_TransitionTex, u_xlat0.zy);
    u_xlatb0 = 0.0<u_xlat0.x;
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    u_xlat16_3.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = phase0_Input0_2.x;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + _TransitionProgress;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = (-u_xlat0.xx) + phase0_Input0_2.yw;
    u_xlat1.y = fract(u_xlat0.x);
    u_xlat1.x = fract(phase0_Input0_2.x);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.z = phase0_Input0_2.z;
    u_xlat2 = texture(_TransitionTex, u_xlat0.zy);
    u_xlatb0 = 0.0<u_xlat0.x;
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = phase0_Input0_2.x;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + _TransitionProgress;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = (-u_xlat0.xx) + phase0_Input0_2.yw;
    u_xlat1.y = fract(u_xlat0.x);
    u_xlat1.x = fract(phase0_Input0_2.x);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.z = phase0_Input0_2.z;
    u_xlat2 = texture(_TransitionTex, u_xlat0.zy);
    u_xlatb0 = 0.0<u_xlat0.x;
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec2 _RandomSeed;
UNITY_LOCATION(0) uniform mediump sampler2D _CloudsTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
highp vec4 phase0_Input0_2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    phase0_Input0_2 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0.x = phase0_Input0_2.x;
    u_xlat0.y = _RandomSeed.xxxy.z;
    u_xlat10_0 = texture(_CloudsTex, u_xlat0.xy).x;
    u_xlat0.x = _TransitionProgress * u_xlat10_0 + _TransitionProgress;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = (-u_xlat0.xx) + phase0_Input0_2.yw;
    u_xlat1.y = fract(u_xlat0.x);
    u_xlat1.x = fract(phase0_Input0_2.x);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.z = phase0_Input0_2.z;
    u_xlat2 = texture(_TransitionTex, u_xlat0.zy);
    u_xlatb0 = 0.0<u_xlat0.x;
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WATERFALL" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
vec2 u_xlat11;
bvec2 u_xlatb11;
float u_xlat15;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat10_1) + u_xlat10_1;
    u_xlat1.xy = vec2(_TransitionProgress) * _TransitionParams.xy;
    u_xlat6 = _TransitionParams.z * vs_TEXCOORD0.y + u_xlat1.y;
    u_xlat6 = sin(u_xlat6);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlatb11.xy = greaterThanEqual(u_xlat1.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat11.x = u_xlatb11.x ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat1 = u_xlat1.xxxx * (-u_xlat16_3) + u_xlat16_3;
    u_xlat16_4.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.www + (-u_xlat16_4.xyz);
    u_xlat15 = u_xlat0.w + (-u_xlat1.w);
    u_xlat2.w = _TransitionProgress * u_xlat15 + u_xlat1.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.www + u_xlat0.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
vec2 u_xlat11;
bvec2 u_xlatb11;
float u_xlat15;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat10_1) + u_xlat10_1;
    u_xlat1.xy = vec2(_TransitionProgress) * _TransitionParams.xy;
    u_xlat6 = _TransitionParams.z * vs_TEXCOORD0.y + u_xlat1.y;
    u_xlat6 = sin(u_xlat6);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlatb11.xy = greaterThanEqual(u_xlat1.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat11.x = u_xlatb11.x ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat1 = u_xlat1.xxxx * (-u_xlat16_3) + u_xlat16_3;
    u_xlat16_4.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.www + (-u_xlat16_4.xyz);
    u_xlat15 = u_xlat0.w + (-u_xlat1.w);
    u_xlat2.w = _TransitionProgress * u_xlat15 + u_xlat1.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.www + u_xlat0.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
vec2 u_xlat11;
bvec2 u_xlatb11;
float u_xlat15;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat10_1) + u_xlat10_1;
    u_xlat1.xy = vec2(_TransitionProgress) * _TransitionParams.xy;
    u_xlat6 = _TransitionParams.z * vs_TEXCOORD0.y + u_xlat1.y;
    u_xlat6 = sin(u_xlat6);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlatb11.xy = greaterThanEqual(u_xlat1.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat11.x = u_xlatb11.x ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat1 = u_xlat1.xxxx * (-u_xlat16_3) + u_xlat16_3;
    u_xlat16_4.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.www + (-u_xlat16_4.xyz);
    u_xlat15 = u_xlat0.w + (-u_xlat1.w);
    u_xlat2.w = _TransitionProgress * u_xlat15 + u_xlat1.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_TransitionProgress);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.www + u_xlat0.xyz;
    SV_Target0 = u_xlat2 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
float u_xlat5;
vec2 u_xlat9;
bvec2 u_xlatb9;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat10_1) + u_xlat10_1;
    u_xlat1.xy = vec2(_TransitionProgress) * _TransitionParams.xy;
    u_xlat5 = _TransitionParams.z * vs_TEXCOORD0.y + u_xlat1.y;
    u_xlat5 = sin(u_xlat5);
    u_xlat1.x = u_xlat5 * u_xlat1.x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlatb9.xy = greaterThanEqual(u_xlat1.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat9.x = u_xlatb9.x ? float(1.0) : 0.0;
    u_xlat9.y = u_xlatb9.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat9.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat1 = u_xlat1.xxxx * (-u_xlat16_3) + u_xlat16_3;
    u_xlat0 = u_xlat0 + (-u_xlat1);
    u_xlat0 = vec4(_TransitionProgress) * u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
float u_xlat5;
vec2 u_xlat9;
bvec2 u_xlatb9;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat10_1) + u_xlat10_1;
    u_xlat1.xy = vec2(_TransitionProgress) * _TransitionParams.xy;
    u_xlat5 = _TransitionParams.z * vs_TEXCOORD0.y + u_xlat1.y;
    u_xlat5 = sin(u_xlat5);
    u_xlat1.x = u_xlat5 * u_xlat1.x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlatb9.xy = greaterThanEqual(u_xlat1.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat9.x = u_xlatb9.x ? float(1.0) : 0.0;
    u_xlat9.y = u_xlatb9.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat9.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat1 = u_xlat1.xxxx * (-u_xlat16_3) + u_xlat16_3;
    u_xlat0 = u_xlat0 + (-u_xlat1);
    u_xlat0 = vec4(_TransitionProgress) * u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
float u_xlat5;
vec2 u_xlat9;
bvec2 u_xlatb9;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.y + 1.0;
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat0 = u_xlat0.xxxx * (-u_xlat10_1) + u_xlat10_1;
    u_xlat1.xy = vec2(_TransitionProgress) * _TransitionParams.xy;
    u_xlat5 = _TransitionParams.z * vs_TEXCOORD0.y + u_xlat1.y;
    u_xlat5 = sin(u_xlat5);
    u_xlat1.x = u_xlat5 * u_xlat1.x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlatb9.xy = greaterThanEqual(u_xlat1.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat9.x = u_xlatb9.x ? float(1.0) : 0.0;
    u_xlat9.y = u_xlatb9.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat9.xy;
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.y + 1.0;
    u_xlat1 = u_xlat1.xxxx * (-u_xlat16_3) + u_xlat16_3;
    u_xlat0 = u_xlat0 + (-u_xlat1);
    u_xlat0 = vec4(_TransitionProgress) * u_xlat0 + u_xlat1;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_WAVE" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat10_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat4.x = u_xlat10_0 * -2.0 + 1.0;
    u_xlat0.x = _TransitionParams.y * u_xlat4.x + u_xlat10_0;
    u_xlat0.x = (-u_xlat0.x) + _TransitionProgress;
    u_xlat4.x = min(_TransitionParams.x, 100.0);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 100.0;
    u_xlat0.x = u_xlat0.x * u_xlat4.x + _TransitionProgress;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat10_1.w + (-u_xlat16_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat16_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat10_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat4.x = u_xlat10_0 * -2.0 + 1.0;
    u_xlat0.x = _TransitionParams.y * u_xlat4.x + u_xlat10_0;
    u_xlat0.x = (-u_xlat0.x) + _TransitionProgress;
    u_xlat4.x = min(_TransitionParams.x, 100.0);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 100.0;
    u_xlat0.x = u_xlat0.x * u_xlat4.x + _TransitionProgress;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat10_1.w + (-u_xlat16_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat16_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat10_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat4.x = u_xlat10_0 * -2.0 + 1.0;
    u_xlat0.x = _TransitionParams.y * u_xlat4.x + u_xlat10_0;
    u_xlat0.x = (-u_xlat0.x) + _TransitionProgress;
    u_xlat4.x = min(_TransitionParams.x, 100.0);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 100.0;
    u_xlat0.x = u_xlat0.x * u_xlat4.x + _TransitionProgress;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat10_1.www + (-u_xlat16_3.xyz);
    u_xlat1.x = u_xlat10_1.w + (-u_xlat16_2.w);
    u_xlat1.w = u_xlat0.x * u_xlat1.x + u_xlat16_2.w;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat16_2.xyz * u_xlat16_2.www + u_xlat0.xyz;
    SV_Target0 = u_xlat1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat10_0 * -2.0 + 1.0;
    u_xlat0.x = _TransitionParams.y * u_xlat3 + u_xlat10_0;
    u_xlat0.x = (-u_xlat0.x) + _TransitionProgress;
    u_xlat3 = min(_TransitionParams.x, 100.0);
    u_xlat3 = max(u_xlat3, 0.0);
    u_xlat3 = (-u_xlat3) + 100.0;
    u_xlat0.x = u_xlat0.x * u_xlat3 + _TransitionProgress;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + (-u_xlat16_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat16_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat10_0 * -2.0 + 1.0;
    u_xlat0.x = _TransitionParams.y * u_xlat3 + u_xlat10_0;
    u_xlat0.x = (-u_xlat0.x) + _TransitionProgress;
    u_xlat3 = min(_TransitionParams.x, 100.0);
    u_xlat3 = max(u_xlat3, 0.0);
    u_xlat3 = (-u_xlat3) + 100.0;
    u_xlat0.x = u_xlat0.x * u_xlat3 + _TransitionProgress;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + (-u_xlat16_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat16_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" "PREMULTIPLIED_ALPHA" }
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TransitionTex_ST;
uniform 	float _FlipMainX;
uniform 	mediump vec4 _TintColor;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0 = in_COLOR0 * _TintColor;
    vs_COLOR0 = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = u_xlat0.x * -2.0 + 1.0;
    vs_TEXCOORD0.x = _FlipMainX * u_xlat4 + u_xlat0.x;
    vs_TEXCOORD0.y = u_xlat0.y;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _TransitionTex_ST.xy + _TransitionTex_ST.zw;
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
uniform 	float _TransitionProgress;
uniform 	vec4 _TransitionParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_DissolveTex, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat10_0 * -2.0 + 1.0;
    u_xlat0.x = _TransitionParams.y * u_xlat3 + u_xlat10_0;
    u_xlat0.x = (-u_xlat0.x) + _TransitionProgress;
    u_xlat3 = min(_TransitionParams.x, 100.0);
    u_xlat3 = max(u_xlat3, 0.0);
    u_xlat3 = (-u_xlat3) + 100.0;
    u_xlat0.x = u_xlat0.x * u_xlat3 + _TransitionProgress;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture(_TransitionTex, vs_TEXCOORD1.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + (-u_xlat16_2);
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat16_2;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "NANINOVEL_TRANSITION_CUSTOM" "PREMULTIPLIED_ALPHA" }
"// disassembly error Unable to decode SMOL-V shader
"
}
}
}
}
}