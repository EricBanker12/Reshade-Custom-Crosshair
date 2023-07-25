#include "ReShadeUI.fxh"
#include "ReShade.fxh"

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection
// ------------------------------------------------------------------------------------------------------------------------

    uniform int DetectorBehavior <
        ui_type = "combo";
        ui_label = "Behavior";
        ui_items = "AND\0OR\0";
        ui_tooltip = "Hide effects when all detectors are matched (AND), or when at least one detector is matched (OR).";
    > = 0;

    uniform bool ShowDetectors <
        ui_label = "Show Detectors";
        ui_tooltip = "Show UI detectors for ease of configuration.";
    > = true;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 1
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector1 <
        ui_label = "UI Detector 1";
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = false;

    uniform float3 DetectorColor1 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = float3(1.0, 1.0, 1.0);

    uniform float3 DetectorThreshold1 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0;
        ui_max = 255.0;
        ui_step = 1.0;
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = float3(15.0, 15.0, 15.0);

    uniform float2 DetectorSize1 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1.0, 1.0);
        ui_max = float2(100.0, 100.0);
        ui_step = 1.0;
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 DetectorOffset1 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float DetectorRotation1 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_tooltip = "Rotation in degrees, relative to the center of the rectanglular detector.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = 0.0;

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
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = false;

    uniform float3 DetectorColor2 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = float3(1.0, 1.0, 1.0);

    uniform float3 DetectorThreshold2 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0;
        ui_max = 255.0;
        ui_step = 1.0;
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = float3(15.0, 15.0, 15.0);

    uniform float2 DetectorSize2 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1.0, 1.0);
        ui_max = float2(100.0, 100.0);
        ui_step = 1.0;
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 DetectorOffset2 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float DetectorRotation2 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_tooltip = "Rotation in degrees, relative to the center of the rectanglular detector.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = 0.0;

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
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = false;

    uniform float3 DetectorColor3 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = float3(1.0, 1.0, 1.0);

    uniform float3 DetectorThreshold3 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0;
        ui_max = 255.0;
        ui_step = 1.0;
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = float3(15.0, 15.0, 15.0);

    uniform float2 DetectorSize3 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1.0, 1.0);
        ui_max = float2(100.0, 100.0);
        ui_step = 1.0;
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 DetectorOffset3 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float DetectorRotation3 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_tooltip = "Rotation in degrees, relative to the center of the rectanglular detector.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = 0.0;

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
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = false;

    uniform float3 DetectorColor4 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = float3(1.0, 1.0, 1.0);

    uniform float3 DetectorThreshold4 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0;
        ui_max = 255.0;
        ui_step = 1.0;
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = float3(15.0, 15.0, 15.0);

    uniform float2 DetectorSize4 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1.0, 1.0);
        ui_max = float2(100.0, 100.0);
        ui_step = 1.0;
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 DetectorOffset4 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float DetectorRotation4 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_tooltip = "Rotation in degrees, relative to the center of the rectanglular detector.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = 0.0;

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
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = false;

    uniform float3 DetectorColor5 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = float3(1.0, 1.0, 1.0);

    uniform float3 DetectorThreshold5 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0;
        ui_max = 255.0;
        ui_step = 1.0;
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = float3(15.0, 15.0, 15.0);

    uniform float2 DetectorSize5 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1.0, 1.0);
        ui_max = float2(100.0, 100.0);
        ui_step = 1.0;
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 DetectorOffset5 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float DetectorRotation5 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_tooltip = "Rotation in degrees, relative to the center of the rectanglular detector.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = 0.0;

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
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = false;

    uniform float3 DetectorColor6 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = float3(1.0, 1.0, 1.0);

    uniform float3 DetectorThreshold6 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0;
        ui_max = 255.0;
        ui_step = 1.0;
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = float3(15.0, 15.0, 15.0);

    uniform float2 DetectorSize6 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1.0, 1.0);
        ui_max = float2(100.0, 100.0);
        ui_step = 1.0;
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 DetectorOffset6 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float DetectorRotation6 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_tooltip = "Rotation in degrees, relative to the center of the rectanglular detector.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = 0.0;

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
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = false;

    uniform float3 DetectorColor7 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = float3(1.0, 1.0, 1.0);

    uniform float3 DetectorThreshold7 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0;
        ui_max = 255.0;
        ui_step = 1.0;
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = float3(15.0, 15.0, 15.0);

    uniform float2 DetectorSize7 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1.0, 1.0);
        ui_max = float2(100.0, 100.0);
        ui_step = 1.0;
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 DetectorOffset7 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float DetectorRotation7 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_tooltip = "Rotation in degrees, relative to the center of the rectanglular detector.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = 0.0;

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
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = false;

    uniform float3 DetectorColor8 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = float3(1.0, 1.0, 1.0);

    uniform float3 DetectorThreshold8 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0;
        ui_max = 255.0;
        ui_step = 1.0;
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = float3(15.0, 15.0, 15.0);

    uniform float2 DetectorSize8 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1.0, 1.0);
        ui_max = float2(100.0, 100.0);
        ui_step = 1.0;
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 DetectorOffset8 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float DetectorRotation8 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_tooltip = "Rotation in degrees, relative to the center of the rectanglular detector.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = 0.0;

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
// Hidden or Static Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
    static const float2 PixelOffset = float2(0.5, 0.5);
    
    uniform float2 MousePoint < source = "mousepoint"; >;

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture2D UIDetectGUITexture <pooled = false; > { Width = 8; Height = 1; Format = R8; };
    sampler2D UIDetectGUISampler { Texture = UIDetectGUITexture; };

    texture2D UIDetectCustomCrosshairTexture <pooled = false; > { Width = 1; Height = 1; Format = R8; };
    sampler2D UIDetectCustomCrosshairSampler { Texture = UIDetectCustomCrosshairTexture; };

    texture2D UIDetectGUIBeforeTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler2D UIDetectGUIBeforeSampler { Texture = UIDetectGUIBeforeTexture;};

