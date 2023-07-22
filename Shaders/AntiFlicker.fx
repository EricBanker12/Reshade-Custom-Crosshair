#include "ReShadeUI.fxh"
#include "ReShade.fxh"

// ------------------------------------------------------------------------------------------------------------------------
// UI
// ------------------------------------------------------------------------------------------------------------------------

uniform int FlickerDetectionType < __UNIFORM_COMBO_INT1
	ui_items = "Luminance flicker detection\0"
                "Perceived Luminance flicker detection\0"
                "Color flicker detection\0"
                "Perceived Color flicker detection\0";
	ui_label = "Flicker Detection Type";
> = 3;

uniform float FlickerDetectionThreshold < __UNIFORM_DRAG_FLOAT1
	ui_label = "Flicker Detection Threshold";
    ui_tooltip = "If AntiFlicker misses some flickering, try lowering this slightly.";
    ui_min = 0.000; ui_max = 0.200;
> = 0.050;

uniform float FlickerDetectionTimespan < __UNIFORM_DRAG_FLOAT1
    ui_label = "Flicker Detection Timespan";
    ui_tooltip = "If AntiFlicker misses some flickering, try raising this slightly.";
    ui_min = 0.0; ui_max = 1000.0; ui_step = 1.0;
> = 100.0;

uniform float FlickerReductionStrength < __UNIFORM_DRAG_FLOAT1
	ui_label = "Flicker Reduction Strength";
    ui_tooltip = "If AntiFlicker misses some flickering, try raising this slightly.";
    ui_min = 0.000; ui_max = 2.000;
> = 1.000;

// ------------------------------------------------------------------------------------------------------------------------
// Global Variables
// ------------------------------------------------------------------------------------------------------------------------

static const uint PrevFrameCount = 5; // actually 4, but need +1 texture

static const float3 FlickerDetectionVector[4] = {
    float3(0.2126, 0.7152, 0.0722),
    float3(0.299, 0.587, 0.114),
    float3(0.3333333, 0.3333333, 0.3333333),
    float3(0.299, 0.587, 0.114)
};

uniform uint FrameCount < source = "framecount"; >;
uniform float Time < source = "timer"; >;

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

texture2D PrevFrameTex1 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
texture2D PrevFrameTex2 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
texture2D PrevFrameTex3 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
texture2D PrevFrameTex4 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
texture2D PrevFrameTex5 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };

sampler2D PrevFrameSampler1 { Texture = PrevFrameTex1; };
sampler2D PrevFrameSampler2 { Texture = PrevFrameTex2; };
sampler2D PrevFrameSampler3 { Texture = PrevFrameTex3; };
sampler2D PrevFrameSampler4 { Texture = PrevFrameTex4; };
sampler2D PrevFrameSampler5 { Texture = PrevFrameTex5; };

texture2D PrevFrameTimeTex { Height = 1.0; Width = 5.0; Format = R32F; };
sampler2D PrevFrameTimeSampler { Texture = PrevFrameTimeTex; };

texture2D AntiFlickerDebugTex { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };

// ------------------------------------------------------------------------------------------------------------------------
// Functions
// ------------------------------------------------------------------------------------------------------------------------

float LinearDifference(float3 A, float3 B)
{
	if (FlickerDetectionType < 2)
	    return dot(A, FlickerDetectionVector[FlickerDetectionType])
                - dot(B, FlickerDetectionVector[FlickerDetectionType]);
	
	else if (FlickerDetectionType == 2)
	{
		float3 C = abs(A - B);
		return max(max(C.r, C.g), C.b);
	}
	else { // if (FlickerDetectionType == 3)
        float3 C = saturate(abs(A - B) * 3 * FlickerDetectionVector[FlickerDetectionType]);
		return max(max(C.r, C.g), C.b);
    }
}

float3 InterpolateColor(float3 A, float3 B, float S) {
    return saturate(A + (B - A) * S * 3 * FlickerDetectionVector[FlickerDetectionType]);
}

