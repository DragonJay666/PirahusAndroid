//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-UIRDefaultWorld" {
Properties {
_MainTex ("Atlas", 2D) = "white" { }
_FontTex ("Font", 2D) = "black" { }
_CustomTex ("Custom", 2D) = "black" { }
_Color ("Tint", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_VertexTexturingIsAvailable" = "1" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_VertexTexturingIsAvailable" = "1" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 23110
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
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _ClipSpaceParams;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out highp vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
bvec4 u_xlatb5;
mediump vec2 u_xlat16_6;
vec4 u_xlat7;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
vec2 u_xlat19;
mediump vec2 u_xlat16_24;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat18.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat0.xz = u_xlat18.xy * vec2(0.09375, 0.03125);
    u_xlat1.y = in_TEXCOORD1.y * 2040.0 + u_xlat0.x;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat0.xw = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
    u_xlat0.x = in_TEXCOORD3.x * 255.0;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlat4 = (-u_xlat0.xxxx) + vec4(4.0, 3.0, 2.0, 1.0);
    u_xlatb4 = lessThan(abs(u_xlat4), vec4(9.99999975e-05, 9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat5.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat5.w = u_xlatb4.w ? float(1.0) : 0.0;
;
    u_xlat0.xw = u_xlat5.zz + u_xlat5.wy;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat0.x = u_xlat5.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19.x = dot(u_xlat1, in_POSITION0);
    u_xlat19.y = dot(u_xlat2, in_POSITION0);
    u_xlat1.x = dot(u_xlat3, in_POSITION0);
    u_xlat2 = u_xlat19.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat19.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlatb1.x = _FontTexSDFScale==0.0;
    u_xlatb1.x = u_xlatb1.x && u_xlatb4.w;
    u_xlat3.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat3.xy = u_xlat3.xy * _ClipSpaceParams.xy + vec2(0.152700007, 0.152700007);
    u_xlat3.xy = roundEven(u_xlat3.xy);
    u_xlat3.xy = u_xlat3.xy * _ClipSpaceParams.zw + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlatb1.x) ? u_xlat3.xy : u_xlat2.xy;
    u_xlat1.x = u_xlatb4.w ? float(2.0) : 0.0;
    u_xlat1.y = u_xlatb4.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.w * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat1.y + u_xlat0.x;
    u_xlat16_6.y = 0.0;
    u_xlat16_24.x = float(0.0);
    u_xlat16_24.y = float(0.0);
    u_xlati27 = 0;
    while(true){
        u_xlatb1.x = u_xlat16_24.y>=7.0;
        u_xlati27 = 0;
        if(u_xlatb1.x){break;}
        u_xlatu1 = uint(u_xlat16_24.y);
        u_xlatb1.x = in_TEXCOORD6==_TextureInfo[int(u_xlatu1)].x;
        if(u_xlatb1.x){
            u_xlat16_24.x = u_xlat16_24.y;
            u_xlati27 = int(0xFFFFFFFFu);
            break;
        }
        u_xlat16_6.x = u_xlat16_24.y + 1.0;
        u_xlat16_24.xy = u_xlat16_6.yx;
        u_xlatb27 = u_xlatb1.x;
    }
    u_xlat16_6.x = (u_xlati27 != 0) ? u_xlat16_24.x : 7.0;
    u_xlat27 = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzz).xy;
    u_xlat2.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat1.x = (u_xlatb1.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb1.y) ? u_xlat1.x : u_xlat2.x;
    if(u_xlatb4.y){
        u_xlatu1 = uint(u_xlat16_6.x);
        vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu1)].yz;
    } else {
        vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    }
    u_xlat2.x = in_TEXCOORD4.x * 8160.0 + u_xlat0.y;
    u_xlat2.y = in_TEXCOORD4.y * 2040.0 + u_xlat0.z;
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = u_xlat9.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat3 = in_TEXCOORD2.wwyy * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb5 = greaterThanEqual(u_xlat3.yyww, (-u_xlat3.yyww));
    u_xlat5.x = (u_xlatb5.x) ? float(32.0) : float(-32.0);
    u_xlat5.y = (u_xlatb5.y) ? float(0.03125) : float(-0.03125);
    u_xlat5.z = (u_xlatb5.z) ? float(32.0) : float(-32.0);
    u_xlat5.w = (u_xlatb5.w) ? float(0.03125) : float(-0.03125);
    u_xlat3.xyz = u_xlat3.xzx * u_xlat5.ywy;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xzx;
    u_xlat4.xyz = in_TEXCOORD2.wyw * vec3(255.0, 255.0, 255.0) + (-u_xlat3.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.03125, 0.03125, 0.125);
    u_xlat5.x = in_TEXCOORD4.z * 8160.0 + u_xlat3.z;
    u_xlat5.yz = in_TEXCOORD4.ww * vec2(2040.0, 2040.0) + u_xlat4.xz;
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _ShaderInfoTex_TexelSize.xy;
    if(u_xlatb1.y){
        u_xlat7 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
        u_xlat16_15.xyz = u_xlat7.xyz;
        u_xlat16_8 = u_xlat7.w;
    } else {
        u_xlat16_15.xyz = in_COLOR0.xyz;
        u_xlat16_8 = in_COLOR0.w;
    }
    u_xlat1.x = in_TEXCOORD1.z * 8160.0 + u_xlat3.y;
    u_xlat1.y = in_TEXCOORD1.w * 2040.0 + u_xlat4.y;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat9.x = textureLod(_ShaderInfoTex, u_xlat9.xy, 0.0).w;
    u_xlat18.x = u_xlat9.x * u_xlat16_8;
    vs_TEXCOORD1.z = (u_xlatb4.w) ? u_xlat9.x : u_xlat27;
    vs_TEXCOORD3.xy = (u_xlatb4.w) ? u_xlat5.xz : u_xlat2.xy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    vs_TEXCOORD0.zw = u_xlat19.xy * u_xlat3.xy + u_xlat3.zw;
    vs_TEXCOORD4.x = (u_xlatb4.w) ? in_TEXCOORD3.y : in_TEXCOORD5.x;
    gl_Position.zw = u_xlat2.zw;
    vs_COLOR0.xyz = u_xlat16_15.xyz;
    vs_COLOR0.w = u_xlat18.x;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat16_6.x;
    vs_TEXCOORD4.yzw = in_TEXCOORD5.yzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture4;
