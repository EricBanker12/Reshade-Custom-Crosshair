#include "ReShadeUI.fxh";

// Main Settings

uniform float2 Offset <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the crosshair relative to the window center or mouse cursor.";
    ui_category = "Main";
    ui_category_closed = false;
> = float2(0, 0);

uniform bool UseAntialiasing <
    ui_label = "Use Antialiasing";
    ui_tooltip = "Applies 4x SSAA.";
    ui_category = "Main";
> = false;

uniform bool FollowCursor <
    ui_label = "Follow Cursor";
    ui_tooltip = "Apply crosshair relative to mouse cursor instead of the window center.";
    ui_category = "Main";
> = false;

uniform float2 MousePoint < source = "mousepoint"; >;

uniform bool ShowDebug <
    ui_label = "Show Debug";
    ui_tooltip = "Render only crosshair.";
    ui_category = "Main";
> = false;

// Shape 1

uniform int Shape1 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Ellipse\0Triangle\0";
    ui_category = "Shape 1";
    ui_category_closed = true;
> = 1;

uniform float2 FillSize1 <
    ui_type = "drag";
    ui_label = "Fill Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Shape 1";
    ui_spacing = 2;
> = float2(20,3);

uniform float2 GapSize1 <
    ui_type = "drag";
    ui_label = "Gap Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Shape 1";
> = float2(0,0);

uniform float OutlineSize1 <
    ui_type = "drag";
    ui_label = "Outline Size";
    ui_min = 0;
    ui_max = 200.0f;
    ui_step = 1.0f;
    ui_category = "Shape 1";
> = 1;

uniform float4 FillColor1 <
    ui_type = "color";
    ui_label = "Fill Color";
    ui_category = "Shape 1";
    ui_spacing = 2;
> = float4(0, 1, 0, 0.9f);

uniform float4 OutlineColor1 <
    ui_type = "color";
    ui_label = "Outline Color";
    ui_category = "Shape 1";
> = float4(0, 0, 0, 0.9f);

uniform int Anchor1 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Shape 1";
    ui_spacing = 2;
> = 3;

uniform float2 Offset1 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the crosshair relative to the window center or mouse cursor.";
    ui_category = "Shape 1";
    ui_category_closed = false;
> = float2(5, 0);

uniform float Rotation1 <
    ui_type = "drag";
    ui_label = "Rotation";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Shape 1";
> = 0;

uniform float2 Section1 <
    ui_type = "drag";
    ui_label = "Section";
    ui_tooltip = "The section of an Ellipse to render in degrees.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Shape 1";
> = float2(0,360);

// uniform float2 MouseDelta < source = "mousedelta"; >;
// uniform float FrameTime < source = "frametime"; >;
// uniform bool SpaceBar <source = "key"; keycode = 0x20; mode = ""; >;

texture overlayTarget < pooled = true; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
sampler overlaySampler { Texture = overlayTarget;};

texture overlayTargetSSAA < pooled = true; > { Width = BUFFER_WIDTH * 2.0; Height = BUFFER_HEIGHT * 2.0; Format = RGBA8; };
sampler overlaySamplerSSAA { Texture = overlayTargetSSAA;};

#include "ReShade.fxh";

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
            return float2(0, 0);
        case 1: // Top Center
            return float2(0.5f, 0);
        case 2: // Top Right
            return float2(1.0f, 0);
        case 3: // Center Left
            return float2(0, 0.5f);
        case 4: // Center
            return float2(0.5f, 0.5f);
        case 5: // Center Right
            return float2(1.0f, 0.5f);
        case 6: // Bottom Left
            return float2(0, 1.0f);
        case 7: // Bottom Center
            return float2(0.5f, 1.0f);
        case 8: //Bottom Right
            return float2(1.0f, 1.0f);
    }
}

// float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float outlineWidth, float4 outlineColor, float rotation, int anchor) {

// }

float4 DrawRect(float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float outlineWidth, float4 outlineColor, float rotation, int anchor) {
    const float2 anchorOffset = GetAnchorOffset(anchor);
    
    const float2 rotatedPos = float2((basePos.x - fillPos.x) * cos(-rotation) - (basePos.y - fillPos.y) * sin(-rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(-rotation) + (basePos.y - fillPos.y) * cos(-rotation) + fillPos.y);
    const float2 fillStartPos = fillPos - fillSize * anchorOffset;
    const float2 fillEndPos = fillPos + fillSize * (float2(1, 1) - anchorOffset);
    if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
        return lerp(baseColor, fillColor, fillColor.a);
    }
    
    const float2 outlineStartPos = fillPos - fillSize * anchorOffset - outlineWidth;
    const float2 outlineEndPos = fillPos + fillSize * (float2(1, 1) - anchorOffset) + outlineWidth;
    if (rotatedPos.x >= outlineStartPos.x && rotatedPos.x < outlineEndPos.x && rotatedPos.y >= outlineStartPos.y && rotatedPos.y < outlineEndPos.y) {
        return lerp(baseColor, outlineColor, outlineColor.a);
    }

    return baseColor;
}