float4 ClampBuffer(uint2 pixPosition) {
    float time = Time % FlickerDetectionTimespan;
    uint frameNumber = floor(time * PrevFrameCount / FlickerDetectionTimespan);
    
    uint prev1 = (frameNumber + 4) % PrevFrameCount;
    uint prev2 = (frameNumber + 3) % PrevFrameCount;
    uint prev3 = (frameNumber + 2) % PrevFrameCount;
    uint prev4 = (frameNumber + 1) % PrevFrameCount;
    
    float4 prev[PrevFrameCount] = {
        tex2Dfetch(PrevFrameSampler5, pixPosition, 0),
        tex2Dfetch(PrevFrameSampler1, pixPosition, 0),
        tex2Dfetch(PrevFrameSampler2, pixPosition, 0),
        tex2Dfetch(PrevFrameSampler3, pixPosition, 0),
        tex2Dfetch(PrevFrameSampler4, pixPosition, 0)
    };
    
    float4 color = tex2Dfetch(ReShade::BackBuffer, pixPosition, 0);

    float frameTime[PrevFrameCount] = {
        tex2Dfetch(PrevFrameTimeSampler, int2(0, 0), 0).r * FlickerDetectionTimespan,
        tex2Dfetch(PrevFrameTimeSampler, int2(1, 0), 0).r * FlickerDetectionTimespan,
        tex2Dfetch(PrevFrameTimeSampler, int2(2, 0), 0).r * FlickerDetectionTimespan,
        tex2Dfetch(PrevFrameTimeSampler, int2(3, 0), 0).r * FlickerDetectionTimespan,
        tex2Dfetch(PrevFrameTimeSampler, int2(4, 0), 0).r * FlickerDetectionTimespan
    };

    frameTime[prev1] -= (frameTime[prev1] >= time) ? FlickerDetectionTimespan : 0.0;
    frameTime[prev2] -= (frameTime[prev2] >= time) ? FlickerDetectionTimespan : 0.0;
    frameTime[prev3] -= (frameTime[prev3] >= time) ? FlickerDetectionTimespan : 0.0;
    frameTime[prev4] -= (frameTime[prev4] >= time) ? FlickerDetectionTimespan : 0.0;
    
    float4 diff = float4(
        LinearDifference(color.rgb, prev[prev1].rgb),
        LinearDifference(color.rgb, prev[prev2].rgb),
        LinearDifference(color.rgb, prev[prev3].rgb),
        LinearDifference(color.rgb, prev[prev4].rgb)
    );

    float4 timeDiff = float4(
        time - frameTime[prev4],
        frameTime[prev1] - frameTime[prev4],
        frameTime[prev2] - frameTime[prev4],
        frameTime[prev3] - frameTime[prev4]
    );

    float4 weight = timeDiff / timeDiff.x;
    weight /= dot(weight, 1.0);
    
    float flicker = dot(diff, weight) - FlickerDetectionThreshold;
    if (flicker > 0.0) {
        // color.rgb *= (1.0 - flicker / 2.0);
        
        // color.rgb = lerp(color.rgb, prev[prev1].rgb, flicker * FlickerReductionStrength);
        
        color.rgb = lerp(color.rgb, prev[prev1].rgb, flicker * weight.x * FlickerReductionStrength);
        color.rgb = lerp(color.rgb, prev[prev2].rgb, flicker * weight.y * FlickerReductionStrength);
        color.rgb = lerp(color.rgb, prev[prev3].rgb, flicker * weight.z * FlickerReductionStrength);
        color.rgb = lerp(color.rgb, prev[prev4].rgb, flicker * weight.w * FlickerReductionStrength);
        
        // color.rgb = InterpolateColor(color.rgb, prev[prev1].rgb, flicker * FlickerReductionStrength);
        
        // color.rgb = InterpolateColor(color.rgb, prev[prev1].rgb, flicker * weight.x * FlickerReductionStrength);
        // color.rgb = InterpolateColor(color.rgb, prev[prev2].rgb, flicker * weight.y * FlickerReductionStrength);
        // color.rgb = InterpolateColor(color.rgb, prev[prev3].rgb, flicker * weight.z * FlickerReductionStrength);
        // color.rgb = InterpolateColor(color.rgb, prev[prev4].rgb, flicker * weight.w * FlickerReductionStrength);
    }
    else {
        color.a = 0.0;
    }
    
    return color;
}

// ------------------------------------------------------------------------------------------------------------------------
// Vertex Shaders
// ------------------------------------------------------------------------------------------------------------------------

void SaveBuffer1VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    float time = Time % FlickerDetectionTimespan;
    
    uint target = 1;
    uint nextTarget = target + 1;
    
    float targetTime = target * FlickerDetectionTimespan / PrevFrameCount;
    float nextTargetTime = nextTarget * FlickerDetectionTimespan / PrevFrameCount;
    
    if (time >= targetTime && time < nextTargetTime)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer2VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    float time = Time % FlickerDetectionTimespan;
    
    uint target = 2;
    uint nextTarget = target + 1;
    
    float targetTime = target * FlickerDetectionTimespan / PrevFrameCount;
    float nextTargetTime = nextTarget * FlickerDetectionTimespan / PrevFrameCount;
    
    if (time >= targetTime && time < nextTargetTime)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer3VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    float time = Time % FlickerDetectionTimespan;
    
    uint target = 3;
    uint nextTarget = target + 1;
    
    float targetTime = target * FlickerDetectionTimespan / PrevFrameCount;
    float nextTargetTime = nextTarget * FlickerDetectionTimespan / PrevFrameCount;
    
    if (time >= targetTime && time < nextTargetTime)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer4VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    float time = Time % FlickerDetectionTimespan;
    
    uint target = 4;
    uint nextTarget = target + 1;
    
    float targetTime = target * FlickerDetectionTimespan / PrevFrameCount;
    float nextTargetTime = nextTarget * FlickerDetectionTimespan / PrevFrameCount;
    
    if (time >= targetTime && time < nextTargetTime)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer5VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    float time = Time % FlickerDetectionTimespan;
    
    uint target = 0;
    uint nextTarget = target + 1;
    
    float targetTime = target * FlickerDetectionTimespan / PrevFrameCount;
    float nextTargetTime = nextTarget * FlickerDetectionTimespan / PrevFrameCount;
    
    if (time >= targetTime && time < nextTargetTime)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

