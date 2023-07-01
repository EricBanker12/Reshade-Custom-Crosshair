#include "ReShadeUI.fxh";

uniform float HorizontalOffset <
    ui_type = "slider";
	ui_min = BUFFER_WIDTH / -2.0;
    ui_max = BUFFER_WIDTH / 2.0;
    ui_step = 1.0;
    ui_label = "X Offset";
	ui_tooltip = "Horizontal offset for the crosshair relative to the window center or mouse cursor.";
> = float(0);

uniform float VerticalOffset <
    ui_type = "slider";
	ui_min = BUFFER_HEIGHT / -2.0;
    ui_max = BUFFER_HEIGHT / 2.0;
    ui_step = 1.0;
    ui_label = "Y Offset";
	ui_tooltip = "Vertical offset for the crosshair relative to the window center or mouse cursor.";
> = float(0);

uniform bool UseAntialiasing <
    ui_label = "Use Antialiasing";
    ui_tooltip = "Applies low preset SMAA.";
> = false;

uniform bool FollowCursor <
    ui_label = "Follow Cursor";
    ui_tooltip = "Apply crosshair relative to mouse cursor instead of the window center.";
> = false;

uniform float2 MousePoint < source = "mousepoint"; >;

// Shape 1

uniform int Shape1 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Ellipse\0Triangle\0";
    ui_category = "Shape 1";
    ui_category_closed = true;
> = 1;

uniform float Width1 <
    ui_type = "slider";
    ui_label = "Fill Width";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0;
    ui_category = "Shape 1";
    ui_spacing = 2;
> = 20;

uniform float Height1 <
    ui_type = "slider";
    ui_label = "Fill Height";
    ui_min = 0;
    ui_max = 1000;
    ui_category = "Shape 1";
    ui_step = 1.0;
> = 3;

uniform float4 Color1 <
    ui_type = "color";
    ui_label = "Fill Color";
    ui_category = "Shape 1";
> = float4(0,1,0,0.9);

uniform float OutlineWidth1 <
    ui_type = "slider";
    ui_label = "Outline Width";
    ui_min = 0;
    ui_max = 200.0;
    ui_step = 1.0;
    ui_category = "Shape 1";
    ui_spacing = 2;
> = 1;

uniform float4 OutlineColor1 <
    ui_type = "color";
    ui_label = "Outline Color";
    ui_category = "Shape 1";
> = float4(0,0,0,0.9);

uniform int Anchor1 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Shape 1";
    ui_spacing = 2;
> = 3;

uniform float HorizontalOffset1 <
    ui_type = "slider";
    ui_label = "X Offset";
    ui_min = BUFFER_WIDTH / -2.0;
    ui_max = BUFFER_WIDTH / 2.0;
    ui_step = 1.0;
    ui_category = "Shape 1";
> = 5;

uniform float VerticalOffset1 <
    ui_type = "slider";
    ui_label = "Y Offset";
    ui_min = BUFFER_HEIGHT / -2.0;
    ui_max = BUFFER_HEIGHT / 2.0;
    ui_step = 1.0;
    ui_category = "Shape 1";
> = 0;

uniform float Rotation1 <
    ui_type = "slider";
    ui_label = "Rotation";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0;
    ui_category = "Shape 1";
> = 0;

// uniform float Skew1 <
//     ui_type = "slider";
//     ui_label = "Skew";
//     ui_tooltip = "This only applies to Triangles.";
//     ui_min = -500;
//     ui_max = 500;
//     ui_step = 1.0;
//     ui_category = "Shape 1";
//     ui_spacing = 2;
// > = 0;

uniform float2 Section1 <
    ui_type = "slider";
    ui_label = "Section";
    ui_tooltip = "This only applies to Ellipses.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0;
    ui_category = "Shape 1";
> = float2(0,360);

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

texture edgesTex < pooled = true; > {
	Width = BUFFER_WIDTH;
	Height = BUFFER_HEIGHT;
	Format = RG8;
};
texture blendTex < pooled = true; > {
	Width = BUFFER_WIDTH;
	Height = BUFFER_HEIGHT;
	Format = RGBA8;
};
texture areaTex < source = "AreaTex.png"; > {
	Width = 160;
	Height = 560;
	Format = RG8;
};
texture searchTex < source = "SearchTex.png"; > {
	Width = 64;
	Height = 16;
	Format = R8;
};

