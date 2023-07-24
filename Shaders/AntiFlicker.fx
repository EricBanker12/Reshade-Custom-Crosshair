// ------------------------------------------------------------------------------------------------------------------------
// Defines
// ------------------------------------------------------------------------------------------------------------------------

#define BUFFER_PIXEL_SIZE float2(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT)
#define BUFFER_ASPECT_RATIO (BUFFER_WIDTH * BUFFER_RCP_HEIGHT)

// ------------------------------------------------------------------------------------------------------------------------
// UI
// ------------------------------------------------------------------------------------------------------------------------

uniform int FlickerDetectionType <
    ui_type = "combo";
	ui_label = "Flicker Detection Type";
	ui_items = "Luminance flicker detection\0"
                "Perceived Luminance flicker detection\0";
> = 1;

uniform float FlickerDetectionThreshold <
    ui_type = "drag";
	ui_label = "Flicker Detection Threshold";
    ui_tooltip = "Try lowering this slightly if AntiFlicker misses some flickering.\n"
				 "Default is 0.010";
    ui_min = 0.000; ui_max = 0.200; ui_step = 0.001;
> = 0.010;

uniform float LocalContrastThreshold <
    ui_type = "drag";
	ui_label = "Local Contrast Threshold";
    ui_tooltip = "Try lowering this slightly if AntiFlicker misses some flickering.\n"
				 "Default is 0.020";
    ui_min = 0.000; ui_max = 0.200; ui_step = 0.001;
> = 0.020;

uniform float FlickerTimescale <
    ui_type = "drag";
	ui_label = "Smoothing Timescale";
    ui_tooltip = "The time in milliseconds to smooth brightness changes."
                 "Try raising this if flickering is still too noticeable.\n"
				 "Default is 1000";
    ui_min = 0.000; ui_max = 2000.000; ui_step = 1.000;
> = 1000.000;

// ------------------------------------------------------------------------------------------------------------------------
// Global Variables
// ------------------------------------------------------------------------------------------------------------------------
static const float3 FlickerDetectionVector[2] = {
    float3(0.2126, 0.7152, 0.0722),
    float3(0.299, 0.587, 0.114)
};

uniform float Time < source = "timer"; >;
uniform uint FrameCount < source = "framecount"; >;
uniform float FrameTime < source = "frametime"; >;

// ------------------------------------------------------------------------------------------------------------------------
// Textures & Samplers
// ------------------------------------------------------------------------------------------------------------------------

texture2D BackBufferTex : COLOR;
sampler2D BackBuffer { Texture = BackBufferTex; };

texture2D PrevFrameTex1 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
sampler2D PrevFrameSampler1 { Texture = PrevFrameTex1; };

texture2D PrevFrameTex2 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
sampler2D PrevFrameSampler2 { Texture = PrevFrameTex2; };

texture2D AntiFlickerDebugTex { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };

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

