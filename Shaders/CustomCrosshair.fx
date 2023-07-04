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
    ui_tooltip = "Applies 4x SSAA. Disable for performance or to use a different AA (i.e. SMAA, FXAA).";
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

uniform float3 DebugColor <
    ui_type = "color";
    ui_label = "Debug Color";
    ui_category = "Debug";
> = float3(1, 1, 1);

// Shape 1

uniform int Shape1 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Ellipse\0Triangle\0";
    ui_category = "Shape 1";
    ui_category_closed = true;
> = 1;

uniform int Anchor1 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Shape 1";
> = 3;

uniform float2 Offset1 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
    ui_category = "Shape 1";
    ui_spacing = 2;
> = float2(5, 0);

uniform float2 FillSize1 <
    ui_type = "drag";
    ui_label = "Fill Size";
    ui_min = 1;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Shape 1";
> = float2(20,3);

uniform float2 GapSize1 <
    ui_type = "drag";
    ui_label = "Gap Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Shape 1";
> = float2(0,0);

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

uniform float2 Section1 <
    ui_type = "drag";
    ui_label = "Section";
    ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Shape 1";
    ui_spacing = 2;
> = float2(0,360);

uniform float Skew1 <
    ui_type = "drag";
    ui_label = "Skew";
    ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
    ui_min = -90;
    ui_max = 90;
    ui_step = 1.0f;
    ui_category = "Shape 1";
> = 0.00f;

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