// smaa samplers

sampler colorGammaSampler {
	Texture = ReShade::BackBufferTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Point; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};
sampler colorLinearSampler {
	Texture = ReShade::BackBufferTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Point; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = true;
};
sampler edgesSampler {
	Texture = edgesTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};
sampler blendSampler {
	Texture = blendTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};
sampler areaSampler {
	Texture = areaTex;
	AddressU = Clamp; AddressV = Clamp; AddressW = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};
sampler searchSampler {
	Texture = searchTex;
	AddressU = Clamp; AddressV = Clamp; AddressW = Clamp;
	MipFilter = Point; MinFilter = Point; MagFilter = Point;
	SRGBTexture = false;
};

// smaa vertex shaders

void SMAAEdgeDetectionWrapVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0, out float4 offset[3] : TEXCOORD1) {
    if (!UseAntialiasing) discard;
	PostProcessVS(id, position, texcoord);
    SMAAEdgeDetectionVS(texcoord, offset);
}
void SMAABlendingWeightCalculationWrapVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0, out float2 pixcoord : TEXCOORD1, out float4 offset[3] : TEXCOORD2) {
    if (!UseAntialiasing) discard;
	PostProcessVS(id, position, texcoord);
	SMAABlendingWeightCalculationVS(texcoord, pixcoord, offset);
}
void SMAANeighborhoodBlendingWrapVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0, out float4 offset : TEXCOORD1) {
    if (!UseAntialiasing) discard;
	PostProcessVS(id, position, texcoord);
	SMAANeighborhoodBlendingVS(texcoord, offset);
}

// smaa pixel shaders

float2 SMAAEdgeDetectionWrapPS(float4 position : SV_Position, float2 texcoord : TEXCOORD0, float4 offset[3] : TEXCOORD1) : SV_Target {
        if (!UseAntialiasing) discard;
        return SMAAColorEdgeDetectionPS(texcoord, offset, colorGammaSampler);
}
float4 SMAABlendingWeightCalculationWrapPS(float4 position : SV_Position, float2 texcoord : TEXCOORD0, float2 pixcoord : TEXCOORD1, float4 offset[3] : TEXCOORD2) : SV_Target {
    if (!UseAntialiasing) discard;
	return SMAABlendingWeightCalculationPS(texcoord, pixcoord, offset, edgesSampler, areaSampler, searchSampler, 0.0);
}

float3 SMAANeighborhoodBlendingWrapPS(float4 position : SV_Position, float2 texcoord : TEXCOORD0, float4 offset : TEXCOORD1) : SV_Target {
    if (!UseAntialiasing) discard;
	return SMAANeighborhoodBlendingPS(texcoord, -offset, colorLinearSampler, blendSampler).rgb;
}

/*
To Do:

Shape drawing functions:
Rectangle (height, width, color, border, rotation, anchor, offset)
Circle (height, width, color, border, rotation, section, anchor, position)
Triangle (height, width, color, border, rotation, skew, anchor, position)

Animations/Transitions

UI Detection:
Set position and color (height, width, color, threshold, anchor, position)
Show Detector (red border = no match; green border = match)
Invert Detector
*/

float2 GetAnchorOffset(int anchor) {
    switch (anchor) {
        default:
        case 0: // Top Left
            return float2(0,0);
        case 1: // Top Center
            return float2(0.5,0);
        case 2: // Top Right
            return float2(1.0,0);
        case 3: // Center Left
            return float2(0,0.5);
        case 4: // Center
            return float2(0.5,0.5);
        case 5: // Center Right
            return float2(1.0,0.5);
        case 6: // Bottom Left
            return float2(0,1.0);
        case 7: // Bottom Center
            return float2(0.5,1.0);
        case 8: //Bottom Right
            return float2(1.0,1.0);
    }
}

// float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float outlineWidth, float4 outlineColor, float rotation, int anchor) {

