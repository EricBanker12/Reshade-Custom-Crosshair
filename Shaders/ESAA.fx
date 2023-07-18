// Edge Smearing Anti Aliasing
// Helps take the edge off shimmering aliasing by smearing adjacent pixels on an edge.

#include "ReShadeUI.fxh"

uniform float EdgeThreshold <
    ui_label = "Edge Threshold";
    ui_tooltip = "Smaller values will detect more edges, but may increase unwanted bluring.";
    ui_type = "drag";
    ui_min = 0.05;
    ui_max = 0.20;
> = 0.10;

uniform float SmearDistance <
    ui_label = "Smear Distance";
    ui_tooltip = "Smaller values produce less blurring.";
    ui_type = "drag";
    ui_min = 0.0;
    ui_max = 1.0;
> = 0.5;

#include "ReShade.fxh"

texture2D ESAAEdgesTexture < pooled = true; > {
    Width = BUFFER_WIDTH;
    Height = BUFFER_HEIGHT;
    Format = R8;
};

sampler2D ESAAEdgesSampler {
    Texture = ESAAEdgesTexture;
};

float2 ColorEdgeDetection(sampler2D colorSampler, float4 texcoord) {
    // Calculate the threshold:
    float2 threshold = float2(EdgeThreshold, EdgeThreshold);

    // Calculate color deltas:
    float4 delta;
    float3 C = tex2Dlod(colorSampler, texcoord).rgb;

    float3 Cleft = tex2Dlod(colorSampler, texcoord, int2(-1, 0)).rgb;
    float3 t = abs(C - Cleft);
    delta.x = max(max(t.r, t.g), t.b);

    float3 Ctop  = tex2Dlod(colorSampler, texcoord, int2(0, -1)).rgb;
    t = abs(C - Ctop);
    delta.y = max(max(t.r, t.g), t.b);

    // We do the usual threshold:
    float2 edges = step(threshold, delta.xy);

    // Then discard if there is no edge:
    if (edges.x == -edges.y) return edges;

    // Calculate right and bottom deltas:
    float3 Cright = tex2Dlod(colorSampler, texcoord, int2(1, 0)).rgb;
    t = abs(C - Cright);
    delta.z = max(max(t.r, t.g), t.b);

    float3 Cbottom  = tex2Dlod(colorSampler, texcoord, int2(0, 1)).rgb;
    t = abs(C - Cbottom);
    delta.w = max(max(t.r, t.g), t.b);

    // Calculate the maximum delta in the direct neighborhood:
    float2 maxDelta = max(delta.xy, delta.zw);

    // Calculate left-left and top-top deltas:
    float3 Cleftleft  = tex2Dlod(colorSampler, texcoord, int2(-2, 0)).rgb;
    t = abs(Cleft - Cleftleft);
    delta.z = max(max(t.r, t.g), t.b);

    float3 Ctoptop = tex2Dlod(colorSampler, texcoord, int2(0, -2)).rgb;
    t = abs(Ctop - Ctoptop);
    delta.w = max(max(t.r, t.g), t.b);

    // Calculate the final maximum delta:
    maxDelta = max(maxDelta.xy, delta.zw);
    float finalDelta = max(maxDelta.x, maxDelta.y);

    // Local contrast adaptation:
    edges.xy *= step(finalDelta, 2.0 * delta.xy);

    return edges;
}

float PS_EdgeDetection(float4 position : SV_Position, float2 texcoord : TEXCOORD0) : SV_TARGET {
    float2 edges = ColorEdgeDetection(ReShade::BackBuffer, float4(texcoord, 0, 0));
    return max(edges.x, edges.y);
}

