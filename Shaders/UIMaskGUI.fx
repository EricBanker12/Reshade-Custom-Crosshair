#include "ReShadeUI.fxh"
#include "ReShade.fxh"

// ------------------------------------------------------------------------------------------------------------------------
// UI Masks
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShowMasks <
        ui_label = "Show Masks";
        ui_tooltip = "Show UI masks for ease of configuration.";
    > = true;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 1
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled1 <
        ui_label = "UI Mask 1";
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = true;

    uniform int Shape1 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor1 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = 7;

    uniform float2 MaskSize1 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = float2(600.0, 200.0);

    uniform float2 Offset1 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = float2(0.0, BUFFER_HEIGHT / 2.0);

    uniform float Feather1 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = 20.0;

    uniform float Rotation1 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = 0.0;

    uniform bool MaskFollowCursor1 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply UI Mask relative to mouse cursor instead of the window center.";
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 2
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled2 <
        ui_label = "UI Mask 2";
        ui_category = "UI Mask 2";
        ui_category_closed = true;
    > = false;

    uniform int Shape2 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 2";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor2 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "UI Mask 2";
        ui_category_closed = true;
    > = 4;

    uniform float2 MaskSize2 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 2";
        ui_category_closed = true;
    > = float2(200.0, 200.0);

    uniform float2 Offset2 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 2";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Feather2 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 2";
        ui_category_closed = true;
    > = 20.0;

    uniform float Rotation2 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Mask 2";
        ui_category_closed = true;
    > = 0.0;

    uniform bool MaskFollowCursor2 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply UI Mask relative to mouse cursor instead of the window center.";
        ui_category = "UI Mask 2";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 3
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled3 <
        ui_label = "UI Mask 3";
        ui_category = "UI Mask 3";
        ui_category_closed = true;
    > = false;

    uniform int Shape3 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 3";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor3 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "UI Mask 3";
        ui_category_closed = true;
    > = 4;

    uniform float2 MaskSize3 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 3";
        ui_category_closed = true;
    > = float2(200.0, 200.0);

    uniform float2 Offset3 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 3";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Feather3 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 3";
        ui_category_closed = true;
    > = 20.0;

    uniform float Rotation3 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Mask 3";
        ui_category_closed = true;
    > = 0.0;

    uniform bool MaskFollowCursor3 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply UI Mask relative to mouse cursor instead of the window center.";
        ui_category = "UI Mask 3";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 4
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled4 <
        ui_label = "UI Mask 4";
        ui_category = "UI Mask 4";
        ui_category_closed = true;
    > = false;

    uniform int Shape4 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 4";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor4 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "UI Mask 4";
        ui_category_closed = true;
    > = 4;

    uniform float2 MaskSize4 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 4";
        ui_category_closed = true;
    > = float2(200.0, 200.0);

    uniform float2 Offset4 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 4";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Feather4 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 4";
        ui_category_closed = true;
    > = 20.0;

    uniform float Rotation4 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Mask 4";
        ui_category_closed = true;
    > = 0.0;

    uniform bool MaskFollowCursor4 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply UI Mask relative to mouse cursor instead of the window center.";
        ui_category = "UI Mask 4";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 5
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled5 <
        ui_label = "UI Mask 5";
        ui_category = "UI Mask 5";
        ui_category_closed = true;
    > = false;

    uniform int Shape5 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 5";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor5 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "UI Mask 5";
        ui_category_closed = true;
    > = 4;

    uniform float2 MaskSize5 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 5";
        ui_category_closed = true;
    > = float2(200.0, 200.0);

    uniform float2 Offset5 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 5";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Feather5 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 5";
        ui_category_closed = true;
    > = 20.0;

    uniform float Rotation5 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Mask 5";
        ui_category_closed = true;
    > = 0.0;

    uniform bool MaskFollowCursor5 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply UI Mask relative to mouse cursor instead of the window center.";
        ui_category = "UI Mask 5";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 6
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled6 <
        ui_label = "UI Mask 6";
        ui_category = "UI Mask 6";
        ui_category_closed = true;
    > = false;

    uniform int Shape6 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 6";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor6 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "UI Mask 6";
        ui_category_closed = true;
    > = 4;

    uniform float2 MaskSize6 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 6";
        ui_category_closed = true;
    > = float2(200.0, 200.0);

    uniform float2 Offset6 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 6";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Feather6 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 6";
        ui_category_closed = true;
    > = 20.0;

    uniform float Rotation6 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Mask 6";
        ui_category_closed = true;
    > = 0.0;

    uniform bool MaskFollowCursor6 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply UI Mask relative to mouse cursor instead of the window center.";
        ui_category = "UI Mask 6";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 7
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled7 <
        ui_label = "UI Mask 7";
        ui_category = "UI Mask 7";
        ui_category_closed = true;
    > = false;

    uniform int Shape7 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 7";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor7 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "UI Mask 7";
        ui_category_closed = true;
    > = 4;

    uniform float2 MaskSize7 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 7";
        ui_category_closed = true;
    > = float2(200.0, 200.0);

    uniform float2 Offset7 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 7";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Feather7 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 7";
        ui_category_closed = true;
    > = 20.0;

    uniform float Rotation7 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Mask 7";
        ui_category_closed = true;
    > = 0.0;

    uniform bool MaskFollowCursor7 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply UI Mask relative to mouse cursor instead of the window center.";
        ui_category = "UI Mask 7";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 8
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled8 <
        ui_label = "UI Mask 8";
        ui_category = "UI Mask 8";
        ui_category_closed = true;
    > = false;

    uniform int Shape8 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 8";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor8 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "UI Mask 8";
        ui_category_closed = true;
    > = 4;

    uniform float2 MaskSize8 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 8";
        ui_category_closed = true;
    > = float2(200.0, 200.0);

    uniform float2 Offset8 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 8";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Feather8 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 8";
        ui_category_closed = true;
    > = 20.0;

    uniform float Rotation8 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "UI Mask 8";
        ui_category_closed = true;
    > = 0.0;

    uniform bool MaskFollowCursor8 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply UI Mask relative to mouse cursor instead of the window center.";
        ui_category = "UI Mask 8";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection
