#include "ReShadeUI.fxh"
#include "ReShade.fxh"

// ------------------------------------------------------------------------------------------------------------------------
// UI
// ------------------------------------------------------------------------------------------------------------------------

uniform int FlickerDetectionType <
    ui_type = "combo";
	ui_label = "Flicker Detection Type";
	ui_items = "Luminance flicker detection\0"
                "Perceived Luminance flicker detection\0";
> = 0;

uniform float FlickerDetectionThreshold <
    ui_type = "drag";
	ui_label = "Flicker Detection Threshold";
    ui_tooltip = "Try lowering this slightly if AntiFlicker misses some flickering.\n"
				 "Default is 0.100";
    ui_min = 0.000; ui_max = 0.200; ui_step = 0.001;
> = 0.100;

uniform float FlickerTimescale <
    ui_type = "drag";
	ui_label = "Flicker Timescale";
    ui_tooltip = "The time in milliseconds to smooth brightness changes."
                 "Try raising this if flickering is still too noticeable.\n"
				 "Default is 300";
    ui_min = 0.000; ui_max = 2000.000; ui_step = 1.000;
> = 300.000;

// ------------------------------------------------------------------------------------------------------------------------
// Global Variables
// ------------------------------------------------------------------------------------------------------------------------
static const float3 FlickerDetectionVector[2] = {
    float3(0.2126, 0.7152, 0.0722),
    float3(0.299, 0.587, 0.114)
};

static const uint PrevFrameCount = 2;

uniform float Time < source = "timer"; >;
uniform uint FrameCount < source = "framecount"; >;
uniform float FrameTime < source = "frametime"; >;

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

texture2D AntiFlickerDebugTex { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };

texture2D PrevFrameTex1 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
texture2D PrevFrameTex2 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };

sampler2D PrevFrameSampler1 { Texture = PrevFrameTex1; };
sampler2D PrevFrameSampler2 { Texture = PrevFrameTex2; };

// ------------------------------------------------------------------------------------------------------------------------
// Functions
// ------------------------------------------------------------------------------------------------------------------------

float LinearDifference(float3 A, float3 B)
{
    float lumDiff = dot(A, FlickerDetectionVector[FlickerDetectionType]) - dot(B, FlickerDetectionVector[FlickerDetectionType]);
    if (FlickerDetectionType < 2)
        return lumDiff;
    
    float3 C = abs(A - B);
    return max(max(C.r, C.g), C.b) * (lumDiff < 0.0 ? -1.0 : 1.0); // sign intrinsic can return 0, which we don't want. Plus this is faster.
}

float4 ClampBuffer(uint2 pixPosition) {
    uint prev = (FrameCount + 1) % PrevFrameCount;
    
    float4 color = tex2Dfetch(ReShade::BackBuffer, pixPosition, 0);
    
    float4 prevColor;
    if (prev == 1)
        prevColor = tex2Dfetch(PrevFrameSampler1, pixPosition, 0);
    else
        prevColor = tex2Dfetch(PrevFrameSampler2, pixPosition, 0);

    float lumineColor = dot(color.rgb, FlickerDetectionVector[FlickerDetectionType]);
    float luminePrev = dot(prevColor.rgb, FlickerDetectionVector[FlickerDetectionType]);
    
    float flicker = lumineColor - luminePrev;
    if (flicker >= FlickerDetectionThreshold) {
        // darken pixels that suddenly become bright
        float unflicker = 1.0 - flicker * saturate(1.0 - FrameTime / FlickerTimescale);
        color.rgb *= unflicker;
    }
    else if (flicker <= -FlickerDetectionThreshold) {
        // brighten pixels that suddenly become dark
        float unflicker = luminePrev / lumineColor * saturate(1.0 - FrameTime / FlickerTimescale);
        color.rgb = lerp(color.rgb - flicker * 0.3333333, color.rgb * unflicker, lumineColor);
    }
    else {
        color.a = 0.0;
    }
    
    return color;
}

// ------------------------------------------------------------------------------------------------------------------------
// Vertex Shaders
// ------------------------------------------------------------------------------------------------------------------------

void SaveBuffer1VS(
    in uint id : SV_VertexID,
    out float4 position : SV_POSITION,
    out float2 texcoord : TEXCOORD
) {
    uint frameNumber = (FrameCount % 2);
    if (frameNumber == 1)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer2VS(
    in uint id : SV_VertexID,
    out float4 position : SV_POSITION,
    out float2 texcoord : TEXCOORD
) {
    uint frameNumber = (FrameCount % 2);
    if (frameNumber == 0)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

float4 ClampBufferPS(in float4 position: SV_POSITION, in float2 texcoord : TEXCOORD) : SV_TARGET {
    float4 color = ClampBuffer(floor(position.xy));
    color.a = 1.0;
    return color;
}

float4 DebugBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    float4 color = ClampBuffer(floor(position.xy));
    
    uint row = floor(texcoord.y / 0.1);
    uint col = floor(texcoord.x * BUFFER_ASPECT_RATIO / 0.1);

    float3 lightGray = 0.5;
    float3 darkGray = 0.1667;
    
    lightGray = lerp(lightGray, color.rgb, color.a);
    darkGray = lerp(darkGray, color.rgb, color.a);

    // Create checkerboad background to depict transparency
    if (row % 2 == 0) {
        if (col % 2 == 0) {
            color.rgb = lightGray;
        }
        else {
            color.rgb = darkGray;
        }
    }
    else {
        if (col % 2 == 0) {
            color.rgb = darkGray;
        }
        else {
            color.rgb = lightGray;
        }
    }

    color.a = 1.0;
    return color;
}

float4 SaveBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    return tex2Dfetch(ReShade::BackBuffer, floor(position.xy), 0);
}

float4 ShowBufferAfterPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    int2 pixPosition = floor(position.xy);
    uint target = FrameCount % PrevFrameCount;
    
    if (target == 1)
        return tex2Dfetch(PrevFrameSampler1, pixPosition, 0);
    else // if (target == 0)
        return tex2Dfetch(PrevFrameSampler2, pixPosition, 0);
}

// ------------------------------------------------------------------------------------------------------------------------
// Render Passes
// ------------------------------------------------------------------------------------------------------------------------

technique AntiFlicker
{
    pass {
        VertexShader = SaveBuffer1VS;
        PixelShader = ClampBufferPS;
        RenderTarget = PrevFrameTex1;
    }
    pass {
        VertexShader = SaveBuffer2VS;
        PixelShader = ClampBufferPS;
        RenderTarget = PrevFrameTex2;
    }
    pass {
        VertexShader = PostProcessVS;
        PixelShader = ShowBufferAfterPS;
    }
}

technique AntiFlickerDebug {
    pass {
        VertexShader = PostProcessVS;
        PixelShader = DebugBufferPS;
        RenderTarget = AntiFlickerDebugTex;
    }
}