float4 EdgeSmear(sampler2D colorSampler, float2 texcoord, float2 smearDist) {
    float edge = tex2Dlod(ESAAEdgesSampler, float4(texcoord, 0.0, 0.0)).r;
    if (edge <= 0.0) discard;

    float edgeTop = tex2Dlod(ESAAEdgesSampler, float4(mad(float2(0.0, -1.0), smearDist, texcoord), 0.0, 0.0)).r;
    float edgeBottom = tex2Dlod(ESAAEdgesSampler, float4(mad(float2(0.0, 1.0), smearDist, texcoord), 0.0, 0.0)).r;
    float edgeLeft = tex2Dlod(ESAAEdgesSampler, float4(mad(float2(-1.0, 0.0), smearDist, texcoord), 0.0, 0.0)).r;
    float edgeRight = tex2Dlod(ESAAEdgesSampler, float4(mad(float2(1.0, 0.0), smearDist, texcoord), 0.0, 0.0)).r;
    float edgeTopLeft = tex2Dlod(ESAAEdgesSampler, float4(mad(float2(-1.0, -1.0), smearDist, texcoord), 0.0, 0.0)).r;
    float edgeTopRight = tex2Dlod(ESAAEdgesSampler, float4(mad(float2(1.0, -1.0), smearDist, texcoord), 0.0, 0.0)).r;
    float edgeBottomLeft = tex2Dlod(ESAAEdgesSampler, float4(mad(float2(-1.0, -1.0), smearDist, texcoord), 0.0, 0.0)).r;
    float edgeBottomRight = tex2Dlod(ESAAEdgesSampler, float4(mad(float2(1.0, -1.0), smearDist, texcoord), 0.0, 0.0)).r;

    float3 color = tex2Dlod(colorSampler, float4(texcoord, 0.0, 0.0)).rgb;
    float3 colorTop = tex2Dlod(colorSampler, float4(mad(float2(0.0, -1.0), smearDist, texcoord), 0.0, 0.0)).rgb;
    float3 colorBottom = tex2Dlod(colorSampler, float4(mad(float2(0.0, 1.0), smearDist, texcoord), 0.0, 0.0)).rgb;
    float3 colorLeft = tex2Dlod(colorSampler, float4(mad(float2(-1.0, 0.0), smearDist, texcoord), 0.0, 0.0)).rgb;
    float3 colorRight = tex2Dlod(colorSampler, float4(mad(float2(1.0, 0.0), smearDist, texcoord), 0.0, 0.0)).rgb;
    float3 colorTopLeft = tex2Dlod(colorSampler, float4(mad(float2(-1.0, -1.0), smearDist, texcoord), 0.0, 0.0)).rgb;
    float3 colorTopRight = tex2Dlod(colorSampler, float4(mad(float2(1.0, -1.0), smearDist, texcoord), 0.0, 0.0)).rgb;
    float3 colorBottomLeft = tex2Dlod(colorSampler, float4(mad(float2(-1.0, 1.0), smearDist, texcoord), 0.0, 0.0)).rgb;
    float3 colorBottomRight = tex2Dlod(colorSampler, float4(mad(float2(1.0, 1.0), smearDist, texcoord), 0.0, 0.0)).rgb;

    float edgeSum = edge + edgeTop + edgeBottom + edgeLeft + edgeRight + edgeTopLeft + edgeTopRight + edgeBottomLeft + edgeBottomRight;
    float4 retval = float4(color * edge, 1.0);
    retval.rgb += edgeTop * colorTop;
    retval.rgb += edgeBottom * colorBottom;
    retval.rgb += edgeLeft * colorLeft;
    retval.rgb += edgeRight * colorRight;
    retval.rgb += edgeTopLeft * colorTopLeft;
    retval.rgb += edgeTopRight * colorTopRight;
    retval.rgb += edgeBottomLeft * colorBottomLeft;
    retval.rgb += edgeBottomRight * colorBottomRight;
    retval.rgb /= edgeSum;
    return retval;
}

float4 PS_Smear(float4 position : SV_Position, float2 texcoord : TEXCOORD0) : SV_TARGET {
    return EdgeSmear(ReShade::BackBuffer, texcoord, BUFFER_PIXEL_SIZE * SmearDistance);
}


technique ESAA {
    pass {
        VertexShader = PostProcessVS;
        PixelShader = PS_EdgeDetection;
        RenderTarget = ESAAEdgesTexture;
    }
    pass {
        VertexShader = PostProcessVS;
        PixelShader = PS_Smear;
    }
}