// }

float4 DrawRect(float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float outlineWidth, float4 outlineColor, float rotation, int anchor) {
    const float2 anchorOffset = GetAnchorOffset(anchor);
    
    const float2 rotatedPos = float2((basePos.x - fillPos.x) * cos(-rotation) - (basePos.y - fillPos.y) * sin(-rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(-rotation) + (basePos.y - fillPos.y) * cos(-rotation) + fillPos.y);
    const float2 fillStartPos = fillPos - fillSize * anchorOffset;
    const float2 fillEndPos = fillPos + fillSize * (float2(1,1) - anchorOffset);
    if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
        return lerp(baseColor, fillColor, fillColor.a);
    }
    
    const float2 outlineStartPos = fillPos - fillSize * anchorOffset - outlineWidth;
    const float2 outlineEndPos = fillPos + fillSize * (float2(1,1) - anchorOffset) + outlineWidth;
    if (rotatedPos.x >= outlineStartPos.x && rotatedPos.x < outlineEndPos.x && rotatedPos.y >= outlineStartPos.y && rotatedPos.y < outlineEndPos.y) {
        return lerp(baseColor, outlineColor, outlineColor.a);
    }

    return baseColor;
}

float4 DrawEllipse(float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float outlineWidth, float4 outlineColor, float rotation, int anchor, float2 section) {
    const float2 anchorOffset = GetAnchorOffset(anchor);
    const float2 rotatedPos = float2((basePos.x - fillPos.x) * cos(-rotation) - (basePos.y - fillPos.y) * sin(-rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(-rotation) + (basePos.y - fillPos.y) * cos(-rotation) + fillPos.y);
    const float2 centeredPos = float2(rotatedPos.x - fillPos.x - fillSize.x * (0.5 - anchorOffset.x), rotatedPos.y  - fillPos.y - fillSize.y * (0.5 - anchorOffset.y));
    const float centeredAngle = degrees(atan2(centeredPos.y, centeredPos.x)) + 180.0;
    
    if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0, 2) <= 1)
        if (centeredAngle >= section.x && centeredAngle <= section.y)
            return lerp(baseColor, fillColor, fillColor.a);
    
    if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0 + outlineWidth, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0 + outlineWidth, 2) <= 1)
        if (centeredAngle >= section.x && centeredAngle <= section.y)
            return lerp(baseColor, outlineColor, outlineColor.a);

    return baseColor;
}

float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    // Draw a rectangle in the middle of the screen
    float4 color = tex2D(ReShade::BackBuffer, texCoord);
    color = DrawEllipse(
        color,
        pos + 0.5,
        float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0) + float2(HorizontalOffset, VerticalOffset) + float2(HorizontalOffset1, VerticalOffset1),
        float2(Width1, Height1),
        Color1,
        OutlineWidth1,
        OutlineColor1,
        radians(Rotation1),
        Anchor1,
        Section1
    );
    return color;
}

technique CustomCrosshair {
    pass CustomCrosshair {
        VertexShader = PostProcessVS;
        PixelShader = PS_CustomCrosshair;
    }
    // SMAA passes
    pass EdgeDetectionPass {
        VertexShader = SMAAEdgeDetectionWrapVS;
        PixelShader = SMAAEdgeDetectionWrapPS;
        RenderTarget = edgesTex;
        ClearRenderTargets = true;
        StencilEnable = true;
        StencilPass = REPLACE;
        StencilRef = 1;
    }
    pass BlendWeightCalculationPass {
        VertexShader = SMAABlendingWeightCalculationWrapVS;
        PixelShader = SMAABlendingWeightCalculationWrapPS;
        RenderTarget = blendTex;
        ClearRenderTargets = true;
        StencilEnable = true;
        StencilPass = KEEP;
        StencilFunc = EQUAL;
        StencilRef = 1;
    }
    pass NeighborhoodBlendingPass {
        VertexShader = SMAANeighborhoodBlendingWrapVS;
        PixelShader = SMAANeighborhoodBlendingWrapPS;
        StencilEnable = false;
        SRGBWriteEnable = true;
    }
}