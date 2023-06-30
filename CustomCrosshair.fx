#include "ReShadeUI.fxh";
#include "ReShade.fxh";

uniform float HorizontalOffset < __UNIFORM_SLIDER_ANY
	ui_min = ReShade::ScreenSize.x / -2.0; ui_max = ReShade::ScreenSize.x / 2.0; ui_step = 1.0;
	ui_tooltip = "Horizontal offset for the crosshair relative to center of the window or mouse cursor.";
> = float(0);

uniform float VerticalOffset < __UNIFORM_SLIDER_ANY
	ui_min = ReShade::ScreenSize.y / -2.0; ui_max = ReShade::ScreenSize.y / 2.0; ui_step = 1.0;
	ui_tooltip = "Vertical offset for the crosshair relative to center of the window or mouse cursor.";
> = float(0);

uniform float Scale < __UNIFORM_SLIDER_ANY
    ui_min = 0.0; ui_max = 10.0;
    ui_tooltip = "Scale of crosshair.";
> = float(1.0);

uniform float4 Color < __UNIFORM_COLOR_ANY > = float4(0.0,1.0,0.0,1.0);

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

float4 DrawRect(float4 baseColor, float4 pos, float height, float width, float4 color, float borderWidth, float4 borderColor, int anchor, float rotation, float2 offset) {    
    // 
}

float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    // Draw a + in the middle of the screen
    const float4 backColor = tex2D(ReShade::BackBuffer, texCoord);
    const float2 lineOne = float2(20.0, 1.0);
    
    if (FollowCursor) {
        const float2 startPos = MousePoint;
        const float2 stopPos = MousePoint + lineOne;
        if (pos.x >= startPos.x && pos.x <= stopPos.x) {
            if (pos.y >= startPos.y && pos.y <= stopPos.y) {
                return lerp(backColor, Color, Color.a);
            }
        }
    }
    else {
        const float2 startPos = ReShade::ScreenSize * float2(0.5, 0.5) + float2(HorizontalOffset, VerticalOffset);
        const float2 stopPos = ReShade::ScreenSize * float2(0.5, 0.5) + float2(HorizontalOffset, VerticalOffset) + lineOne;
        if (pos.x >= startPos.x && pos.x <= stopPos.x) {
            if (pos.y >= startPos.y && pos.y <= stopPos.y) {
                return lerp(backColor, Color, Color.a);
            }
        }
    }

    return backColor;
}

technique CustomCrosshair {
    pass CustomCrosshair {
        VertexShader = PostProcessVS;
        PixelShader = PS_CustomCrosshair;
    }
}