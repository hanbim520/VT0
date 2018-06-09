

#define VT0_def(TEX) uniform sampler2D VT0##TEX; uniform float4 VT0_pos##TEX;
#include "VT0_channels.cginc"

#ifdef _VT0_ON

float4 VT0_sample_explicit(sampler2D small, sampler2D vt, float4 pos, float2 uv)
{
    return (pos.w <= 0 ? tex2D(small, uv) : tex2D(vt, (saturate(uv) * pos.zw) + pos.xy));
}

#define VT0_sample(TEX, UV) VT0_sample_explicit(TEX, VT0##TEX, VT0_pos##TEX, (UV))

#else
#define VT0_sample(TEX, UV) tex2D(TEX, (UV))
#endif