float4 ClampBuffer(float2 texcoord, int2 pixPosition, uint frame) {
    
    //  +---+---+---+---+---+
    //  |   |   |   |   |   |
    //  +---+---+---+---+---+
    //  |   | e | f | g |   |
    //  +---+--(a)-(b)--+---+
    //  |   | h | x | i |   |
    //  +---+--(c)-(d)--+---+
    //  |   | j | k | l |   |
    //  +---+---+---+---+---+
    //  |   |   |   |   |   |
    //  +---+---+---+---+---+

    float2 offset = 0.5 * BUFFER_PIXEL_SIZE;
    float3 a = tex2Dlod(BackBuffer, float4(texcoord - offset, 0.0, 0.0)).rgb;
    float3 d = tex2Dlod(BackBuffer, float4(texcoord + offset, 0.0, 0.0)).rgb;
    
    offset.x = -offset.x;
    float3 b = tex2Dlod(BackBuffer, float4(texcoord - offset, 0.0, 0.0)).rgb;
    float3 c = tex2Dlod(BackBuffer, float4(texcoord + offset, 0.0, 0.0)).rgb;

    float4 color = tex2Dfetch(BackBuffer, pixPosition, 0);
    
    float lumineA = dot(a.rgb, FlickerDetectionVector[FlickerDetectionType]);
    float lumineD = dot(d.rgb, FlickerDetectionVector[FlickerDetectionType]);
    float lumineB = dot(b.rgb, FlickerDetectionVector[FlickerDetectionType]);
    float lumineC = dot(c.rgb, FlickerDetectionVector[FlickerDetectionType]);
    float lumineColor = dot(color.rgb, FlickerDetectionVector[FlickerDetectionType]);

    float2 contrast = float2(lumineC + lumineD - lumineA - lumineB, lumineB + lumineD - lumineA - lumineC);
    float contrastLen = saturate(length(contrast));
    
    float4 prevColor = 0.0;
    if (frame == 1)
        prevColor = tex2Dfetch(PrevFrameSampler2, pixPosition, 0);
    else
        prevColor = tex2Dfetch(PrevFrameSampler1, pixPosition, 0);

    float luminePrev = dot(prevColor.rgb, FlickerDetectionVector[FlickerDetectionType]);

    float flicker = (lumineColor - luminePrev) * step(LocalContrastThreshold, contrastLen);

    // darken pixels that suddenly become bright
    if (flicker >= FlickerDetectionThreshold) {
        color.rgb *= 1.0 - flicker * saturate(1.0 - FrameTime / FlickerTimescale);
    }
    
    // brighten pixels that suddenly become dark
    if (flicker <= -FlickerDetectionThreshold) {
        float unflicker = luminePrev / lumineColor * saturate(1.0 - FrameTime / FlickerTimescale);
        color.rgb = lerp(color.rgb - flicker * 0.3333333, color.rgb * unflicker, lumineColor);
    }

    return color;
}

// ------------------------------------------------------------------------------------------------------------------------
// Vertex Shaders
// ------------------------------------------------------------------------------------------------------------------------

void PostProcessVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
{
	texcoord.x = (id == 2) ? 2.0 : 0.0;
	texcoord.y = (id == 1) ? 2.0 : 0.0;
	position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
}

void SaveBuffer1VS(
    in uint id : SV_VertexID,
    out float4 position : SV_POSITION,
    out float2 texcoord : TEXCOORD,
    out nointerpolation uint frame : FRAME
) {
    frame = (FrameCount % 2);
    if (frame == 1)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer2VS(
    in uint id : SV_VertexID,
    out float4 position : SV_POSITION,
    out float2 texcoord : TEXCOORD,
    out nointerpolation uint frame : FRAME
) {
    frame = (FrameCount % 2);
    if (frame == 0) // if (frame == 2)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void ShowBufferVS(
    in uint id : SV_VertexID,
    out float4 position : SV_POSITION,
    out float2 texcoord : TEXCOORD,
    out nointerpolation uint frame : FRAME
) {
    frame = (FrameCount % 2);
    PostProcessVS(id, position, texcoord);
}

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

float4 ClampBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD, nointerpolation uint frame : FRAME) : SV_TARGET {
    float4 color = ClampBuffer(texcoord, floor(position.xy), frame);
    return color;
}

float4 DebugBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD, nointerpolation uint frame : FRAME) : SV_TARGET {
    int2 pixPosition = floor(position.xy);
    
    float4 color;
    if (frame == 1)
        color = tex2Dfetch(PrevFrameSampler1, pixPosition, 0);
    else // if (target == 0)
        color = tex2Dfetch(PrevFrameSampler2, pixPosition, 0);
    
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

float4 ShowBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD, nointerpolation uint frame : FRAME) : SV_TARGET {
    int2 pixPosition = floor(position.xy);
    if (frame == 1)
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
        VertexShader = ShowBufferVS;
        PixelShader = ShowBufferPS;
    }
}

technique AntiFlickerDebug {
    pass {
        VertexShader = ShowBufferVS;
        PixelShader = DebugBufferPS;
        RenderTarget = AntiFlickerDebugTex;
    }
}