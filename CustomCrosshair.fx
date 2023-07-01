#include "ReShadeUI.fxh";
#include "ReShade.fxh";

uniform float HorizontalOffset < __UNIFORM_SLIDER_ANY
	ui_min = ReShade::ScreenSize.x / -2.0; ui_max = ReShade::ScreenSize.x / 2.0; ui_step = 1.0;
	ui_tooltip = "Horizontal offset for the crosshair relative to the window center or mouse cursor.";
> = float(0);

uniform float VerticalOffset < __UNIFORM_SLIDER_ANY
	ui_min = ReShade::ScreenSize.y / -2.0; ui_max = ReShade::ScreenSize.y / 2.0; ui_step = 1.0;
	ui_tooltip = "Vertical offset for the crosshair relative to the window center or mouse cursor.";
> = float(0);

uniform bool FollowCursor = false;

uniform float2 MousePoint < source = "mousepoint"; >;
uniform float2 MouseDelta < source = "mousedelta"; >;
uniform float FrameTime < source = "frametime"; >;
uniform bool SpaceBar <source = "key"; keycode = 0x20; mode = ""; >;

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
    // Draw a + in the middle of the screen
    const float4 baseColor = tex2D(ReShade::BackBuffer, texCoord);
    return DrawRect(baseColor, pos, float2(100,0), float2(200, 10), float4(0,1,0,1), float4(0,0,0,1), float(2), radians(10.0));
}

technique CustomCrosshair {
    pass CustomCrosshair {
        VertexShader = PostProcessVS;
        PixelShader = PS_CustomCrosshair;
    }
}