float4 DrawRectangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float2 anchorOffset) {
    const float2 fillStartPos = fillPos - fillSize * anchorOffset;
    const float2 fillEndPos = fillStartPos + fillSize;
    const float2 gapStartPos = fillStartPos + fillSize / 2.0 - gapSize / 2.0f + gapOffset;
    const float2 gapEndPos = gapStartPos + gapSize;
    if (basePos.x >= fillStartPos.x && basePos.x < fillEndPos.x && basePos.y >= fillStartPos.y && basePos.y < fillEndPos.y) {
        if (gapSize.x == 0 || gapSize.y == 0 || basePos.x < gapStartPos.x || basePos.x >= gapEndPos.x || basePos.y < gapStartPos.y || basePos.y >= gapEndPos.y) {
            if (baseColor.a > 0)
                return lerp(baseColor, fillColor, fillColor.a);
            else
                return fillColor;
        }
    }
    
    if (outlineSize > 0) {
        if (basePos.x >= fillStartPos.x - outlineSize && basePos.x < fillEndPos.x + outlineSize && basePos.y >= fillStartPos.y - outlineSize && basePos.y < fillEndPos.y + outlineSize) {
            if (gapSize.x == 0
                || gapSize.y == 0
                    || outlineSize >= gapSize.x / 2
                        || outlineSize >= gapSize.y / 2
                            || basePos.x < gapStartPos.x + outlineSize
                                || basePos.x >= gapEndPos.x - outlineSize
                                    || basePos.y < gapStartPos.y + outlineSize
                                        || basePos.y >= gapEndPos.y - outlineSize) {
                if (baseColor.a > 0) 
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
        }
    }

    return baseColor;
}

float4 DrawEllipse(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float2 anchorOffset, float2 section) {
    if (fillSize.x < 1 || fillSize.y < 1 || section.x >= section.y || section.y <= section.x)
        return baseColor;
    
    const float2 centerPos = float2(fillPos.x + fillSize.x * (0.5f - anchorOffset.x), fillPos.y + fillSize.y * (0.5f - anchorOffset.y));
    const float2 centeredPos = basePos - centerPos;
    const float centeredAngle = degrees(atan2(centeredPos.y, centeredPos.x)) + 180.0f;
    const float2 gappedPos = centeredPos + gapOffset;
    if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f, 2) <= 1)
        if (gapSize.x == 0 || gapSize.y == 0 || pow(gappedPos.x, 2) / pow(gapSize.x / 2.0f, 2) + pow(gappedPos.y, 2) / pow(gapSize.y / 2.0f, 2) > 1)
            if (centeredAngle >= section.x && (centeredAngle < section.y || section.y == 360)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, fillColor, fillColor.a);
                else
                    return fillColor;
            }

    if (outlineSize > 0) {
        if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f + outlineSize, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f + outlineSize, 2) <= 1) {
            if (gapSize.x == 0 || gapSize.y == 0 || outlineSize >= gapSize.x / 2 || outlineSize >= gapSize.y / 2 || pow(gappedPos.x, 2) / pow(gapSize.x / 2.0f - outlineSize, 2) + pow(gappedPos.y, 2) / pow(gapSize.y / 2.0f - outlineSize, 2) > 1) {
                if (centeredAngle >= section.x && (centeredAngle < section.y || section.y == 360)) {
                    if (baseColor.a > 0)
                        return lerp(baseColor, outlineColor, outlineColor.a);
                    else
                        return outlineColor;
                }
                else if (section.x > 0 || section.y < 360) {
                    float2 rotatedPos = float2((basePos.x - centerPos.x) * cos(-radians(section.x)) - (basePos.y - centerPos.y) * sin(-radians(section.x)) + centerPos.x, (basePos.x - centerPos.x) * sin(-radians(section.x)) + (basePos.y - centerPos.y) * cos(-radians(section.x)) + centerPos.y);
                    float2 fillStartPos = centerPos - float2(fillPos.x + outlineSize, 0);
                    float2 fillEndPos = centerPos + float2(0, outlineSize);
                    if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
                        if (baseColor.a > 0)
                            return lerp(baseColor, outlineColor, outlineColor.a);
                        else
                            return outlineColor;
                    }
                    
                    rotatedPos = float2((basePos.x - centerPos.x) * cos(-radians(section.y)) - (basePos.y - centerPos.y) * sin(-radians(section.y)) + centerPos.x, (basePos.x - centerPos.x) * sin(-radians(section.y)) + (basePos.y - centerPos.y) * cos(-radians(section.y)) + centerPos.y);
                    fillStartPos = centerPos - float2(fillPos.x + outlineSize, outlineSize);
                    fillEndPos = centerPos;
                    if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
                        if (baseColor.a > 0)
                            return lerp(baseColor, outlineColor, outlineColor.a);
                        else
                            return outlineColor;
                    }
                    
                    if (pow(centeredPos.x, 2) + pow(centeredPos.y, 2) < pow(outlineSize, 2)) {
                        if (baseColor.a > 0)
                            return lerp(baseColor, outlineColor, outlineColor.a);
                        else
                            return outlineColor;
                    }
                }
            }
        }
    }

    return baseColor;
}

