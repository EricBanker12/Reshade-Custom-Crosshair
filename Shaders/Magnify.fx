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
        ui_min = -BUFFER_WIDTH;
        ui_max = BUFFER_WIDTH;
        ui_step = 1.0;
    > = float2(0.0, 0.0);

    uniform int Hotkey <
        ui_type = "combo";
        ui_label = "Hotkey";
        ui_items = "None\0Left Mouse Button\0Right Mouse Button\0Middle Mouse Button\0X1 Mouse Button (Back Mouse Button)\0X2 Mouse Button (Forward Mouse Button)\0Custom Hotkey\0";
        ui_tooltip = "Select the mouse button or keyboard key code to trigger hotkey behavior. Default custom key code is 0x5A corresponding to the Z key.";
    > = 0;

    uniform bool IsFollowCursor <
        ui_label = "Follow Cursor";
        ui_tooltip = "Center magnification around cursor position, not the center of the screen.";
    > = false;

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

    #ifndef CUSTOM_HOTKEY_KEYCODE
        #define CUSTOM_HOTKEY_KEYCODE 0x5A
    #endif

    uniform bool CustomKey_Down <source = "key"; keycode = CUSTOM_HOTKEY_KEYCODE; mode = ""; >;
    uniform bool CustomKey_Press <source = "key"; keycode = CUSTOM_HOTKEY_KEYCODE; mode = "press"; >;

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
bool GetHotkey() {
    if (Hotkey > 0) {
        const bool hotkeyDown[6] = { MouseLeft_Down, MouseRight_Down, MouseMiddle_Down, MouseBack_Down, MouseForward_Down, CustomKey_Down };
        return hotkeyDown[Hotkey - 1];
    }
    return true;
}

bool GetHotkeyToggle() {
    if (Hotkey > 0) {
        const bool hotkeyPress[6] = { MouseLeft_Press, MouseRight_Press, MouseMiddle_Press, MouseBack_Press, MouseForward_Press, CustomKey_Press };
        bool status = tex2Dfetch(MagnifyStatusCopy, int2(0, 0), 0).r > 0.0;
        if (status && !hotkeyPress[Hotkey - 1] || !status && hotkeyPress[Hotkey - 1]) return true;
        return false;
    }
    return true;
}

// ------------------------------------------------------------------------------------------------------------------------
// Vertex Shaders
// ------------------------------------------------------------------------------------------------------------------------
    void MagnifyStatusVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
    {
        texcoord.xy = 0.5;
        position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

    void MagnifyVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
    {   
        float2 offset = float2(Offset.x - Size.x / 2.0, Offset.y + Offset.y - Size.y / 2.0);
        if (id > 1) offset.x += Size.x;
        if (id == 1 || id == 3) offset.y += Size.y;

        if (IsFollowCursor) texcoord = (MousePoint + offset) / BUFFER_SCREEN_SIZE;
        else texcoord = (CenterPoint + offset) / BUFFER_SCREEN_SIZE;

        if (!GetHotkey()) texcoord = 0.0;

	    position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

    void MagnifyToggleVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
    {   
        float2 offset = float2(Offset.x - Size.x / 2.0, Offset.y + Offset.y - Size.y / 2.0);
        if (id > 1) offset.x += Size.x;
        if (id == 1 || id == 3) offset.y += Size.y;

        if (IsFollowCursor) texcoord = (MousePoint + offset) / BUFFER_SCREEN_SIZE;
        else texcoord = (CenterPoint + offset) / BUFFER_SCREEN_SIZE;

        if (!GetHotkeyToggle()) texcoord = 0.0;

	    position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float MagnifyStatusPS(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return GetHotkeyToggle() ? 1.0 : 0.0;
    }

    float MagnifyStatusCopyPS(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return tex2Dfetch(MagnifyStatus, int2(0, 0), 0).r;
    }

    float4 MagnifyPS(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return 1.0;
    }
// ------------------------------------------------------------------------------------------------------------------------
// Passes
// ------------------------------------------------------------------------------------------------------------------------

technique Magnify
{
    pass Magnify
    {
        PrimitiveTopology = TRIANGLESTRIP;
        VertexCount = 4;
        VertexShader = MagnifyVS;
        PixelShader = MagnifyPS;
    }
}

technique Magnify_Toggle
{
    pass Magnify
    {
        PrimitiveTopology = TRIANGLESTRIP;
        VertexCount = 4;
        VertexShader = MagnifyToggleVS;
        PixelShader = MagnifyPS;
    }
    // ReShade cannot read and write to the same texture in a single pass, so we have to duplicate it.
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