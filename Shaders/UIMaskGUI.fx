#include "ReShadeUI.fxh"
#include "ReShade.fxh"

// ------------------------------------------------------------------------------------------------------------------------
// UI Masks
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShowMasks <
        ui_label = "Show Masks";
        ui_tooltip = "Show UI masks for ease of configuration.";
        ui_category = "UI Masks";
        ui_category_closed = true;
    > = true;

// ------------------------------------------------------------------------------------------------------------------------
// UI Mask 1
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool MaskEnabled1 <
        ui_label = "UI Mask 1";
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = false;

    uniform int Shape1 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_tooltip = "Shape for the UI Mask.";
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = 0;

    uniform float2 MaskSize1 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for the UI Mask.";
        ui_min = 1.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = float2(200.0, 200.0);

    uniform float2 Offset1 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the UI Mask relative to the window center or mouse cursor.";
        ui_min = BUFFER_SCREEN_SIZE / -2.0;
        ui_max = BUFFER_SCREEN_SIZE / 2.0;
        ui_step = 1.0;
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Feather1 <
        ui_type = "drag";
        ui_label = "Feather";
        ui_tooltip = "Size of the linear gradiant outside the UI mask to blend effect removal.";
        ui_min = 0.0;
        ui_max = BUFFER_SCREEN_SIZE;
        ui_step = 1.0;
        ui_category = "UI Mask 1";
        ui_category_closed = true;
    > = 50.0;

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
// UI Detection
// ------------------------------------------------------------------------------------------------------------------------

    uniform int DetectorBehavior <
        ui_type = "combo";
        ui_label = "Behavior";
        ui_items = "AND\0OR\0";
        ui_tooltip = "Hide effects inside a UI mask when all of its detectors are matched (AND),\n"
                        "or when at least one of its detectors is matched (OR).";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = 0;

    uniform bool ShowDetectors <
        ui_label = "Show Detectors";
        ui_tooltip = "Show UI detectors for ease of configuration.";
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
// Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
    static const float2 PixelOffset = float2(0.5, 0.5);
    static const float4 MaskColors[8] = { float4(0xff, 0xad, 0xad, 0xff), float4(0xff, 0xd6, 0xa5, 0xff), float4(0xfd, 0xff, 0xb6, 0xff), float4(0xca, 0xff, 0xbf, 0xff), float4(0x9b, 0xf6, 0xff, 0xff), float4(0xa0, 0xc4, 0xff, 0xff), float4(0xbd, 0xb2, 0xff, 0xff), float4(0xff, 0xc6, 0xff, 0xff) };
    // Mask Colors: #ffadad #ffd6a5 #fdffb6 #caffbf #9bf6ff #a0c4ff #bdb2ff #ffc6ff

    uniform float2 MousePoint < source = "mousepoint"; >;

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture UIMaskGUITexture <pooled = false; > { Width = 8; Height = 1; Format = R8; };
    sampler UIMaskGUISampler { Texture = UIMaskGUITexture; };

    texture UIMaskGUIBeforeTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler UIMaskGUIBeforeSampler { Texture = UIMaskGUIBeforeTexture;};

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
    
    float4 DrawRectangle(float4 baseColor, float2 basePos, float2 center, float2 fillSize, float4 fillColor, float outlineSize, float4 outlineColor, bool feather) {
        const float sdFill = sdBox(basePos - center, fillSize / 2.0);
        if (sdFill <= 0.0)
            return fillColor;

        if (sdFill <= outlineSize)
            return feather ? float4(outlineColor.rgb, 1.0 - sdFill / outlineSize) : outlineColor;

        return baseColor;
    }

    float4 DrawEllipse(float4 baseColor, float2 basePos, float2 center, float2 fillSize, float4 fillColor, float outlineSize, float4 outlineColor, bool feather) {
        const float sdFill = sdEllipse(basePos - center, fillSize / 2.0);
        if (sdFill <= 0.0)
            return fillColor;

        if (sdFill <= outlineSize)
            return feather ? float4(outlineColor.rgb, 1.0 - sdFill / outlineSize) : outlineColor;

        return baseColor;
    }

    float4 DrawTriangle(float4 baseColor, float2 basePos, float2 center, float2 fillSize, float4 fillColor, float outlineSize, float4 outlineColor, bool feather) {
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

    float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float rotation, float outlineSize, float4 outlineColor, bool feather) {
        if (rotation > 0.0) {
            rotation = -radians(rotation);
            basePos = float4((basePos.x - fillPos.x) * cos(rotation) - (basePos.y - fillPos.y) * sin(rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(rotation) + (basePos.y - fillPos.y) * cos(rotation) + fillPos.y, 0.0, 0.0);
        }
        
        if (shape == 1) return DrawTriangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, outlineSize, outlineColor, feather);
        if (shape == 2) return DrawEllipse(baseColor, basePos.xy, fillPos, fillSize, fillColor, outlineSize, outlineColor, feather);
        return DrawRectangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, outlineSize, outlineColor, feather);
    }

    float2 GetBoundingBoxVertex(int id, int shape, float2 center, float2 fillSize, float rotation, float outlineSize) {
        float2 retVal;
        retVal.x = (id < 2) ?
            center.x - fillSize.x / 2.0 -  outlineSize :
            center.x + fillSize.x / 2.0 +  outlineSize;
            
        if (shape == 1) { //triangle
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
            retVal.xy = float2((retVal.x - center.x) * cos(rotation) - (retVal.y - center.y) * sin(rotation) + center.x, (retVal.x - center.x) * sin(rotation) + (retVal.y - center.y) * cos(rotation) + center.y);
        }

        retVal /= BUFFER_SCREEN_SIZE;
        
        return retVal;
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

    void VS_AfterMask1(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
        // TODO: add ui detectors check
        const bool applyMask = MaskEnabled1;
        const float2 maskPos = (MaskFollowCursor1 ? MousePoint : CenterPoint) + Offset1;
        texcoord.xy = applyMask ? GetBoundingBoxVertex(id, Shape1, maskPos, MaskSize1, Rotation1, Feather1) : float2(0.0, 0.0);
        position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float4 PS_Before(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        return tex2Dfetch(ReShade::BackBuffer, floor(pos.xy), 0);
    }

    float4 PS_AfterMask1(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        float2 maskPos = (MaskFollowCursor1 ? MousePoint : CenterPoint) + Offset1;
        float4 maskColor = MaskColors[0] / 255.0;
        float4 color = float4(0.0, 0.0, 0.0, 0.0);
        
        color = DrawShape(Shape1, color, pos, maskPos, MaskSize1, maskColor, Rotation1, Feather1, maskColor, true);
        if (ShowMasks) return color;

        color.rgb = tex2Dfetch(UIMaskGUIBeforeSampler, floor(pos.xy), 0).rgb;
        return color;
    }

// ------------------------------------------------------------------------------------------------------------------------
// Techniques
// ------------------------------------------------------------------------------------------------------------------------

    technique UIMaskBefore <
        ui_label = "UI Mask Before";
        ui_tooltip = "Order this before the effects you want to mask.";
    > {
        // pass detector {
        //     VertexShader = PostProcessVS;
        //     PixelShader = PS_UIDetect;
        //     RenderTarget = UIDetectGUITexture;
        // }
        pass Before {
            VertexShader = PostProcessVS;
            PixelShader = PS_Before;
            RenderTarget = UIMaskGUIBeforeTexture;
        }
    }

    technique UIMaskAfter <
        ui_label = "UI Mask After";
        ui_tooltip = "Order this after the effects you want to mask.";
    > {
        pass AfterMask1 {
            PrimitiveTopology = TRIANGLESTRIP;
            VertexCount = 4;
            VertexShader = VS_AfterMask1;
            PixelShader = PS_AfterMask1;    
            BlendEnable = true;
            SrcBlend = SRCALPHA;
            DestBlend = INVSRCALPHA;
        }
    }