// ------------------------------------------------------------------------------------------------------------------------

    uniform int DetectorBehavior <
        ui_type = "combo";
        ui_label = "Behavior";
        ui_items = "AND\0OR\0";
        ui_tooltip = "Hide effects inside a UI mask when all of its detectors are matched (AND),\n"
                        "or when at least one of its detectors is matched (OR).";
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

    uniform int DetectorMask1 <
        ui_type = "combo";
        ui_label = "UI Mask";
        ui_items = "UI Mask 1\0UI Mask 2\0UI Mask 3\0UI Mask 4\0UI Mask 5\0UI Mask 6\0UI Mask 7\0UI Mask 8\0";
        ui_tooltip = "The UI Mask which will activate when the UI Detector is matched.";
        ui_category = "UI Detector 1";
        ui_category_closed = true;
    > = 0;

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
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
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

    uniform int DetectorMask2 <
        ui_type = "combo";
        ui_label = "UI Mask";
        ui_items = "UI Mask 1\0UI Mask 2\0UI Mask 3\0UI Mask 4\0UI Mask 5\0UI Mask 6\0UI Mask 7\0UI Mask 8\0";
        ui_tooltip = "The UI Mask which will activate when the UI Detector is matched.";
        ui_category = "UI Detector 2";
        ui_category_closed = true;
    > = 0;

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
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
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

    uniform int DetectorMask3 <
        ui_type = "combo";
        ui_label = "UI Mask";
        ui_items = "UI Mask 1\0UI Mask 2\0UI Mask 3\0UI Mask 4\0UI Mask 5\0UI Mask 6\0UI Mask 7\0UI Mask 8\0";
        ui_tooltip = "The UI Mask which will activate when the UI Detector is matched.";
        ui_category = "UI Detector 3";
        ui_category_closed = true;
    > = 0;

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
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
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

    uniform int DetectorMask4 <
        ui_type = "combo";
        ui_label = "UI Mask";
        ui_items = "UI Mask 1\0UI Mask 2\0UI Mask 3\0UI Mask 4\0UI Mask 5\0UI Mask 6\0UI Mask 7\0UI Mask 8\0";
        ui_tooltip = "The UI Mask which will activate when the UI Detector is matched.";
        ui_category = "UI Detector 4";
        ui_category_closed = true;
    > = 0;

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
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
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

    uniform int DetectorMask5 <
        ui_type = "combo";
        ui_label = "UI Mask";
        ui_items = "UI Mask 1\0UI Mask 2\0UI Mask 3\0UI Mask 4\0UI Mask 5\0UI Mask 6\0UI Mask 7\0UI Mask 8\0";
        ui_tooltip = "The UI Mask which will activate when the UI Detector is matched.";
        ui_category = "UI Detector 5";
        ui_category_closed = true;
    > = 0;

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
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
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

    uniform int DetectorMask6 <
        ui_type = "combo";
        ui_label = "UI Mask";
        ui_items = "UI Mask 1\0UI Mask 2\0UI Mask 3\0UI Mask 4\0UI Mask 5\0UI Mask 6\0UI Mask 7\0UI Mask 8\0";
        ui_tooltip = "The UI Mask which will activate when the UI Detector is matched.";
        ui_category = "UI Detector 6";
        ui_category_closed = true;
    > = 0;

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
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
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

    uniform int DetectorMask7 <
        ui_type = "combo";
        ui_label = "UI Mask";
        ui_items = "UI Mask 1\0UI Mask 2\0UI Mask 3\0UI Mask 4\0UI Mask 5\0UI Mask 6\0UI Mask 7\0UI Mask 8\0";
        ui_tooltip = "The UI Mask which will activate when the UI Detector is matched.";
        ui_category = "UI Detector 7";
        ui_category_closed = true;
    > = 0;

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
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
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

    uniform int DetectorMask8 <
        ui_type = "combo";
        ui_label = "UI Mask";
        ui_items = "UI Mask 1\0UI Mask 2\0UI Mask 3\0UI Mask 4\0UI Mask 5\0UI Mask 6\0UI Mask 7\0UI Mask 8\0";
        ui_tooltip = "The UI Mask which will activate when the UI Detector is matched.";
        ui_category = "UI Detector 8";
        ui_category_closed = true;
    > = 0;

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
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
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
// Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
    static const float2 PixelOffset = float2(0.5, 0.5);
    static const float2 AnchorOffsets[9] = {float2(0.5, 0.5), float2(0.0, 0.5), float2(-0.5, 0.5), float2(0.5, 0.0), float2(0.0, 0.0), float2(-0.5, 0.0), float2(0.5, -0.5), float2(0.0, -0.5), float2(-0.5, -0.5)};
    static const float4 MaskColors[8] = { float4(0xff, 0xad, 0xad, 0xff), float4(0xff, 0xd6, 0xa5, 0xff), float4(0xfd, 0xff, 0xb6, 0xff), float4(0xca, 0xff, 0xbf, 0xff), float4(0x9b, 0xf6, 0xff, 0xff), float4(0xa0, 0xc4, 0xff, 0xff), float4(0xbd, 0xb2, 0xff, 0xff), float4(0xff, 0xc6, 0xff, 0xff) };
    // Mask Colors: #ffadad #ffd6a5 #fdffb6 #caffbf #9bf6ff #a0c4ff #bdb2ff #ffc6ff

    uniform float2 MousePoint < source = "mousepoint"; >;

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture2D UIMaskGUIStateTexture <pooled = false; > { Width = 8; Height = 1; Format = R8; };
    sampler2D UIMaskGUIStateSampler { Texture = UIMaskGUIStateTexture; };

    texture2D UIMaskGUIMaskTexture <pooled = false; > { Width = 8; Height = 1; Format = R8; };
    sampler2D UIMaskGUIMaskSampler { Texture = UIMaskGUIMaskTexture; };

    texture2D UIMaskGUIBeforeTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler2D UIMaskGUIBeforeSampler { Texture = UIMaskGUIBeforeTexture;};

    texture2D UIMaskGUIAfterTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler2D UIMaskGUIAfterSampler { Texture = UIMaskGUIAfterTexture;};

