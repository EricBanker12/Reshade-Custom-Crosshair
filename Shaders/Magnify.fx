#include "ReShade.fxh"

// ------------------------------------------------------------------------------------------------------------------------
// Magnification Settings
// ------------------------------------------------------------------------------------------------------------------------

    uniform float2 Size <
        ui_label = "Size";
        ui_type = "drag";
        ui_min = 0.0;
        ui_max = BUFFER_WIDTH;
        ui_step = 1.0;
    > = float2(100, 100);

    uniform float Magnification <
        ui_label = "Magnification";
        ui_type = "drag";
        ui_min = 0.1;
        ui_max = 10.0;
        ui_step = 0.1;
    > = 2.0;

    uniform int Shape <
        ui_label = "Shape";
        ui_type = "combo";
        ui_items = "Ellipse\0Rectangle\0";
    > = 0;

    uniform float2 Offset <
        ui_label = "Offset";
        ui_type = "drag";
        ui_min = 0.0;
        ui_max = BUFFER_WIDTH;
        ui_step = 1.0;
    > = float2(0.0, 0.0);

    uniform bool IsFollowCursor <
        ui_label = "Follow Cursor";
        ui_tooltip = "Center magnification around cursor position, not the center of the screen.";
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// Hotkey Settings
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Hotkey <
        ui_label = "Hotkey";
        ui_category = "Hotkey";
        ui_category_closed = true;
    > = false;

    uniform int HotkeyBehavior <
        ui_type = "combo";
        ui_label = "Behavior";
        ui_items = "Hold\0Toggle\0";
        ui_category = "Hotkey";
        ui_category_closed = true;
    > = 0;

    uniform int HotkeyButton <
        ui_type = "combo";
        ui_label = "Button";
        ui_items = "Left Mouse Button\0Right Mouse Button\0Middle Mouse Button\0X1 Mouse Button (Back Mouse Button)\0X2 Mouse Button (Forward Mouse Button)\0Custom Hotkey\0";
        ui_tooltip = "Select the mouse button or keyboard key code to trigger hotkey behavior. Default custom key code is 0x5A corresponding to the Z key.";
        ui_category = "Hotkey";
        ui_category_closed = true;
    > = 1;

// ------------------------------------------------------------------------------------------------------------------------
// Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = BUFFER_SCREEN_SIZE / 2.0;
    
    uniform float2 MousePoint < source = "mousepoint"; >;
    
    uniform bool MouseLeft_Down < source = "mousebutton"; keycode = 0; mode = ""; >;
    uniform bool MouseLeft_Press < source = "mousebutton"; keycode = 0; mode = "press"; >;
    uniform bool MouseRight_Down < source = "mousebutton"; keycode = 1; mode = ""; >;
    uniform bool MouseRight_Press < source = "mousebutton"; keycode = 1; mode = "press"; >;
    uniform bool MouseMiddle_Down < source = "mousebutton"; keycode = 2; mode = ""; >;
    uniform bool MouseMiddle_Press < source = "mousebutton"; keycode = 2; mode = "press"; >;
    uniform bool MouseBack_Down < source = "mousebutton"; keycode = 3; mode = ""; >;
    uniform bool MouseBack_Press < source = "mousebutton"; keycode = 3; mode = "press"; >;
    uniform bool MouseForward_Down < source = "mousebutton"; keycode = 4; mode = ""; >;
    uniform bool MouseForward_Press < source = "mousebutton"; keycode = 4; mode = "press"; >;

    #ifndef CUSTOM_HOTKEY_KEYCODE_1
        #define CUSTOM_HOTKEY_KEYCODE_1 0x5A
    #endif

    uniform bool CustomKey1_Down <source = "key"; keycode = CUSTOM_HOTKEY_KEYCODE_1; mode = ""; >;
    uniform bool CustomKey1_Press <source = "key"; keycode = CUSTOM_HOTKEY_KEYCODE_1; mode = "press"; >;

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------
    texture2D MagnifyStatusTex { Width= 1; Height = 1; Format = R8; };
    sampler2D MagnifyStatus { Texture = MagnifyStatusTex; MagFilter = POINT; MinFilter = POINT; MipFilter = POINT; };

    texture2D MagnifyStatusCopyTex { Width= 1; Height = 1; Format = R8; };
    sampler2D MagnifyStatusCopy { Texture = MagnifyStatusCopyTex; MagFilter = POINT; MinFilter = POINT; MipFilter = POINT; };

