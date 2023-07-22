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
> = 1;

uniform float FlickerDetectionThreshold < __UNIFORM_DRAG_FLOAT1
	ui_label = "Flicker Detection Threshold";
    ui_tooltip = "If AntiFlicker misses some flickering, try lowering this slightly.\n"
				 "Default is 0.050";
    ui_min = 0.000; ui_max = 0.200;
> = 0.050;

uniform float FlickerReductionStrength < __UNIFORM_DRAG_FLOAT1
	ui_label = "Flicker Reduction Strength";
    ui_tooltip = "If AntiFlicker misses some flickering, try lowering this slightly.\n"
				 "Default is 0.050";
    ui_min = 0.000; ui_max = 1.000;
> = 0.500;

// ------------------------------------------------------------------------------------------------------------------------
// Global Variables
// ------------------------------------------------------------------------------------------------------------------------
static const float3 FlickerDetectionVector[4] = {
    float3(0.2126, 0.7152, 0.0722),
    float3(0.299, 0.587, 0.114),
    float3(0.3333333, 0.3333333, 0.3333333),
    float3(0.299, 0.587, 0.114)
};

static const uint PrevFrameCount = 4; // actually 3, but need +1 texture

uniform uint FrameCount < source = "framecount"; >;

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

texture2D PrevFrameTex1 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
texture2D PrevFrameTex2 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
texture2D PrevFrameTex3 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };
texture2D PrevFrameTex4 { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };

texture2D AntiFlickerDebugTex { Height = BUFFER_HEIGHT; Width = BUFFER_WIDTH; Format = RGBA8; };

sampler2D PrevFrameSampler1 { Texture = PrevFrameTex1; };
sampler2D PrevFrameSampler2 { Texture = PrevFrameTex2; };
sampler2D PrevFrameSampler3 { Texture = PrevFrameTex3; };
sampler2D PrevFrameSampler4 { Texture = PrevFrameTex4; };

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
    return A + (B - A) * S * 3 * FlickerDetectionVector[FlickerDetectionType];
}

float4 ClampBuffer(uint2 pixPosition) {
    uint prev1 = (FrameCount + 3) % PrevFrameCount;
    uint prev2 = (FrameCount + 2) % PrevFrameCount;
    uint prev3 = (FrameCount + 1) % PrevFrameCount;
    
    float4 prev[PrevFrameCount] = {
        tex2Dfetch(PrevFrameSampler4, pixPosition, 0),
        tex2Dfetch(PrevFrameSampler1, pixPosition, 0),
        tex2Dfetch(PrevFrameSampler2, pixPosition, 0),
        tex2Dfetch(PrevFrameSampler3, pixPosition, 0),
    };
    
    float4 color = tex2Dfetch(ReShade::BackBuffer, pixPosition, 0);
    
    float3 diff = float3(
        LinearDifference(color.rgb, prev[prev1].rgb),
        LinearDifference(color.rgb, prev[prev2].rgb),
        LinearDifference(color.rgb, prev[prev3].rgb)
    );
 
    // float4 weight = float4(0.4, 0.3, 0.2, 0.1);
    float3 weight = float3(0.5, 0.3333333, 0.1666667);
    // float3 weight = float3(0.6666667, 0.3333333, 0.0);
    // float3 weight = float3(1.0, 0.0, 0.0);
    
    float flicker = dot(diff, weight) - FlickerDetectionThreshold;
    if (flicker > 0.0) {
        // color.rgb *= (1.0 - flicker);
        
        // color.rgb = lerp(color.rgb, prev[prev1].rgb, flicker * FlickerReductionStrength);
        
        color.rgb = lerp(color.rgb, prev[prev1].rgb, flicker * weight.x * FlickerReductionStrength);
        color.rgb = lerp(color.rgb, prev[prev2].rgb, flicker * weight.y * FlickerReductionStrength);
        color.rgb = lerp(color.rgb, prev[prev3].rgb, flicker * weight.z * FlickerReductionStrength);
        
        // color.rgb = InterpolateColor(color.rgb, prev[prev1].rgb, flicker * FlickerReductionStrength);
        
        // color.rgb = InterpolateColor(color.rgb, prev[prev1].rgb, flicker * weight.x * FlickerReductionStrength);
        // color.rgb = InterpolateColor(color.rgb, prev[prev2].rgb, flicker * weight.y * FlickerReductionStrength);
        // color.rgb = InterpolateColor(color.rgb, prev[prev3].rgb, flicker * weight.z * FlickerReductionStrength);
    }
    else {
        color.a = 0.0;
    }
    
    return color;
}

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

float4 ClampBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    float4 color = ClampBuffer(floor(position.xy));
    color.a = 1.0;
    return color;
}

float4 DebugClampBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
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

void SaveBuffer1VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    int target = 1 * sign(PrevFrameCount - 1);
    if (FrameCount % PrevFrameCount == target)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer2VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    int target = 2 * sign(PrevFrameCount - 2);
    if (FrameCount % PrevFrameCount == target)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer3VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    int target = 3 * sign(PrevFrameCount - 3);
    if (FrameCount % PrevFrameCount == target)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

void SaveBuffer4VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
    int target = 4 * sign(PrevFrameCount - 4);
    if (FrameCount % PrevFrameCount == target)
        PostProcessVS(id, position, texcoord);
    else
        PostProcessVS(0, position, texcoord);
}

float4 SaveBufferPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    return tex2Dfetch(ReShade::BackBuffer, floor(position.xy), 0);
}

float4 BlankPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    return 1.0;
}

float4 ShowBufferAfterPS(float4 position: SV_POSITION, float2 texcoord : TEXCOORD) : SV_TARGET {
    int2 pixPosition = floor(position.xy);
    uint target = FrameCount % PrevFrameCount;
    if (target == 1)
        return tex2Dfetch(PrevFrameSampler1, pixPosition, 0);
    if (target == 2)
        return tex2Dfetch(PrevFrameSampler2, pixPosition, 0);
    if (target == 3)
        return tex2Dfetch(PrevFrameSampler3, pixPosition, 0);
    // if (target == 0)
    return tex2Dfetch(PrevFrameSampler4, pixPosition, 0);
}

// ------------------------------------------------------------------------------------------------------------------------
// Render Passes
// ------------------------------------------------------------------------------------------------------------------------

technique AntiFlicker
{
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
        VertexShader = PostProcessVS;
        PixelShader = ClampBufferPS;
    }
}

technique AntiFlicker2
{
    pass {
        VertexShader = PostProcessVS;
        PixelShader = ClampBufferPS;
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
}

technique AntiFlicker3
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
        VertexShader = PostProcessVS;
        PixelShader = ShowBufferAfterPS;
    }
}

technique AntiFlickerDebug {
    pass {
        VertexShader = PostProcessVS;
        PixelShader = DebugClampBufferPS;
        RenderTarget = AntiFlickerDebugTex;
    }
}