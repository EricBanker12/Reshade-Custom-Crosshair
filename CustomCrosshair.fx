#include "ReShadeUI.fxh";

uniform float HorizontalOffset < __UNIFORM_SLIDER_ANY
	ui_min = BUFFER_WIDTH / -2.0; ui_max = BUFFER_WIDTH / 2.0; ui_step = 1.0;
	ui_tooltip = "Horizontal offset for the crosshair relative to the window center or mouse cursor.";
> = float(0);

uniform float VerticalOffset < __UNIFORM_SLIDER_ANY
	ui_min = BUFFER_HEIGHT / -2.0; ui_max = BUFFER_HEIGHT / 2.0; ui_step = 1.0;
	ui_tooltip = "Vertical offset for the crosshair relative to the window center or mouse cursor.";
> = float(0);

uniform bool UseAntialiasing <
    ui_tooltip = "Applies low preset SMAA.";
> = false;

// uniform bool FollowCursor = false;
// uniform float2 MousePoint < source = "mousepoint"; >;
// uniform float2 MouseDelta < source = "mousedelta"; >;
// uniform float FrameTime < source = "frametime"; >;
// uniform bool SpaceBar <source = "key"; keycode = 0x20; mode = ""; >;

// SMAA

#define SMAA_RT_METRICS float4(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT, BUFFER_WIDTH, BUFFER_HEIGHT)
#define SMAA_PRESET_LOW
#define SMAA_HLSL_3

#include "ReShade.fxh";
#include "SMAA.fxh";

// smaa textures

texture edgesTex < pooled = true; >
{
	Width = BUFFER_WIDTH;
	Height = BUFFER_HEIGHT;
	Format = RG8;
};
texture blendTex < pooled = true; >
{
	Width = BUFFER_WIDTH;
	Height = BUFFER_HEIGHT;
	Format = RGBA8;
};

texture areaTex < source = "AreaTex.png"; >
{
	Width = 160;
	Height = 560;
	Format = RG8;
};
texture searchTex < source = "SearchTex.png"; >
{
	Width = 64;
	Height = 16;
	Format = R8;
};

// smaa samplers

sampler colorGammaSampler
{
	Texture = ReShade::BackBufferTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Point; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};
sampler colorLinearSampler
{
	Texture = ReShade::BackBufferTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Point; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = true;
};
sampler edgesSampler
{
	Texture = edgesTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};
sampler blendSampler
{
	Texture = blendTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};
sampler areaSampler
{
	Texture = areaTex;
	AddressU = Clamp; AddressV = Clamp; AddressW = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};
sampler searchSampler
{
	Texture = searchTex;
	AddressU = Clamp; AddressV = Clamp; AddressW = Clamp;
	MipFilter = Point; MinFilter = Point; MagFilter = Point;
	SRGBTexture = false;
};

// smaa vertex shaders

void SMAAEdgeDetectionWrapVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0, out float4 offset[3] : TEXCOORD1)
{
    if (!UseAntialiasing) discard;
	PostProcessVS(id, position, texcoord);
    SMAAEdgeDetectionVS(texcoord, offset);
}
void SMAABlendingWeightCalculationWrapVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0, out float2 pixcoord : TEXCOORD1, out float4 offset[3] : TEXCOORD2)
{
    if (!UseAntialiasing) discard;
	PostProcessVS(id, position, texcoord);
	SMAABlendingWeightCalculationVS(texcoord, pixcoord, offset);
}
void SMAANeighborhoodBlendingWrapVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0, out float4 offset : TEXCOORD1)
{
    if (!UseAntialiasing) discard;
	PostProcessVS(id, position, texcoord);
	SMAANeighborhoodBlendingVS(texcoord, offset);
}

// smaa pixel shaders

float2 SMAAEdgeDetectionWrapPS(float4 position : SV_Position, float2 texcoord : TEXCOORD0, float4 offset[3] : TEXCOORD1) : SV_Target
{
        if (!UseAntialiasing) discard;
        return SMAAColorEdgeDetectionPS(texcoord, offset, colorGammaSampler);
}
float4 SMAABlendingWeightCalculationWrapPS(float4 position : SV_Position, float2 texcoord : TEXCOORD0, float2 pixcoord : TEXCOORD1, float4 offset[3] : TEXCOORD2) : SV_Target
{
    if (!UseAntialiasing) discard;
	return SMAABlendingWeightCalculationPS(texcoord, pixcoord, offset, edgesSampler, areaSampler, searchSampler, 0.0);
}

