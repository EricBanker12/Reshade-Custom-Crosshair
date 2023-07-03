#include "ReShadeUI.fxh";

// Main

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
> = true;

uniform bool FollowCursor <
    ui_label = "Follow Cursor";
    ui_tooltip = "Apply crosshair relative to mouse cursor instead of the window center.";
    ui_category = "Main";
> = false;

uniform float2 MousePoint < source = "mousepoint"; >;

// Debug

uniform bool ShowDebug <
    ui_label = "Show Debug";
    ui_tooltip = "Render only crosshair.";
    ui_category = "Debug";
    ui_category_closed = true;
> = false;

uniform float4 DebugColor <
    ui_type = "color";
    ui_label = "Debug Color";
    ui_category = "Debug";
> = float4(1, 1, 1, 0f);

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
	ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
    ui_category = "Shape 1";
> = float2(5, 0);

uniform float2 GapOffset1 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Gap Offset";
	ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
    ui_category = "Shape 1";
> = float2(0, 0);

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

float4 DrawRectangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float outlineSize, float4 outlineColor, float2 anchorOffset) {
    const float2 fillStartPos = fillPos - fillSize * anchorOffset;
    const float2 fillEndPos = fillPos + fillSize * (float2(1, 1) - anchorOffset);
    const float2 gapStartPos = fillPos - gapSize * anchorOffset;
    const float2 gapEndPos = fillPos + gapSize * (float2(1, 1) - anchorOffset);
    if (basePos.x >= fillStartPos.x && basePos.x < fillEndPos.x && basePos.y >= fillStartPos.y && basePos.y < fillEndPos.y)
        if (gapSize.x == 0 || gapSize.y == 0 || basePos.x < gapStartPos.x || basePos.x >= gapEndPos.x || basePos.y < gapStartPos.y || basePos.y >= gapEndPos.y)
            return lerp(baseColor, fillColor, fillColor.a);
    
    if (basePos.x >= fillStartPos.x - outlineSize && basePos.x < fillEndPos.x + outlineSize && basePos.y >= fillStartPos.y - outlineSize && basePos.y < fillEndPos.y + outlineSize)
        if (gapSize.x == 0 || gapSize.y == 0 || basePos.x < gapStartPos.x + outlineSize || basePos.x >= gapEndPos.x - outlineSize || basePos.y < gapStartPos.y + outlineSize || basePos.y >= gapEndPos.y - outlineSize)
            return lerp(baseColor, outlineColor, outlineColor.a);

    return baseColor;
}

float4 DrawEllipse(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float outlineSize, float4 outlineColor, float2 anchorOffset, float2 section) {
    const float2 centeredPos = float2(basePos.x - fillPos.x - fillSize.x * (0.5f - anchorOffset.x), basePos.y  - fillPos.y - fillSize.y * (0.5f - anchorOffset.y));
    const float centeredAngle = degrees(atan2(centeredPos.y, centeredPos.x)) + 180.0f;
    if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f, 2) <= 1)
        if (gapSize.x == 0 || gapSize.y == 0 || pow(centeredPos.x, 2) / pow(gapSize.x / 2.0f, 2) + pow(centeredPos.y, 2) / pow(gapSize.y / 2.0f, 2) > 1)
            if (centeredAngle >= section.x && (centeredAngle < section.y || section.y == 360))
                return lerp(baseColor, fillColor, fillColor.a);
    
    const float outlinedDist = distance(centeredPos, float2(0, 0));
    const float outlinedAngle = degrees(atan(outlineSize / outlinedDist));
    if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f + outlineSize, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f + outlineSize, 2) <= 1)
        if (gapSize.x == 0 || gapSize.y == 0 || pow(centeredPos.x, 2) / pow(gapSize.x / 2.0f - outlineSize, 2) + pow(centeredPos.y, 2) / pow(gapSize.y / 2.0f - outlineSize, 2) > 1)
            if (outlinedDist < outlineSize || (centeredAngle >= section.x - outlinedAngle || centeredAngle < section.y - 360.0f + outlinedAngle) && (centeredAngle < section.y + outlinedAngle || centeredAngle >= 360.0f + section.x - outlinedAngle))
                return lerp(baseColor, outlineColor, outlineColor.a);

    return baseColor;
}