UNITY_LOCATION(5) uniform mediump sampler2D _Texture5;
UNITY_LOCATION(6) uniform mediump sampler2D _Texture6;
UNITY_LOCATION(7) uniform mediump sampler2D _Texture7;
UNITY_LOCATION(8) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in highp vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
uint u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
float u_xlat7;
mediump float u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
vec2 u_xlat10;
bool u_xlatb10;
bool u_xlatb11;
vec2 u_xlat12;
mediump float u_xlat16_12;
bvec2 u_xlatb12;
vec2 u_xlat14;
vec2 u_xlat15;
vec2 u_xlat16;
bool u_xlatb16;
float u_xlat18;
bool u_xlatb18;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlatb0.x = vs_TEXCOORD1.w>=2.0;
    u_xlat6 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1.x = (u_xlatb0.x) ? u_xlat6 : vs_TEXCOORD1.w;
    u_xlatb6.x = vs_TEXCOORD1.x==1.0;
    if(u_xlatb6.x){
        u_xlatb6.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
        if(u_xlatb6.x){
            u_xlatb6.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD4.xzxx).xy;
            if(u_xlatb6.x){
                u_xlat6 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                u_xlat6 = sqrt(u_xlat6);
                u_xlat6 = u_xlat6 + -1.0;
                u_xlat18 = dFdx(u_xlat6);
                u_xlat2.x = dFdy(u_xlat6);
                u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                u_xlat6 = u_xlat6 / u_xlat18;
                u_xlat6 = (-u_xlat6) + 0.5;
                u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
            } else {
                u_xlat6 = 1.0;
            }
            if(u_xlatb6.y){
                u_xlat12.x = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                u_xlat12.x = sqrt(u_xlat12.x);
                u_xlat12.x = u_xlat12.x + -1.0;
                u_xlat18 = dFdx(u_xlat12.x);
                u_xlat2.x = dFdy(u_xlat12.x);
                u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                u_xlat12.x = u_xlat12.x / u_xlat18;
                u_xlat12.x = (-u_xlat12.x) + 0.5;
                u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
                u_xlat12.x = (-u_xlat12.x) + 1.0;
                u_xlat6 = u_xlat12.x * u_xlat6;
            }
        } else {
            u_xlat6 = 1.0;
        }
        SV_Target0.xyz = vs_COLOR0.xyz;
        u_xlat16_7 = vs_COLOR0.w;
    } else {
        u_xlatb12.x = vs_TEXCOORD1.x==3.0;
        if(u_xlatb12.x){
            u_xlatb12.x = vs_TEXCOORD1.y<4.0;
            if(u_xlatb12.x){
                u_xlatb12.x = vs_TEXCOORD1.y<2.0;
                if(u_xlatb12.x){
                    u_xlatb12.x = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture0, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture1, vs_TEXCOORD0.xy);
                    }
                } else {
                    u_xlatb12.x = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture2, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture3, vs_TEXCOORD0.xy);
                    }
                }
            } else {
                u_xlatb12.x = vs_TEXCOORD1.y<6.0;
                if(u_xlatb12.x){
                    u_xlatb12.x = vs_TEXCOORD1.y<5.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture4, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture5, vs_TEXCOORD0.xy);
                    }
                } else {
                    u_xlatb12.x = vs_TEXCOORD1.y<7.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture6, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture7, vs_TEXCOORD0.xy);
                    }
                }
            }
            u_xlat2 = u_xlat16_2 * vs_COLOR0;
            u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
            if(u_xlatb12.x){
                u_xlatb12.xy = lessThan(vec4(-9999.0, -9999.0, -9999.0, -9999.0), vs_TEXCOORD4.xzxz).xy;
                if(u_xlatb12.x){
                    u_xlat12.x = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                    u_xlat12.x = sqrt(u_xlat12.x);
                    u_xlat12.x = u_xlat12.x + -1.0;
                    u_xlat3.x = dFdx(u_xlat12.x);
                    u_xlat9 = dFdy(u_xlat12.x);
                    u_xlat3.x = abs(u_xlat9) + abs(u_xlat3.x);
                    u_xlat12.x = u_xlat12.x / u_xlat3.x;
                    u_xlat6 = (-u_xlat12.x) + 0.5;
                    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
                } else {
                    u_xlat6 = 1.0;
                }
                if(u_xlatb12.y){
                    u_xlat12.x = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                    u_xlat12.x = sqrt(u_xlat12.x);
                    u_xlat12.x = u_xlat12.x + -1.0;
                    u_xlat18 = dFdx(u_xlat12.x);
                    u_xlat3.x = dFdy(u_xlat12.x);
                    u_xlat18 = abs(u_xlat18) + abs(u_xlat3.x);
                    u_xlat12.x = u_xlat12.x / u_xlat18;
                    u_xlat12.x = (-u_xlat12.x) + 0.5;
                    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
                    u_xlat12.x = (-u_xlat12.x) + 1.0;
                    u_xlat6 = u_xlat12.x * u_xlat6;
                }
            } else {
                u_xlat6 = 1.0;
            }
            SV_Target0.xyz = u_xlat2.xyz;
            u_xlat16_7 = u_xlat2.w;
        } else {
            u_xlatb12.x = vs_TEXCOORD1.x==2.0;
            if(u_xlatb12.x){
                u_xlat16_12 = texture(_FontTex, vs_TEXCOORD0.xy).w;
                u_xlatb18 = 0.0<_FontTexSDFScale;
                if(u_xlatb18){
                    u_xlat2 = vs_TEXCOORD3.xyxy + vec4(0.5, 3.5, 0.5, 1.5);
                    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
                    u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
                    u_xlat3 = u_xlat16_3 * vec4(_FontTexSDFScale);
                    u_xlat4.y = u_xlat3.w * 0.25;
                    u_xlat2.xy = u_xlat3.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                    u_xlat16_5.z = texture(_FontTex, u_xlat2.xy).w;
                    u_xlat4.x = (-u_xlat4.y);
                    u_xlat4.z = 0.0;
                    u_xlat4.xyz = u_xlat4.xyz + vs_TEXCOORD4.xxx;
                    u_xlat18 = dFdx(vs_TEXCOORD0.y);
                    u_xlat2.x = dFdy(vs_TEXCOORD0.y);
                    u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                    u_xlat16_5.xy = vec2(u_xlat16_12);
                    u_xlat5.xyz = u_xlat16_5.xyz + vec3(-0.5, -0.5, -0.5);
                    u_xlat4.xyz = u_xlat5.xyz * vec3(_FontTexSDFScale) + u_xlat4.xyz;
                    u_xlat4.xyz = u_xlat4.xyz + u_xlat4.xyz;
                    u_xlat3.x = float(0.0);
                    u_xlat3.y = float(0.0);
                    u_xlat3.xyz = _FontTex_TexelSize.www * vec3(u_xlat18) + u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat4.xyz / u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
                    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
                    if(u_xlatb0.x){
                        u_xlat0.xw = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                        u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
                        u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
                        u_xlat5.w = u_xlat16_4.w * vs_TEXCOORD1.z;
                    } else {
                        u_xlat16_4.xyz = vs_COLOR0.xyz;
                        u_xlat5.w = vs_COLOR0.w;
                    }
                    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.www;
                    u_xlat16_2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
                    u_xlat4.w = u_xlat16_2.w * vs_TEXCOORD1.z;
                    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.www;
                    u_xlat0.xw = (-u_xlat3.xy) + vec2(1.0, 1.0);
                    u_xlat2 = u_xlat0.xxxx * u_xlat4;
                    u_xlat2 = u_xlat3.yyyy * u_xlat2;
                    u_xlat2 = u_xlat5 * u_xlat3.xxxx + u_xlat2;
                    u_xlat3.xy = vs_TEXCOORD3.xy + vec2(0.5, 2.5);
                    u_xlat3.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                    u_xlat3.x = u_xlat16_4.w * vs_TEXCOORD1.z;
                    u_xlat3.w = u_xlat3.z * u_xlat3.x;
                    u_xlat3.xyz = u_xlat3.www * u_xlat16_4.xyz;
                    u_xlat3 = u_xlat0.xxxx * u_xlat3;
                    u_xlat2 = u_xlat3 * u_xlat0.wwww + u_xlat2;
                    u_xlatb0.x = 0.0<u_xlat2.w;
                    u_xlat0.x = (u_xlatb0.x) ? u_xlat2.w : 1.0;
                    u_xlat2.xyz = u_xlat2.xyz / u_xlat0.xxx;
                    SV_Target0.xyz = u_xlat2.xyz;
                    u_xlat16_7 = u_xlat2.w;
                } else {
                    u_xlat7 = u_xlat16_12 * vs_COLOR0.w;
                    SV_Target0.xyz = vs_COLOR0.xyz;
                    u_xlat16_7 = u_xlat7;
                }
            } else {
                u_xlatu0 = uint(vs_TEXCOORD1.y);
                u_xlat2.y = vs_TEXCOORD1.z + 0.5;
                u_xlat2.x = float(0.5);
                u_xlat14.y = float(0.0);
                u_xlat12.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat12.xy, 0.0);
                u_xlatb3.x = 0.0<u_xlat16_3.x;
                u_xlat15.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
                u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
                u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat15.xy);
                u_xlat16.x = dot(u_xlat4.xy, u_xlat4.xy);
                u_xlat16.x = inversesqrt(u_xlat16.x);
                u_xlat16.xy = u_xlat16.xx * u_xlat4.xy;
                u_xlat5.x = dot((-u_xlat15.xy), u_xlat16.xy);
                u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
                u_xlat15.x = (-u_xlat5.x) * u_xlat5.x + u_xlat15.x;
                u_xlat15.x = (-u_xlat15.x) + 1.0;
                u_xlat15.x = sqrt(u_xlat15.x);
                u_xlat21 = (-u_xlat15.x) + u_xlat5.x;
                u_xlat15.x = u_xlat15.x + u_xlat5.x;
                u_xlat5.x = min(u_xlat15.x, u_xlat21);
                u_xlatb11 = u_xlat5.x<0.0;
                u_xlat15.x = max(u_xlat15.x, u_xlat21);
                u_xlat15.x = (u_xlatb11) ? u_xlat15.x : u_xlat5.x;
                u_xlat15.xy = u_xlat15.xx * u_xlat16.xy;
                u_xlatb16 = 9.99999975e-05>=abs(u_xlat15.x);
                u_xlatb22 = 9.99999975e-05<abs(u_xlat15.y);
                u_xlat15.xy = u_xlat4.xy / u_xlat15.xy;
                u_xlat21 = u_xlatb22 ? u_xlat15.y : float(0.0);
                u_xlat10.x = (u_xlatb16) ? u_xlat21 : u_xlat15.x;
                u_xlat10.y = 0.0;
                u_xlat4.yz = (u_xlatb3.x) ? u_xlat10.xy : vs_TEXCOORD0.xy;
                u_xlat16_1.x = u_xlat16_3.y * 255.0;
                u_xlat16_1.x = roundEven(u_xlat16_1.x);
                u_xlati3 = int(u_xlat16_1.x);
                u_xlatb9 = u_xlat4.y>=(-u_xlat4.y);
                u_xlat15.x = fract(abs(u_xlat4.y));
                u_xlat9 = (u_xlatb9) ? u_xlat15.x : (-u_xlat15.x);
                u_xlat9 = (u_xlati3 != 0) ? u_xlat4.y : u_xlat9;
                u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
                u_xlat21 = u_xlat9;
                u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
                u_xlat3.x = (u_xlatb3.x) ? u_xlat21 : u_xlat9;
                u_xlat9 = u_xlat3.x * 0.5;
                u_xlatb21 = u_xlat9>=(-u_xlat9);
                u_xlat9 = fract(abs(u_xlat9));
                u_xlat9 = (u_xlatb21) ? u_xlat9 : (-u_xlat9);
                u_xlat21 = u_xlat9 + u_xlat9;
                u_xlatb9 = 0.5<u_xlat9;
                u_xlatb10 = u_xlat21>=(-u_xlat21);
                u_xlat22 = fract(abs(u_xlat21));
                u_xlat10.x = (u_xlatb10) ? u_xlat22 : (-u_xlat22);
                u_xlat10.x = (-u_xlat10.x) + 1.0;
                u_xlat9 = (u_xlatb9) ? u_xlat10.x : u_xlat21;
                u_xlat4.x = (u_xlatb3.z) ? u_xlat9 : u_xlat3.x;
                u_xlat14.x = _GradientSettingsTex_TexelSize.x;
                u_xlat2.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat14.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat2.xy, 0.0);
                u_xlat2.xy = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_1.xz = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat2.xy;
                u_xlat2.xy = u_xlat16_1.xz + vec2(0.5, 0.5);
                u_xlat12.xy = u_xlat14.xy * vec2(2.0, 2.0) + u_xlat12.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat12.xy, 0.0);
                u_xlat12.xy = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_1.xz = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat12.xy;
                u_xlat12.xy = u_xlat2.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat2.xy = u_xlat16_1.xz * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat0.xz = u_xlat4.xz * u_xlat2.xy + u_xlat12.xy;
                u_xlatb18 = vs_TEXCOORD1.y<4.0;
                if(u_xlatb18){
                    u_xlatb18 = vs_TEXCOORD1.y<2.0;
                    if(u_xlatb18){
                        u_xlatb18 = vs_TEXCOORD1.y<1.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture0, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture1, u_xlat0.xz);
                        }
                    } else {
                        u_xlatb18 = vs_TEXCOORD1.y<3.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture2, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture3, u_xlat0.xz);
                        }
                    }
                } else {
                    u_xlatb18 = vs_TEXCOORD1.y<6.0;
                    if(u_xlatb18){
                        u_xlatb18 = vs_TEXCOORD1.y<5.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture4, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture5, u_xlat0.xz);
                        }
                    } else {
                        u_xlatb18 = vs_TEXCOORD1.y<7.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture6, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture7, u_xlat0.xz);
                        }
                    }
                }
                u_xlat2 = u_xlat16_2 * vs_COLOR0;
                SV_Target0.xyz = u_xlat2.xyz;
                u_xlat16_7 = u_xlat2.w;
            }
            u_xlat6 = 1.0;
        }
    }
    u_xlatb0.xz = lessThan(abs(vs_TEXCOORD0.zzwz), vec4(1.00010002, 0.0, 1.00010002, 0.0)).xz;
    u_xlatb0.x = u_xlatb0.x && u_xlatb0.z;
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat12.x = u_xlat0.x * u_xlat6;
    u_xlat0.x = u_xlat6 * u_xlat0.x + -0.00300000003;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    SV_Target0.w = u_xlat12.x * u_xlat16_7;
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
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _ClipSpaceParams;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out highp vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
bvec4 u_xlatb5;
mediump vec2 u_xlat16_6;
vec4 u_xlat7;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
vec2 u_xlat19;
mediump vec2 u_xlat16_24;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat18.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat0.xz = u_xlat18.xy * vec2(0.09375, 0.03125);
    u_xlat1.y = in_TEXCOORD1.y * 2040.0 + u_xlat0.x;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat0.xw = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
    u_xlat0.x = in_TEXCOORD3.x * 255.0;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlat4 = (-u_xlat0.xxxx) + vec4(4.0, 3.0, 2.0, 1.0);
    u_xlatb4 = lessThan(abs(u_xlat4), vec4(9.99999975e-05, 9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat5.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat5.w = u_xlatb4.w ? float(1.0) : 0.0;
;
    u_xlat0.xw = u_xlat5.zz + u_xlat5.wy;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat0.x = u_xlat5.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19.x = dot(u_xlat1, in_POSITION0);
    u_xlat19.y = dot(u_xlat2, in_POSITION0);
    u_xlat1.x = dot(u_xlat3, in_POSITION0);
    u_xlat2 = u_xlat19.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat19.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlatb1.x = _FontTexSDFScale==0.0;
    u_xlatb1.x = u_xlatb1.x && u_xlatb4.w;
    u_xlat3.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat3.xy = u_xlat3.xy * _ClipSpaceParams.xy + vec2(0.152700007, 0.152700007);
    u_xlat3.xy = roundEven(u_xlat3.xy);
    u_xlat3.xy = u_xlat3.xy * _ClipSpaceParams.zw + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlatb1.x) ? u_xlat3.xy : u_xlat2.xy;
    u_xlat1.x = u_xlatb4.w ? float(2.0) : 0.0;
    u_xlat1.y = u_xlatb4.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.w * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat1.y + u_xlat0.x;
    u_xlat16_6.y = 0.0;
    u_xlat16_24.x = float(0.0);
    u_xlat16_24.y = float(0.0);
    u_xlati27 = 0;
    while(true){
        u_xlatb1.x = u_xlat16_24.y>=7.0;
        u_xlati27 = 0;
        if(u_xlatb1.x){break;}
        u_xlatu1 = uint(u_xlat16_24.y);
        u_xlatb1.x = in_TEXCOORD6==_TextureInfo[int(u_xlatu1)].x;
        if(u_xlatb1.x){
            u_xlat16_24.x = u_xlat16_24.y;
            u_xlati27 = int(0xFFFFFFFFu);
            break;
        }
        u_xlat16_6.x = u_xlat16_24.y + 1.0;
        u_xlat16_24.xy = u_xlat16_6.yx;
        u_xlatb27 = u_xlatb1.x;
    }
    u_xlat16_6.x = (u_xlati27 != 0) ? u_xlat16_24.x : 7.0;
    u_xlat27 = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzz).xy;
    u_xlat2.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat1.x = (u_xlatb1.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb1.y) ? u_xlat1.x : u_xlat2.x;
    if(u_xlatb4.y){
        u_xlatu1 = uint(u_xlat16_6.x);
        vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu1)].yz;
    } else {
        vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    }
    u_xlat2.x = in_TEXCOORD4.x * 8160.0 + u_xlat0.y;
    u_xlat2.y = in_TEXCOORD4.y * 2040.0 + u_xlat0.z;
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = u_xlat9.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat3 = in_TEXCOORD2.wwyy * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb5 = greaterThanEqual(u_xlat3.yyww, (-u_xlat3.yyww));
    u_xlat5.x = (u_xlatb5.x) ? float(32.0) : float(-32.0);
    u_xlat5.y = (u_xlatb5.y) ? float(0.03125) : float(-0.03125);
    u_xlat5.z = (u_xlatb5.z) ? float(32.0) : float(-32.0);
    u_xlat5.w = (u_xlatb5.w) ? float(0.03125) : float(-0.03125);
    u_xlat3.xyz = u_xlat3.xzx * u_xlat5.ywy;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xzx;
    u_xlat4.xyz = in_TEXCOORD2.wyw * vec3(255.0, 255.0, 255.0) + (-u_xlat3.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.03125, 0.03125, 0.125);
    u_xlat5.x = in_TEXCOORD4.z * 8160.0 + u_xlat3.z;
    u_xlat5.yz = in_TEXCOORD4.ww * vec2(2040.0, 2040.0) + u_xlat4.xz;
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _ShaderInfoTex_TexelSize.xy;
    if(u_xlatb1.y){
        u_xlat7 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
        u_xlat16_15.xyz = u_xlat7.xyz;
        u_xlat16_8 = u_xlat7.w;
    } else {
        u_xlat16_15.xyz = in_COLOR0.xyz;
        u_xlat16_8 = in_COLOR0.w;
    }
    u_xlat1.x = in_TEXCOORD1.z * 8160.0 + u_xlat3.y;
    u_xlat1.y = in_TEXCOORD1.w * 2040.0 + u_xlat4.y;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat9.x = textureLod(_ShaderInfoTex, u_xlat9.xy, 0.0).w;
    u_xlat18.x = u_xlat9.x * u_xlat16_8;
    vs_TEXCOORD1.z = (u_xlatb4.w) ? u_xlat9.x : u_xlat27;
    vs_TEXCOORD3.xy = (u_xlatb4.w) ? u_xlat5.xz : u_xlat2.xy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    vs_TEXCOORD0.zw = u_xlat19.xy * u_xlat3.xy + u_xlat3.zw;
    vs_TEXCOORD4.x = (u_xlatb4.w) ? in_TEXCOORD3.y : in_TEXCOORD5.x;
    gl_Position.zw = u_xlat2.zw;
    vs_COLOR0.xyz = u_xlat16_15.xyz;
    vs_COLOR0.w = u_xlat18.x;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat16_6.x;
    vs_TEXCOORD4.yzw = in_TEXCOORD5.yzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture4;