float4 ClampBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    float4 color = ClampBuffer(floor(position.xy));
    color.a = 1.0;
    return color;
}

float4 DebugBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    float4 color = ClampBuffer(floor(position.xy));
    if (color.a == 0.0) {
        color.a = 1.0;
        
        uint row = floor(texcoord.y / 0.1);
        uint col = floor(texcoord.x * BUFFER_ASPECT_RATIO / 0.1);
        if (row % 2 == 0) {
            if (col % 2 == 0) {
                color.rgb = 0.5;
            }
            else {
                color.rgb = 0.1;
            }
        }
        else {
            if (col % 2 == 0) {
                color.rgb = 0.1;
            }
            else {
                color.rgb = 0.5;
            }
        }
    }
    return color;
}

float4 SaveBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    return tex2Dfetch(ReShade::BackBuffer, floor(position.xy), 0);
}

float4 ShowBufferAfterPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    int2 pixPosition = floor(position.xy);
    float time = Time % FlickerDetectionTimespan;
    uint frameNumber = floor(time * PrevFrameCount / FlickerDetectionTimespan);
    if (frameNumber == 1)
        return tex2Dfetch(PrevFrameSampler1, pixPosition, 0);
    if (frameNumber == 2)
        return tex2Dfetch(PrevFrameSampler2, pixPosition, 0);
    if (frameNumber == 3)
        return tex2Dfetch(PrevFrameSampler3, pixPosition, 0);
    if (frameNumber == 4)
        return tex2Dfetch(PrevFrameSampler4, pixPosition, 0);
    // if (frameNumber == 0)
    return tex2Dfetch(PrevFrameSampler5, pixPosition, 0);
}

float4 FrameTimePS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    float time = Time % FlickerDetectionTimespan;
    uint frameNumber = floor(time * PrevFrameCount / FlickerDetectionTimespan);
    uint pixPosition = floor(position.x);

    if (pixPosition == frameNumber) return time / FlickerDetectionTimespan;
    else discard;
}

// ------------------------------------------------------------------------------------------------------------------------
// Render Passes
// ------------------------------------------------------------------------------------------------------------------------

technique AntiFlicker
{
    pass {
        VertexShader = PostProcessVS;
        PixelShader = FrameTimePS;
        RenderTarget = PrevFrameTimeTex;
    }
    pass {
        VertexShader = SaveBuffer1VS;
        PixelShader = SaveBufferPS;
        RenderTarget = PrevFrameTex1;
    }
    pass {
        VertexShader = SaveBuffer2VS;
        PixelShader = SaveBufferPS;
        RenderTarget = PrevFrameTex2;
    }
    pass {
        VertexShader = SaveBuffer3VS;
        PixelShader = SaveBufferPS;
        RenderTarget = PrevFrameTex3;
    }
    pass {
        VertexShader = SaveBuffer4VS;
        PixelShader = SaveBufferPS;
        RenderTarget = PrevFrameTex4;
    }
    pass {
        VertexShader = SaveBuffer5VS;
        PixelShader = SaveBufferPS;
        RenderTarget = PrevFrameTex5;
    }
    pass {
        VertexShader = PostProcessVS;
        PixelShader = ClampBufferPS;
    }
}

technique AntiFlicker3
{
    pass {
        VertexShader = PostProcessVS;
        PixelShader = FrameTimePS;
        RenderTarget = PrevFrameTimeTex;
    }
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
        VertexShader = SaveBuffer3VS;
        PixelShader = ClampBufferPS;
        RenderTarget = PrevFrameTex3;
    }
    pass {
        VertexShader = SaveBuffer4VS;
        PixelShader = ClampBufferPS;
        RenderTarget = PrevFrameTex4;
    }
    pass {
        VertexShader = SaveBuffer5VS;
        PixelShader = ClampBufferPS;
        RenderTarget = PrevFrameTex5;
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