float4 DrawTriangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float2 anchorOffset) {
    const float2 center = float2(fillPos.x + fillSize.x * (0.5f - anchorOffset.x), fillPos.y - fillSize.y * anchorOffset.y + fillSize.y * 2.0 / 3.0);
    
    const float2 A = float2 (center.x - fillSize.x / 2.0, center.y + fillSize.y / 3.0);
    const float2 B = float2 (center.x, center.y - fillSize.y * 2.0 / 3.0);
    const float2 C = float2 (center.x + fillSize.x / 2.0, center.y + fillSize.y / 3.0);
    
    float2 AP = basePos - A;
    float2 BP = basePos - B;
    float2 CP = basePos - C;

    const float2 AB = B - A;
    const float2 BC = C - B;
    const float2 CA = A - C;

    const float2 D = float2 (center.x - gapSize.x / 2.0, center.y + gapSize.y / 3.0) + gapOffset;
    const float2 E = float2 (center.x, center.y - gapSize.y * 2.0 / 3.0) + gapOffset;
    const float2 F = float2 (center.x + gapSize.x / 2.0, center.y + gapSize.y / 3.0) + gapOffset;
    
    float2 DP = basePos - D;
    float2 EP = basePos - E;
    float2 FP = basePos - F;

    const float2 DE = E - D;
    const float2 EF = F - E;
    const float2 FD = D - F;

    if ((AB.x * AP.y - AB.y * AP.x > 0) == (BC.x * BP.y - BC.y * BP.x > 0) && (AB.x * AP.y - AB.y * AP.x > 0) == (CA.x * CP.y - CA.y * CP.x > 0))
        if (gapSize.x == 0 || gapSize.y == 0 || !((DE.x * DP.y - DE.y * DP.x > 0) == (EF.x * EP.y - EF.y * EP.x > 0) && (DE.x * DP.y - DE.y * DP.x > 0) == (FD.x * FP.y - FD.y * FP.x > 0)))
            return lerp(baseColor, fillColor, fillColor.a);

    // // Zoom based outlining, looks great but not compatible with gap offset
    // if (outlineSize > 0) {
    //     AP = basePos + (center - basePos) * 2 * outlineSize / (min(fillSize.x, fillSize.y) + 2 * outlineSize) - A;
    //     BP = basePos + (center - basePos) * 2 * outlineSize / (min(fillSize.x, fillSize.y) + 2 * outlineSize) - B;
    //     CP = basePos + (center - basePos) * 2 * outlineSize / (min(fillSize.x, fillSize.y) + 2 * outlineSize) - C;

    //     float gapOutlineFactor = 
    //     DP = basePos - (center - basePos) * 2 * outlineSize / max(min(gapSize.x, gapSize.y) - 2 * outlineSize, 1) - D;
    //     EP = basePos - (center - basePos) * 2 * outlineSize / max(min(gapSize.x, gapSize.y) - 2 * outlineSize, 1) - E;
    //     FP = basePos - (center - basePos) * 2 * outlineSize / max(min(gapSize.x, gapSize.y) - 2 * outlineSize, 1) - F;

    //     if ((AB.x * AP.y - AB.y * AP.x > 0) == (BC.x * BP.y - BC.y * BP.x > 0) && (AB.x * AP.y - AB.y * AP.x > 0) == (CA.x * CP.y - CA.y * CP.x > 0))
    //         if (gapSize.x == 0 || gapSize.y == 0 || !((DE.x * DP.y - DE.y * DP.x > 0) == (EF.x * EP.y - EF.y * EP.x > 0) && (DE.x * DP.y - DE.y * DP.x > 0) == (FD.x * FP.y - FD.y * FP.x > 0)))
    //             return lerp(baseColor, outlineColor, outlineColor.a);
    // }

    const float2 H = A + outlineSize * float2(-max(fillSize.x / fillSize.y, sqrt(2)), 1);
    const float2 I = B + outlineSize * float2(0, -max(fillSize.y / fillSize.x, 2));
    const float2 J = C + outlineSize * float2(max(fillSize.x / fillSize.y, sqrt(2)), 1);
    
    const float2 HP = basePos - H;
    const float2 IP = basePos - I;
    const float2 JP = basePos - J;

    const float2 HI = I - H;
    const float2 IJ = J - I;
    const float2 JH = H - J;

    const float2 K = D - outlineSize * float2(-max(gapSize.x / gapSize.y, sqrt(2)), 1);
    const float2 L = E - outlineSize * float2(0, -max(gapSize.y / gapSize.x, 2));
    const float2 M = F - outlineSize * float2(max(gapSize.x / gapSize.y, sqrt(2)), 1);
    
    const float2 KP = basePos - K;
    const float2 LP = basePos - L;
    const float2 MP = basePos - M;

    const float2 KL = L - K;
    const float2 LM = M - L;
    const float2 MK = K - M;
    
    if ((HI.x * HP.y - HI.y * HP.x > 0) == (IJ.x * IP.y - IJ.y * IP.x > 0) && (HI.x * HP.y - HI.y * HP.x > 0) == (JH.x * JP.y - JH.y * JP.x > 0))
        if (gapSize.x == 0 || gapSize.y == 0 || outlineSize >= gapSize.y / 3 || outlineSize >= gapSize.x / 2 || !((KL.x * KP.y - KL.y * KP.x > 0) == (LM.x * LP.y - LM.y * LP.x > 0) && (KL.x * KP.y - KL.y * KP.x > 0) == (MK.x * MP.y - MK.y * MP.x > 0)))
            return lerp(baseColor, outlineColor, outlineColor.a);

    return baseColor;
}