UNITY_LOCATION(5) uniform mediump sampler2D _Texture5;
UNITY_LOCATION(6) uniform mediump sampler2D _Texture6;
UNITY_LOCATION(7) uniform mediump sampler2D _Texture7;
UNITY_LOCATION(8) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in highp vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
uint u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
float u_xlat7;
mediump float u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
vec2 u_xlat10;
bool u_xlatb10;
bool u_xlatb11;
vec2 u_xlat12;
mediump float u_xlat16_12;
bvec2 u_xlatb12;
vec2 u_xlat14;
vec2 u_xlat15;
vec2 u_xlat16;
bool u_xlatb16;
float u_xlat18;
bool u_xlatb18;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlatb0.x = vs_TEXCOORD1.w>=2.0;
    u_xlat6 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1.x = (u_xlatb0.x) ? u_xlat6 : vs_TEXCOORD1.w;
    u_xlatb6.x = vs_TEXCOORD1.x==1.0;
    if(u_xlatb6.x){
        u_xlatb6.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
        if(u_xlatb6.x){
            u_xlatb6.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD4.xzxx).xy;
            if(u_xlatb6.x){
                u_xlat6 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                u_xlat6 = sqrt(u_xlat6);
                u_xlat6 = u_xlat6 + -1.0;
                u_xlat18 = dFdx(u_xlat6);
                u_xlat2.x = dFdy(u_xlat6);
                u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                u_xlat6 = u_xlat6 / u_xlat18;
                u_xlat6 = (-u_xlat6) + 0.5;
                u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
            } else {
                u_xlat6 = 1.0;
            }
            if(u_xlatb6.y){
                u_xlat12.x = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                u_xlat12.x = sqrt(u_xlat12.x);
                u_xlat12.x = u_xlat12.x + -1.0;
                u_xlat18 = dFdx(u_xlat12.x);
                u_xlat2.x = dFdy(u_xlat12.x);
                u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                u_xlat12.x = u_xlat12.x / u_xlat18;
                u_xlat12.x = (-u_xlat12.x) + 0.5;
                u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
                u_xlat12.x = (-u_xlat12.x) + 1.0;
                u_xlat6 = u_xlat12.x * u_xlat6;
            }
        } else {
            u_xlat6 = 1.0;
        }
        SV_Target0.xyz = vs_COLOR0.xyz;
        u_xlat16_7 = vs_COLOR0.w;
    } else {
        u_xlatb12.x = vs_TEXCOORD1.x==3.0;
        if(u_xlatb12.x){
            u_xlatb12.x = vs_TEXCOORD1.y<4.0;
            if(u_xlatb12.x){
                u_xlatb12.x = vs_TEXCOORD1.y<2.0;
                if(u_xlatb12.x){
                    u_xlatb12.x = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture0, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture1, vs_TEXCOORD0.xy);
                    }
                } else {
                    u_xlatb12.x = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture2, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture3, vs_TEXCOORD0.xy);
                    }
                }
            } else {
                u_xlatb12.x = vs_TEXCOORD1.y<6.0;
                if(u_xlatb12.x){
                    u_xlatb12.x = vs_TEXCOORD1.y<5.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture4, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture5, vs_TEXCOORD0.xy);
                    }
                } else {
                    u_xlatb12.x = vs_TEXCOORD1.y<7.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture6, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture7, vs_TEXCOORD0.xy);
                    }
                }
            }
            u_xlat2 = u_xlat16_2 * vs_COLOR0;
            u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
            if(u_xlatb12.x){
                u_xlatb12.xy = lessThan(vec4(-9999.0, -9999.0, -9999.0, -9999.0), vs_TEXCOORD4.xzxz).xy;
                if(u_xlatb12.x){
                    u_xlat12.x = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                    u_xlat12.x = sqrt(u_xlat12.x);
                    u_xlat12.x = u_xlat12.x + -1.0;
                    u_xlat3.x = dFdx(u_xlat12.x);
                    u_xlat9 = dFdy(u_xlat12.x);
                    u_xlat3.x = abs(u_xlat9) + abs(u_xlat3.x);
                    u_xlat12.x = u_xlat12.x / u_xlat3.x;
                    u_xlat6 = (-u_xlat12.x) + 0.5;
                    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
                } else {
                    u_xlat6 = 1.0;
                }
                if(u_xlatb12.y){
                    u_xlat12.x = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                    u_xlat12.x = sqrt(u_xlat12.x);
                    u_xlat12.x = u_xlat12.x + -1.0;
                    u_xlat18 = dFdx(u_xlat12.x);
                    u_xlat3.x = dFdy(u_xlat12.x);
                    u_xlat18 = abs(u_xlat18) + abs(u_xlat3.x);
                    u_xlat12.x = u_xlat12.x / u_xlat18;
                    u_xlat12.x = (-u_xlat12.x) + 0.5;
                    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
                    u_xlat12.x = (-u_xlat12.x) + 1.0;
                    u_xlat6 = u_xlat12.x * u_xlat6;
                }
            } else {
                u_xlat6 = 1.0;
            }
            SV_Target0.xyz = u_xlat2.xyz;
            u_xlat16_7 = u_xlat2.w;
        } else {
            u_xlatb12.x = vs_TEXCOORD1.x==2.0;
            if(u_xlatb12.x){
                u_xlat16_12 = texture(_FontTex, vs_TEXCOORD0.xy).w;
                u_xlatb18 = 0.0<_FontTexSDFScale;
                if(u_xlatb18){
                    u_xlat2 = vs_TEXCOORD3.xyxy + vec4(0.5, 3.5, 0.5, 1.5);
                    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
                    u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
                    u_xlat3 = u_xlat16_3 * vec4(_FontTexSDFScale);
                    u_xlat4.y = u_xlat3.w * 0.25;
                    u_xlat2.xy = u_xlat3.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                    u_xlat16_5.z = texture(_FontTex, u_xlat2.xy).w;
                    u_xlat4.x = (-u_xlat4.y);
                    u_xlat4.z = 0.0;
                    u_xlat4.xyz = u_xlat4.xyz + vs_TEXCOORD4.xxx;
                    u_xlat18 = dFdx(vs_TEXCOORD0.y);
                    u_xlat2.x = dFdy(vs_TEXCOORD0.y);
                    u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                    u_xlat16_5.xy = vec2(u_xlat16_12);
                    u_xlat5.xyz = u_xlat16_5.xyz + vec3(-0.5, -0.5, -0.5);
                    u_xlat4.xyz = u_xlat5.xyz * vec3(_FontTexSDFScale) + u_xlat4.xyz;
                    u_xlat4.xyz = u_xlat4.xyz + u_xlat4.xyz;
                    u_xlat3.x = float(0.0);
                    u_xlat3.y = float(0.0);
                    u_xlat3.xyz = _FontTex_TexelSize.www * vec3(u_xlat18) + u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat4.xyz / u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
                    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
                    if(u_xlatb0.x){
                        u_xlat0.xw = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                        u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
                        u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
                        u_xlat5.w = u_xlat16_4.w * vs_TEXCOORD1.z;
                    } else {
                        u_xlat16_4.xyz = vs_COLOR0.xyz;
                        u_xlat5.w = vs_COLOR0.w;
                    }
                    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.www;
                    u_xlat16_2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
                    u_xlat4.w = u_xlat16_2.w * vs_TEXCOORD1.z;
                    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.www;
                    u_xlat0.xw = (-u_xlat3.xy) + vec2(1.0, 1.0);
                    u_xlat2 = u_xlat0.xxxx * u_xlat4;
                    u_xlat2 = u_xlat3.yyyy * u_xlat2;
                    u_xlat2 = u_xlat5 * u_xlat3.xxxx + u_xlat2;
                    u_xlat3.xy = vs_TEXCOORD3.xy + vec2(0.5, 2.5);
                    u_xlat3.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                    u_xlat3.x = u_xlat16_4.w * vs_TEXCOORD1.z;
                    u_xlat3.w = u_xlat3.z * u_xlat3.x;
                    u_xlat3.xyz = u_xlat3.www * u_xlat16_4.xyz;
                    u_xlat3 = u_xlat0.xxxx * u_xlat3;
                    u_xlat2 = u_xlat3 * u_xlat0.wwww + u_xlat2;
                    u_xlatb0.x = 0.0<u_xlat2.w;
                    u_xlat0.x = (u_xlatb0.x) ? u_xlat2.w : 1.0;
                    u_xlat2.xyz = u_xlat2.xyz / u_xlat0.xxx;
                    SV_Target0.xyz = u_xlat2.xyz;
                    u_xlat16_7 = u_xlat2.w;
                } else {
                    u_xlat7 = u_xlat16_12 * vs_COLOR0.w;
                    SV_Target0.xyz = vs_COLOR0.xyz;
                    u_xlat16_7 = u_xlat7;
                }
            } else {
                u_xlatu0 = uint(vs_TEXCOORD1.y);
                u_xlat2.y = vs_TEXCOORD1.z + 0.5;
                u_xlat2.x = float(0.5);
                u_xlat14.y = float(0.0);
                u_xlat12.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat12.xy, 0.0);
                u_xlatb3.x = 0.0<u_xlat16_3.x;
                u_xlat15.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
                u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
                u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat15.xy);
                u_xlat16.x = dot(u_xlat4.xy, u_xlat4.xy);
                u_xlat16.x = inversesqrt(u_xlat16.x);
                u_xlat16.xy = u_xlat16.xx * u_xlat4.xy;
                u_xlat5.x = dot((-u_xlat15.xy), u_xlat16.xy);
                u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
                u_xlat15.x = (-u_xlat5.x) * u_xlat5.x + u_xlat15.x;
                u_xlat15.x = (-u_xlat15.x) + 1.0;
                u_xlat15.x = sqrt(u_xlat15.x);
                u_xlat21 = (-u_xlat15.x) + u_xlat5.x;
                u_xlat15.x = u_xlat15.x + u_xlat5.x;
                u_xlat5.x = min(u_xlat15.x, u_xlat21);
                u_xlatb11 = u_xlat5.x<0.0;
                u_xlat15.x = max(u_xlat15.x, u_xlat21);
                u_xlat15.x = (u_xlatb11) ? u_xlat15.x : u_xlat5.x;
                u_xlat15.xy = u_xlat15.xx * u_xlat16.xy;
                u_xlatb16 = 9.99999975e-05>=abs(u_xlat15.x);
                u_xlatb22 = 9.99999975e-05<abs(u_xlat15.y);
                u_xlat15.xy = u_xlat4.xy / u_xlat15.xy;
                u_xlat21 = u_xlatb22 ? u_xlat15.y : float(0.0);
                u_xlat10.x = (u_xlatb16) ? u_xlat21 : u_xlat15.x;
                u_xlat10.y = 0.0;
                u_xlat4.yz = (u_xlatb3.x) ? u_xlat10.xy : vs_TEXCOORD0.xy;
                u_xlat16_1.x = u_xlat16_3.y * 255.0;
                u_xlat16_1.x = roundEven(u_xlat16_1.x);
                u_xlati3 = int(u_xlat16_1.x);
                u_xlatb9 = u_xlat4.y>=(-u_xlat4.y);
                u_xlat15.x = fract(abs(u_xlat4.y));
                u_xlat9 = (u_xlatb9) ? u_xlat15.x : (-u_xlat15.x);
                u_xlat9 = (u_xlati3 != 0) ? u_xlat4.y : u_xlat9;
                u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
                u_xlat21 = u_xlat9;
                u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
                u_xlat3.x = (u_xlatb3.x) ? u_xlat21 : u_xlat9;
                u_xlat9 = u_xlat3.x * 0.5;
                u_xlatb21 = u_xlat9>=(-u_xlat9);
                u_xlat9 = fract(abs(u_xlat9));
                u_xlat9 = (u_xlatb21) ? u_xlat9 : (-u_xlat9);
                u_xlat21 = u_xlat9 + u_xlat9;
                u_xlatb9 = 0.5<u_xlat9;
                u_xlatb10 = u_xlat21>=(-u_xlat21);
                u_xlat22 = fract(abs(u_xlat21));
                u_xlat10.x = (u_xlatb10) ? u_xlat22 : (-u_xlat22);
                u_xlat10.x = (-u_xlat10.x) + 1.0;
                u_xlat9 = (u_xlatb9) ? u_xlat10.x : u_xlat21;
                u_xlat4.x = (u_xlatb3.z) ? u_xlat9 : u_xlat3.x;
                u_xlat14.x = _GradientSettingsTex_TexelSize.x;
                u_xlat2.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat14.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat2.xy, 0.0);
                u_xlat2.xy = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_1.xz = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat2.xy;
                u_xlat2.xy = u_xlat16_1.xz + vec2(0.5, 0.5);
                u_xlat12.xy = u_xlat14.xy * vec2(2.0, 2.0) + u_xlat12.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat12.xy, 0.0);
                u_xlat12.xy = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_1.xz = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat12.xy;
                u_xlat12.xy = u_xlat2.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat2.xy = u_xlat16_1.xz * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat0.xz = u_xlat4.xz * u_xlat2.xy + u_xlat12.xy;
                u_xlatb18 = vs_TEXCOORD1.y<4.0;
                if(u_xlatb18){
                    u_xlatb18 = vs_TEXCOORD1.y<2.0;
                    if(u_xlatb18){
                        u_xlatb18 = vs_TEXCOORD1.y<1.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture0, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture1, u_xlat0.xz);
                        }
                    } else {
                        u_xlatb18 = vs_TEXCOORD1.y<3.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture2, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture3, u_xlat0.xz);
                        }
                    }
                } else {
                    u_xlatb18 = vs_TEXCOORD1.y<6.0;
                    if(u_xlatb18){
                        u_xlatb18 = vs_TEXCOORD1.y<5.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture4, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture5, u_xlat0.xz);
                        }
                    } else {
                        u_xlatb18 = vs_TEXCOORD1.y<7.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture6, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture7, u_xlat0.xz);
                        }
                    }
                }
                u_xlat2 = u_xlat16_2 * vs_COLOR0;
                SV_Target0.xyz = u_xlat2.xyz;
                u_xlat16_7 = u_xlat2.w;
            }
            u_xlat6 = 1.0;
        }
    }
    u_xlatb0.xz = lessThan(abs(vs_TEXCOORD0.zzwz), vec4(1.00010002, 0.0, 1.00010002, 0.0)).xz;
    u_xlatb0.x = u_xlatb0.x && u_xlatb0.z;
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat12.x = u_xlat0.x * u_xlat6;
    u_xlat0.x = u_xlat6 * u_xlat0.x + -0.00300000003;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    SV_Target0.w = u_xlat12.x * u_xlat16_7;
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
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
uniform 	vec4 _ClipSpaceParams;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out highp vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
bvec4 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
bvec4 u_xlatb5;
mediump vec2 u_xlat16_6;
vec4 u_xlat7;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
vec2 u_xlat19;
mediump vec2 u_xlat16_24;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat18.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat0.xz = u_xlat18.xy * vec2(0.09375, 0.03125);
    u_xlat1.y = in_TEXCOORD1.y * 2040.0 + u_xlat0.x;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat0.xw = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
    u_xlat0.x = in_TEXCOORD3.x * 255.0;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlat4 = (-u_xlat0.xxxx) + vec4(4.0, 3.0, 2.0, 1.0);
    u_xlatb4 = lessThan(abs(u_xlat4), vec4(9.99999975e-05, 9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat5.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat5.w = u_xlatb4.w ? float(1.0) : 0.0;
;
    u_xlat0.xw = u_xlat5.zz + u_xlat5.wy;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat0.x = u_xlat5.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19.x = dot(u_xlat1, in_POSITION0);
    u_xlat19.y = dot(u_xlat2, in_POSITION0);
    u_xlat1.x = dot(u_xlat3, in_POSITION0);
    u_xlat2 = u_xlat19.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat19.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlatb1.x = _FontTexSDFScale==0.0;
    u_xlatb1.x = u_xlatb1.x && u_xlatb4.w;
    u_xlat3.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat3.xy = u_xlat3.xy * _ClipSpaceParams.xy + vec2(0.152700007, 0.152700007);
    u_xlat3.xy = roundEven(u_xlat3.xy);
    u_xlat3.xy = u_xlat3.xy * _ClipSpaceParams.zw + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlatb1.x) ? u_xlat3.xy : u_xlat2.xy;
    u_xlat1.x = u_xlatb4.w ? float(2.0) : 0.0;
    u_xlat1.y = u_xlatb4.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.w * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat1.y + u_xlat0.x;
    u_xlat16_6.y = 0.0;
    u_xlat16_24.x = float(0.0);
    u_xlat16_24.y = float(0.0);
    u_xlati27 = 0;
    while(true){
        u_xlatb1.x = u_xlat16_24.y>=7.0;
        u_xlati27 = 0;
        if(u_xlatb1.x){break;}
        u_xlatu1 = uint(u_xlat16_24.y);
        u_xlatb1.x = in_TEXCOORD6==_TextureInfo[int(u_xlatu1)].x;
        if(u_xlatb1.x){
            u_xlat16_24.x = u_xlat16_24.y;
            u_xlati27 = int(0xFFFFFFFFu);
            break;
        }
        u_xlat16_6.x = u_xlat16_24.y + 1.0;
        u_xlat16_24.xy = u_xlat16_6.yx;
        u_xlatb27 = u_xlatb1.x;
    }
    u_xlat16_6.x = (u_xlati27 != 0) ? u_xlat16_24.x : 7.0;
    u_xlat27 = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzz).xy;
    u_xlat2.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat1.x = (u_xlatb1.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb1.y) ? u_xlat1.x : u_xlat2.x;
    if(u_xlatb4.y){
        u_xlatu1 = uint(u_xlat16_6.x);
        vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu1)].yz;
    } else {
        vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    }
    u_xlat2.x = in_TEXCOORD4.x * 8160.0 + u_xlat0.y;
    u_xlat2.y = in_TEXCOORD4.y * 2040.0 + u_xlat0.z;
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = u_xlat9.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat3 = in_TEXCOORD2.wwyy * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb5 = greaterThanEqual(u_xlat3.yyww, (-u_xlat3.yyww));
    u_xlat5.x = (u_xlatb5.x) ? float(32.0) : float(-32.0);
    u_xlat5.y = (u_xlatb5.y) ? float(0.03125) : float(-0.03125);
    u_xlat5.z = (u_xlatb5.z) ? float(32.0) : float(-32.0);
    u_xlat5.w = (u_xlatb5.w) ? float(0.03125) : float(-0.03125);
    u_xlat3.xyz = u_xlat3.xzx * u_xlat5.ywy;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xzx;
    u_xlat4.xyz = in_TEXCOORD2.wyw * vec3(255.0, 255.0, 255.0) + (-u_xlat3.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.03125, 0.03125, 0.125);
    u_xlat5.x = in_TEXCOORD4.z * 8160.0 + u_xlat3.z;
    u_xlat5.yz = in_TEXCOORD4.ww * vec2(2040.0, 2040.0) + u_xlat4.xz;
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _ShaderInfoTex_TexelSize.xy;
    if(u_xlatb1.y){
        u_xlat7 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
        u_xlat16_15.xyz = u_xlat7.xyz;
        u_xlat16_8 = u_xlat7.w;
    } else {
        u_xlat16_15.xyz = in_COLOR0.xyz;
        u_xlat16_8 = in_COLOR0.w;
    }
    u_xlat1.x = in_TEXCOORD1.z * 8160.0 + u_xlat3.y;
    u_xlat1.y = in_TEXCOORD1.w * 2040.0 + u_xlat4.y;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat9.x = textureLod(_ShaderInfoTex, u_xlat9.xy, 0.0).w;
    u_xlat18.x = u_xlat9.x * u_xlat16_8;
    vs_TEXCOORD1.z = (u_xlatb4.w) ? u_xlat9.x : u_xlat27;
    vs_TEXCOORD3.xy = (u_xlatb4.w) ? u_xlat5.xz : u_xlat2.xy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    vs_TEXCOORD0.zw = u_xlat19.xy * u_xlat3.xy + u_xlat3.zw;
    vs_TEXCOORD4.x = (u_xlatb4.w) ? in_TEXCOORD3.y : in_TEXCOORD5.x;
    gl_Position.zw = u_xlat2.zw;
    vs_COLOR0.xyz = u_xlat16_15.xyz;
    vs_COLOR0.w = u_xlat18.x;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat16_6.x;
    vs_TEXCOORD4.yzw = in_TEXCOORD5.yzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[8];