// ------------------------------------------------------------------------------------------------------------------------
// Helper Functions
// ------------------------------------------------------------------------------------------------------------------------
bool GetStatus(in sampler2D s) {
    if (Hotkey) {
        const bool hotkeyDown[6] = { MouseLeft_Down, MouseRight_Down, MouseMiddle_Down, MouseBack_Down, MouseForward_Down, CustomKey1_Down };
        const bool hotkeyPress[6] = { MouseLeft_Down, MouseRight_Down, MouseMiddle_Down, MouseBack_Down, MouseForward_Down, CustomKey1_Down };
            
        // hold hotkey or skip magnify
        if (HotkeyBehavior == 0 && hotkeyDown[HotkeyButton]) return true;
        else if (HotkeyBehavior == 1) {
            bool status = tex2Dfetch(s, int2(0, 0), 0).r > 0.0;
            if (status && !hotkeyPress[HotkeyButton] || !status && hotkeyPress[HotkeyButton]) return true;
        }
        return false;
    }
    return true;
}

// ------------------------------------------------------------------------------------------------------------------------
// Vertex Shaders
// ------------------------------------------------------------------------------------------------------------------------
    void MagnifyStatusVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
    {
        texcoord.x = 0.0;
        texcoord.y = 0.0;
        position = float4(float2(-1.0, 1.0), 0.0, 1.0);
    }

    void MagnifyVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
    {   
        float2 offset = float2(Offset.x - Size.x / 2.0, MousePoint.y + Offset.y - Size.y / 2.0);
        if (id > 1) offset.x += Size.x;
        if (id == 1 || id == 3) offset.y += Size.y;
        offset /= BUFFER_SCREEN_SIZE;

        if (IsFollowCursor) texcoord = MousePoint + offset;
        else texcoord = CenterPoint + offset;

        if (!GetStatus(MagnifyStatus)) texcoord = float2(0.0, 0.0);

	    position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

    void TestVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
    {   
        float2 offset = float2(-50.0, -50.0);
        
        if (id > 1) offset.x += 100.0;
        if (id == 1 || id == 3) offset.y += 100.0;
        
        offset /= BUFFER_SCREEN_SIZE;

        texcoord = CenterPoint + offset;

	    position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float MagnifyStatusPS(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return GetStatus(MagnifyStatusCopy) ? 1.0 : 0.0;
    }

    float MagnifyStatusCopyPS(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return tex2Dfetch(MagnifyStatus, int2(0, 0), 0).r;
    }

    float4 MagnifyPS(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return 1.0;
    }

    float4 TestPS(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return 1.0;
    }
// ------------------------------------------------------------------------------------------------------------------------
// Passes
// ------------------------------------------------------------------------------------------------------------------------

technique Magnify_Hotkey
{
    pass Magnify
    {
        PrimitiveTopology = TRIANGLESTRIP;
        VertexShader = MagnifyVS;
        PixelShader = MagnifyPS;
    }
    pass MagnifyStatus
    {
        PrimitiveTopology = POINTLIST;
        VertexShader = MagnifyStatusVS;
        PixelShader = MagnifyStatusPS;
        RenderTarget = MagnifyStatusTex;
    }
    pass MagnifyStatusCopy
    {
        PrimitiveTopology = POINTLIST;
        VertexShader = MagnifyStatusVS;
        PixelShader = MagnifyStatusCopyPS;
        RenderTarget = MagnifyStatusCopyTex;
    }
}

technique Magnify
{
    pass Magnify
    {
        PrimitiveTopology = TRIANGLESTRIP;
        VertexShader = MagnifyVS;
        PixelShader = MagnifyPS;
    }
}