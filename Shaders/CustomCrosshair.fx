#include "ReShadeUI.fxh"
// ------------------------------------------------------------------------------------------------------------------------
// Crosshair Offset
// ------------------------------------------------------------------------------------------------------------------------

    uniform int ConfigNotice <
        ui_type = "radio";
        ui_label = " ";
        ui_text = "To make changes to the crosshair shape,\n"
                    "enable the technique \"Custom Crosshair Setup\"";
        ui_category = "Crosshair Offset";
        ui_category_closed = true;
    >;

    uniform float2 Offset <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the crosshair relative to the window center.";
        ui_category = "Crosshair Offset";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform bool FollowCursor <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply crosshair relative to mouse cursor instead of the window center.";
        ui_category = "Crosshair Offset";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection
// ------------------------------------------------------------------------------------------------------------------------

    uniform int DetectorBehavior <
        ui_type = "combo";
        ui_label = "Behavior";
        ui_items = "AND\0OR\0";
        ui_tooltip = "Show crosshair when all detectors are matched (AND), or when at least one detector is matched (OR).";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = 0;

    uniform bool ShowDetectors <
        ui_label = "Show Detectors";
        ui_tooltip = "Show detectors for ease of configuration.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = true;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 1
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector1 <
        ui_label = "UI Detector 1";
        ui_category = "UI Detector 1";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor1 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold1 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize1 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset1 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor1 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted1 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 2
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector2 <
        ui_label = "UI Detector 2";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 2";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor2 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold2 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize2 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset2 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor2 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted2 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 3
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector3 <
        ui_label = "UI Detector 3";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 3";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor3 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold3 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize3 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset3 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor3 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted3 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 4
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector4 <
        ui_label = "UI Detector 4";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 4";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor4 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold4 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize4 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset4 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor4 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted4 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 5
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector5 <
        ui_label = "UI Detector 5";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 5";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor5 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold5 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize5 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset5 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor5 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted5 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 6
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector6 <
        ui_label = "UI Detector 6";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 6";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor6 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold6 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize6 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset6 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor6 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted6 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 7
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector7 <
        ui_label = "UI Detector 7";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 7";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor7 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold7 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize7 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset7 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor7 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted7 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 8
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector8 <
        ui_label = "UI Detector 8";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 8";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor8 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold8 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize8 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset8 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor8 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted8 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// Hotkeys
// ------------------------------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------------------------------
// Hidden or Static Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    static const float2 PixelOffset = float2(0.5f, 0.5f);
    static const float2 anchorOffsets[9] = {float2(0.5f, 0.5f), float2(0, 0.5f), float2(-0.5f, 0.5f), float2(0.5f, 0), float2(0, 0), float2(-0.5f, 0), float2(0.5f, -0.5f), float2(0, -0.5f), float2(-0.5f, -0.5f)};
    
    uniform float2 MousePoint < source = "mousepoint"; >;

    // uniform bool SpaceBar <source = "key"; keycode = 0x20; mode = ""; >;
    // uniform bool left_mouse_button_down < source = "mousebutton"; keycode = 0; mode = ""; >;

    /*
    To Do:
    - option to use png image layer instead of shape - see https://github.com/CeeJayDK/SweetFX/blob/master/Shaders/Layer.fx
    - hotkey enable/disable shapes - might be easier to duplicate fx file for switching between different crosshairs
    - hotkey animated transformations - likely too expensive unless pre-rendered - could use overlay LoD for frames?

    */

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture CustomCrosshairDetectorTexture <pooled = false; > { Width = 8; Height = 1; Format = R8; };
    sampler CustomCrosshairDetectorSampler { Texture = CustomCrosshairDetectorTexture; };

    texture CustomCrosshairOverlayTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler CustomCrosshairOverlaySampler { Texture = CustomCrosshairOverlayTexture;};

// ------------------------------------------------------------------------------------------------------------------------
// Imports
// ------------------------------------------------------------------------------------------------------------------------

    #include "ReShade.fxh"