float4 DrawTriangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float2 anchorOffset, float skew) {
    if (anchorOffset.y == 0.5f)
        anchorOffset.y = 2.0f / 3.0f;
    
    const float2 centerPos = float2(fillPos.x + fillSize.x * (0.5f - anchorOffset.x), fillPos.y + fillSize.y * (2.0f / 3.0f - anchorOffset.y));

    const float2 A = float2 (centerPos.x - fillSize.x / 2.0 * (1 + skew / 90.0f), centerPos.y + fillSize.y / 3.0);
    const float2 B = float2 (centerPos.x + fillSize.x * skew / 90.0f, centerPos.y - fillSize.y * 2.0 / 3.0);
    const float2 C = float2 (centerPos.x + fillSize.x / 2.0 * (1 - skew / 90.0f), centerPos.y + fillSize.y / 3.0);
    
    // // Debugging skew
    // const float2 avgCenter = (A + B + C) / 3.0f;
    // if (distance(basePos, centerPos) <= 3) return float4(1,0,0,1);
    // if (distance(basePos, avgCenter) <= 3) return float4(0,0,1,1);
    
    const float2 AP = basePos - A;
    const float2 BP = basePos - B;
    const float2 CP = basePos - C;

    const float2 AB = B - A;
    const float2 BC = C - B;
    const float2 CA = A - C;

    const bool inTriangle = (AB.x * AP.y - AB.y * AP.x > 0) == (BC.x * BP.y - BC.y * BP.x > 0) && (AB.x * AP.y - AB.y * AP.x > 0) == (CA.x * CP.y - CA.y * CP.x > 0);
    bool inTriangleGap = false;

    float rotation;
    float2 rotatedPos;
    float2 fillStartPos;
    float2 fillEndPos;

    if (gapSize.x > 0 && gapSize.y > 0) {
        const float2 D = float2 (centerPos.x - gapSize.x / 2.0 * (1 + skew / 90.0f), centerPos.y + gapSize.y / 3.0) + gapOffset;
        const float2 E = float2 (centerPos.x + gapSize.x * skew / 90.0f, centerPos.y - gapSize.y * 2.0 / 3.0) + gapOffset;
        const float2 F = float2 (centerPos.x + gapSize.x / 2.0 * (1 - skew / 90.0f), centerPos.y + gapSize.y / 3.0) + gapOffset;
        
        const float2 DP = basePos - D;
        const float2 EP = basePos - E;
        const float2 FP = basePos - F;

        const float2 DE = E - D;
        const float2 EF = F - E;
        const float2 FD = D - F;
        
        inTriangleGap = ((DE.x * DP.y - DE.y * DP.x > 0) == (EF.x * EP.y - EF.y * EP.x > 0) && (DE.x * DP.y - DE.y * DP.x > 0) == (FD.x * FP.y - FD.y * FP.x > 0));
        
        // inside fill with gap
        if (inTriangle && !inTriangleGap) {
            if (baseColor.a > 0)
                return lerp(baseColor, fillColor, fillColor.a);
            else
                return fillColor;
        }

        // inside outline
        if (inTriangle && inTriangleGap && outlineSize > 0) {
            rotation = 0;
            rotatedPos = float2((basePos.x - D.x) * cos(-rotation) - (basePos.y - D.y) * sin(-rotation) + D.x, (basePos.x - D.x) * sin(-rotation) + (basePos.y - D.y) * cos(-rotation) + D.y);
            fillStartPos = D + float2(0, -outlineSize);
            fillEndPos = D + float2(F.x - D.x, 0);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }

            rotation = atan(gapSize.y / (F.x - E.x));
            if (skew <= 30)
                rotation += radians(180);
            rotatedPos = float2((basePos.x - F.x) * cos(-rotation) - (basePos.y - F.y) * sin(-rotation) + F.x, (basePos.x - F.x) * sin(-rotation) + (basePos.y - F.y) * cos(-rotation) + F.y);
            fillStartPos = F + float2(0, -outlineSize);
            fillEndPos = F + float2(distance(F,E), 0);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }

            rotation = atan(gapSize.y / (D.x - E.x));
            if (skew > -30)
                rotation += radians(180);
            rotatedPos = float2((basePos.x - D.x) * cos(-rotation) - (basePos.y - D.y) * sin(-rotation) + D.x, (basePos.x - D.x) * sin(-rotation) + (basePos.y - D.y) * cos(-rotation) + D.y);
            fillStartPos = D - float2(distance(E,D), outlineSize);
            fillEndPos = D + float2(0, 0);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
        }

        // inside outline intersection with outside outline
        if (!inTriangle && inTriangleGap && outlineSize > 0) {
            // get slope: y1 - y2 = mx1 + b - mx2 - b | m = (y1 - y2) / (x1 - x2)
            const float ACm = (C.y - A.y) / (C.x - A.x);
            const float ABm = (B.y - A.y) / (B.x - A.x);
            const float BCm = (C.y - B.y) / (C.x - B.x);
            const float DFm = (F.y - D.y) / (F.x - D.x);
            const float DEm = (E.y - D.y) / (E.x - D.x);
            const float EFm = (F.y - E.y) / (F.x - E.x);
            
            // get y intercept: y = mx + b | b = y - mx
            const float ACb = A.y - ACm * A.x;
            const float ABb = A.y - ABm * A.x;
            const float BCb = B.y - BCm * B.x;
            const float DFb = D.y - DFm * D.x;
            const float DEb = D.y - DEm * D.x;
            const float EFb = E.y - EFm * E.x;
            
            // find intersect
            const float2 ACDE = float2((DEb - ACb) / (ACm - DEm), ACm * (DEb - ACb) / (ACm - DEm) + ACb);
            const float2 ACEF = float2((EFb - ACb) / (ACm - EFm), ACm * (EFb - ACb) / (ACm - EFm) + ACb);
            // AC cannot intersect DF, always parallel
            const float2 ABDF = float2((DFb - ABb) / (ABm - DFm), ABm * (DFb - ABb) / (ABm - DFm) + ABb);
            const float2 ABDE = float2((DEb - ABb) / (ABm - DEm), ABm * (DEb - ABb) / (ABm - DEm) + ABb);
            const float2 ABEF = float2((EFb - ABb) / (ABm - EFm), ABm * (EFb - ABb) / (ABm - EFm) + ABb);
            const float2 BCDF = float2((DFb - BCb) / (BCm - DFm), BCm * (DFb - BCb) / (BCm - DFm) + BCb);
            const float2 BCDE = float2((DEb - BCb) / (BCm - DEm), BCm * (DEb - BCb) / (BCm - DEm) + BCb);
            const float2 BCEF = float2((EFb - BCb) / (BCm - EFm), BCm * (EFb - BCb) / (BCm - EFm) + BCb);

            // // debugging visualizer
            // outlineColor = float4(1,0,0,1);

            // // if (distance(basePos, float2(basePos.x, EFm * basePos.x + EFb)) <= outlineSize)
            // //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);

            // if (distance(basePos, A) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, B) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, C) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, D) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, E) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, F) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, ACDE) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, ACEF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, ABDF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, ABDE) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, ABEF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, BCDF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, BCDE) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, BCEF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            
            // test intersect
            if (distance(basePos, ACDE) <= outlineSize && dot(ACDE - A, C - A) >= 0 && dot(ACDE - A, C - A) < dot(C - A, C - A) && dot(ACDE - E, D - E) >= 0 && dot(ACDE - E, D - E) < dot(D - E, D - E)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
            if (distance(basePos, ACEF) <= outlineSize && dot(ACEF - A, C - A) >= 0 && dot(ACEF - A, C - A) < dot(C - A, C - A) && dot(ACEF - F, E - F) >= 0 && dot(ACEF - F, E - F) < dot(E - F, E - F)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
            if (distance(basePos, ABDF) <= outlineSize && dot(ABDF - A, B - A) >= 0 && dot(ABDF - A, B - A) < dot(B - A, B - A) && dot(ABDF - F, D - F) >= 0 && dot(ABDF - F, D - F) < dot(D - F, D - F)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
            if (distance(basePos, ABDE) <= outlineSize && dot(ABDE - A, B - A) >= 0 && dot(ABDE - A, B - A) < dot(B - A, B - A) && dot(ABDE - E, D - E) >= 0 && dot(ABDE - E, D - E) < dot(D - E, D - E)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
            if (distance(basePos, ABEF) <= outlineSize && dot(ABEF - A, B - A) >= 0 && dot(ABEF - A, B - A) < dot(B - A, B - A) && dot(ABEF - E, F - E) >= 0 && dot(ABEF - E, F - E) < dot(F - E, F - E)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
            if (distance(basePos, BCDF) <= outlineSize && dot(BCDF - B, C - B) >= 0 && dot(BCDF - B, C - B) < dot(C - B, C - B) && dot(BCDF - F, D - F) >= 0 && dot(BCDF - F, D - F) < dot(D - F, D - F)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
            if (distance(basePos, BCDE) <= outlineSize && dot(BCDE - B, C - B) >= 0 && dot(BCDE - B, C - B) < dot(C - B, C - B) && dot(BCDE - E, D - E) >= 0 && dot(BCDE - E, D - E) < dot(D - E, D - E)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
            if (distance(basePos, BCEF) <= outlineSize && dot(BCEF - B, C - B) >= 0 && dot(BCEF - B, C - B) < dot(C - B, C - B) && dot(BCEF - E, F - E) >= 0 && dot(BCEF - E, F - E) < dot(F - E, F - E)) {
                if (baseColor.a > 0)
                    return lerp(baseColor, outlineColor, outlineColor.a);
                else
                    return outlineColor;
            }
        }
    }

    // inside fill with no gap
    if (inTriangle && !inTriangleGap) {
        if (baseColor.a > 0)
            return lerp(baseColor, fillColor, fillColor.a);
        else
            return fillColor;
    }
    
    // outside outline
    if (!inTriangle && !inTriangleGap && outlineSize > 0) {
        if (distance(basePos, A) < outlineSize) {
            if (baseColor.a > 0)
                return lerp(baseColor, outlineColor, outlineColor.a);
            else
                return outlineColor;
        }
        if (distance(basePos, B) < outlineSize) {
            if (baseColor.a > 0)
                return lerp(baseColor, outlineColor, outlineColor.a);
            else
                return outlineColor;
        }
        if (distance(basePos, C) < outlineSize) {
            if (baseColor.a > 0)
                return lerp(baseColor, outlineColor, outlineColor.a);
            else
                return outlineColor;
        }

        rotation = 0;
        rotatedPos = float2((basePos.x - A.x) * cos(-rotation) - (basePos.y - A.y) * sin(-rotation) + A.x, (basePos.x - A.x) * sin(-rotation) + (basePos.y - A.y) * cos(-rotation) + A.y);
        fillStartPos = A;
        fillEndPos = A + float2(C.x - A.x, outlineSize);
        if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
            if (baseColor.a > 0)
                return lerp(baseColor, outlineColor, outlineColor.a);
            else
                return outlineColor;
        }

        rotation = atan(fillSize.y / (C.x - B.x));
        if (skew <= 30)
            rotation += radians(180);
        rotatedPos = float2((basePos.x - C.x) * cos(-rotation) - (basePos.y - C.y) * sin(-rotation) + C.x, (basePos.x - C.x) * sin(-rotation) + (basePos.y - C.y) * cos(-rotation) + C.y);
        fillStartPos = C;
        fillEndPos = C + float2(distance(C,B), outlineSize);
        if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
            if (baseColor.a > 0)
                return lerp(baseColor, outlineColor, outlineColor.a);
            else
                return outlineColor;
        }

        rotation = atan(fillSize.y / (A.x - B.x));
        if (skew > -30)
            rotation += radians(180);
        rotatedPos = float2((basePos.x - A.x) * cos(-rotation) - (basePos.y - A.y) * sin(-rotation) + A.x, (basePos.x - A.x) * sin(-rotation) + (basePos.y - A.y) * cos(-rotation) + A.y);
        fillStartPos = A - float2(distance(B,A), 0);
        fillEndPos = A + float2(0, outlineSize);
        if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) {
            if (baseColor.a > 0)
                return lerp(baseColor, outlineColor, outlineColor.a);
            else
                return outlineColor;
        }
    }

    return baseColor;
}

float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float rotation, int anchor, float2 section, float skew) {
    rotation = radians(rotation);
    const float2 anchorOffset = GetAnchorOffset(anchor);
    const float2 rotatedPos = float2((basePos.x - fillPos.x) * cos(-rotation) - (basePos.y - fillPos.y) * sin(-rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(-rotation) + (basePos.y - fillPos.y) * cos(-rotation) + fillPos.y);
    switch (shape) {
        case 0:
        default:
            return baseColor;
        case 1:
            return DrawRectangle(baseColor, rotatedPos, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchorOffset);
        case 2:
            return DrawEllipse(baseColor, rotatedPos, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchorOffset, section);
        case 3:
            return DrawTriangle(baseColor, rotatedPos, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchorOffset, skew);
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
        Section1,
        Skew1
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
        Section1,
        Skew1
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