float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float rotation, int anchor, float2 section) {
    rotation = radians(rotation);
    const float2 anchorOffset = GetAnchorOffset(anchor);
    const float2 rotatedPos = float2((basePos.x - fillPos.x) * cos(-rotation) - (basePos.y - fillPos.y) * sin(-rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(-rotation) + (basePos.y - fillPos.y) * cos(-rotation) + fillPos.y);
    switch (shape) {
        case 0:
        default:
            return baseColor;
        case 1:
            return DrawRectangle(baseColor, rotatedPos, fillPos, fillSize, fillColor, gapSize, outlineSize, outlineColor, anchorOffset);
        case 2:
            return DrawEllipse(baseColor, rotatedPos, fillPos, fillSize, fillColor, gapSize, outlineSize, outlineColor, anchorOffset, section);
        case 3:
            return DrawTriangle(baseColor, rotatedPos, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchorOffset);
    }
}

float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    if (UseAntialiasing) discard;
    
    float4 color = float4(tex2D(ReShade::BackBuffer, texCoord).rgb, 0);
    if (ShowDebug) color = float4(DebugColor.rgb, 0);

    color = DrawShape(
        Shape1,
        color,
        pos + 0.5f,
        float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f) + Offset + Offset1,
        FillSize1,
        FillColor1,
        GapSize1,
        GapOffset1,
        OutlineSize1,
        OutlineColor1,
        Rotation1,
        Anchor1,
        Section1
    );
    return color;
}

float4 PS_CustomCrosshairSSAA(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    if (!UseAntialiasing) discard;
    
    float4 color = float4(tex2D(ReShade::BackBuffer, texCoord).rgb, 0);
    if (ShowDebug) color = float4(DebugColor.rgb, 0);
    
    color = DrawShape(
        Shape1,
        color,
        pos + 0.5f,
        float2(BUFFER_WIDTH, BUFFER_HEIGHT) + Offset * 2.0f + Offset1 * 2.0f,
        FillSize1 * 2.0f,
        FillColor1,
        GapSize1 * 2.0f,
        GapOffset1 * 2.0f,
        OutlineSize1 * 2.0f,
        OutlineColor1,
        Rotation1,
        Anchor1,
        Section1
    );
    return color;
}

float4 PS_final(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    // Draw a rectangle in the middle of the screen
    const float4 color = tex2D(ReShade::BackBuffer, texCoord);
    
    float4 overlay;
    if (UseAntialiasing) 
        overlay = tex2D(overlaySamplerSSAA, texCoord);
    else
        overlay = tex2D(overlaySampler, texCoord);
    
    if (ShowDebug)
        return overlay;
    
    return lerp(color, overlay, overlay.a);
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