// ------------------------------------------------------------------------------------------------------------------------
// Structs
// ------------------------------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------------------------------
// Functions
// ------------------------------------------------------------------------------------------------------------------------
    // https://iquilezles.org/articles/distfunctions2d/
    float sdBox( in float2 p, in float2 b )
    {
        float2 d = abs(p)-b;
        return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
    }

    float4 DrawRectangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, int anchor) {
        const float2 center = fillPos + fillSize * anchorOffsets[anchor];
        const float sdFill = sdBox(basePos - center, fillSize / 2.0f);

        if (gapSize.x > 0 && gapSize.y > 0) {
            gapSize /= 2.0f;
            const float sdGap = sdBox(basePos - center - gapOffset, gapSize);
            if (sdFill <= 0 && sdGap > 0) return lerp(fillColor, baseColor, baseColor.a);
            if (sdFill <= outlineSize && sdGap > -outlineSize) return lerp(outlineColor, baseColor, baseColor.a);
        }
        else {
            if (sdFill <= 0) return lerp(fillColor, baseColor, baseColor.a);
            if (sdFill <= outlineSize) return lerp(outlineColor, baseColor, baseColor.a);
        }

        return baseColor;
    }

    float DetectorMatchAll(float2 pos, float2 size, float3 detectorColor, float3 detectorThreshold, bool inverted) {
        detectorThreshold = detectorThreshold / 255.0f;
        
        float3 color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(0, 0)), 0, 0)).rgb - detectorColor.rgb);
        bool matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
        if (inverted && matched) return 0.0f;
        if (!matched && !inverted) return 0.0f;

        if (size.x > 2) {
            color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(-1, 0) * size / 2.0f), 0, 0)).rgb - detectorColor.rgb);
            matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (inverted && matched) return 0.0f;
            if (!matched && !inverted) return 0.0f;

            color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(1, 0) * size / 2.0f), 0, 0)).rgb - detectorColor.rgb);
            matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (inverted && matched) return 0.0f;
            if (!matched && !inverted) return 0.0f;
        }

        if (size.y > 2) {
            color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(0, -1) * size / 2.0f), 0, 0)).rgb - detectorColor.rgb);
            matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (inverted && matched) return 0.0f;
            if (!matched && !inverted) return 0.0f;

            color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(0, 1) * size / 2.0f), 0, 0)).rgb - detectorColor.rgb);
            matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (inverted && matched) return 0.0f;
            if (!matched && !inverted) return 0.0f;
        }

        if (size.x > 3 && size.y > 3) {
            color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(-1, -1) * size / 2.0f), 0, 0)).rgb - detectorColor.rgb);
            matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (inverted && matched) return 0.0f;
            if (!matched && !inverted) return 0.0f;

            color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(1, -1) * size / 2.0f), 0, 0)).rgb - detectorColor.rgb);
            matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (inverted && matched) return 0.0f;
            if (!matched && !inverted) return 0.0f;

            color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(-1, 1) * size / 2.0f), 0, 0)).rgb - detectorColor.rgb);
            matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (inverted && matched) return 0.0f;
            if (!matched && !inverted) return 0.0f;

            color = abs(tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(1, 1) * size / 2.0f), 0, 0)).rgb - detectorColor.rgb);
            matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (inverted && matched) return 0.0f;
            if (!matched && !inverted) return 0.0f;
        }

        return 1.0f;
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float PS_UIDetect(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        const int pixelNumber = round(texCoord.x * 8 + PixelOffset.x);
        if (pixelNumber == 1 && Detector1) return DetectorMatchAll((DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1 - PixelOffset, DetectorSize1, DetectorColor1, DetectorThreshold1, DetectorInverted1);
        if (pixelNumber == 2 && Detector2) return DetectorMatchAll((DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2 - PixelOffset, DetectorSize2, DetectorColor2, DetectorThreshold2, DetectorInverted2);
        if (pixelNumber == 3 && Detector3) return DetectorMatchAll((DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3 - PixelOffset, DetectorSize3, DetectorColor3, DetectorThreshold3, DetectorInverted3);
        if (pixelNumber == 4 && Detector4) return DetectorMatchAll((DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4 - PixelOffset, DetectorSize4, DetectorColor4, DetectorThreshold4, DetectorInverted4);
        if (pixelNumber == 5 && Detector5) return DetectorMatchAll((DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5 - PixelOffset, DetectorSize5, DetectorColor5, DetectorThreshold5, DetectorInverted5);
        if (pixelNumber == 6 && Detector6) return DetectorMatchAll((DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6 - PixelOffset, DetectorSize6, DetectorColor6, DetectorThreshold6, DetectorInverted6);
        if (pixelNumber == 7 && Detector7) return DetectorMatchAll((DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7 - PixelOffset, DetectorSize7, DetectorColor7, DetectorThreshold7, DetectorInverted7);
        if (pixelNumber == 8 && Detector8) return DetectorMatchAll((DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8 - PixelOffset, DetectorSize8, DetectorColor8, DetectorThreshold8, DetectorInverted8);
        return 0.0f;
    }

    float4 PS_Final(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        float4 color = tex2Dlod(ReShade::BackBuffer, float4(texCoord, 0, 0));
        const float2 overlayOffset = Offset + (FollowCursor ? MousePoint - CenterPoint : 0);
        const float4 overlay = tex2Dlod(CustomCrosshairOverlaySampler, float4(texCoord + -overlayOffset * BUFFER_PIXEL_SIZE, 0, 0));

        if (Detector1 || Detector2 || Detector3 || Detector4 || Detector5 || Detector6 || Detector7 || Detector8) {
            bool detectorMatches1;
            bool detectorMatches2;
            bool detectorMatches3;
            bool detectorMatches4;
            bool detectorMatches5;
            bool detectorMatches6;
            bool detectorMatches7;
            bool detectorMatches8;
            bool showOverlay;

            if (Detector1) detectorMatches1 = tex2Dfetch(CustomCrosshairDetectorSampler, int2(0, 0), 0).r > 0.0f;
            if (Detector2) detectorMatches2 = tex2Dfetch(CustomCrosshairDetectorSampler, int2(1, 0), 0).r > 0.0f;
            if (Detector3) detectorMatches3 = tex2Dfetch(CustomCrosshairDetectorSampler, int2(2, 0), 0).r > 0.0f;
            if (Detector4) detectorMatches4 = tex2Dfetch(CustomCrosshairDetectorSampler, int2(3, 0), 0).r > 0.0f;
            if (Detector5) detectorMatches5 = tex2Dfetch(CustomCrosshairDetectorSampler, int2(4, 0), 0).r > 0.0f;
            if (Detector6) detectorMatches6 = tex2Dfetch(CustomCrosshairDetectorSampler, int2(5, 0), 0).r > 0.0f;
            if (Detector7) detectorMatches7 = tex2Dfetch(CustomCrosshairDetectorSampler, int2(6, 0), 0).r > 0.0f;
            if (Detector8) detectorMatches8 = tex2Dfetch(CustomCrosshairDetectorSampler, int2(7, 0), 0).r > 0.0f;

            if (DetectorBehavior == 1) { // OR
                showOverlay = false;
                if (showOverlay || detectorMatches1) showOverlay = true;
                if (showOverlay || detectorMatches2) showOverlay = true;
                if (showOverlay || detectorMatches3) showOverlay = true;
                if (showOverlay || detectorMatches4) showOverlay = true;
                if (showOverlay || detectorMatches5) showOverlay = true;
                if (showOverlay || detectorMatches6) showOverlay = true;
                if (showOverlay || detectorMatches7) showOverlay = true;
                if (showOverlay || detectorMatches8) showOverlay = true;
            }
            else { // AND
                showOverlay = true;
                if (Detector1) showOverlay = showOverlay && detectorMatches1;
                if (Detector2) showOverlay = showOverlay && detectorMatches2;
                if (Detector3) showOverlay = showOverlay && detectorMatches3;
                if (Detector4) showOverlay = showOverlay && detectorMatches4;
                if (Detector5) showOverlay = showOverlay && detectorMatches5;
                if (Detector6) showOverlay = showOverlay && detectorMatches6;
                if (Detector7) showOverlay = showOverlay && detectorMatches7;
                if (Detector8) showOverlay = showOverlay && detectorMatches8;
            }

            if (showOverlay) {
                color = lerp(color, overlay, overlay.a);
            }

            if (ShowDetectors) {
                float2 detectorPos;
                float4 outlineColor;
                float4 detectorColor = float4(0,0,0,0);
                
                if (Detector1) {
                    detectorPos = (DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1;
                    outlineColor = detectorMatches1 ? float4(0,1,0,1) : float4(1,0,0,1);
                    detectorColor = DrawRectangle(detectorColor, pos.xy, detectorPos, DetectorSize1, float4(DetectorColor1, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector2) {
                    detectorPos = (DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2;
                    outlineColor = detectorMatches2 ? float4(0,1,0,1) : float4(1,0,0,1);
                    detectorColor = DrawRectangle(detectorColor, pos.xy, detectorPos, DetectorSize2, float4(DetectorColor2, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector3) {
                    detectorPos = (DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3;
                    outlineColor = detectorMatches3 ? float4(0,1,0,1) : float4(1,0,0,1);
                    detectorColor = DrawRectangle(detectorColor, pos.xy, detectorPos, DetectorSize3, float4(DetectorColor3, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector4) {
                    detectorPos = (DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4;
                    outlineColor = detectorMatches4 ? float4(0,1,0,1) : float4(1,0,0,1);
                    detectorColor = DrawRectangle(detectorColor, pos.xy, detectorPos, DetectorSize4, float4(DetectorColor4, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector5) {
                    detectorPos = (DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5;
                    outlineColor = detectorMatches5 ? float4(0,1,0,1) : float4(1,0,0,1);
                    detectorColor = DrawRectangle(detectorColor, pos.xy, detectorPos, DetectorSize5, float4(DetectorColor5, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector6) {
                    detectorPos = (DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6;
                    outlineColor = detectorMatches6 ? float4(0,1,0,1) : float4(1,0,0,1);
                    detectorColor = DrawRectangle(detectorColor, pos.xy, detectorPos, DetectorSize6, float4(DetectorColor6, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector7) {
                    detectorPos = (DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7;
                    outlineColor = detectorMatches7 ? float4(0,1,0,1) : float4(1,0,0,1);
                    detectorColor = DrawRectangle(detectorColor, pos.xy, detectorPos, DetectorSize7, float4(DetectorColor7, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector8) {
                    detectorPos = (DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8;
                    outlineColor = detectorMatches8 ? float4(0,1,0,1) : float4(1,0,0,1);
                    detectorColor = DrawRectangle(detectorColor, pos.xy, detectorPos, DetectorSize8, float4(DetectorColor8, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }

                color = lerp(color, detectorColor, detectorColor.a);
            }
        }
        else {
            color = lerp(color, overlay, overlay.a);
        }
        
        return color;
    }

// ------------------------------------------------------------------------------------------------------------------------
// Techniques
// ------------------------------------------------------------------------------------------------------------------------

    technique CustomCrosshair <
        ui_label = "Custom Crosshair";
        ui_tooltip = "Enable \"Custom Crosshair Setup\" to apply config changes.";
    > {
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetect;
            RenderTarget = CustomCrosshairDetectorTexture;
        }
        pass final {
            VertexShader = PostProcessVS;
            PixelShader = PS_Final;
        }
    }

    technique CustomCrosshairDetectorDebug <
        ui_label = "Custom Crosshair Detector Debug";
        hidden = true;
    > {
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetect;
        }
    }