float4 DrawEllipse(float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float outlineWidth, float4 outlineColor, float rotation, int anchor, float2 section) {
    const float2 anchorOffset = GetAnchorOffset(anchor);
    const float2 rotatedPos = float2((basePos.x - fillPos.x) * cos(-rotation) - (basePos.y - fillPos.y) * sin(-rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(-rotation) + (basePos.y - fillPos.y) * cos(-rotation) + fillPos.y);
    const float2 centeredPos = float2(rotatedPos.x - fillPos.x - fillSize.x * (0.5f - anchorOffset.x), rotatedPos.y  - fillPos.y - fillSize.y * (0.5f - anchorOffset.y));
    const float centeredAngle = degrees(atan2(centeredPos.y, centeredPos.x)) + 180.0f;
    
    if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f, 2) <= 1)
        if (gapSize.x == 0 || gapSize.y == 0 || pow(centeredPos.x, 2) / pow(gapSize.x / 2.0f, 2) + pow(centeredPos.y, 2) / pow(gapSize.y / 2.0f, 2) > 1)
            if (centeredAngle >= section.x && (centeredAngle < section.y || section.y == 360))
                return lerp(baseColor, fillColor, fillColor.a);
    
    const float outlinedDist = distance(centeredPos, float2(0, 0));
    const float outlinedAngle = degrees(atan(outlineWidth / outlinedDist));
    if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f + outlineWidth, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f + outlineWidth, 2) <= 1)
        if (gapSize.x == 0 || gapSize.y == 0 || pow(centeredPos.x, 2) / pow(gapSize.x / 2.0f - outlineWidth, 2) + pow(centeredPos.y, 2) / pow(gapSize.y / 2.0f - outlineWidth, 2) > 1)
            if (outlinedDist < outlineWidth || (centeredAngle >= section.x - outlinedAngle || centeredAngle < section.y - 360.0f + outlinedAngle) && (centeredAngle < section.y + outlinedAngle || centeredAngle >= 360.0f + section.x - outlinedAngle))
                return lerp(baseColor, outlineColor, outlineColor.a);

    return baseColor;
}

float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    if (UseAntialiasing) discard;
    float4 color = float4(1, 1, 1, 0);
    color = DrawEllipse(
        color,
        pos + 0.5f,
        float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f) + Offset + Offset1,
        FillSize1,
        FillColor1,
        GapSize1,
        OutlineSize1,
        OutlineColor1,
        radians(Rotation1),
        Anchor1,
        Section1
    );
    return color;
}

float4 PS_CustomCrosshairSSAA(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    if (!UseAntialiasing) discard;
    float4 color = float4(1, 1, 1, 0);
    color = DrawEllipse(
        color,
        pos + 0.5f,
        float2(BUFFER_WIDTH, BUFFER_HEIGHT) + Offset * 2.0f + Offset1 * 2.0f,
        FillSize1 * 2.0f,
        FillColor1,
        GapSize1 * 2.0f,
        OutlineSize1 * 2.0f,
        OutlineColor1,
        radians(Rotation1),
        Anchor1,
        Section1
    );
    return color;
}

float4 PS_final(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    // Draw a rectangle in the middle of the screen
    const float4 color = tex2D(ReShade::BackBuffer, texCoord);
    if (!UseAntialiasing) {
        const float4 overlay = tex2D(overlaySampler, texCoord);
        if (ShowDebug) return overlay;
        return lerp(color, overlay, overlay.a);
    }
    else {
        const float4 overlay1 = tex2D(overlaySamplerSSAA, texCoord);
        const float4 overlay2 = tex2D(overlaySamplerSSAA, texCoord + BUFFER_PIXEL_SIZE * float2(1,0));
        const float4 overlay3 = tex2D(overlaySamplerSSAA, texCoord + BUFFER_PIXEL_SIZE * float2(0,1));
        const float4 overlay4 = tex2D(overlaySamplerSSAA, texCoord + BUFFER_PIXEL_SIZE * float2(1,1));
        const float4 overlayAvg = (overlay1 + overlay2 + overlay3 + overlay4) / 4;
        if (ShowDebug) return overlayAvg;
        return lerp(color, overlayAvg, overlayAvg.a);
    }
}

technique CustomCrosshair {
    pass overlay {
        VertexShader = PostProcessVS;
        PixelShader = PS_CustomCrosshair;
        RenderTarget = overlayTarget;
    }
    pass overlaySSAA {
        VertexShader = PostProcessVS;
        PixelShader = PS_CustomCrosshairSSAA;
        RenderTarget = overlayTargetSSAA;
    }
    pass final {
        VertexShader = PostProcessVS;
        PixelShader = PS_final;
    }
}