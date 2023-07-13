#include "ReShadeUI.fxh"
// ------------------------------------------------------------------------------------------------------------------------
// Crosshair Offset
// ------------------------------------------------------------------------------------------------------------------------

    uniform int ConfigNotice <
        ui_type = "radio";
        ui_label = " ";
        ui_text = "To make changes to the crosshair shape,\n"
                    "enable the effect \"CustomCrosshairSetup\"";
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
// Hotkeys
// ------------------------------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------------------------------
// Hotkey 1
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Hotkey1 <
        ui_label = "Hotkey 1";
        ui_category = "Hotkey 1";
        ui_category_closed = true;
    > = false;

    uniform int HotkeyBehavior1 <
        ui_type = "combo";
        ui_label = "Behavior";
        ui_items = "Hold Hide\0Hold Show\0Toggle\0Hide\0Show\0";
        ui_tooltip = "Hold Hide: Hide the crosshair when held.\n"
                        "Hold Show: Show the crosshair when held and not toggled.\n"
                        "Toggle: Show the crosshair if toggled. Hide if not toggled.\n"
                        "Hide: Toggle to hide the crosshair if not toggled.\n"
                        "Show: Toggle to show the crosshair if toggled.";
        ui_category = "Hotkey 1";
        ui_category_closed = true;
    > = 0;

    uniform int HotkeyButton1 <
        ui_type = "combo";
        ui_label = "Button";
        ui_items = "Right-Click\0 1\0 2\0 3\0 4\0 5\0WASD\0Shift\0Ctrl\0Alt\0Spacebar\0";
        ui_category = "Hotkey 1";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Hotkey 2
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Hotkey2 <
        ui_label = "Hotkey 2";
        ui_category = "Hotkey 2";
        ui_category_closed = true;
    > = false;

    uniform int HotkeyBehavior2 <
        ui_type = "combo";
        ui_label = "Behavior";
        ui_items = "Hold Hide\0Hold Show\0Toggle\0Hide\0Show\0";
        ui_tooltip = "Hold Hide: Hide the crosshair when held.\n"
                        "Hold Show: Show the crosshair when held and not toggled.\n"
                        "Toggle: Show the crosshair if toggled. Hide if not toggled.\n"
                        "Hide: Toggle to hide the crosshair if not toggled.\n"
                        "Show: Toggle to show the crosshair if toggled.";
        ui_category = "Hotkey 2";
        ui_category_closed = true;
    > = 0;

    uniform int HotkeyButton2 <
        ui_type = "combo";
        ui_label = "Button";
        ui_items = "Right-Click\0 1\0 2\0 3\0 4\0 5\0WASD\0Shift\0Ctrl\0Alt\0Spacebar\0";
        ui_category = "Hotkey 2";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Hotkey 3
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Hotkey3 <
        ui_label = "Hotkey 3";
        ui_category = "Hotkey 3";
        ui_category_closed = true;
    > = false;

    uniform int HotkeyBehavior3 <
        ui_type = "combo";
        ui_label = "Behavior";
        ui_items = "Hold Hide\0Hold Show\0Toggle\0Hide\0Show\0";
        ui_tooltip = "Hold Hide: Hide the crosshair when held.\n"
                        "Hold Show: Show the crosshair when held and not toggled.\n"
                        "Toggle: Show the crosshair if toggled. Hide if not toggled.\n"
                        "Hide: Toggle to hide the crosshair if not toggled.\n"
                        "Show: Toggle to show the crosshair if toggled.";
        ui_category = "Hotkey 3";
        ui_category_closed = true;
    > = 0;

    uniform int HotkeyButton3 <
        ui_type = "combo";
        ui_label = "Button";
        ui_items = "Right-Click\0 1\0 2\0 3\0 4\0 5\0WASD\0Shift\0Ctrl\0Alt\0Spacebar\0";
        ui_category = "Hotkey 3";
        ui_category_closed = true;
    > = 0;

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
        ui_category = "UI Detector 2";
        ui_category_closed = true;
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
        ui_category = "UI Detector 3";
        ui_category_closed = true;
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
        ui_category = "UI Detector 4";
        ui_category_closed = true;
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
        ui_category = "UI Detector 5";
        ui_category_closed = true;
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
        ui_category = "UI Detector 6";
        ui_category_closed = true;
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
        ui_category = "UI Detector 7";
        ui_category_closed = true;
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
        ui_category = "UI Detector 8";
        ui_category_closed = true;
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
// Hidden or Static Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    static const float2 PixelOffset = float2(0.5f, 0.5f);
    static const float2 anchorOffsets[9] = {float2(0.5f, 0.5f), float2(0, 0.5f), float2(-0.5f, 0.5f), float2(0.5f, 0), float2(0, 0), float2(-0.5f, 0), float2(0.5f, -0.5f), float2(0, -0.5f), float2(-0.5f, -0.5f)};
    
    uniform float2 MousePoint < source = "mousepoint"; >;
    
    uniform bool MouseRight_Down < source = "mousebutton"; keycode = 1; mode = ""; >;
    uniform bool MouseRight_Press < source = "mousebutton"; keycode = 1; mode = "press"; >;

    uniform bool Spacebar_Down <source = "key"; keycode = 0x20; mode = ""; >;
    uniform bool Spacebar_Press <source = "key"; keycode = 0x20; mode = "press"; >;
    uniform bool Shift_Down <source = "key"; keycode = 0x10; mode = ""; >;
    uniform bool Shift_Press <source = "key"; keycode = 0x10; mode = "press"; >;
    uniform bool Ctrl_Down <source = "key"; keycode = 0x11; mode = ""; >;
    uniform bool Ctrl_Press <source = "key"; keycode = 0x11; mode = "press"; >;
    uniform bool Alt_Down <source = "key"; keycode = 0x12; mode = ""; >;
    uniform bool Alt_Press <source = "key"; keycode = 0x12; mode = "press"; >;
    
    uniform bool One_Down <source = "key"; keycode = 0x31; mode = ""; >;
    uniform bool One_Press <source = "key"; keycode = 0x31; mode = "press"; >;
    uniform bool Two_Down <source = "key"; keycode = 0x32; mode = ""; >;
    uniform bool Two_Press <source = "key"; keycode = 0x32; mode = "press"; >;
    uniform bool Three_Down <source = "key"; keycode = 0x33; mode = ""; >;
    uniform bool Three_Press <source = "key"; keycode = 0x33; mode = "press"; >;
    uniform bool Four_Down <source = "key"; keycode = 0x34; mode = ""; >;
    uniform bool Four_Press <source = "key"; keycode = 0x34; mode = "press"; >;
    uniform bool Five_Down <source = "key"; keycode = 0x35; mode = ""; >;
    uniform bool Five_Press <source = "key"; keycode = 0x35; mode = "press"; >;
    
    uniform bool WWW_Down <source = "key"; keycode = 0x57; mode = ""; >;
    uniform bool WWW_Press <source = "key"; keycode = 0x57; mode = "press"; >;
    uniform bool AAA_Down <source = "key"; keycode = 0x41; mode = ""; >;
    uniform bool AAA_Press <source = "key"; keycode = 0x41; mode = "press"; >;
    uniform bool SSS_Down <source = "key"; keycode = 0x53; mode = ""; >;
    uniform bool SSS_Press <source = "key"; keycode = 0x53; mode = "press"; >;
    uniform bool DDD_Down <source = "key"; keycode = 0x44; mode = ""; >;
    uniform bool DDD_Press <source = "key"; keycode = 0x44; mode = "press"; >;

    /*
    To Do:
    - option to use png image layer instead of shape - see https://github.com/CeeJayDK/SweetFX/blob/master/Shaders/Layer.fx
    - hotkey animated transformations - likely too expensive unless pre-rendered - could use overlay LoD for frames?
    */

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture CustomCrosshairStateTex <pooled = false; > { Width = 11; Height = 1; Format = R8; };
    sampler CustomCrosshairStateSamp { Texture = CustomCrosshairStateTex; };

    texture CustomCrosshairPrevStateTex <pooled = false; > { Width = 11; Height = 1; Format = R8; };
    sampler CustomCrosshairPrevStateSamp { Texture = CustomCrosshairPrevStateTex; };

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

    float PS_PrevStateHandler(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return tex2Dfetch(CustomCrosshairStateSamp, floor(pos.xy), 0).r;
    }

    float PS_StateHandler(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        const int pixelNumber = floor(texCoord.x * 11);
        
        // detector state
        if (pixelNumber == 0 && Detector1) return DetectorMatchAll((DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1 - PixelOffset, DetectorSize1, DetectorColor1, DetectorThreshold1, DetectorInverted1);
        if (pixelNumber == 1 && Detector2) return DetectorMatchAll((DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2 - PixelOffset, DetectorSize2, DetectorColor2, DetectorThreshold2, DetectorInverted2);
        if (pixelNumber == 2 && Detector3) return DetectorMatchAll((DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3 - PixelOffset, DetectorSize3, DetectorColor3, DetectorThreshold3, DetectorInverted3);
        if (pixelNumber == 3 && Detector4) return DetectorMatchAll((DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4 - PixelOffset, DetectorSize4, DetectorColor4, DetectorThreshold4, DetectorInverted4);
        if (pixelNumber == 4 && Detector5) return DetectorMatchAll((DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5 - PixelOffset, DetectorSize5, DetectorColor5, DetectorThreshold5, DetectorInverted5);
        if (pixelNumber == 5 && Detector6) return DetectorMatchAll((DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6 - PixelOffset, DetectorSize6, DetectorColor6, DetectorThreshold6, DetectorInverted6);
        if (pixelNumber == 6 && Detector7) return DetectorMatchAll((DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7 - PixelOffset, DetectorSize7, DetectorColor7, DetectorThreshold7, DetectorInverted7);
        if (pixelNumber == 7 && Detector8) return DetectorMatchAll((DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8 - PixelOffset, DetectorSize8, DetectorColor8, DetectorThreshold8, DetectorInverted8);
        
        // hotkey state
        // "Right-Click, 1, 2, 3, 4, 5, WASD, Shift, Ctrl, Alt, Spacebar";
        if (Hotkey1 || Hotkey2 || Hotkey3) {
            const bool hotkeyDown[] = { MouseRight_Down, One_Down, Two_Down, Three_Down, Four_Down, Five_Down, WWW_Down || AAA_Down || SSS_Down || DDD_Down, Shift_Down, Ctrl_Down, Alt_Down, Spacebar_Down };
            const bool hotkeyPress[] = { MouseRight_Press, One_Press, Two_Press, Three_Press, Four_Press, Five_Press, WWW_Press || AAA_Press || SSS_Press || DDD_Press, Shift_Press, Ctrl_Press, Alt_Press, Spacebar_Press };
            const bool hotkeyTriggered1 = Hotkey1 && (tex2Dfetch(CustomCrosshairPrevStateSamp, int2(8, 0), 0).r > 0.0f);
            const bool hotkeyTriggered2 = Hotkey2 && (tex2Dfetch(CustomCrosshairPrevStateSamp, int2(9, 0), 0).r > 0.0f);
            const bool hotkeyTriggered3 = Hotkey3 && (tex2Dfetch(CustomCrosshairPrevStateSamp, int2(10, 0), 0).r > 0.0f);

            bool toggled = (HotkeyBehavior1 > 1) && hotkeyTriggered1 || (HotkeyBehavior2 > 1) && hotkeyTriggered2 || (HotkeyBehavior3 > 1) && hotkeyTriggered3;

            if (pixelNumber == 8 && Hotkey1) {
                if (Hotkey2 && HotkeyBehavior2 == 2 && hotkeyPress[HotkeyButton2] && toggled) toggled = false;
                if (Hotkey2 && HotkeyBehavior2 == 4 && hotkeyPress[HotkeyButton2]) toggled = false;
                if (Hotkey3 && HotkeyBehavior3 == 2 && hotkeyPress[HotkeyButton3] && toggled) toggled = false;
                if (Hotkey3 && HotkeyBehavior3 == 4 && hotkeyPress[HotkeyButton3]) toggled = false;

                if (HotkeyBehavior1 == 0 && hotkeyDown[HotkeyButton1]) return 1.0f;
                if (HotkeyBehavior1 == 0 && !hotkeyDown[HotkeyButton1] && !toggled) return 0.0f;
                if (HotkeyBehavior1 == 1 && !hotkeyDown[HotkeyButton1]) return 1.0f;
                if (HotkeyBehavior1 == 1 && hotkeyDown[HotkeyButton1] && !toggled) return 0.0f;
                if (HotkeyBehavior1 == 2 && hotkeyPress[HotkeyButton1] && !toggled) return 1.0f;
                if (HotkeyBehavior1 == 2 && hotkeyPress[HotkeyButton1] && toggled) return 0.0f;
                if (HotkeyBehavior1 == 3 && hotkeyPress[HotkeyButton1]) return 1.0f;
                if (HotkeyBehavior1 == 4 && hotkeyPress[HotkeyButton1]) return 0.0f;
                if (HotkeyBehavior1 > 1) return (toggled ? 1.0f : 0.0f);
                return (hotkeyTriggered1 ? 1.0f : 0.0f);
            }
            if (pixelNumber == 9 && Hotkey2) {
                if (Hotkey1 && HotkeyBehavior1 == 2 && hotkeyPress[HotkeyButton1] && toggled) toggled = false;
                if (Hotkey1 && HotkeyBehavior1 == 4 && hotkeyPress[HotkeyButton1]) toggled = false;
                if (Hotkey3 && HotkeyBehavior3 == 2 && hotkeyPress[HotkeyButton3] && toggled) toggled = false;
                if (Hotkey3 && HotkeyBehavior3 == 4 && hotkeyPress[HotkeyButton3]) toggled = false;

                if (HotkeyBehavior2 == 0 && hotkeyDown[HotkeyButton2]) return 1.0f;
                if (HotkeyBehavior2 == 0 && !hotkeyDown[HotkeyButton2] && !toggled) return 0.0f;
                if (HotkeyBehavior2 == 1 && !hotkeyDown[HotkeyButton2]) return 1.0f;
                if (HotkeyBehavior2 == 1 && hotkeyDown[HotkeyButton2] && !toggled) return 0.0f;
                if (HotkeyBehavior2 == 2 && hotkeyPress[HotkeyButton2] && !toggled) return 1.0f;
                if (HotkeyBehavior2 == 2 && hotkeyPress[HotkeyButton2] && toggled) return 0.0f;
                if (HotkeyBehavior2 == 3 && hotkeyPress[HotkeyButton2]) return 1.0f;
                if (HotkeyBehavior2 == 4 && hotkeyPress[HotkeyButton2]) return 0.0f;
                if (HotkeyBehavior2 > 1) return (toggled ? 1.0f : 0.0f);
                return (hotkeyTriggered2 ? 1.0f : 0.0f);
            }
            if (pixelNumber == 10 && Hotkey3) {
                if (Hotkey2 && HotkeyBehavior2 == 2 && hotkeyPress[HotkeyButton2] && toggled) toggled = false;
                if (Hotkey2 && HotkeyBehavior2 == 4 && hotkeyPress[HotkeyButton2]) toggled = false;
                if (Hotkey1 && HotkeyBehavior1 == 2 && hotkeyPress[HotkeyButton1] && toggled) toggled = false;
                if (Hotkey1 && HotkeyBehavior1 == 4 && hotkeyPress[HotkeyButton1]) toggled = false;

                if (HotkeyBehavior3 == 0 && hotkeyDown[HotkeyButton3]) return 1.0f;
                if (HotkeyBehavior3 == 0 && !hotkeyDown[HotkeyButton3] && !toggled) return 0.0f;
                if (HotkeyBehavior3 == 1 && !hotkeyDown[HotkeyButton3]) return 1.0f;
                if (HotkeyBehavior3 == 1 && hotkeyDown[HotkeyButton3] && !toggled) return 0.0f;
                if (HotkeyBehavior3 == 2 && hotkeyPress[HotkeyButton3] && !toggled) return 1.0f;
                if (HotkeyBehavior3 == 2 && hotkeyPress[HotkeyButton3] && toggled) return 0.0f;
                if (HotkeyBehavior3 == 3 && hotkeyPress[HotkeyButton3]) return 1.0f;
                if (HotkeyBehavior3 == 4 && hotkeyPress[HotkeyButton3]) return 0.0f;
                if (HotkeyBehavior3 > 1) return (toggled ? 1.0f : 0.0f);
                return (hotkeyTriggered3 ? 1.0f : 0.0f);
            }
        }
        
        return 0.0f;
    }

    float4 PS_Final(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        float4 color = tex2Dlod(ReShade::BackBuffer, float4(texCoord, 0, 0));
        const float2 overlayOffset = Offset + (FollowCursor ? MousePoint - CenterPoint : 0);
        const float4 overlay = tex2Dlod(CustomCrosshairOverlaySampler, float4(texCoord + -overlayOffset * BUFFER_PIXEL_SIZE, 0, 0));

        if (Hotkey1 || Hotkey2 || Hotkey3) {
            bool hotkeyTriggered1;
            bool hotkeyTriggered2;
            bool hotkeyTriggered3;

            if (Hotkey1) hotkeyTriggered1 = tex2Dfetch(CustomCrosshairStateSamp, int2(8, 0), 0).r > 0.0f;
            if (Hotkey2) hotkeyTriggered2 = tex2Dfetch(CustomCrosshairStateSamp, int2(9, 0), 0).r > 0.0f;
            if (Hotkey3) hotkeyTriggered3 = tex2Dfetch(CustomCrosshairStateSamp, int2(10, 0), 0).r > 0.0f;

            if (hotkeyTriggered1 || hotkeyTriggered2 || hotkeyTriggered3) discard;
        }

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

            if (Detector1) detectorMatches1 = tex2Dfetch(CustomCrosshairStateSamp, int2(0, 0), 0).r > 0.0f;
            if (Detector2) detectorMatches2 = tex2Dfetch(CustomCrosshairStateSamp, int2(1, 0), 0).r > 0.0f;
            if (Detector3) detectorMatches3 = tex2Dfetch(CustomCrosshairStateSamp, int2(2, 0), 0).r > 0.0f;
            if (Detector4) detectorMatches4 = tex2Dfetch(CustomCrosshairStateSamp, int2(3, 0), 0).r > 0.0f;
            if (Detector5) detectorMatches5 = tex2Dfetch(CustomCrosshairStateSamp, int2(4, 0), 0).r > 0.0f;
            if (Detector6) detectorMatches6 = tex2Dfetch(CustomCrosshairStateSamp, int2(5, 0), 0).r > 0.0f;
            if (Detector7) detectorMatches7 = tex2Dfetch(CustomCrosshairStateSamp, int2(6, 0), 0).r > 0.0f;
            if (Detector8) detectorMatches8 = tex2Dfetch(CustomCrosshairStateSamp, int2(7, 0), 0).r > 0.0f;

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

            if (!showOverlay && !ShowDetectors) discard;

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
        ui_label = "CustomCrosshair";
        ui_tooltip = "Enable \"CustomCrosshairSetup\" to apply config changes.";
    > {
        pass prevState {
            VertexShader = PostProcessVS;
            PixelShader = PS_PrevStateHandler;
            RenderTarget = CustomCrosshairPrevStateTex;
        }
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_StateHandler;
            RenderTarget = CustomCrosshairStateTex;
        }
        pass final {
            VertexShader = PostProcessVS;
            PixelShader = PS_Final;
        }
    }

    technique CustomCrosshairStateDebug <
        ui_label = "CustomCrosshairStateDebug";
        hidden = true;
    > {
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_StateHandler;
        }
    }