UNITY_LOCATION(0) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture4;
UNITY_LOCATION(5) uniform mediump sampler2D _Texture5;
UNITY_LOCATION(6) uniform mediump sampler2D _Texture6;
UNITY_LOCATION(7) uniform mediump sampler2D _Texture7;
UNITY_LOCATION(8) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in highp vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
uint u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
float u_xlat7;
mediump float u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
vec2 u_xlat10;
bool u_xlatb10;
bool u_xlatb11;
vec2 u_xlat12;
mediump float u_xlat16_12;
bvec2 u_xlatb12;
vec2 u_xlat14;
vec2 u_xlat15;
vec2 u_xlat16;
bool u_xlatb16;
float u_xlat18;
bool u_xlatb18;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlatb0.x = vs_TEXCOORD1.w>=2.0;
    u_xlat6 = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1.x = (u_xlatb0.x) ? u_xlat6 : vs_TEXCOORD1.w;
    u_xlatb6.x = vs_TEXCOORD1.x==1.0;
    if(u_xlatb6.x){
        u_xlatb6.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
        if(u_xlatb6.x){
            u_xlatb6.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD4.xzxx).xy;
            if(u_xlatb6.x){
                u_xlat6 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                u_xlat6 = sqrt(u_xlat6);
                u_xlat6 = u_xlat6 + -1.0;
                u_xlat18 = dFdx(u_xlat6);
                u_xlat2.x = dFdy(u_xlat6);
                u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                u_xlat6 = u_xlat6 / u_xlat18;
                u_xlat6 = (-u_xlat6) + 0.5;
                u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
            } else {
                u_xlat6 = 1.0;
            }
            if(u_xlatb6.y){
                u_xlat12.x = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                u_xlat12.x = sqrt(u_xlat12.x);
                u_xlat12.x = u_xlat12.x + -1.0;
                u_xlat18 = dFdx(u_xlat12.x);
                u_xlat2.x = dFdy(u_xlat12.x);
                u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                u_xlat12.x = u_xlat12.x / u_xlat18;
                u_xlat12.x = (-u_xlat12.x) + 0.5;
                u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
                u_xlat12.x = (-u_xlat12.x) + 1.0;
                u_xlat6 = u_xlat12.x * u_xlat6;
            }
        } else {
            u_xlat6 = 1.0;
        }
        SV_Target0.xyz = vs_COLOR0.xyz;
        u_xlat16_7 = vs_COLOR0.w;
    } else {
        u_xlatb12.x = vs_TEXCOORD1.x==3.0;
        if(u_xlatb12.x){
            u_xlatb12.x = vs_TEXCOORD1.y<4.0;
            if(u_xlatb12.x){
                u_xlatb12.x = vs_TEXCOORD1.y<2.0;
                if(u_xlatb12.x){
                    u_xlatb12.x = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture0, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture1, vs_TEXCOORD0.xy);
                    }
                } else {
                    u_xlatb12.x = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture2, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture3, vs_TEXCOORD0.xy);
                    }
                }
            } else {
                u_xlatb12.x = vs_TEXCOORD1.y<6.0;
                if(u_xlatb12.x){
                    u_xlatb12.x = vs_TEXCOORD1.y<5.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture4, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture5, vs_TEXCOORD0.xy);
                    }
                } else {
                    u_xlatb12.x = vs_TEXCOORD1.y<7.0;
                    if(u_xlatb12.x){
                        u_xlat16_2 = texture(_Texture6, vs_TEXCOORD0.xy);
                    } else {
                        u_xlat16_2 = texture(_Texture7, vs_TEXCOORD0.xy);
                    }
                }
            }
            u_xlat2 = u_xlat16_2 * vs_COLOR0;
            u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
            if(u_xlatb12.x){
                u_xlatb12.xy = lessThan(vec4(-9999.0, -9999.0, -9999.0, -9999.0), vs_TEXCOORD4.xzxz).xy;
                if(u_xlatb12.x){
                    u_xlat12.x = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                    u_xlat12.x = sqrt(u_xlat12.x);
                    u_xlat12.x = u_xlat12.x + -1.0;
                    u_xlat3.x = dFdx(u_xlat12.x);
                    u_xlat9 = dFdy(u_xlat12.x);
                    u_xlat3.x = abs(u_xlat9) + abs(u_xlat3.x);
                    u_xlat12.x = u_xlat12.x / u_xlat3.x;
                    u_xlat6 = (-u_xlat12.x) + 0.5;
                    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
                } else {
                    u_xlat6 = 1.0;
                }
                if(u_xlatb12.y){
                    u_xlat12.x = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                    u_xlat12.x = sqrt(u_xlat12.x);
                    u_xlat12.x = u_xlat12.x + -1.0;
                    u_xlat18 = dFdx(u_xlat12.x);
                    u_xlat3.x = dFdy(u_xlat12.x);
                    u_xlat18 = abs(u_xlat18) + abs(u_xlat3.x);
                    u_xlat12.x = u_xlat12.x / u_xlat18;
                    u_xlat12.x = (-u_xlat12.x) + 0.5;
                    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
                    u_xlat12.x = (-u_xlat12.x) + 1.0;
                    u_xlat6 = u_xlat12.x * u_xlat6;
                }
            } else {
                u_xlat6 = 1.0;
            }
            SV_Target0.xyz = u_xlat2.xyz;
            u_xlat16_7 = u_xlat2.w;
        } else {
            u_xlatb12.x = vs_TEXCOORD1.x==2.0;
            if(u_xlatb12.x){
                u_xlat16_12 = texture(_FontTex, vs_TEXCOORD0.xy).w;
                u_xlatb18 = 0.0<_FontTexSDFScale;
                if(u_xlatb18){
                    u_xlat2 = vs_TEXCOORD3.xyxy + vec4(0.5, 3.5, 0.5, 1.5);
                    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
                    u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
                    u_xlat3 = u_xlat16_3 * vec4(_FontTexSDFScale);
                    u_xlat4.y = u_xlat3.w * 0.25;
                    u_xlat2.xy = u_xlat3.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                    u_xlat16_5.z = texture(_FontTex, u_xlat2.xy).w;
                    u_xlat4.x = (-u_xlat4.y);
                    u_xlat4.z = 0.0;
                    u_xlat4.xyz = u_xlat4.xyz + vs_TEXCOORD4.xxx;
                    u_xlat18 = dFdx(vs_TEXCOORD0.y);
                    u_xlat2.x = dFdy(vs_TEXCOORD0.y);
                    u_xlat18 = abs(u_xlat18) + abs(u_xlat2.x);
                    u_xlat16_5.xy = vec2(u_xlat16_12);
                    u_xlat5.xyz = u_xlat16_5.xyz + vec3(-0.5, -0.5, -0.5);
                    u_xlat4.xyz = u_xlat5.xyz * vec3(_FontTexSDFScale) + u_xlat4.xyz;
                    u_xlat4.xyz = u_xlat4.xyz + u_xlat4.xyz;
                    u_xlat3.x = float(0.0);
                    u_xlat3.y = float(0.0);
                    u_xlat3.xyz = _FontTex_TexelSize.www * vec3(u_xlat18) + u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat4.xyz / u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
                    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
                    if(u_xlatb0.x){
                        u_xlat0.xw = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                        u_xlat0.xw = u_xlat0.xw * _ShaderInfoTex_TexelSize.xy;
                        u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat0.xw, 0.0);
                        u_xlat5.w = u_xlat16_4.w * vs_TEXCOORD1.z;
                    } else {
                        u_xlat16_4.xyz = vs_COLOR0.xyz;
                        u_xlat5.w = vs_COLOR0.w;
                    }
                    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.www;
                    u_xlat16_2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
                    u_xlat4.w = u_xlat16_2.w * vs_TEXCOORD1.z;
                    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.www;
                    u_xlat0.xw = (-u_xlat3.xy) + vec2(1.0, 1.0);
                    u_xlat2 = u_xlat0.xxxx * u_xlat4;
                    u_xlat2 = u_xlat3.yyyy * u_xlat2;
                    u_xlat2 = u_xlat5 * u_xlat3.xxxx + u_xlat2;
                    u_xlat3.xy = vs_TEXCOORD3.xy + vec2(0.5, 2.5);
                    u_xlat3.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                    u_xlat3.x = u_xlat16_4.w * vs_TEXCOORD1.z;
                    u_xlat3.w = u_xlat3.z * u_xlat3.x;
                    u_xlat3.xyz = u_xlat3.www * u_xlat16_4.xyz;
                    u_xlat3 = u_xlat0.xxxx * u_xlat3;
                    u_xlat2 = u_xlat3 * u_xlat0.wwww + u_xlat2;
                    u_xlatb0.x = 0.0<u_xlat2.w;
                    u_xlat0.x = (u_xlatb0.x) ? u_xlat2.w : 1.0;
                    u_xlat2.xyz = u_xlat2.xyz / u_xlat0.xxx;
                    SV_Target0.xyz = u_xlat2.xyz;
                    u_xlat16_7 = u_xlat2.w;
                } else {
                    u_xlat7 = u_xlat16_12 * vs_COLOR0.w;
                    SV_Target0.xyz = vs_COLOR0.xyz;
                    u_xlat16_7 = u_xlat7;
                }
            } else {
                u_xlatu0 = uint(vs_TEXCOORD1.y);
                u_xlat2.y = vs_TEXCOORD1.z + 0.5;
                u_xlat2.x = float(0.5);
                u_xlat14.y = float(0.0);
                u_xlat12.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat12.xy, 0.0);
                u_xlatb3.x = 0.0<u_xlat16_3.x;
                u_xlat15.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
                u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
                u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat15.xy);
                u_xlat16.x = dot(u_xlat4.xy, u_xlat4.xy);
                u_xlat16.x = inversesqrt(u_xlat16.x);
                u_xlat16.xy = u_xlat16.xx * u_xlat4.xy;
                u_xlat5.x = dot((-u_xlat15.xy), u_xlat16.xy);
                u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
                u_xlat15.x = (-u_xlat5.x) * u_xlat5.x + u_xlat15.x;
                u_xlat15.x = (-u_xlat15.x) + 1.0;
                u_xlat15.x = sqrt(u_xlat15.x);
                u_xlat21 = (-u_xlat15.x) + u_xlat5.x;
                u_xlat15.x = u_xlat15.x + u_xlat5.x;
                u_xlat5.x = min(u_xlat15.x, u_xlat21);
                u_xlatb11 = u_xlat5.x<0.0;
                u_xlat15.x = max(u_xlat15.x, u_xlat21);
                u_xlat15.x = (u_xlatb11) ? u_xlat15.x : u_xlat5.x;
                u_xlat15.xy = u_xlat15.xx * u_xlat16.xy;
                u_xlatb16 = 9.99999975e-05>=abs(u_xlat15.x);
                u_xlatb22 = 9.99999975e-05<abs(u_xlat15.y);
                u_xlat15.xy = u_xlat4.xy / u_xlat15.xy;
                u_xlat21 = u_xlatb22 ? u_xlat15.y : float(0.0);
                u_xlat10.x = (u_xlatb16) ? u_xlat21 : u_xlat15.x;
                u_xlat10.y = 0.0;
                u_xlat4.yz = (u_xlatb3.x) ? u_xlat10.xy : vs_TEXCOORD0.xy;
                u_xlat16_1.x = u_xlat16_3.y * 255.0;
                u_xlat16_1.x = roundEven(u_xlat16_1.x);
                u_xlati3 = int(u_xlat16_1.x);
                u_xlatb9 = u_xlat4.y>=(-u_xlat4.y);
                u_xlat15.x = fract(abs(u_xlat4.y));
                u_xlat9 = (u_xlatb9) ? u_xlat15.x : (-u_xlat15.x);
                u_xlat9 = (u_xlati3 != 0) ? u_xlat4.y : u_xlat9;
                u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
                u_xlat21 = u_xlat9;
                u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
                u_xlat3.x = (u_xlatb3.x) ? u_xlat21 : u_xlat9;
                u_xlat9 = u_xlat3.x * 0.5;
                u_xlatb21 = u_xlat9>=(-u_xlat9);
                u_xlat9 = fract(abs(u_xlat9));
                u_xlat9 = (u_xlatb21) ? u_xlat9 : (-u_xlat9);
                u_xlat21 = u_xlat9 + u_xlat9;
                u_xlatb9 = 0.5<u_xlat9;
                u_xlatb10 = u_xlat21>=(-u_xlat21);
                u_xlat22 = fract(abs(u_xlat21));
                u_xlat10.x = (u_xlatb10) ? u_xlat22 : (-u_xlat22);
                u_xlat10.x = (-u_xlat10.x) + 1.0;
                u_xlat9 = (u_xlatb9) ? u_xlat10.x : u_xlat21;
                u_xlat4.x = (u_xlatb3.z) ? u_xlat9 : u_xlat3.x;
                u_xlat14.x = _GradientSettingsTex_TexelSize.x;
                u_xlat2.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat14.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat2.xy, 0.0);
                u_xlat2.xy = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_1.xz = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat2.xy;
                u_xlat2.xy = u_xlat16_1.xz + vec2(0.5, 0.5);
                u_xlat12.xy = u_xlat14.xy * vec2(2.0, 2.0) + u_xlat12.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat12.xy, 0.0);
                u_xlat12.xy = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_1.xz = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat12.xy;
                u_xlat12.xy = u_xlat2.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat2.xy = u_xlat16_1.xz * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat0.xz = u_xlat4.xz * u_xlat2.xy + u_xlat12.xy;
                u_xlatb18 = vs_TEXCOORD1.y<4.0;
                if(u_xlatb18){
                    u_xlatb18 = vs_TEXCOORD1.y<2.0;
                    if(u_xlatb18){
                        u_xlatb18 = vs_TEXCOORD1.y<1.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture0, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture1, u_xlat0.xz);
                        }
                    } else {
                        u_xlatb18 = vs_TEXCOORD1.y<3.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture2, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture3, u_xlat0.xz);
                        }
                    }
                } else {
                    u_xlatb18 = vs_TEXCOORD1.y<6.0;
                    if(u_xlatb18){
                        u_xlatb18 = vs_TEXCOORD1.y<5.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture4, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture5, u_xlat0.xz);
                        }
                    } else {
                        u_xlatb18 = vs_TEXCOORD1.y<7.0;
                        if(u_xlatb18){
                            u_xlat16_2 = texture(_Texture6, u_xlat0.xz);
                        } else {
                            u_xlat16_2 = texture(_Texture7, u_xlat0.xz);
                        }
                    }
                }
                u_xlat2 = u_xlat16_2 * vs_COLOR0;
                SV_Target0.xyz = u_xlat2.xyz;
                u_xlat16_7 = u_xlat2.w;
            }
            u_xlat6 = 1.0;
        }
    }
    u_xlatb0.xz = lessThan(abs(vs_TEXCOORD0.zzwz), vec4(1.00010002, 0.0, 1.00010002, 0.0)).xz;
    u_xlatb0.x = u_xlatb0.x && u_xlatb0.z;
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat12.x = u_xlat0.x * u_xlat6;
    u_xlat0.x = u_xlat6 * u_xlat0.x + -0.00300000003;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    SV_Target0.w = u_xlat12.x * u_xlat16_7;
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
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 101312
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
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ClipSpaceParams;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
int u_xlati7;
float u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
int u_xlati13;
uint u_xlatu13;
bvec2 u_xlatb13;
vec2 u_xlat17;
void main()
{
    u_xlat0 = in_TEXCOORD2.xzzw * vec4(765.0, 255.0, 8160.0, 255.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlat13.x = in_TEXCOORD3.x * 255.0;
    u_xlat13.x = roundEven(u_xlat13.x);
    u_xlat2 = (-u_xlat13.xxxx) + vec4(4.0, 3.0, 2.0, 1.0);
    u_xlatb2 = lessThan(abs(u_xlat2), vec4(9.99999975e-05, 9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat3.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat3.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat13.xy = u_xlat3.zz + u_xlat3.wy;
    u_xlat13.x = u_xlat3.y + u_xlat13.x;
    u_xlat13.x = u_xlat3.x + u_xlat13.x;
    u_xlat13.x = min(u_xlat13.x, 1.0);
    u_xlat13.x = (-u_xlat13.x) + 1.0;
    u_xlat3.z = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat3.w = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat4 = u_xlat3.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
    u_xlatb0 = _FontTexSDFScale==0.0;
    u_xlatb0 = u_xlatb0 && u_xlatb2.w;
    u_xlat1.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * _ClipSpaceParams.xy + vec2(0.152700007, 0.152700007);
    u_xlat1.xy = roundEven(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _ClipSpaceParams.zw + vec2(-1.0, -1.0);
    gl_Position.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat4.xy;
    u_xlat1.x = u_xlatb2.w ? float(2.0) : 0.0;
    u_xlat1.y = u_xlatb2.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat1.x + u_xlat13.x;
    u_xlat0.x = u_xlat13.y * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat1.y + u_xlat0.x;
    u_xlat1.x = (-in_TEXCOORD6) + _TextureInfo[1].x;
    u_xlati7 = int((0.0<u_xlat1.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati1.x = int((u_xlat1.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati1.x = (-u_xlati7) + u_xlati1.x;
    u_xlati1.x = max((-u_xlati1.x), u_xlati1.x);
    u_xlat1.x = float(u_xlati1.x);
    u_xlat7 = (-in_TEXCOORD6) + _TextureInfo[2].x;
    u_xlati13 = int((0.0<u_xlat7) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = int((u_xlat7<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = (-u_xlati13) + u_xlati7;
    u_xlati7 = max((-u_xlati7), u_xlati7);
    u_xlat1.y = float(u_xlati7);
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * 2.0 + u_xlat1.x;
    u_xlat7 = (-in_TEXCOORD6) + _TextureInfo[3].x;
    u_xlati13 = int((0.0<u_xlat7) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = int((u_xlat7<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = (-u_xlati13) + u_xlati7;
    u_xlati7 = max((-u_xlati7), u_xlati7);
    u_xlat7 = float(u_xlati7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1.x = u_xlat7 * 3.0 + u_xlat1.x;
    u_xlat7 = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb13.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzw).xy;
    u_xlat2.x = u_xlatb13.x ? 1.0 : float(0.0);
    u_xlat13.x = (u_xlatb13.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb13.y) ? u_xlat13.x : u_xlat2.x;
    if(u_xlatb2.y){
        u_xlatu13 = uint(u_xlat1.x);
        u_xlat3.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu13)].yz;
    } else {
        u_xlat3.xy = in_TEXCOORD0.xy;
    }
    u_xlatb12 = u_xlat0.z>=(-u_xlat0.z);
    u_xlat13.xy = (bool(u_xlatb12)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat6.x = u_xlat0.y * u_xlat13.y;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * u_xlat13.x;
    u_xlat12 = in_TEXCOORD2.z * 255.0 + (-u_xlat6.x);
    u_xlat13.xy = in_TEXCOORD4.yw * vec2(2040.0, 2040.0);
    u_xlat17.x = in_TEXCOORD4.x * 8160.0 + u_xlat6.x;
    u_xlat17.y = u_xlat12 * 0.03125 + u_xlat13.x;
    u_xlat6.xy = u_xlat17.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat6.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat6.x = in_TEXCOORD2.w * 8160.0;
    u_xlatb6 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat12 = u_xlat6.y * u_xlat0.w;
    u_xlat12 = fract(u_xlat12);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat12 = in_TEXCOORD2.w * 255.0 + (-u_xlat6.x);
    u_xlat2.x = in_TEXCOORD4.z * 8160.0 + u_xlat6.x;
    u_xlat2.yz = vec2(u_xlat12) * vec2(0.03125, 0.125) + u_xlat13.yy;
    u_xlat6.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD1.z = (u_xlatb2.w) ? 1.0 : u_xlat7;
    vs_TEXCOORD3.xy = (u_xlatb2.w) ? u_xlat2.xz : u_xlat6.xy;
    vs_TEXCOORD4.x = (u_xlatb2.w) ? in_TEXCOORD3.y : in_TEXCOORD5.x;
    gl_Position.zw = u_xlat4.zw;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = u_xlat3;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat1.x;
    u_xlat5.x = in_TEXCOORD2.y * 255.0;
    u_xlat5.y = 0.0;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.yzw = in_TEXCOORD5.yzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(5) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(6) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uint u_xlatu0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
vec2 u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat19;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlatb0.x = vs_TEXCOORD1.w>=2.0;
    u_xlat8.x = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD1.w;
    u_xlat16_8 = textureLod(_ShaderInfoTex, vs_TEXCOORD2.zw, 0.0).w;
    u_xlatb16.x = vs_TEXCOORD1.x!=2.0;
    u_xlatb16.x = u_xlatb16.x && u_xlatb0.x;
    if(u_xlatb16.x){
        u_xlat16_2 = textureLod(_ShaderInfoTex, vs_TEXCOORD3.xy, 0.0).wxyz;
        u_xlat16_2 = u_xlat16_2;
    } else {
        u_xlat16_2.x = u_xlat16_8 * vs_COLOR0.w;
        u_xlat16_2.yzw = vs_COLOR0.xyz;
    }
    u_xlatb16.x = vs_TEXCOORD1.x==1.0;
    if(u_xlatb16.x){
        u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
        if(u_xlatb16.x){
            u_xlatb16.xy = lessThan(vec4(-9999.0, -9999.0, -9999.0, -9999.0), vs_TEXCOORD4.xzxz).xy;
            if(u_xlatb16.x){
                u_xlat16 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                u_xlat16 = sqrt(u_xlat16);
                u_xlat16 = u_xlat16 + -1.0;
                u_xlat3.x = dFdx(u_xlat16);
                u_xlat11.x = dFdy(u_xlat16);
                u_xlat3.x = abs(u_xlat11.x) + abs(u_xlat3.x);
                u_xlat16 = u_xlat16 / u_xlat3.x;
                u_xlat16 = (-u_xlat16) + 0.5;
                u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
            } else {
                u_xlat16 = 1.0;
            }
            if(u_xlatb16.y){
                u_xlat24 = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                u_xlat24 = sqrt(u_xlat24);
                u_xlat24 = u_xlat24 + -1.0;
                u_xlat3.x = dFdx(u_xlat24);
                u_xlat11.x = dFdy(u_xlat24);
                u_xlat3.x = abs(u_xlat11.x) + abs(u_xlat3.x);
                u_xlat24 = u_xlat24 / u_xlat3.x;
                u_xlat24 = (-u_xlat24) + 0.5;
                u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
                u_xlat24 = (-u_xlat24) + 1.0;
                u_xlat16 = u_xlat24 * u_xlat16;
            }
        } else {
            u_xlat16 = 1.0;
        }
        SV_Target0.xyz = u_xlat16_2.yzw;
    } else {
        u_xlatb24 = vs_TEXCOORD1.x==3.0;
        if(u_xlatb24){
            u_xlatb24 = vs_TEXCOORD1.y<2.0;
            if(u_xlatb24){
                u_xlatb24 = vs_TEXCOORD1.y<1.0;
                if(u_xlatb24){
                    u_xlat16_3 = texture(_Texture0, vs_TEXCOORD0.xy);
                } else {
                    u_xlat16_3 = texture(_Texture1, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb24 = vs_TEXCOORD1.y<3.0;
                if(u_xlatb24){
                    u_xlat16_3 = texture(_Texture2, vs_TEXCOORD0.xy);
                } else {
                    u_xlat16_3 = texture(_Texture3, vs_TEXCOORD0.xy);
                }
            }
            u_xlat3 = u_xlat16_2.yzwx * u_xlat16_3;
            u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
            if(u_xlatb24){
                u_xlatb4.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD4.xzxx).xy;
                if(u_xlatb4.x){
                    u_xlat24 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                    u_xlat24 = sqrt(u_xlat24);
                    u_xlat24 = u_xlat24 + -1.0;
                    u_xlat4.x = dFdx(u_xlat24);
                    u_xlat20.x = dFdy(u_xlat24);
                    u_xlat4.x = abs(u_xlat20.x) + abs(u_xlat4.x);
                    u_xlat24 = u_xlat24 / u_xlat4.x;
                    u_xlat16 = (-u_xlat24) + 0.5;
                    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
                } else {
                    u_xlat16 = 1.0;
                }
                if(u_xlatb4.y){
                    u_xlat24 = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                    u_xlat24 = sqrt(u_xlat24);
                    u_xlat24 = u_xlat24 + -1.0;
                    u_xlat4.x = dFdx(u_xlat24);
                    u_xlat12.x = dFdy(u_xlat24);
                    u_xlat4.x = abs(u_xlat12.x) + abs(u_xlat4.x);
                    u_xlat24 = u_xlat24 / u_xlat4.x;
                    u_xlat24 = (-u_xlat24) + 0.5;
                    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
                    u_xlat24 = (-u_xlat24) + 1.0;
                    u_xlat16 = u_xlat24 * u_xlat16;
                }
            } else {
                u_xlat16 = 1.0;
            }
            SV_Target0.xyz = u_xlat3.xyz;
            u_xlat16_2.x = u_xlat3.w;
        } else {
            u_xlatb24 = vs_TEXCOORD1.x==2.0;
            if(u_xlatb24){
                u_xlat16_24 = texture(_FontTex, vs_TEXCOORD0.xy).w;
                u_xlatb3.x = 0.0<_FontTexSDFScale;
                if(u_xlatb3.x){
                    u_xlat1 = vs_TEXCOORD3.xyxy + vec4(0.5, 3.5, 0.5, 1.5);
                    u_xlat1 = u_xlat1 * _ShaderInfoTex_TexelSize.xyxy;
                    u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
                    u_xlat3 = u_xlat16_3 * vec4(_FontTexSDFScale);
                    u_xlat4.y = u_xlat3.w * 0.25;
                    u_xlat5.xy = u_xlat3.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                    u_xlat16_5.z = texture(_FontTex, u_xlat5.xy).w;
                    u_xlat4.x = (-u_xlat4.y);
                    u_xlat4.z = 0.0;
                    u_xlat4.xyz = u_xlat4.xyz + vs_TEXCOORD4.xxx;
                    u_xlat27 = dFdx(vs_TEXCOORD0.y);
                    u_xlat28 = dFdy(vs_TEXCOORD0.y);
                    u_xlat27 = abs(u_xlat27) + abs(u_xlat28);
                    u_xlat16_5.xy = vec2(u_xlat16_24);
                    u_xlat5.xyz = u_xlat16_5.xyz + vec3(-0.5, -0.5, -0.5);
                    u_xlat4.xyz = u_xlat5.xyz * vec3(_FontTexSDFScale) + u_xlat4.xyz;
                    u_xlat4.xyz = u_xlat4.xyz + u_xlat4.xyz;
                    u_xlat3.x = float(0.0);
                    u_xlat3.y = float(0.0);
                    u_xlat3.xyz = _FontTex_TexelSize.www * vec3(u_xlat27) + u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat4.xyz / u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
                    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
                    if(u_xlatb0.x){
                        u_xlat4.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                        u_xlat4.xy = u_xlat4.xy * _ShaderInfoTex_TexelSize.xy;
                        u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                        u_xlat5.w = u_xlat16_8 * u_xlat16_4.w;
                    } else {
                        u_xlat16_4.xyz = u_xlat16_2.yzw;
                        u_xlat5.w = u_xlat16_2.x;
                    }
                    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.www;
                    u_xlat16_1 = textureLod(_ShaderInfoTex, u_xlat1.zw, 0.0);
                    u_xlat4.w = u_xlat16_8 * u_xlat16_1.w;
                    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat4.www;
                    u_xlat6.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
                    u_xlat1 = u_xlat4 * u_xlat6.xxxx;
                    u_xlat1 = u_xlat3.yyyy * u_xlat1;
                    u_xlat1 = u_xlat5 * u_xlat3.xxxx + u_xlat1;
                    u_xlat3.xy = vs_TEXCOORD3.xy + vec2(0.5, 2.5);
                    u_xlat3.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                    u_xlat0.x = u_xlat16_8 * u_xlat16_4.w;
                    u_xlat3.w = u_xlat3.z * u_xlat0.x;
                    u_xlat3.xyz = u_xlat3.www * u_xlat16_4.xyz;
                    u_xlat3 = u_xlat6.xxxx * u_xlat3;
                    u_xlat1 = u_xlat3 * u_xlat6.yyyy + u_xlat1;
                    u_xlatb0.x = 0.0<u_xlat1.w;
                    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.w : 1.0;
                    u_xlat3.xyz = u_xlat1.xyz / u_xlat0.xxx;
                    SV_Target0.xyz = u_xlat3.xyz;
                    u_xlat16_2.x = u_xlat1.w;
                } else {
                    u_xlat2 = u_xlat16_24 * u_xlat16_2.x;
                    SV_Target0.xyz = u_xlat16_2.yzw;
                    u_xlat16_2.x = u_xlat2;
                }
            } else {
                u_xlatu0 = uint(vs_TEXCOORD1.y);
                u_xlat1.y = vs_TEXCOORD1.z + 0.5;
                u_xlat1.x = float(0.5);
                u_xlat17.y = float(0.0);
                u_xlat8.xz = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat8.xz, 0.0);
                u_xlatb3.x = 0.0<u_xlat16_3.x;
                u_xlat19.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
                u_xlat19.xy = u_xlat19.xy + u_xlat19.xy;
                u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat19.xy);
                u_xlat20.x = dot(u_xlat4.xy, u_xlat4.xy);
                u_xlat20.x = inversesqrt(u_xlat20.x);
                u_xlat20.xy = u_xlat20.xx * u_xlat4.xy;
                u_xlat5.x = dot((-u_xlat19.xy), u_xlat20.xy);
                u_xlat19.x = dot(u_xlat19.xy, u_xlat19.xy);
                u_xlat19.x = (-u_xlat5.x) * u_xlat5.x + u_xlat19.x;
                u_xlat19.x = (-u_xlat19.x) + 1.0;
                u_xlat19.x = sqrt(u_xlat19.x);
                u_xlat27 = (-u_xlat19.x) + u_xlat5.x;
                u_xlat19.x = u_xlat19.x + u_xlat5.x;
                u_xlat5.x = min(u_xlat19.x, u_xlat27);
                u_xlatb13 = u_xlat5.x<0.0;
                u_xlat19.x = max(u_xlat19.x, u_xlat27);
                u_xlat19.x = (u_xlatb13) ? u_xlat19.x : u_xlat5.x;
                u_xlat19.xy = u_xlat19.xx * u_xlat20.xy;
                u_xlatb20 = 9.99999975e-05>=abs(u_xlat19.x);
                u_xlatb28 = 9.99999975e-05<abs(u_xlat19.y);
                u_xlat19.xy = u_xlat4.xy / u_xlat19.xy;
                u_xlat27 = u_xlatb28 ? u_xlat19.y : float(0.0);
                u_xlat12.x = (u_xlatb20) ? u_xlat27 : u_xlat19.x;
                u_xlat12.y = 0.0;
                u_xlat4.yz = (u_xlatb3.x) ? u_xlat12.xy : vs_TEXCOORD0.xy;
                u_xlat16_7.x = u_xlat16_3.y * 255.0;
                u_xlat16_7.x = roundEven(u_xlat16_7.x);
                u_xlati3 = int(u_xlat16_7.x);
                u_xlatb11 = u_xlat4.y>=(-u_xlat4.y);
                u_xlat19.x = fract(abs(u_xlat4.y));
                u_xlat11.x = (u_xlatb11) ? u_xlat19.x : (-u_xlat19.x);
                u_xlat11.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat11.x;
                u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
                u_xlat27 = u_xlat11.x;
                u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
                u_xlat3.x = (u_xlatb3.x) ? u_xlat27 : u_xlat11.x;
                u_xlat11.x = u_xlat3.x * 0.5;
                u_xlatb27 = u_xlat11.x>=(-u_xlat11.x);
                u_xlat11.x = fract(abs(u_xlat11.x));
                u_xlat11.x = (u_xlatb27) ? u_xlat11.x : (-u_xlat11.x);
                u_xlat27 = u_xlat11.x + u_xlat11.x;
                u_xlatb11 = 0.5<u_xlat11.x;
                u_xlatb12 = u_xlat27>=(-u_xlat27);
                u_xlat28 = fract(abs(u_xlat27));
                u_xlat12.x = (u_xlatb12) ? u_xlat28 : (-u_xlat28);
                u_xlat12.x = (-u_xlat12.x) + 1.0;
                u_xlat11.x = (u_xlatb11) ? u_xlat12.x : u_xlat27;
                u_xlat4.x = (u_xlatb3.z) ? u_xlat11.x : u_xlat3.x;
                u_xlat17.x = _GradientSettingsTex_TexelSize.x;
                u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat17.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat3.xy, 0.0);
                u_xlat11.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_7.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat11.xz;
                u_xlat3.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
                u_xlat8.xz = u_xlat17.xy * vec2(2.0, 2.0) + u_xlat8.xz;
                u_xlat16_1 = textureLod(_GradientSettingsTex, u_xlat8.xz, 0.0);
                u_xlat8.xz = u_xlat16_1.yw * vec2(255.0, 255.0);
                u_xlat16_7.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat8.xz;
                u_xlat8.xz = u_xlat3.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat3.xy = u_xlat16_7.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat0.xy = u_xlat4.xz * u_xlat3.xy + u_xlat8.xz;
                u_xlatb24 = vs_TEXCOORD1.y<2.0;
                if(u_xlatb24){
                    u_xlatb24 = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb24){
                        u_xlat16_1 = texture(_Texture0, u_xlat0.xy);
                    } else {
                        u_xlat16_1 = texture(_Texture1, u_xlat0.xy);
                    }
                } else {
                    u_xlatb24 = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb24){
                        u_xlat16_1 = texture(_Texture2, u_xlat0.xy);
                    } else {
                        u_xlat16_1 = texture(_Texture3, u_xlat0.xy);
                    }
                }
                u_xlat1 = u_xlat16_2.yzwx * u_xlat16_1;
                SV_Target0.xyz = u_xlat1.xyz;
                u_xlat16_2.x = u_xlat1.w;
            }
            u_xlat16 = 1.0;
        }
    }
    u_xlatu0 = uint(vs_TEXCOORD2.x);
    u_xlat0.xy = vs_TEXCOORD0.zw * _ClipRects[int(u_xlatu0)].xy + _ClipRects[int(u_xlatu0)].zw;
    u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(1.00010002, 1.00010002, 0.0, 0.0)).xy;
    u_xlatb0.x = u_xlatb0.x && u_xlatb0.y;
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat8.x = u_xlat0.x * u_xlat16;
    u_xlat0.x = u_xlat16 * u_xlat0.x + -0.00300000003;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    SV_Target0.w = u_xlat8.x * u_xlat16_2.x;
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
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ClipSpaceParams;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
int u_xlati7;
float u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
int u_xlati13;
uint u_xlatu13;
bvec2 u_xlatb13;
vec2 u_xlat17;
void main()
{
    u_xlat0 = in_TEXCOORD2.xzzw * vec4(765.0, 255.0, 8160.0, 255.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlat13.x = in_TEXCOORD3.x * 255.0;
    u_xlat13.x = roundEven(u_xlat13.x);
    u_xlat2 = (-u_xlat13.xxxx) + vec4(4.0, 3.0, 2.0, 1.0);
    u_xlatb2 = lessThan(abs(u_xlat2), vec4(9.99999975e-05, 9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat3.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat3.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat13.xy = u_xlat3.zz + u_xlat3.wy;
    u_xlat13.x = u_xlat3.y + u_xlat13.x;
    u_xlat13.x = u_xlat3.x + u_xlat13.x;
    u_xlat13.x = min(u_xlat13.x, 1.0);
    u_xlat13.x = (-u_xlat13.x) + 1.0;
    u_xlat3.z = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat3.w = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat4 = u_xlat3.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
    u_xlatb0 = _FontTexSDFScale==0.0;
    u_xlatb0 = u_xlatb0 && u_xlatb2.w;
    u_xlat1.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * _ClipSpaceParams.xy + vec2(0.152700007, 0.152700007);
    u_xlat1.xy = roundEven(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _ClipSpaceParams.zw + vec2(-1.0, -1.0);
    gl_Position.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat4.xy;
    u_xlat1.x = u_xlatb2.w ? float(2.0) : 0.0;
    u_xlat1.y = u_xlatb2.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat1.x + u_xlat13.x;
    u_xlat0.x = u_xlat13.y * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat1.y + u_xlat0.x;
    u_xlat1.x = (-in_TEXCOORD6) + _TextureInfo[1].x;
    u_xlati7 = int((0.0<u_xlat1.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati1.x = int((u_xlat1.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati1.x = (-u_xlati7) + u_xlati1.x;
    u_xlati1.x = max((-u_xlati1.x), u_xlati1.x);
    u_xlat1.x = float(u_xlati1.x);
    u_xlat7 = (-in_TEXCOORD6) + _TextureInfo[2].x;
    u_xlati13 = int((0.0<u_xlat7) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = int((u_xlat7<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = (-u_xlati13) + u_xlati7;
    u_xlati7 = max((-u_xlati7), u_xlati7);
    u_xlat1.y = float(u_xlati7);
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * 2.0 + u_xlat1.x;
    u_xlat7 = (-in_TEXCOORD6) + _TextureInfo[3].x;
    u_xlati13 = int((0.0<u_xlat7) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = int((u_xlat7<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = (-u_xlati13) + u_xlati7;
    u_xlati7 = max((-u_xlati7), u_xlati7);
    u_xlat7 = float(u_xlati7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1.x = u_xlat7 * 3.0 + u_xlat1.x;
    u_xlat7 = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb13.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzw).xy;
    u_xlat2.x = u_xlatb13.x ? 1.0 : float(0.0);
    u_xlat13.x = (u_xlatb13.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb13.y) ? u_xlat13.x : u_xlat2.x;
    if(u_xlatb2.y){
        u_xlatu13 = uint(u_xlat1.x);
        u_xlat3.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu13)].yz;
    } else {
        u_xlat3.xy = in_TEXCOORD0.xy;
    }
    u_xlatb12 = u_xlat0.z>=(-u_xlat0.z);
    u_xlat13.xy = (bool(u_xlatb12)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat6.x = u_xlat0.y * u_xlat13.y;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * u_xlat13.x;
    u_xlat12 = in_TEXCOORD2.z * 255.0 + (-u_xlat6.x);
    u_xlat13.xy = in_TEXCOORD4.yw * vec2(2040.0, 2040.0);
    u_xlat17.x = in_TEXCOORD4.x * 8160.0 + u_xlat6.x;
    u_xlat17.y = u_xlat12 * 0.03125 + u_xlat13.x;
    u_xlat6.xy = u_xlat17.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat6.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat6.x = in_TEXCOORD2.w * 8160.0;
    u_xlatb6 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat12 = u_xlat6.y * u_xlat0.w;
    u_xlat12 = fract(u_xlat12);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat12 = in_TEXCOORD2.w * 255.0 + (-u_xlat6.x);
    u_xlat2.x = in_TEXCOORD4.z * 8160.0 + u_xlat6.x;
    u_xlat2.yz = vec2(u_xlat12) * vec2(0.03125, 0.125) + u_xlat13.yy;
    u_xlat6.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD1.z = (u_xlatb2.w) ? 1.0 : u_xlat7;
    vs_TEXCOORD3.xy = (u_xlatb2.w) ? u_xlat2.xz : u_xlat6.xy;
    vs_TEXCOORD4.x = (u_xlatb2.w) ? in_TEXCOORD3.y : in_TEXCOORD5.x;
    gl_Position.zw = u_xlat4.zw;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = u_xlat3;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat1.x;
    u_xlat5.x = in_TEXCOORD2.y * 255.0;
    u_xlat5.y = 0.0;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.yzw = in_TEXCOORD5.yzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(5) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(6) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uint u_xlatu0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
vec2 u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat19;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlatb0.x = vs_TEXCOORD1.w>=2.0;
    u_xlat8.x = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD1.w;
    u_xlat16_8 = textureLod(_ShaderInfoTex, vs_TEXCOORD2.zw, 0.0).w;
    u_xlatb16.x = vs_TEXCOORD1.x!=2.0;
    u_xlatb16.x = u_xlatb16.x && u_xlatb0.x;
    if(u_xlatb16.x){
        u_xlat16_2 = textureLod(_ShaderInfoTex, vs_TEXCOORD3.xy, 0.0).wxyz;
        u_xlat16_2 = u_xlat16_2;
    } else {
        u_xlat16_2.x = u_xlat16_8 * vs_COLOR0.w;
        u_xlat16_2.yzw = vs_COLOR0.xyz;
    }
    u_xlatb16.x = vs_TEXCOORD1.x==1.0;
    if(u_xlatb16.x){
        u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
        if(u_xlatb16.x){
            u_xlatb16.xy = lessThan(vec4(-9999.0, -9999.0, -9999.0, -9999.0), vs_TEXCOORD4.xzxz).xy;
            if(u_xlatb16.x){
                u_xlat16 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                u_xlat16 = sqrt(u_xlat16);
                u_xlat16 = u_xlat16 + -1.0;
                u_xlat3.x = dFdx(u_xlat16);
                u_xlat11.x = dFdy(u_xlat16);
                u_xlat3.x = abs(u_xlat11.x) + abs(u_xlat3.x);
                u_xlat16 = u_xlat16 / u_xlat3.x;
                u_xlat16 = (-u_xlat16) + 0.5;
                u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
            } else {
                u_xlat16 = 1.0;
            }
            if(u_xlatb16.y){
                u_xlat24 = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                u_xlat24 = sqrt(u_xlat24);
                u_xlat24 = u_xlat24 + -1.0;
                u_xlat3.x = dFdx(u_xlat24);
                u_xlat11.x = dFdy(u_xlat24);
                u_xlat3.x = abs(u_xlat11.x) + abs(u_xlat3.x);
                u_xlat24 = u_xlat24 / u_xlat3.x;
                u_xlat24 = (-u_xlat24) + 0.5;
                u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
                u_xlat24 = (-u_xlat24) + 1.0;
                u_xlat16 = u_xlat24 * u_xlat16;
            }
        } else {
            u_xlat16 = 1.0;
        }
        SV_Target0.xyz = u_xlat16_2.yzw;
    } else {
        u_xlatb24 = vs_TEXCOORD1.x==3.0;
        if(u_xlatb24){
            u_xlatb24 = vs_TEXCOORD1.y<2.0;
            if(u_xlatb24){
                u_xlatb24 = vs_TEXCOORD1.y<1.0;
                if(u_xlatb24){
                    u_xlat16_3 = texture(_Texture0, vs_TEXCOORD0.xy);
                } else {
                    u_xlat16_3 = texture(_Texture1, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb24 = vs_TEXCOORD1.y<3.0;
                if(u_xlatb24){
                    u_xlat16_3 = texture(_Texture2, vs_TEXCOORD0.xy);
                } else {
                    u_xlat16_3 = texture(_Texture3, vs_TEXCOORD0.xy);
                }
            }
            u_xlat3 = u_xlat16_2.yzwx * u_xlat16_3;
            u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
            if(u_xlatb24){
                u_xlatb4.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD4.xzxx).xy;
                if(u_xlatb4.x){
                    u_xlat24 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                    u_xlat24 = sqrt(u_xlat24);
                    u_xlat24 = u_xlat24 + -1.0;
                    u_xlat4.x = dFdx(u_xlat24);
                    u_xlat20.x = dFdy(u_xlat24);
                    u_xlat4.x = abs(u_xlat20.x) + abs(u_xlat4.x);
                    u_xlat24 = u_xlat24 / u_xlat4.x;
                    u_xlat16 = (-u_xlat24) + 0.5;
                    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
                } else {
                    u_xlat16 = 1.0;
                }
                if(u_xlatb4.y){
                    u_xlat24 = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                    u_xlat24 = sqrt(u_xlat24);
                    u_xlat24 = u_xlat24 + -1.0;
                    u_xlat4.x = dFdx(u_xlat24);
                    u_xlat12.x = dFdy(u_xlat24);
                    u_xlat4.x = abs(u_xlat12.x) + abs(u_xlat4.x);
                    u_xlat24 = u_xlat24 / u_xlat4.x;
                    u_xlat24 = (-u_xlat24) + 0.5;
                    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
                    u_xlat24 = (-u_xlat24) + 1.0;
                    u_xlat16 = u_xlat24 * u_xlat16;
                }
            } else {
                u_xlat16 = 1.0;
            }
            SV_Target0.xyz = u_xlat3.xyz;
            u_xlat16_2.x = u_xlat3.w;
        } else {
            u_xlatb24 = vs_TEXCOORD1.x==2.0;
            if(u_xlatb24){
                u_xlat16_24 = texture(_FontTex, vs_TEXCOORD0.xy).w;
                u_xlatb3.x = 0.0<_FontTexSDFScale;
                if(u_xlatb3.x){
                    u_xlat1 = vs_TEXCOORD3.xyxy + vec4(0.5, 3.5, 0.5, 1.5);
                    u_xlat1 = u_xlat1 * _ShaderInfoTex_TexelSize.xyxy;
                    u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
                    u_xlat3 = u_xlat16_3 * vec4(_FontTexSDFScale);
                    u_xlat4.y = u_xlat3.w * 0.25;
                    u_xlat5.xy = u_xlat3.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                    u_xlat16_5.z = texture(_FontTex, u_xlat5.xy).w;
                    u_xlat4.x = (-u_xlat4.y);
                    u_xlat4.z = 0.0;
                    u_xlat4.xyz = u_xlat4.xyz + vs_TEXCOORD4.xxx;
                    u_xlat27 = dFdx(vs_TEXCOORD0.y);
                    u_xlat28 = dFdy(vs_TEXCOORD0.y);
                    u_xlat27 = abs(u_xlat27) + abs(u_xlat28);
                    u_xlat16_5.xy = vec2(u_xlat16_24);
                    u_xlat5.xyz = u_xlat16_5.xyz + vec3(-0.5, -0.5, -0.5);
                    u_xlat4.xyz = u_xlat5.xyz * vec3(_FontTexSDFScale) + u_xlat4.xyz;
                    u_xlat4.xyz = u_xlat4.xyz + u_xlat4.xyz;
                    u_xlat3.x = float(0.0);
                    u_xlat3.y = float(0.0);
                    u_xlat3.xyz = _FontTex_TexelSize.www * vec3(u_xlat27) + u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat4.xyz / u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
                    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
                    if(u_xlatb0.x){
                        u_xlat4.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                        u_xlat4.xy = u_xlat4.xy * _ShaderInfoTex_TexelSize.xy;
                        u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                        u_xlat5.w = u_xlat16_8 * u_xlat16_4.w;
                    } else {
                        u_xlat16_4.xyz = u_xlat16_2.yzw;
                        u_xlat5.w = u_xlat16_2.x;
                    }
                    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.www;
                    u_xlat16_1 = textureLod(_ShaderInfoTex, u_xlat1.zw, 0.0);
                    u_xlat4.w = u_xlat16_8 * u_xlat16_1.w;
                    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat4.www;
                    u_xlat6.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
                    u_xlat1 = u_xlat4 * u_xlat6.xxxx;
                    u_xlat1 = u_xlat3.yyyy * u_xlat1;
                    u_xlat1 = u_xlat5 * u_xlat3.xxxx + u_xlat1;
                    u_xlat3.xy = vs_TEXCOORD3.xy + vec2(0.5, 2.5);
                    u_xlat3.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                    u_xlat0.x = u_xlat16_8 * u_xlat16_4.w;
                    u_xlat3.w = u_xlat3.z * u_xlat0.x;
                    u_xlat3.xyz = u_xlat3.www * u_xlat16_4.xyz;
                    u_xlat3 = u_xlat6.xxxx * u_xlat3;
                    u_xlat1 = u_xlat3 * u_xlat6.yyyy + u_xlat1;
                    u_xlatb0.x = 0.0<u_xlat1.w;
                    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.w : 1.0;
                    u_xlat3.xyz = u_xlat1.xyz / u_xlat0.xxx;
                    SV_Target0.xyz = u_xlat3.xyz;
                    u_xlat16_2.x = u_xlat1.w;
                } else {
                    u_xlat2 = u_xlat16_24 * u_xlat16_2.x;
                    SV_Target0.xyz = u_xlat16_2.yzw;
                    u_xlat16_2.x = u_xlat2;
                }
            } else {
                u_xlatu0 = uint(vs_TEXCOORD1.y);
                u_xlat1.y = vs_TEXCOORD1.z + 0.5;
                u_xlat1.x = float(0.5);
                u_xlat17.y = float(0.0);
                u_xlat8.xz = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat8.xz, 0.0);
                u_xlatb3.x = 0.0<u_xlat16_3.x;
                u_xlat19.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
                u_xlat19.xy = u_xlat19.xy + u_xlat19.xy;
                u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat19.xy);
                u_xlat20.x = dot(u_xlat4.xy, u_xlat4.xy);
                u_xlat20.x = inversesqrt(u_xlat20.x);
                u_xlat20.xy = u_xlat20.xx * u_xlat4.xy;
                u_xlat5.x = dot((-u_xlat19.xy), u_xlat20.xy);
                u_xlat19.x = dot(u_xlat19.xy, u_xlat19.xy);
                u_xlat19.x = (-u_xlat5.x) * u_xlat5.x + u_xlat19.x;
                u_xlat19.x = (-u_xlat19.x) + 1.0;
                u_xlat19.x = sqrt(u_xlat19.x);
                u_xlat27 = (-u_xlat19.x) + u_xlat5.x;
                u_xlat19.x = u_xlat19.x + u_xlat5.x;
                u_xlat5.x = min(u_xlat19.x, u_xlat27);
                u_xlatb13 = u_xlat5.x<0.0;
                u_xlat19.x = max(u_xlat19.x, u_xlat27);
                u_xlat19.x = (u_xlatb13) ? u_xlat19.x : u_xlat5.x;
                u_xlat19.xy = u_xlat19.xx * u_xlat20.xy;
                u_xlatb20 = 9.99999975e-05>=abs(u_xlat19.x);
                u_xlatb28 = 9.99999975e-05<abs(u_xlat19.y);
                u_xlat19.xy = u_xlat4.xy / u_xlat19.xy;
                u_xlat27 = u_xlatb28 ? u_xlat19.y : float(0.0);
                u_xlat12.x = (u_xlatb20) ? u_xlat27 : u_xlat19.x;
                u_xlat12.y = 0.0;
                u_xlat4.yz = (u_xlatb3.x) ? u_xlat12.xy : vs_TEXCOORD0.xy;
                u_xlat16_7.x = u_xlat16_3.y * 255.0;
                u_xlat16_7.x = roundEven(u_xlat16_7.x);
                u_xlati3 = int(u_xlat16_7.x);
                u_xlatb11 = u_xlat4.y>=(-u_xlat4.y);
                u_xlat19.x = fract(abs(u_xlat4.y));
                u_xlat11.x = (u_xlatb11) ? u_xlat19.x : (-u_xlat19.x);
                u_xlat11.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat11.x;
                u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
                u_xlat27 = u_xlat11.x;
                u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
                u_xlat3.x = (u_xlatb3.x) ? u_xlat27 : u_xlat11.x;
                u_xlat11.x = u_xlat3.x * 0.5;
                u_xlatb27 = u_xlat11.x>=(-u_xlat11.x);
                u_xlat11.x = fract(abs(u_xlat11.x));
                u_xlat11.x = (u_xlatb27) ? u_xlat11.x : (-u_xlat11.x);
                u_xlat27 = u_xlat11.x + u_xlat11.x;
                u_xlatb11 = 0.5<u_xlat11.x;
                u_xlatb12 = u_xlat27>=(-u_xlat27);
                u_xlat28 = fract(abs(u_xlat27));
                u_xlat12.x = (u_xlatb12) ? u_xlat28 : (-u_xlat28);
                u_xlat12.x = (-u_xlat12.x) + 1.0;
                u_xlat11.x = (u_xlatb11) ? u_xlat12.x : u_xlat27;
                u_xlat4.x = (u_xlatb3.z) ? u_xlat11.x : u_xlat3.x;
                u_xlat17.x = _GradientSettingsTex_TexelSize.x;
                u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat17.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat3.xy, 0.0);
                u_xlat11.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_7.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat11.xz;
                u_xlat3.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
                u_xlat8.xz = u_xlat17.xy * vec2(2.0, 2.0) + u_xlat8.xz;
                u_xlat16_1 = textureLod(_GradientSettingsTex, u_xlat8.xz, 0.0);
                u_xlat8.xz = u_xlat16_1.yw * vec2(255.0, 255.0);
                u_xlat16_7.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat8.xz;
                u_xlat8.xz = u_xlat3.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat3.xy = u_xlat16_7.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat0.xy = u_xlat4.xz * u_xlat3.xy + u_xlat8.xz;
                u_xlatb24 = vs_TEXCOORD1.y<2.0;
                if(u_xlatb24){
                    u_xlatb24 = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb24){
                        u_xlat16_1 = texture(_Texture0, u_xlat0.xy);
                    } else {
                        u_xlat16_1 = texture(_Texture1, u_xlat0.xy);
                    }
                } else {
                    u_xlatb24 = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb24){
                        u_xlat16_1 = texture(_Texture2, u_xlat0.xy);
                    } else {
                        u_xlat16_1 = texture(_Texture3, u_xlat0.xy);
                    }
                }
                u_xlat1 = u_xlat16_2.yzwx * u_xlat16_1;
                SV_Target0.xyz = u_xlat1.xyz;
                u_xlat16_2.x = u_xlat1.w;
            }
            u_xlat16 = 1.0;
        }
    }
    u_xlatu0 = uint(vs_TEXCOORD2.x);
    u_xlat0.xy = vs_TEXCOORD0.zw * _ClipRects[int(u_xlatu0)].xy + _ClipRects[int(u_xlatu0)].zw;
    u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(1.00010002, 1.00010002, 0.0, 0.0)).xy;
    u_xlatb0.x = u_xlatb0.x && u_xlatb0.y;
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat8.x = u_xlat0.x * u_xlat16;
    u_xlat0.x = u_xlat16 * u_xlat0.x + -0.00300000003;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    SV_Target0.w = u_xlat8.x * u_xlat16_2.x;
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
uniform 	float _FontTexSDFScale;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ClipSpaceParams;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
in highp vec4 in_TEXCOORD4;
in highp vec4 in_TEXCOORD5;
in highp float in_TEXCOORD6;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
int u_xlati7;
float u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
int u_xlati13;
uint u_xlatu13;
bvec2 u_xlatb13;
vec2 u_xlat17;
void main()
{
    u_xlat0 = in_TEXCOORD2.xzzw * vec4(765.0, 255.0, 8160.0, 255.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlat13.x = in_TEXCOORD3.x * 255.0;
    u_xlat13.x = roundEven(u_xlat13.x);
    u_xlat2 = (-u_xlat13.xxxx) + vec4(4.0, 3.0, 2.0, 1.0);
    u_xlatb2 = lessThan(abs(u_xlat2), vec4(9.99999975e-05, 9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat3.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat3.w = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat13.xy = u_xlat3.zz + u_xlat3.wy;
    u_xlat13.x = u_xlat3.y + u_xlat13.x;
    u_xlat13.x = u_xlat3.x + u_xlat13.x;
    u_xlat13.x = min(u_xlat13.x, 1.0);
    u_xlat13.x = (-u_xlat13.x) + 1.0;
    u_xlat3.z = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat3.w = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat4 = u_xlat3.wwww * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
    u_xlatb0 = _FontTexSDFScale==0.0;
    u_xlatb0 = u_xlatb0 && u_xlatb2.w;
    u_xlat1.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * _ClipSpaceParams.xy + vec2(0.152700007, 0.152700007);
    u_xlat1.xy = roundEven(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _ClipSpaceParams.zw + vec2(-1.0, -1.0);
    gl_Position.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat4.xy;
    u_xlat1.x = u_xlatb2.w ? float(2.0) : 0.0;
    u_xlat1.y = u_xlatb2.x ? float(4.0) : 0.0;
;
    u_xlat0.x = u_xlat1.x + u_xlat13.x;
    u_xlat0.x = u_xlat13.y * 3.0 + u_xlat0.x;
    u_xlat0.x = u_xlat1.y + u_xlat0.x;
    u_xlat1.x = (-in_TEXCOORD6) + _TextureInfo[1].x;
    u_xlati7 = int((0.0<u_xlat1.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati1.x = int((u_xlat1.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati1.x = (-u_xlati7) + u_xlati1.x;
    u_xlati1.x = max((-u_xlati1.x), u_xlati1.x);
    u_xlat1.x = float(u_xlati1.x);
    u_xlat7 = (-in_TEXCOORD6) + _TextureInfo[2].x;
    u_xlati13 = int((0.0<u_xlat7) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = int((u_xlat7<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = (-u_xlati13) + u_xlati7;
    u_xlati7 = max((-u_xlati7), u_xlati7);
    u_xlat1.y = float(u_xlati7);
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * 2.0 + u_xlat1.x;
    u_xlat7 = (-in_TEXCOORD6) + _TextureInfo[3].x;
    u_xlati13 = int((0.0<u_xlat7) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = int((u_xlat7<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlati7 = (-u_xlati13) + u_xlati7;
    u_xlati7 = max((-u_xlati7), u_xlati7);
    u_xlat7 = float(u_xlati7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1.x = u_xlat7 * 3.0 + u_xlat1.x;
    u_xlat7 = dot(in_TEXCOORD4.zw, vec2(65025.0, 255.0));
    u_xlatb13.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_TEXCOORD3.zwzw).xy;
    u_xlat2.x = u_xlatb13.x ? 1.0 : float(0.0);
    u_xlat13.x = (u_xlatb13.x) ? 3.0 : 2.0;
    vs_TEXCOORD1.w = (u_xlatb13.y) ? u_xlat13.x : u_xlat2.x;
    if(u_xlatb2.y){
        u_xlatu13 = uint(u_xlat1.x);
        u_xlat3.xy = in_TEXCOORD0.xy * _TextureInfo[int(u_xlatu13)].yz;
    } else {
        u_xlat3.xy = in_TEXCOORD0.xy;
    }
    u_xlatb12 = u_xlat0.z>=(-u_xlat0.z);
    u_xlat13.xy = (bool(u_xlatb12)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat6.x = u_xlat0.y * u_xlat13.y;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * u_xlat13.x;
    u_xlat12 = in_TEXCOORD2.z * 255.0 + (-u_xlat6.x);
    u_xlat13.xy = in_TEXCOORD4.yw * vec2(2040.0, 2040.0);
    u_xlat17.x = in_TEXCOORD4.x * 8160.0 + u_xlat6.x;
    u_xlat17.y = u_xlat12 * 0.03125 + u_xlat13.x;
    u_xlat6.xy = u_xlat17.xy + vec2(0.5, 0.5);
    u_xlat5.zw = u_xlat6.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat6.x = in_TEXCOORD2.w * 8160.0;
    u_xlatb6 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat12 = u_xlat6.y * u_xlat0.w;
    u_xlat12 = fract(u_xlat12);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat12 = in_TEXCOORD2.w * 255.0 + (-u_xlat6.x);
    u_xlat2.x = in_TEXCOORD4.z * 8160.0 + u_xlat6.x;
    u_xlat2.yz = vec2(u_xlat12) * vec2(0.03125, 0.125) + u_xlat13.yy;
    u_xlat6.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat6.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD1.z = (u_xlatb2.w) ? 1.0 : u_xlat7;
    vs_TEXCOORD3.xy = (u_xlatb2.w) ? u_xlat2.xz : u_xlat6.xy;
    vs_TEXCOORD4.x = (u_xlatb2.w) ? in_TEXCOORD3.y : in_TEXCOORD5.x;
    gl_Position.zw = u_xlat4.zw;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = u_xlat3;
    vs_TEXCOORD1.x = u_xlat0.x;
    vs_TEXCOORD1.y = u_xlat1.x;
    u_xlat5.x = in_TEXCOORD2.y * 255.0;
    u_xlat5.y = 0.0;
    vs_TEXCOORD2 = u_xlat5;
    vs_TEXCOORD4.yzw = in_TEXCOORD5.yzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _FontTex_TexelSize;
uniform 	float _FontTexSDFScale;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _TextureInfo[4];
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture1;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture2;
UNITY_LOCATION(4) uniform mediump sampler2D _Texture3;
UNITY_LOCATION(5) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(6) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uint u_xlatu0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
vec2 u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat19;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlatb0.x = vs_TEXCOORD1.w>=2.0;
    u_xlat8.x = vs_TEXCOORD1.w + -2.0;
    u_xlat16_1.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD1.w;
    u_xlat16_8 = textureLod(_ShaderInfoTex, vs_TEXCOORD2.zw, 0.0).w;
    u_xlatb16.x = vs_TEXCOORD1.x!=2.0;
    u_xlatb16.x = u_xlatb16.x && u_xlatb0.x;
    if(u_xlatb16.x){
        u_xlat16_2 = textureLod(_ShaderInfoTex, vs_TEXCOORD3.xy, 0.0).wxyz;
        u_xlat16_2 = u_xlat16_2;
    } else {
        u_xlat16_2.x = u_xlat16_8 * vs_COLOR0.w;
        u_xlat16_2.yzw = vs_COLOR0.xyz;
    }
    u_xlatb16.x = vs_TEXCOORD1.x==1.0;
    if(u_xlatb16.x){
        u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
        if(u_xlatb16.x){
            u_xlatb16.xy = lessThan(vec4(-9999.0, -9999.0, -9999.0, -9999.0), vs_TEXCOORD4.xzxz).xy;
            if(u_xlatb16.x){
                u_xlat16 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                u_xlat16 = sqrt(u_xlat16);
                u_xlat16 = u_xlat16 + -1.0;
                u_xlat3.x = dFdx(u_xlat16);
                u_xlat11.x = dFdy(u_xlat16);
                u_xlat3.x = abs(u_xlat11.x) + abs(u_xlat3.x);
                u_xlat16 = u_xlat16 / u_xlat3.x;
                u_xlat16 = (-u_xlat16) + 0.5;
                u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
            } else {
                u_xlat16 = 1.0;
            }
            if(u_xlatb16.y){
                u_xlat24 = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                u_xlat24 = sqrt(u_xlat24);
                u_xlat24 = u_xlat24 + -1.0;
                u_xlat3.x = dFdx(u_xlat24);
                u_xlat11.x = dFdy(u_xlat24);
                u_xlat3.x = abs(u_xlat11.x) + abs(u_xlat3.x);
                u_xlat24 = u_xlat24 / u_xlat3.x;
                u_xlat24 = (-u_xlat24) + 0.5;
                u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
                u_xlat24 = (-u_xlat24) + 1.0;
                u_xlat16 = u_xlat24 * u_xlat16;
            }
        } else {
            u_xlat16 = 1.0;
        }
        SV_Target0.xyz = u_xlat16_2.yzw;
    } else {
        u_xlatb24 = vs_TEXCOORD1.x==3.0;
        if(u_xlatb24){
            u_xlatb24 = vs_TEXCOORD1.y<2.0;
            if(u_xlatb24){
                u_xlatb24 = vs_TEXCOORD1.y<1.0;
                if(u_xlatb24){
                    u_xlat16_3 = texture(_Texture0, vs_TEXCOORD0.xy);
                } else {
                    u_xlat16_3 = texture(_Texture1, vs_TEXCOORD0.xy);
                }
            } else {
                u_xlatb24 = vs_TEXCOORD1.y<3.0;
                if(u_xlatb24){
                    u_xlat16_3 = texture(_Texture2, vs_TEXCOORD0.xy);
                } else {
                    u_xlat16_3 = texture(_Texture3, vs_TEXCOORD0.xy);
                }
            }
            u_xlat3 = u_xlat16_2.yzwx * u_xlat16_3;
            u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(u_xlat16_1.x);
            if(u_xlatb24){
                u_xlatb4.xy = lessThan(vec4(-9999.0, -9999.0, 0.0, 0.0), vs_TEXCOORD4.xzxx).xy;
                if(u_xlatb4.x){
                    u_xlat24 = dot(vs_TEXCOORD4.xy, vs_TEXCOORD4.xy);
                    u_xlat24 = sqrt(u_xlat24);
                    u_xlat24 = u_xlat24 + -1.0;
                    u_xlat4.x = dFdx(u_xlat24);
                    u_xlat20.x = dFdy(u_xlat24);
                    u_xlat4.x = abs(u_xlat20.x) + abs(u_xlat4.x);
                    u_xlat24 = u_xlat24 / u_xlat4.x;
                    u_xlat16 = (-u_xlat24) + 0.5;
                    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
                } else {
                    u_xlat16 = 1.0;
                }
                if(u_xlatb4.y){
                    u_xlat24 = dot(vs_TEXCOORD4.zw, vs_TEXCOORD4.zw);
                    u_xlat24 = sqrt(u_xlat24);
                    u_xlat24 = u_xlat24 + -1.0;
                    u_xlat4.x = dFdx(u_xlat24);
                    u_xlat12.x = dFdy(u_xlat24);
                    u_xlat4.x = abs(u_xlat12.x) + abs(u_xlat4.x);
                    u_xlat24 = u_xlat24 / u_xlat4.x;
                    u_xlat24 = (-u_xlat24) + 0.5;
                    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
                    u_xlat24 = (-u_xlat24) + 1.0;
                    u_xlat16 = u_xlat24 * u_xlat16;
                }
            } else {
                u_xlat16 = 1.0;
            }
            SV_Target0.xyz = u_xlat3.xyz;
            u_xlat16_2.x = u_xlat3.w;
        } else {
            u_xlatb24 = vs_TEXCOORD1.x==2.0;
            if(u_xlatb24){
                u_xlat16_24 = texture(_FontTex, vs_TEXCOORD0.xy).w;
                u_xlatb3.x = 0.0<_FontTexSDFScale;
                if(u_xlatb3.x){
                    u_xlat1 = vs_TEXCOORD3.xyxy + vec4(0.5, 3.5, 0.5, 1.5);
                    u_xlat1 = u_xlat1 * _ShaderInfoTex_TexelSize.xyxy;
                    u_xlat16_3 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
                    u_xlat3 = u_xlat16_3 * vec4(_FontTexSDFScale);
                    u_xlat4.y = u_xlat3.w * 0.25;
                    u_xlat5.xy = u_xlat3.xy * _FontTex_TexelSize.xx + vs_TEXCOORD0.xy;
                    u_xlat16_5.z = texture(_FontTex, u_xlat5.xy).w;
                    u_xlat4.x = (-u_xlat4.y);
                    u_xlat4.z = 0.0;
                    u_xlat4.xyz = u_xlat4.xyz + vs_TEXCOORD4.xxx;
                    u_xlat27 = dFdx(vs_TEXCOORD0.y);
                    u_xlat28 = dFdy(vs_TEXCOORD0.y);
                    u_xlat27 = abs(u_xlat27) + abs(u_xlat28);
                    u_xlat16_5.xy = vec2(u_xlat16_24);
                    u_xlat5.xyz = u_xlat16_5.xyz + vec3(-0.5, -0.5, -0.5);
                    u_xlat4.xyz = u_xlat5.xyz * vec3(_FontTexSDFScale) + u_xlat4.xyz;
                    u_xlat4.xyz = u_xlat4.xyz + u_xlat4.xyz;
                    u_xlat3.x = float(0.0);
                    u_xlat3.y = float(0.0);
                    u_xlat3.xyz = _FontTex_TexelSize.www * vec3(u_xlat27) + u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat4.xyz / u_xlat3.xyz;
                    u_xlat3.xyz = u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
                    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
                    if(u_xlatb0.x){
                        u_xlat4.xy = vs_TEXCOORD3.xy + vec2(0.5, 0.5);
                        u_xlat4.xy = u_xlat4.xy * _ShaderInfoTex_TexelSize.xy;
                        u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat4.xy, 0.0);
                        u_xlat5.w = u_xlat16_8 * u_xlat16_4.w;
                    } else {
                        u_xlat16_4.xyz = u_xlat16_2.yzw;
                        u_xlat5.w = u_xlat16_2.x;
                    }
                    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.www;
                    u_xlat16_1 = textureLod(_ShaderInfoTex, u_xlat1.zw, 0.0);
                    u_xlat4.w = u_xlat16_8 * u_xlat16_1.w;
                    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat4.www;
                    u_xlat6.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
                    u_xlat1 = u_xlat4 * u_xlat6.xxxx;
                    u_xlat1 = u_xlat3.yyyy * u_xlat1;
                    u_xlat1 = u_xlat5 * u_xlat3.xxxx + u_xlat1;
                    u_xlat3.xy = vs_TEXCOORD3.xy + vec2(0.5, 2.5);
                    u_xlat3.xy = u_xlat3.xy * _ShaderInfoTex_TexelSize.xy;
                    u_xlat16_4 = textureLod(_ShaderInfoTex, u_xlat3.xy, 0.0);
                    u_xlat0.x = u_xlat16_8 * u_xlat16_4.w;
                    u_xlat3.w = u_xlat3.z * u_xlat0.x;
                    u_xlat3.xyz = u_xlat3.www * u_xlat16_4.xyz;
                    u_xlat3 = u_xlat6.xxxx * u_xlat3;
                    u_xlat1 = u_xlat3 * u_xlat6.yyyy + u_xlat1;
                    u_xlatb0.x = 0.0<u_xlat1.w;
                    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.w : 1.0;
                    u_xlat3.xyz = u_xlat1.xyz / u_xlat0.xxx;
                    SV_Target0.xyz = u_xlat3.xyz;
                    u_xlat16_2.x = u_xlat1.w;
                } else {
                    u_xlat2 = u_xlat16_24 * u_xlat16_2.x;
                    SV_Target0.xyz = u_xlat16_2.yzw;
                    u_xlat16_2.x = u_xlat2;
                }
            } else {
                u_xlatu0 = uint(vs_TEXCOORD1.y);
                u_xlat1.y = vs_TEXCOORD1.z + 0.5;
                u_xlat1.x = float(0.5);
                u_xlat17.y = float(0.0);
                u_xlat8.xz = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat8.xz, 0.0);
                u_xlatb3.x = 0.0<u_xlat16_3.x;
                u_xlat19.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
                u_xlat19.xy = u_xlat19.xy + u_xlat19.xy;
                u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
                u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat19.xy);
                u_xlat20.x = dot(u_xlat4.xy, u_xlat4.xy);
                u_xlat20.x = inversesqrt(u_xlat20.x);
                u_xlat20.xy = u_xlat20.xx * u_xlat4.xy;
                u_xlat5.x = dot((-u_xlat19.xy), u_xlat20.xy);
                u_xlat19.x = dot(u_xlat19.xy, u_xlat19.xy);
                u_xlat19.x = (-u_xlat5.x) * u_xlat5.x + u_xlat19.x;
                u_xlat19.x = (-u_xlat19.x) + 1.0;
                u_xlat19.x = sqrt(u_xlat19.x);
                u_xlat27 = (-u_xlat19.x) + u_xlat5.x;
                u_xlat19.x = u_xlat19.x + u_xlat5.x;
                u_xlat5.x = min(u_xlat19.x, u_xlat27);
                u_xlatb13 = u_xlat5.x<0.0;
                u_xlat19.x = max(u_xlat19.x, u_xlat27);
                u_xlat19.x = (u_xlatb13) ? u_xlat19.x : u_xlat5.x;
                u_xlat19.xy = u_xlat19.xx * u_xlat20.xy;
                u_xlatb20 = 9.99999975e-05>=abs(u_xlat19.x);
                u_xlatb28 = 9.99999975e-05<abs(u_xlat19.y);
                u_xlat19.xy = u_xlat4.xy / u_xlat19.xy;
                u_xlat27 = u_xlatb28 ? u_xlat19.y : float(0.0);
                u_xlat12.x = (u_xlatb20) ? u_xlat27 : u_xlat19.x;
                u_xlat12.y = 0.0;
                u_xlat4.yz = (u_xlatb3.x) ? u_xlat12.xy : vs_TEXCOORD0.xy;
                u_xlat16_7.x = u_xlat16_3.y * 255.0;
                u_xlat16_7.x = roundEven(u_xlat16_7.x);
                u_xlati3 = int(u_xlat16_7.x);
                u_xlatb11 = u_xlat4.y>=(-u_xlat4.y);
                u_xlat19.x = fract(abs(u_xlat4.y));
                u_xlat11.x = (u_xlatb11) ? u_xlat19.x : (-u_xlat19.x);
                u_xlat11.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat11.x;
                u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
                u_xlat27 = u_xlat11.x;
                u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
                u_xlat3.x = (u_xlatb3.x) ? u_xlat27 : u_xlat11.x;
                u_xlat11.x = u_xlat3.x * 0.5;
                u_xlatb27 = u_xlat11.x>=(-u_xlat11.x);
                u_xlat11.x = fract(abs(u_xlat11.x));
                u_xlat11.x = (u_xlatb27) ? u_xlat11.x : (-u_xlat11.x);
                u_xlat27 = u_xlat11.x + u_xlat11.x;
                u_xlatb11 = 0.5<u_xlat11.x;
                u_xlatb12 = u_xlat27>=(-u_xlat27);
                u_xlat28 = fract(abs(u_xlat27));
                u_xlat12.x = (u_xlatb12) ? u_xlat28 : (-u_xlat28);
                u_xlat12.x = (-u_xlat12.x) + 1.0;
                u_xlat11.x = (u_xlatb11) ? u_xlat12.x : u_xlat27;
                u_xlat4.x = (u_xlatb3.z) ? u_xlat11.x : u_xlat3.x;
                u_xlat17.x = _GradientSettingsTex_TexelSize.x;
                u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat17.xy;
                u_xlat16_3 = textureLod(_GradientSettingsTex, u_xlat3.xy, 0.0);
                u_xlat11.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
                u_xlat16_7.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat11.xz;
                u_xlat3.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
                u_xlat8.xz = u_xlat17.xy * vec2(2.0, 2.0) + u_xlat8.xz;
                u_xlat16_1 = textureLod(_GradientSettingsTex, u_xlat8.xz, 0.0);
                u_xlat8.xz = u_xlat16_1.yw * vec2(255.0, 255.0);
                u_xlat16_7.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat8.xz;
                u_xlat8.xz = u_xlat3.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat3.xy = u_xlat16_7.xy * _TextureInfo[int(u_xlatu0)].yz;
                u_xlat0.xy = u_xlat4.xz * u_xlat3.xy + u_xlat8.xz;
                u_xlatb24 = vs_TEXCOORD1.y<2.0;
                if(u_xlatb24){
                    u_xlatb24 = vs_TEXCOORD1.y<1.0;
                    if(u_xlatb24){
                        u_xlat16_1 = texture(_Texture0, u_xlat0.xy);
                    } else {
                        u_xlat16_1 = texture(_Texture1, u_xlat0.xy);
                    }
                } else {
                    u_xlatb24 = vs_TEXCOORD1.y<3.0;
                    if(u_xlatb24){
                        u_xlat16_1 = texture(_Texture2, u_xlat0.xy);
                    } else {
                        u_xlat16_1 = texture(_Texture3, u_xlat0.xy);
                    }
                }
                u_xlat1 = u_xlat16_2.yzwx * u_xlat16_1;
                SV_Target0.xyz = u_xlat1.xyz;
                u_xlat16_2.x = u_xlat1.w;
            }
            u_xlat16 = 1.0;
        }
    }
    u_xlatu0 = uint(vs_TEXCOORD2.x);
    u_xlat0.xy = vs_TEXCOORD0.zw * _ClipRects[int(u_xlatu0)].xy + _ClipRects[int(u_xlatu0)].zw;
    u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(1.00010002, 1.00010002, 0.0, 0.0)).xy;
    u_xlatb0.x = u_xlatb0.x && u_xlatb0.y;
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat8.x = u_xlat0.x * u_xlat16;
    u_xlat0.x = u_xlat16 * u_xlat0.x + -0.00300000003;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    SV_Target0.w = u_xlat8.x * u_xlat16_2.x;
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