float3 SMAANeighborhoodBlendingWrapPS(float4 position : SV_Position, float2 texcoord : TEXCOORD0, float4 offset : TEXCOORD1) : SV_Target
{
    if (!UseAntialiasing) discard;
	return SMAANeighborhoodBlendingPS(texcoord, -offset, colorLinearSampler, blendSampler).rgb;
}

/*
To Do:

Shape drawing functions:
Rectangle (height, width, color, border, rotation, anchor, offset)
Circle (height, width, color, border, rotation, section, anchor, position)
Triangle (height, width, color, border, rotation, skew, anchor, position)


UI Detection:
Set position and color (height, width, color, threshold, anchor, position)
Show Detector (red border = no match; green border = match)
Invert Detector
*/

float4 DrawRect(float4 baseColor, float4 basePos, float2 rectPos, float2 rectSize, float4 rectColor, float4 outlineColor, float outlineSize, float rectRotation) {
    
    const float2 rotatedPos = float2((basePos.x - rectPos.x) * cos(-rectRotation) - (basePos.y - rectPos.y) * sin(-rectRotation) + rectPos.x, (basePos.x - rectPos.x) * sin(-rectRotation) + (basePos.y - rectPos.y) * cos(-rectRotation) + rectPos.y);
    if (rotatedPos.x >= rectPos.x && rotatedPos.x < rectPos.x + rectSize.x && rotatedPos.y >= rectPos.y && rotatedPos.y < rectPos.y + rectSize.y) {
        return lerp(baseColor, rectColor, rectColor.a);
    }
    
    const float2 outlineStartPos = rectPos - float2(outlineSize, outlineSize);
    const float2 outlineEndPos = rectPos + rectSize + float2(outlineSize, outlineSize);
    if (rotatedPos.x >= outlineStartPos.x && rotatedPos.x < outlineEndPos.x && rotatedPos.y >= outlineStartPos.y && rotatedPos.y < outlineEndPos.y) {
        return lerp(baseColor, outlineColor, outlineColor.a);
    }

    return baseColor;
}

float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    // Draw a rectangle in the middle of the screen
    const float4 baseColor = tex2D(ReShade::BackBuffer, texCoord);

    // if (!FollowCursor) {
        const float2 rectPos = float2(BUFFER_WIDTH / 2.0 + HorizontalOffset + 50.0, BUFFER_HEIGHT / 2.0 + VerticalOffset);
        const float2 rectSize = float2(50, 10);
        const float4 rectColor = float4(0,1,0,0);
        const float4 outlineColor = float4(0,1,0,1);
        const float outlineSize = float(2);
        const float rectRotation = radians(30.0);
        return DrawRect(baseColor, pos, rectPos, rectSize, rectColor, outlineColor, outlineSize, rectRotation);
    // }
}

technique CustomCrosshair {
    pass CustomCrosshair {
        VertexShader = PostProcessVS;
        PixelShader = PS_CustomCrosshair;
    }
    // SMAA passes
    pass EdgeDetectionPass
    {
        VertexShader = SMAAEdgeDetectionWrapVS;
        PixelShader = SMAAEdgeDetectionWrapPS;
        RenderTarget = edgesTex;
        ClearRenderTargets = true;
        StencilEnable = true;
        StencilPass = REPLACE;
        StencilRef = 1;
    }
    pass BlendWeightCalculationPass
    {
        VertexShader = SMAABlendingWeightCalculationWrapVS;
        PixelShader = SMAABlendingWeightCalculationWrapPS;
        RenderTarget = blendTex;
        ClearRenderTargets = true;
        StencilEnable = true;
        StencilPass = KEEP;
        StencilFunc = EQUAL;
        StencilRef = 1;
    }
    pass NeighborhoodBlendingPass
    {
        VertexShader = SMAANeighborhoodBlendingWrapVS;
        PixelShader = SMAANeighborhoodBlendingWrapPS;
        StencilEnable = false;
        SRGBWriteEnable = true;
    }
}