// ------------------------------------------------------------------------------------------------------------------------
// Functions
// ------------------------------------------------------------------------------------------------------------------------
    float4 DrawRectangle(float4 baseColor, float2 basePos, float2 center, float2 fillSize, float4 fillColor, float outlineSize, float4 outlineColor, float rotation) {
        if (rotation > 0.0) {
            rotation = -radians(rotation);
            basePos = float2((basePos.x - center.x) * cos(rotation) - (basePos.y - center.y) * sin(rotation) + center.x, (basePos.x - center.x) * sin(rotation) + (basePos.y - center.y) * cos(rotation) + center.y);
        }

        // https://iquilezles.org/articles/distfunctions2d/
        float2 d = abs(basePos - center) - fillSize / 2.0;
        const float sdFill = length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
        
        if (sdFill <= 0.0) return fillColor;
        if (sdFill <= outlineSize) return outlineColor;

        return baseColor;
    }

    float DetectorMatchAll(float2 offset, float2 size, float3 detectorColor, float3 detectorThreshold, float rotation, bool inverted, bool followCursor) {
        detectorThreshold = detectorThreshold / 255.0;
        rotation = -radians(rotation);
        float2 pos = (followCursor ? MousePoint : CenterPoint) + offset;
        
        // center
        float4 target = float4(BUFFER_PIXEL_SIZE * pos, 0.0, 0.0);
        float3 color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
        bool matched = color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
        if (!matched && !inverted) return 0.0;

        //  center left and right
        if (size.x > 2.0) {
            target.xy = BUFFER_PIXEL_SIZE * float2((-size.x / 2.0) * cos(rotation) - (0.0) * sin(rotation) + pos.x, (-size.x / 2.0) * sin(rotation) + (0.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;

            target.xy = BUFFER_PIXEL_SIZE * float2((size.x / 2.0) * cos(rotation) - (0.0) * sin(rotation) + pos.x, (size.x / 2.0) * sin(rotation) + (0.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;
        }

        // center top and bottom
        if (size.y > 2.0) {
            target.xy = BUFFER_PIXEL_SIZE * float2((0.0) * cos(rotation) - (-size.y / 2.0) * sin(rotation) + pos.x, (0.0) * sin(rotation) + (-size.y / 2.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;

            target.xy = BUFFER_PIXEL_SIZE * float2((0.0) * cos(rotation) - (size.y / 2.0) * sin(rotation) + pos.x, (0.0) * sin(rotation) + (size.y / 2.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;
        }

        // 4 corners
        if (size.x > 3.0 && size.y > 3.0) {
            target.xy = BUFFER_PIXEL_SIZE * float2((-size.x / 2.0) * cos(rotation) - (-size.y / 2.0) * sin(rotation) + pos.x, (-size.x / 2.0) * sin(rotation) + (-size.y / 2.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;

            target.xy = BUFFER_PIXEL_SIZE * float2((size.x / 2.0) * cos(rotation) - (-size.y / 2.0) * sin(rotation) + pos.x, (size.x / 2.0) * sin(rotation) + (-size.y / 2.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;

            target.xy = BUFFER_PIXEL_SIZE * float2((-size.x / 2.0) * cos(rotation) - (size.y / 2.0) * sin(rotation) + pos.x, (-size.x / 2.0) * sin(rotation) + (size.y / 2.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;

            target.xy = BUFFER_PIXEL_SIZE * float2((size.x / 2.0) * cos(rotation) - (size.y / 2.0) * sin(rotation) + pos.x, (size.x / 2.0) * sin(rotation) + (size.y / 2.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;
        }

        // center left and right midpoint
        if (size.x > 5.0) {
            target.xy = BUFFER_PIXEL_SIZE * float2((-size.x / 4.0) * cos(rotation) - (0.0) * sin(rotation) + pos.x, (-size.x / 4.0) * sin(rotation) + (0.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;
            
            target.xy = BUFFER_PIXEL_SIZE * float2((size.x / 4.0) * cos(rotation) - (0.0) * sin(rotation) + pos.x, (size.x / 4.0) * sin(rotation) + (0.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;
        }

        // center top and bottom midpoint
        if (size.y > 5.0) {
            target.xy = BUFFER_PIXEL_SIZE * float2((0.0) * cos(rotation) - (-size.y / 4.0) * sin(rotation) + pos.x, (0.0) * sin(rotation) + (-size.y / 4.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;

            target.xy = BUFFER_PIXEL_SIZE * float2((0.0) * cos(rotation) - (size.y / 4.0) * sin(rotation) + pos.x, (0.0) * sin(rotation) + (size.y / 4.0) * cos(rotation) + pos.y);
            color = abs(tex2Dlod(ReShade::BackBuffer, target).rgb - detectorColor.rgb);
            matched = matched && color.r <= detectorThreshold.r && color.g <= detectorThreshold.g && color.b <= detectorThreshold.b;
            if (!matched && !inverted) return 0.0;
        }

        if (inverted && matched) return 0.0;
        return 1.0;
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float PS_UIDetect(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        int pixelNumber = floor(pos.x);
        if (pixelNumber == 0 && Detector1) return DetectorMatchAll(DetectorOffset1, DetectorSize1, DetectorColor1, DetectorThreshold1, DetectorRotation1, DetectorInverted1, DetectorFollowCursor1);
        if (pixelNumber == 1 && Detector2) return DetectorMatchAll(DetectorOffset2, DetectorSize2, DetectorColor2, DetectorThreshold2, DetectorRotation2, DetectorInverted2, DetectorFollowCursor2);
        if (pixelNumber == 2 && Detector3) return DetectorMatchAll(DetectorOffset3, DetectorSize3, DetectorColor3, DetectorThreshold3, DetectorRotation3, DetectorInverted3, DetectorFollowCursor3);
        if (pixelNumber == 3 && Detector4) return DetectorMatchAll(DetectorOffset4, DetectorSize4, DetectorColor4, DetectorThreshold4, DetectorRotation4, DetectorInverted4, DetectorFollowCursor4);
        if (pixelNumber == 4 && Detector5) return DetectorMatchAll(DetectorOffset5, DetectorSize5, DetectorColor5, DetectorThreshold5, DetectorRotation5, DetectorInverted5, DetectorFollowCursor5);
        if (pixelNumber == 5 && Detector6) return DetectorMatchAll(DetectorOffset6, DetectorSize6, DetectorColor6, DetectorThreshold6, DetectorRotation6, DetectorInverted6, DetectorFollowCursor6);
        if (pixelNumber == 6 && Detector7) return DetectorMatchAll(DetectorOffset7, DetectorSize7, DetectorColor7, DetectorThreshold7, DetectorRotation7, DetectorInverted7, DetectorFollowCursor7);
        if (pixelNumber == 7 && Detector8) return DetectorMatchAll(DetectorOffset8, DetectorSize8, DetectorColor8, DetectorThreshold8, DetectorRotation8, DetectorInverted8, DetectorFollowCursor8);
        return 0.0;
    }

    float4 PS_Before(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return tex2Dfetch(ReShade::BackBuffer, floor(pos.xy), 0);
    }

    float4 PS_After(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        const float4 before = tex2Dfetch(UIDetectGUIBeforeSampler, floor(pos.xy), 0);
        float4 color;

        if (Detector1 || Detector2 || Detector3 || Detector4 || Detector5 || Detector6 || Detector7 || Detector8) {
            bool detectorMatches1;
            bool detectorMatches2;
            bool detectorMatches3;
            bool detectorMatches4;
            bool detectorMatches5;
            bool detectorMatches6;
            bool detectorMatches7;
            bool detectorMatches8;
            bool showBefore;

            if (Detector1) detectorMatches1 = tex2Dfetch(UIDetectGUISampler, int2(0, 0), 0).r > 0.0;
            if (Detector2) detectorMatches2 = tex2Dfetch(UIDetectGUISampler, int2(1, 0), 0).r > 0.0;
            if (Detector3) detectorMatches3 = tex2Dfetch(UIDetectGUISampler, int2(2, 0), 0).r > 0.0;
            if (Detector4) detectorMatches4 = tex2Dfetch(UIDetectGUISampler, int2(3, 0), 0).r > 0.0;
            if (Detector5) detectorMatches5 = tex2Dfetch(UIDetectGUISampler, int2(4, 0), 0).r > 0.0;
            if (Detector6) detectorMatches6 = tex2Dfetch(UIDetectGUISampler, int2(5, 0), 0).r > 0.0;
            if (Detector7) detectorMatches7 = tex2Dfetch(UIDetectGUISampler, int2(6, 0), 0).r > 0.0;
            if (Detector8) detectorMatches8 = tex2Dfetch(UIDetectGUISampler, int2(7, 0), 0).r > 0.0;

            if (DetectorBehavior == 1) { // OR
                showBefore = detectorMatches1 || detectorMatches2 || detectorMatches3 || detectorMatches4 || detectorMatches5 || detectorMatches6 || detectorMatches7 || detectorMatches8;
            }
            else { // AND
                showBefore = Detector1 && detectorMatches1 || !Detector1;
                showBefore = showBefore && (Detector2 && detectorMatches2 || !Detector2);
                showBefore = showBefore && (Detector3 && detectorMatches3 || !Detector3);
                showBefore = showBefore && (Detector4 && detectorMatches4 || !Detector4);
                showBefore = showBefore && (Detector5 && detectorMatches5 || !Detector5);
                showBefore = showBefore && (Detector6 && detectorMatches6 || !Detector6);
                showBefore = showBefore && (Detector7 && detectorMatches7 || !Detector7);
                showBefore = showBefore && (Detector8 && detectorMatches8 || !Detector8);
            }

            if (showBefore) {
                color = before;
            }

            if (ShowDetectors) {
                float2 detectorPos;
                float4 outlineColor;
                
                if (Detector1) {
                    detectorPos = (DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1;
                    outlineColor = detectorMatches1 ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize1, float4(DetectorColor1, 1.0), 1.0, outlineColor, DetectorRotation1);
                }
                if (Detector2) {
                    detectorPos = (DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2;
                    outlineColor = detectorMatches2 ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize2, float4(DetectorColor2, 1.0), 1.0, outlineColor, DetectorRotation2);
                }
                if (Detector3) {
                    detectorPos = (DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3;
                    outlineColor = detectorMatches3 ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize3, float4(DetectorColor3, 1.0), 1.0, outlineColor, DetectorRotation3);
                }
                if (Detector4) {
                    detectorPos = (DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4;
                    outlineColor = detectorMatches4 ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize4, float4(DetectorColor4, 1.0), 1.0, outlineColor, DetectorRotation4);
                }
                if (Detector5) {
                    detectorPos = (DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5;
                    outlineColor = detectorMatches5 ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize5, float4(DetectorColor5, 1.0), 1.0, outlineColor, DetectorRotation5);
                }
                if (Detector6) {
                    detectorPos = (DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6;
                    outlineColor = detectorMatches6 ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize6, float4(DetectorColor6, 1.0), 1.0, outlineColor, DetectorRotation6);
                }
                if (Detector7) {
                    detectorPos = (DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7;
                    outlineColor = detectorMatches7 ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize7, float4(DetectorColor7, 1.0), 1.0, outlineColor, DetectorRotation7);
                }
                if (Detector8) {
                    detectorPos = (DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8;
                    outlineColor = detectorMatches8 ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize8, float4(DetectorColor8, 1.0), 1.0, outlineColor, DetectorRotation8);
                }
            }
        }
        
        if (color.a > 0.0) return color;

        discard;
    }

    float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (Detector1 || Detector2 || Detector3 || Detector4 || Detector5 || Detector6 || Detector7 || Detector8) {
            bool detectorMatches1;
            bool detectorMatches2;
            bool detectorMatches3;
            bool detectorMatches4;
            bool detectorMatches5;
            bool detectorMatches6;
            bool detectorMatches7;
            bool detectorMatches8;

            if (Detector1) detectorMatches1 = tex2Dfetch(UIDetectGUISampler, int2(0, 0), 0).r > 0.0;
            if (Detector2) detectorMatches2 = tex2Dfetch(UIDetectGUISampler, int2(1, 0), 0).r > 0.0;
            if (Detector3) detectorMatches3 = tex2Dfetch(UIDetectGUISampler, int2(2, 0), 0).r > 0.0;
            if (Detector4) detectorMatches4 = tex2Dfetch(UIDetectGUISampler, int2(3, 0), 0).r > 0.0;
            if (Detector5) detectorMatches5 = tex2Dfetch(UIDetectGUISampler, int2(4, 0), 0).r > 0.0;
            if (Detector6) detectorMatches6 = tex2Dfetch(UIDetectGUISampler, int2(5, 0), 0).r > 0.0;
            if (Detector7) detectorMatches7 = tex2Dfetch(UIDetectGUISampler, int2(6, 0), 0).r > 0.0;
            if (Detector8) detectorMatches8 = tex2Dfetch(UIDetectGUISampler, int2(7, 0), 0).r > 0.0;

            bool hideCrosshair;
            if (DetectorBehavior == 1) { // OR
                hideCrosshair = detectorMatches1 || detectorMatches2 || detectorMatches3 || detectorMatches4 || detectorMatches5 || detectorMatches6 || detectorMatches7 || detectorMatches8;
            }
            else { // AND
                hideCrosshair = Detector1 && detectorMatches1 || !Detector1;
                hideCrosshair = hideCrosshair && (Detector2 && detectorMatches2 || !Detector2);
                hideCrosshair = hideCrosshair && (Detector3 && detectorMatches3 || !Detector3);
                hideCrosshair = hideCrosshair && (Detector4 && detectorMatches4 || !Detector4);
                hideCrosshair = hideCrosshair && (Detector5 && detectorMatches5 || !Detector5);
                hideCrosshair = hideCrosshair && (Detector6 && detectorMatches6 || !Detector6);
                hideCrosshair = hideCrosshair && (Detector7 && detectorMatches7 || !Detector7);
                hideCrosshair = hideCrosshair && (Detector8 && detectorMatches8 || !Detector8);
            }

            if (hideCrosshair) return 1.0;
        }
        return 0.0;
    }

// ------------------------------------------------------------------------------------------------------------------------
// Techniques
// ------------------------------------------------------------------------------------------------------------------------

    technique UIDetectGUIBefore <
        ui_label = "UIDetectGUI Before";
        ui_tooltip = "Order this before the effects you want to hide.";
    > {
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetect;
            RenderTarget = UIDetectGUITexture;
        }
        pass before {
            VertexShader = PostProcessVS;
            PixelShader = PS_Before;
            RenderTarget = UIDetectGUIBeforeTexture;
        }
    }

    technique CustomCrosshairUIDetectBefore <
        ui_label = "CustomCrosshairUIDetectGUI";
        ui_tooltip = "A lightweight version of \"UIDetectGUI Before\" only for \"CustomCrosshair\".\n"
                        "Order this before \"CustomCrosshair\".\n\n"
                        "\"UI Detect GUI After\" is required for the \"Show Detectors\" option,\n"
                        "but after configuration, it should be disabled for performance.";
    > {
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetect;
            RenderTarget = UIDetectGUITexture;
        }
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshair;
            RenderTarget = UIDetectCustomCrosshairTexture;
        }
    }

    technique UIDetectGUIAfter <
        ui_label = "UIDetectGUI After";
        ui_tooltip = "Order this after the effects you want to hide.";
    > {
        pass after {
            VertexShader = PostProcessVS;
            PixelShader = PS_After;
        }
    }