// ------------------------------------------------------------------------------------------------------------------------
// Structs
// ------------------------------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------------------------------
// Functions
// ------------------------------------------------------------------------------------------------------------------------
    // https://iquilezles.org/articles/distfunctions2d/
    float sdBox( in float2 p, in float2 b ) {
        float2 d = abs(p)-b;
        return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
    }

    float sdEllipse( in float2 p, in float2 ab ) {
        if (ab.x == ab.y) return length(p) - ab.x;
        
        p = abs(p);
        if( p.x > p.y ) {p=p.yx;ab=ab.yx;}
        float l = ab.y*ab.y - ab.x*ab.x;
        float m = ab.x*p.x/l;
        float m2 = m*m; 
        float n = ab.y*p.y/l;
        float n2 = n*n; 
        float c = (m2+n2-1.0)/3.0;
        float c3 = c*c*c;
        float q = c3 + m2*n2*2.0;
        float d = c3 + m2*n2;
        float g = m + m*n2;
        float co;
        if (d < 0.0)
        {
            float h = acos(q/c3)/3.0;
            float s = cos(h);
            float t = sin(h)*sqrt(3.0);
            float rx = sqrt( -c*(s + t + 2.0) + m2 );
            float ry = sqrt( -c*(s - t + 2.0) + m2 );
            co = (ry+sign(l)*rx+abs(g)/(rx*ry)- m)/2.0;
        }
        else
        {
            float h = 2.0*m*n*sqrt( d );
            float s = sign(q+h)*pow(abs(q+h), 1.0/3.0);
            float u = sign(q-h)*pow(abs(q-h), 1.0/3.0);
            float rx = -s - u - c*4.0 + 2.0*m2;
            float ry = (s - u)*sqrt(3.0);
            float rm = sqrt( rx*rx + ry*ry );
            co = (ry/sqrt(rm-rx)+2.0*g/rm-m)/2.0;
        }
        float2 r = ab * float2(co, sqrt(1.0-co*co));
        return length(r-p) * sign(p.y-r.y);
    }

    // TODO: replace with simplified Isosceles formula
    float sdTriangle( in float2 p, in float2 p0, in float2 p1, in float2 p2 ) {
        float2 e0 = p1-p0, e1 = p2-p1, e2 = p0-p2;
        float2 v0 = p -p0, v1 = p -p1, v2 = p -p2;
        float2 pq0 = v0 - e0*clamp( dot(v0, e0)/dot(e0, e0), 0.0, 1.0 );
        float2 pq1 = v1 - e1*clamp( dot(v1, e1)/dot(e1, e1), 0.0, 1.0 );
        float2 pq2 = v2 - e2*clamp( dot(v2, e2)/dot(e2, e2), 0.0, 1.0 );
        float s = sign( e0.x*e2.y - e0.y*e2.x );
        float2 d = min(min(float2(dot(pq0, pq0), s*(v0.x*e0.y-v0.y*e0.x)),
                        float2(dot(pq1, pq1), s*(v1.x*e1.y-v1.y*e1.x))),
                        float2(dot(pq2, pq2), s*(v2.x*e2.y-v2.y*e2.x)));
        return -sqrt(d.x)*sign(d.y);
    }
    
    float4 DrawRectangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float outlineSize, float4 outlineColor, int anchor, bool feather) {
        const float2 center = fillPos + fillSize * AnchorOffsets[anchor];
        const float sdFill = sdBox(basePos - center, fillSize / 2.0);
        if (sdFill <= 0.0)
            return fillColor;

        if (sdFill <= outlineSize)
            return feather ? float4(outlineColor.rgb, 1.0 - sdFill / outlineSize) : outlineColor;

        return baseColor;
    }

    float4 DrawEllipse(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float outlineSize, float4 outlineColor, int anchor, bool feather) {
        const float2 center = fillPos + fillSize * AnchorOffsets[anchor];
        const float sdFill = sdEllipse(basePos - center, fillSize / 2.0);
        if (sdFill <= 0.0)
            return fillColor;

        if (sdFill <= outlineSize)
            return feather ? float4(outlineColor.rgb, 1.0 - sdFill / outlineSize) : outlineColor;

        return baseColor;
    }

    float4 DrawTriangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float outlineSize, float4 outlineColor, int anchor, bool feather) {
        float2 anchorOffset = AnchorOffsets[anchor];
        if (anchorOffset.y != 0.0) anchorOffset.y += 1.0 / 6.0;

        const float2 center = fillPos + fillSize * anchorOffset;
        const float2 A = float2(-fillSize.x / 2.0, fillSize.y / 3.0);
        const float2 B = float2(0.0, -fillSize.y * 2.0 / 3.0);
        const float2 C = float2(fillSize.x / 2.0, fillSize.y / 3.0);
        
        const float sdFill = sdTriangle(basePos - center, A, B, C);
        if (sdFill <= 0.0)
            return fillColor;

        if (sdFill <= outlineSize)
            return feather ? float4(outlineColor.rgb, 1.0 - sdFill / outlineSize) : outlineColor;
        
        return baseColor;
    }

    float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float rotation, float outlineSize, float4 outlineColor, int anchor, bool feather) {
        if (rotation > 0.0) {
            rotation = -radians(rotation);
            basePos = float4((basePos.x - fillPos.x) * cos(rotation) - (basePos.y - fillPos.y) * sin(rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(rotation) + (basePos.y - fillPos.y) * cos(rotation) + fillPos.y, 0.0, 0.0);
        }
        
        float4 color;
        if (shape == 1) color = DrawTriangle(color, basePos.xy, fillPos, fillSize, fillColor, outlineSize, outlineColor, anchor, feather);
        else if (shape == 2) color = DrawEllipse(color, basePos.xy, fillPos, fillSize, fillColor, outlineSize, outlineColor, anchor, feather);
        else color = DrawRectangle(color, basePos.xy, fillPos, fillSize, fillColor, outlineSize, outlineColor, anchor, feather);

        if (baseColor.a > 0.0 && color.a > 0.0)
            return float4(lerp(baseColor.rgb, color.rgb, color.a), 1.0 - (1.0 - baseColor.a) * (1.0 - color.a));
        
        if (color.a > 0.0)
            return color;

        return baseColor;
    }

    float2 GetBoundingBoxVertexTS(int id, int shape, float2 fillPos, float2 fillSize, int anchor, float rotation, float outlineSize) {
        float2 retVal;

        outlineSize += 1.0;

        float2 center = fillPos + fillSize * AnchorOffsets[anchor];

        retVal.x = (id < 2) ?
            center.x - fillSize.x / 2.0 - outlineSize :
            center.x + fillSize.x / 2.0 +  outlineSize;
            
        if (shape == 1) { //triangle
            if (AnchorOffsets[anchor].y != 0.0)
                center.y += fillSize.y * 1.0 / 6.0;
            
            retVal.y = (id == 0 || id == 2) ?
                center.y - fillSize.y * 2.0 / 3.0 - outlineSize :
                center.y + fillSize.y / 3.0 + outlineSize;
        }
        else { //other
            retVal.y = (id == 0 || id == 2) ?
                center.y - fillSize.y / 2.0 - outlineSize :
                center.y + fillSize.y / 2.0 + outlineSize;
        }

        if (rotation > 0.0) {
            rotation = radians(rotation);
            retVal.xy = float2((retVal.x - fillPos.x) * cos(rotation) - (retVal.y - fillPos.y) * sin(rotation) + fillPos.x, (retVal.x - fillPos.x) * sin(rotation) + (retVal.y - fillPos.y) * cos(rotation) + fillPos.y);
        }

        retVal /= BUFFER_SCREEN_SIZE;
        
        return retVal;
    }

    float2 GetBoundingBoxVertexTL(int id, int shape, float2 center, float2 fillSize, int anchor, float rotation, float outlineSize) {
        // convert triangle list to triangle strip
        id = id % 6;
        if (id > 2) id -= 2;
        return GetBoundingBoxVertexTS(id, shape, center, fillSize, anchor, rotation, outlineSize);
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
// Vertex Shaders
// ------------------------------------------------------------------------------------------------------------------------

    void VS_AfterMasks(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
        texcoord.xy = float2(0.0, 0.0);
        
        const int idMask = floor(id / 6.0);
        bool applyMask;
        float2 maskPos;
        
        if (idMask == 0) {
            applyMask = MaskEnabled1 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(idMask, 0), 0).r > 0.0);
            maskPos = (MaskFollowCursor1 ? MousePoint : CenterPoint) + Offset1;
            texcoord.xy = applyMask ? GetBoundingBoxVertexTL(id, Shape1, maskPos, MaskSize1, Anchor1, Rotation1, Feather1) : texcoord.xy;
        }
        else if (idMask == 1) {
            applyMask = MaskEnabled2 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(idMask, 0), 0).r > 0.0);
            maskPos = (MaskFollowCursor2 ? MousePoint : CenterPoint) + Offset2;
            texcoord.xy = applyMask ? GetBoundingBoxVertexTL(id, Shape2, maskPos, MaskSize2, Anchor2, Rotation2, Feather2) : texcoord.xy;
        }
        else if (idMask == 2) {
            applyMask = MaskEnabled3 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(idMask, 0), 0).r > 0.0);
            maskPos = (MaskFollowCursor3 ? MousePoint : CenterPoint) + Offset3;
            texcoord.xy = applyMask ? GetBoundingBoxVertexTL(id, Shape3, maskPos, MaskSize3, Anchor3, Rotation3, Feather3) : texcoord.xy;
        }
        else if (idMask == 3) {
            applyMask = MaskEnabled4 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(idMask, 0), 0).r > 0.0);
            maskPos = (MaskFollowCursor4 ? MousePoint : CenterPoint) + Offset4;
            texcoord.xy = applyMask ? GetBoundingBoxVertexTL(id, Shape4, maskPos, MaskSize4, Anchor4, Rotation4, Feather4) : texcoord.xy;
        }
        else if (idMask == 4) {
            applyMask = MaskEnabled5 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(idMask, 0), 0).r > 0.0);
            maskPos = (MaskFollowCursor5 ? MousePoint : CenterPoint) + Offset5;
            texcoord.xy = applyMask ? GetBoundingBoxVertexTL(id, Shape5, maskPos, MaskSize5, Anchor5, Rotation5, Feather5) : texcoord.xy;
        }
        else if (idMask == 5) {
            applyMask = MaskEnabled6 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(idMask, 0), 0).r > 0.0);
            maskPos = (MaskFollowCursor6 ? MousePoint : CenterPoint) + Offset6;
            texcoord.xy = applyMask ? GetBoundingBoxVertexTL(id, Shape6, maskPos, MaskSize6, Anchor6, Rotation6, Feather6) : texcoord.xy;
        }
        else if (idMask == 6) {
            applyMask = MaskEnabled7 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(idMask, 0), 0).r > 0.0);
            maskPos = (MaskFollowCursor7 ? MousePoint : CenterPoint) + Offset7;
            texcoord.xy = applyMask ? GetBoundingBoxVertexTL(id, Shape7, maskPos, MaskSize7, Anchor7, Rotation7, Feather7) : texcoord.xy;
        }
        else if (idMask == 7) {
            applyMask = MaskEnabled8 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(idMask, 0), 0).r > 0.0);
            maskPos = (MaskFollowCursor8 ? MousePoint : CenterPoint) + Offset8;
            texcoord.xy = applyMask ? GetBoundingBoxVertexTL(id, Shape8, maskPos, MaskSize8, Anchor8, Rotation8, Feather8) : texcoord.xy;
        }
        
        position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

    void VS_ShowDetectors(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
        texcoord.xy = float2(0.0, 0.0);
        
        if (ShowDetectors) {
            float2 detectorPos;
            const int idDetector = floor(id / 6.0);

            if (idDetector == 0 && Detector1) {
                detectorPos = (DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1;
                texcoord.xy = GetBoundingBoxVertexTL(id, 0, detectorPos, DetectorSize1, 4, DetectorRotation1, 1.0);
            }
            if (idDetector == 1 && Detector2) {
                detectorPos = (DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2;
                texcoord.xy = GetBoundingBoxVertexTL(id, 0, detectorPos, DetectorSize2, 4, DetectorRotation2, 1.0);
            }
            if (idDetector == 2 && Detector3) {
                detectorPos = (DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3;
                texcoord.xy = GetBoundingBoxVertexTL(id, 0, detectorPos, DetectorSize3, 4, DetectorRotation3, 1.0);
            }
            if (idDetector == 3 && Detector4) {
                detectorPos = (DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4;
                texcoord.xy = GetBoundingBoxVertexTL(id, 0, detectorPos, DetectorSize4, 4, DetectorRotation4, 1.0);
            }
            if (idDetector == 4 && Detector5) {
                detectorPos = (DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5;
                texcoord.xy = GetBoundingBoxVertexTL(id, 0, detectorPos, DetectorSize5, 4, DetectorRotation5, 1.0);
            }
            if (idDetector == 5 && Detector6) {
                detectorPos = (DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6;
                texcoord.xy = GetBoundingBoxVertexTL(id, 0, detectorPos, DetectorSize6, 4, DetectorRotation6, 1.0);
            }
            if (idDetector == 6 && Detector7) {
                detectorPos = (DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7;
                texcoord.xy = GetBoundingBoxVertexTL(id, 0, detectorPos, DetectorSize7, 4, DetectorRotation7, 1.0);
            }
            if (idDetector == 7 && Detector8) {
                detectorPos = (DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8;
                texcoord.xy = GetBoundingBoxVertexTL(id, 0, detectorPos, DetectorSize8, 4, DetectorRotation8, 1.0);
            }
        }
        
        position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float4 PS_Before(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return tex2Dfetch(ReShade::BackBuffer, floor(pos.xy), 0);
    }

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

    float PS_UIDetectBeforeMasks(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        int pixelNumber = floor(pos.x);

        bool detectorAssigned1 = Detector1 && DetectorMask1 == pixelNumber;
        bool detectorAssigned2 = Detector2 && DetectorMask2 == pixelNumber;
        bool detectorAssigned3 = Detector3 && DetectorMask3 == pixelNumber;
        bool detectorAssigned4 = Detector4 && DetectorMask4 == pixelNumber;
        bool detectorAssigned5 = Detector5 && DetectorMask5 == pixelNumber;
        bool detectorAssigned6 = Detector6 && DetectorMask6 == pixelNumber;
        bool detectorAssigned7 = Detector7 && DetectorMask7 == pixelNumber;
        bool detectorAssigned8 = Detector8 && DetectorMask8 == pixelNumber;
        bool detectorAssigned = (detectorAssigned1 || detectorAssigned2 || detectorAssigned3 || detectorAssigned4 || detectorAssigned5 || detectorAssigned6 || detectorAssigned7 || detectorAssigned8);
        
        if (!detectorAssigned) return 1.0;

        bool detectorMatched1 = detectorAssigned1 && tex2Dfetch(UIMaskGUIStateSampler, int2(0, 0), 0).r > 0.0;
        bool detectorMatched2 = detectorAssigned2 && tex2Dfetch(UIMaskGUIStateSampler, int2(1, 0), 0).r > 0.0;
        bool detectorMatched3 = detectorAssigned3 && tex2Dfetch(UIMaskGUIStateSampler, int2(2, 0), 0).r > 0.0;
        bool detectorMatched4 = detectorAssigned4 && tex2Dfetch(UIMaskGUIStateSampler, int2(3, 0), 0).r > 0.0;
        bool detectorMatched5 = detectorAssigned5 && tex2Dfetch(UIMaskGUIStateSampler, int2(4, 0), 0).r > 0.0;
        bool detectorMatched6 = detectorAssigned6 && tex2Dfetch(UIMaskGUIStateSampler, int2(5, 0), 0).r > 0.0;
        bool detectorMatched7 = detectorAssigned7 && tex2Dfetch(UIMaskGUIStateSampler, int2(6, 0), 0).r > 0.0;
        bool detectorMatched8 = detectorAssigned8 && tex2Dfetch(UIMaskGUIStateSampler, int2(7, 0), 0).r > 0.0;

        bool detectorMatched;
        if (DetectorBehavior == 1) { // OR
            detectorMatched = detectorMatched1 || detectorMatched2 || detectorMatched3 || detectorMatched4 || detectorMatched5 || detectorMatched6 || detectorMatched7 || detectorMatched8;
        }
        else { // AND
            detectorMatched = (detectorMatched1 || !detectorAssigned1)
                                && (detectorMatched2 || !detectorAssigned2)
                                && (detectorMatched3 || !detectorAssigned3)
                                && (detectorMatched4 || !detectorAssigned4)
                                && (detectorMatched5 || !detectorAssigned5)
                                && (detectorMatched6 || !detectorAssigned6)
                                && (detectorMatched7 || !detectorAssigned7)
                                && (detectorMatched8 || !detectorAssigned8);
        }

        return detectorMatched ? 1.0 : 0.0;
    }

    float4 PS_AfterMasks(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        float4 color = float4(0.0, 0.0, 0.0, 0.0);
        
        float2 maskPos;
        float4 maskColor;
        
        bool applyMask = MaskEnabled1 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(0, 0), 0).r > 0.0);
        if (applyMask) {
            maskColor = MaskColors[0] / 255.0;
            maskPos = (MaskFollowCursor1 ? MousePoint : CenterPoint) + Offset1;
            color = DrawShape(Shape1, color, pos, maskPos, MaskSize1, maskColor, Rotation1, Feather1, maskColor, Anchor1, true);
        }

        applyMask = MaskEnabled2 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(1, 0), 0).r > 0.0);
        if (applyMask) {
            maskColor = MaskColors[1] / 255.0;
            maskPos = (MaskFollowCursor2 ? MousePoint : CenterPoint) + Offset2;
            color = DrawShape(Shape2, color, pos, maskPos, MaskSize2, maskColor, Rotation2, Feather2, maskColor, Anchor2, true);
        }

        applyMask = MaskEnabled3 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(2, 0), 0).r > 0.0);
        if (applyMask) {
            maskColor = MaskColors[2] / 255.0;
            maskPos = (MaskFollowCursor3 ? MousePoint : CenterPoint) + Offset3;
            color = DrawShape(Shape3, color, pos, maskPos, MaskSize3, maskColor, Rotation3, Feather3, maskColor, Anchor3, true);
        }

        applyMask = MaskEnabled4 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(3, 0), 0).r > 0.0);
        if (applyMask) {
            maskColor = MaskColors[3] / 255.0;
            maskPos = (MaskFollowCursor4 ? MousePoint : CenterPoint) + Offset4;
            color = DrawShape(Shape4, color, pos, maskPos, MaskSize4, maskColor, Rotation4, Feather4, maskColor, Anchor4, true);
        }

        applyMask = MaskEnabled5 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(4, 0), 0).r > 0.0);
        if (applyMask) {
            maskColor = MaskColors[4] / 255.0;
            maskPos = (MaskFollowCursor5 ? MousePoint : CenterPoint) + Offset5;
            color = DrawShape(Shape5, color, pos, maskPos, MaskSize5, maskColor, Rotation5, Feather5, maskColor, Anchor5, true);
        }

        applyMask = MaskEnabled6 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(5, 0), 0).r > 0.0);
        if (applyMask) {
            maskColor = MaskColors[5] / 255.0;
            maskPos = (MaskFollowCursor6 ? MousePoint : CenterPoint) + Offset6;
            color = DrawShape(Shape6, color, pos, maskPos, MaskSize6, maskColor, Rotation6, Feather6, maskColor, Anchor6, true);
        }

        applyMask = MaskEnabled7 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(6, 0), 0).r > 0.0);
        if (applyMask) {
            maskColor = MaskColors[6] / 255.0;
            maskPos = (MaskFollowCursor7 ? MousePoint : CenterPoint) + Offset7;
            color = DrawShape(Shape7, color, pos, maskPos, MaskSize7, maskColor, Rotation7, Feather7, maskColor, Anchor7, true);
        }

        applyMask = MaskEnabled8 && (tex2Dfetch(UIMaskGUIMaskSampler, int2(7, 0), 0).r > 0.0);
        if (applyMask) {
            maskColor = MaskColors[7] / 255.0;
            maskPos = (MaskFollowCursor8 ? MousePoint : CenterPoint) + Offset8;
            color = DrawShape(Shape8, color, pos, maskPos, MaskSize8, maskColor, Rotation8, Feather8, maskColor, Anchor8, true);
        }

        if (color.a > 0.0) {
            color.rgb = lerp(tex2Dfetch(UIMaskGUIBeforeSampler, floor(pos.xy), 0).rgb, color.rgb, ShowMasks ? 0.5 : 0.0);
            return color;
        }

        discard;
    }

    float4 PS_ShowDetectors(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        // return float4(0,0,0,1);
        float4 color = float4(0.0, 0.0, 0.0, 0.0);
        
        bool detectorMatched = tex2Dfetch(UIMaskGUIStateSampler, int2(0, 0), 0).r > 0.0;
        float2 detectorPos = (DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1;
        float4 detectorColorOutline = detectorMatched ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
        if (Detector1) color = DrawShape(0, color, pos, detectorPos, DetectorSize1, float4(DetectorColor1, 1.0), DetectorRotation1, 1.0, detectorColorOutline, 4, false);

        detectorMatched = tex2Dfetch(UIMaskGUIStateSampler, int2(1, 0), 0).r > 0.0;
        detectorPos = (DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2;
        detectorColorOutline = detectorMatched ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
        if (Detector2) color = DrawShape(0, color, pos, detectorPos, DetectorSize2, float4(DetectorColor2, 1.0), DetectorRotation2, 1.0, detectorColorOutline, 4, false);

        detectorMatched = tex2Dfetch(UIMaskGUIStateSampler, int2(2, 0), 0).r > 0.0;
        detectorPos = (DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3;
        detectorColorOutline = detectorMatched ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
        if (Detector3) color = DrawShape(0, color, pos, detectorPos, DetectorSize3, float4(DetectorColor3, 1.0), DetectorRotation3, 1.0, detectorColorOutline, 4, false);

        detectorMatched = tex2Dfetch(UIMaskGUIStateSampler, int2(3, 0), 0).r > 0.0;
        detectorPos = (DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4;
        detectorColorOutline = detectorMatched ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
        if (Detector4) color = DrawShape(0, color, pos, detectorPos, DetectorSize4, float4(DetectorColor4, 1.0), DetectorRotation4, 1.0, detectorColorOutline, 4, false);

        detectorMatched = tex2Dfetch(UIMaskGUIStateSampler, int2(4, 0), 0).r > 0.0;
        detectorPos = (DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5;
        detectorColorOutline = detectorMatched ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
        if (Detector5) color = DrawShape(0, color, pos, detectorPos, DetectorSize5, float4(DetectorColor5, 1.0), DetectorRotation5, 1.0, detectorColorOutline, 4, false);

        detectorMatched = tex2Dfetch(UIMaskGUIStateSampler, int2(5, 0), 0).r > 0.0;
        detectorPos = (DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6;
        detectorColorOutline = detectorMatched ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
        if (Detector6) color = DrawShape(0, color, pos, detectorPos, DetectorSize6, float4(DetectorColor6, 1.0), DetectorRotation6, 1.0, detectorColorOutline, 4, false);

        detectorMatched = tex2Dfetch(UIMaskGUIStateSampler, int2(6, 0), 0).r > 0.0;
        detectorPos = (DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7;
        detectorColorOutline = detectorMatched ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
        if (Detector7) color = DrawShape(0, color, pos, detectorPos, DetectorSize7, float4(DetectorColor7, 1.0), DetectorRotation7, 1.0, detectorColorOutline, 4, false);

        detectorMatched = tex2Dfetch(UIMaskGUIStateSampler, int2(7, 0), 0).r > 0.0;
        detectorPos = (DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8;
        detectorColorOutline = detectorMatched ? float4(0.0, 1.0, 0.0, 1.0) : float4(1.0, 0.0, 0.0, 1.0);
        if (Detector8) color = DrawShape(0, color, pos, detectorPos, DetectorSize8, float4(DetectorColor8, 1.0), DetectorRotation8, 1.0, detectorColorOutline, 4, false);

        if (color.a > 0.0) return color;
        
        discard;
    }

    float4 PS_AfterFinal(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return tex2Dfetch(UIMaskGUIAfterSampler, floor(pos.xy), 0);
    }

// ------------------------------------------------------------------------------------------------------------------------
// Techniques
// ------------------------------------------------------------------------------------------------------------------------

    technique UIMaskGUIBefore <
        ui_label = "UIMaskGUI Before";
        ui_tooltip = "Order this before the effects you want to mask.";
    > {
        pass UIDetect {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetect;
            RenderTarget = UIMaskGUIStateTexture;
        }
        pass UIDetectApply {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetectBeforeMasks;
            RenderTarget = UIMaskGUIMaskTexture;
        }
        pass Before {
            VertexShader = PostProcessVS;
            PixelShader = PS_Before;
            RenderTarget = UIMaskGUIBeforeTexture;
        }
    }

    technique UIMaskGUIAfter <
        ui_label = "UIMaskGUI After";
        ui_tooltip = "Order this after the effects you want to mask.";
    > {
        pass AfterMasks {
            VertexCount = 48;
            VertexShader = VS_AfterMasks;
            PixelShader = PS_AfterMasks;
            RenderTarget = UIMaskGUIAfterTexture;
            ClearRenderTargets = true;
        }
        pass ShowDetectors {
            VertexCount = 48;
            VertexShader = VS_ShowDetectors;
            PixelShader = PS_ShowDetectors;
            RenderTarget = UIMaskGUIAfterTexture;
            BlendEnable = true;
            SrcBlend = SRCALPHA;
            DestBlend = INVSRCALPHA;
        }
        pass Final {
            VertexShader = PostProcessVS;
            PixelShader = PS_AfterFinal;
            BlendEnable = true;
            SrcBlend = SRCALPHA;
            DestBlend = INVSRCALPHA;
        }
    }