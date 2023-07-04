#include "ReShadeUI.fxh";

// ------------------------------------------------------------------------------------------------------------------------
// Debug
// ------------------------------------------------------------------------------------------------------------------------

uniform float3 DebugColor <
    ui_type = "color";
    ui_label = "Debug Color";
    ui_category = "Debug";
    ui_tooltip = "Background color when Show Debug is enabled.";
> = float3(1, 1, 1);

uniform bool ShowDebug <
    ui_label = "Show Debug";
    ui_tooltip = "Render only crosshair.";
    ui_category = "Debug";
    ui_category_closed = true;
> = false;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair
// ------------------------------------------------------------------------------------------------------------------------

uniform float2 Offset <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and vertical offset for the crosshair relative to the window center.";
    ui_category = "Crosshair";
    ui_category_closed = true;
> = float2(0, 0);

uniform int Antialiasing <
    ui_type = "combo";
    ui_label = "Antialiasing";
    ui_tooltip = "Applies Super Sampling Antialiasing. Disable for performance or to use a different AA (i.e. SMAA, FXAA).";
    ui_items = "None\0SSAA x4\0";
    // ui_items = "None\0SSAA x4\0SSAA x8\0SSAA x16\0";
    ui_category = "Crosshair";
> = 0;

uniform bool FollowCursor <
    ui_label = "Follow Cursor";
    ui_tooltip = "Apply crosshair relative to mouse cursor instead of the window center.";
    ui_category = "Crosshair";
> = false;


// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 1
// ------------------------------------------------------------------------------------------------------------------------

uniform bool ShapeEnabled1 <
    ui_label = "Shape 1";
    ui_category = "Crosshair";
    ui_spacing = 2;
> = true;

uniform int Shape1 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Triangle\0Ellipse\0";
    ui_category = "Crosshair";
> = 1;

uniform int Anchor1 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Crosshair";
> = 3;

uniform float2 Offset1 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
    ui_category = "Crosshair";
> = float2(5, 0);

uniform float2 FillSize1 <
    ui_type = "drag";
    ui_label = "Fill Size";
    ui_min = 1;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(10,3);

uniform float4 FillColor1 <
    ui_type = "color";
    ui_label = "Fill Color";
    ui_category = "Crosshair";
> = float4(1, 1, 1, 0.9f);

uniform float OutlineSize1 <
    ui_type = "drag";
    ui_label = "Outline Size";
    ui_min = 0;
    ui_max = 200.0f;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 1.0f;

uniform float4 OutlineColor1 <
    ui_type = "color";
    ui_label = "Outline Color";
    ui_category = "Crosshair";
> = float4(0, 0, 0, 0.9f);

uniform float2 GapSize1 <
    ui_type = "drag";
    ui_label = "Gap Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,0);

uniform float2 GapOffset1 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Gap Offset";
	ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
    ui_category = "Crosshair";
> = float2(0, 0);

uniform float Rotation1 <
    ui_type = "drag";
    ui_label = "Rotation";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0;

uniform float Skew1 <
    ui_type = "drag";
    ui_label = "Skew";
    ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
    ui_min = -90;
    ui_max = 90;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float2 Section1 <
    ui_type = "drag";
    ui_label = "Section";
    ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,360);

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 2
// ------------------------------------------------------------------------------------------------------------------------

uniform bool ShapeEnabled2 <
    ui_label = "Shape 2";
    ui_category = "Crosshair";
    ui_spacing = 2;
> = true;

uniform int Shape2 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Triangle\0Ellipse\0";
    ui_category = "Crosshair";
> = 1;

uniform int Anchor2 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Crosshair";
> = 1;

uniform float2 Offset2 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
    ui_category = "Crosshair";
> = float2(0, 5);

uniform float2 FillSize2 <
    ui_type = "drag";
    ui_label = "Fill Size";
    ui_min = 1;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(3,10);

uniform float4 FillColor2 <
    ui_type = "color";
    ui_label = "Fill Color";
    ui_category = "Crosshair";
> = float4(1, 1, 1, 0.9f);

uniform float OutlineSize2 <
    ui_type = "drag";
    ui_label = "Outline Size";
    ui_min = 0;
    ui_max = 200.0f;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 1.0f;

uniform float4 OutlineColor2 <
    ui_type = "color";
    ui_label = "Outline Color";
    ui_category = "Crosshair";
> = float4(0, 0, 0, 0.9f);

uniform float2 GapSize2 <
    ui_type = "drag";
    ui_label = "Gap Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,0);

uniform float2 GapOffset2 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Gap Offset";
	ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
    ui_category = "Crosshair";
> = float2(0, 0);

uniform float Rotation2 <
    ui_type = "drag";
    ui_label = "Rotation";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float Skew2 <
    ui_type = "drag";
    ui_label = "Skew";
    ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
    ui_min = -90;
    ui_max = 90;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float2 Section2 <
    ui_type = "drag";
    ui_label = "Section";
    ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,360);

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 3
// ------------------------------------------------------------------------------------------------------------------------

uniform bool ShapeEnabled3 <
    ui_label = "Shape 3";
    ui_category = "Crosshair";
    ui_spacing = 2;
> = true;

uniform int Shape3 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Triangle\0Ellipse\0";
    ui_category = "Crosshair";
> = 1;

uniform int Anchor3 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Crosshair";
> = 5;

uniform float2 Offset3 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
    ui_category = "Crosshair";
> = float2(-5, 0);

uniform float2 FillSize3 <
    ui_type = "drag";
    ui_label = "Fill Size";
    ui_min = 1;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(10,3);

uniform float4 FillColor3 <
    ui_type = "color";
    ui_label = "Fill Color";
    ui_category = "Crosshair";
> = float4(1, 1, 1, 0.9f);

uniform float OutlineSize3 <
    ui_type = "drag";
    ui_label = "Outline Size";
    ui_min = 0;
    ui_max = 200.0f;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 1.0f;

uniform float4 OutlineColor3 <
    ui_type = "color";
    ui_label = "Outline Color";
    ui_category = "Crosshair";
> = float4(0, 0, 0, 0.9f);

uniform float2 GapSize3 <
    ui_type = "drag";
    ui_label = "Gap Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,0);

uniform float2 GapOffset3 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Gap Offset";
	ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
    ui_category = "Crosshair";
> = float2(0, 0);

uniform float Rotation3 <
    ui_type = "drag";
    ui_label = "Rotation";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float Skew3 <
    ui_type = "drag";
    ui_label = "Skew";
    ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
    ui_min = -90;
    ui_max = 90;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float2 Section3 <
    ui_type = "drag";
    ui_label = "Section";
    ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,360);

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 4
// ------------------------------------------------------------------------------------------------------------------------

uniform bool ShapeEnabled4 <
    ui_label = "Shape 4";
    ui_category = "Crosshair";
    ui_spacing = 2;
> = true;

uniform int Shape4 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Triangle\0Ellipse\0";
    ui_category = "Crosshair";
> = 1;

uniform int Anchor4 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Crosshair";
> = 7;

uniform float2 Offset4 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
    ui_category = "Crosshair";
> = float2(0, -5);

uniform float2 FillSize4 <
    ui_type = "drag";
    ui_label = "Fill Size";
    ui_min = 1;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(3,10);

uniform float4 FillColor4 <
    ui_type = "color";
    ui_label = "Fill Color";
    ui_category = "Crosshair";
> = float4(1, 1, 1, 0.9f);

uniform float OutlineSize4 <
    ui_type = "drag";
    ui_label = "Outline Size";
    ui_min = 0;
    ui_max = 200.0f;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 1.0f;

uniform float4 OutlineColor4 <
    ui_type = "color";
    ui_label = "Outline Color";
    ui_category = "Crosshair";
> = float4(0, 0, 0, 0.9f);

uniform float2 GapSize4 <
    ui_type = "drag";
    ui_label = "Gap Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,0);

uniform float2 GapOffset4 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Gap Offset";
	ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
    ui_category = "Crosshair";
> = float2(0, 0);

uniform float Rotation4 <
    ui_type = "drag";
    ui_label = "Rotation";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float Skew4 <
    ui_type = "drag";
    ui_label = "Skew";
    ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
    ui_min = -90;
    ui_max = 90;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float2 Section4 <
    ui_type = "drag";
    ui_label = "Section";
    ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,360);

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 5
// ------------------------------------------------------------------------------------------------------------------------

uniform bool ShapeEnabled5 <
    ui_label = "Shape 5";
    ui_category = "Crosshair";
    ui_spacing = 2;
> = false;

uniform int Shape5 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Triangle\0Ellipse\0";
    ui_category = "Crosshair";
> = 1;

uniform int Anchor5 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Crosshair";
> = 3;

uniform float2 Offset5 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
    ui_category = "Crosshair";
> = float2(5, 0);

uniform float2 FillSize5 <
    ui_type = "drag";
    ui_label = "Fill Size";
    ui_min = 1;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(10,3);

uniform float4 FillColor5 <
    ui_type = "color";
    ui_label = "Fill Color";
    ui_category = "Crosshair";
> = float4(1, 1, 1, 0.9f);

uniform float OutlineSize5 <
    ui_type = "drag";
    ui_label = "Outline Size";
    ui_min = 0;
    ui_max = 200.0f;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 1.0f;

uniform float4 OutlineColor5 <
    ui_type = "color";
    ui_label = "Outline Color";
    ui_category = "Crosshair";
> = float4(0, 0, 0, 0.9f);

uniform float2 GapSize5 <
    ui_type = "drag";
    ui_label = "Gap Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,0);

uniform float2 GapOffset5 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Gap Offset";
	ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
    ui_category = "Crosshair";
> = float2(0, 0);

uniform float Rotation5 <
    ui_type = "drag";
    ui_label = "Rotation";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0;

uniform float Skew5 <
    ui_type = "drag";
    ui_label = "Skew";
    ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
    ui_min = -90;
    ui_max = 90;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float2 Section5 <
    ui_type = "drag";
    ui_label = "Section";
    ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,360);

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 6
// ------------------------------------------------------------------------------------------------------------------------

uniform bool ShapeEnabled6 <
    ui_label = "Shape 6";
    ui_category = "Crosshair";
    ui_spacing = 2;
> = false;

uniform int Shape6 <
    ui_type = "combo";
    ui_label = "Shape";
    ui_items = "None\0Rectangle\0Triangle\0Ellipse\0";
    ui_category = "Crosshair";
> = 1;

uniform int Anchor6 <
    ui_type = "combo";
    ui_label = "Anchor";
    ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
    ui_category = "Crosshair";
> = 3;

uniform float2 Offset6 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Offset";
	ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
    ui_category = "Crosshair";
> = float2(5, 0);

uniform float2 FillSize6 <
    ui_type = "drag";
    ui_label = "Fill Size";
    ui_min = 1;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(10,3);

uniform float4 FillColor6 <
    ui_type = "color";
    ui_label = "Fill Color";
    ui_category = "Crosshair";
> = float4(1, 1, 1, 0.9f);

uniform float OutlineSize6 <
    ui_type = "drag";
    ui_label = "Outline Size";
    ui_min = 0;
    ui_max = 200.0f;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 1.0f;

uniform float4 OutlineColor6 <
    ui_type = "color";
    ui_label = "Outline Color";
    ui_category = "Crosshair";
> = float4(0, 0, 0, 0.9f);

uniform float2 GapSize6 <
    ui_type = "drag";
    ui_label = "Gap Size";
    ui_min = 0;
    ui_max = 1000;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,0);

uniform float2 GapOffset6 <
    ui_type = "drag";
	ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_label = "Gap Offset";
	ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
    ui_category = "Crosshair";
> = float2(0, 0);

uniform float Rotation6 <
    ui_type = "drag";
    ui_label = "Rotation";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0;

uniform float Skew6 <
    ui_type = "drag";
    ui_label = "Skew";
    ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
    ui_min = -90;
    ui_max = 90;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = 0.0f;

uniform float2 Section6 <
    ui_type = "drag";
    ui_label = "Section";
    ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
    ui_min = 0;
    ui_max = 360;
    ui_step = 1.0f;
    ui_category = "Crosshair";
> = float2(0,360);

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection
// ------------------------------------------------------------------------------------------------------------------------

uniform int DetectorBehavior <
    ui_type = "combo";
    ui_label = "Behavior";
    ui_items = "AND\0OR\0";
    ui_tooltip = "Show crosshair when all detectors are matched (AND), or when at least one detector is matched (OR).";
    ui_category = "UI Detection";
> = 0;

uniform bool ShowDetectors <
    ui_label = "Show Detectors";
    ui_tooltip = "Show detectors for ease of configuration.";
    ui_category = "UI Detection";
    ui_category_closed = true;
> = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 1
// ------------------------------------------------------------------------------------------------------------------------

uniform bool Detector1 <
    ui_label = "Detector 1";
    ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
    ui_category = "UI Detection";
    ui_spacing = 2;
> = false;

uniform float3 DetectorColor1 <
    ui_type = "color";
    ui_label = "Color";
    ui_tooltip = "Color to match for detection.";
    ui_category = "UI Detection";
> = float3(1, 1, 1);

uniform float3 DetectorThreshold1 <
    ui_type = "drag";
    ui_label = "Threshold";
    ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
    ui_min = 0.0f;
    ui_max = 255.0f;
    ui_step = 1.0f;
    ui_category = "UI Detection";
> = float3(15,15,15);

uniform float2 DetectorOffset1 <
    ui_type = "drag";
    ui_label = "Offset";
    ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
    ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_category = "UI Detection";
> = 0.0f;

uniform bool DetectorFollowCursor1 <
    ui_label = "Follow Cursor";
    ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
    ui_category = "UI Detection";
> = false;

uniform bool DetectorInverted1 <
    ui_label = "Inverted Matching";
    ui_tooltip = "Inverse the matched and not matched states.";
    ui_category = "UI Detection";
> = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 2
// ------------------------------------------------------------------------------------------------------------------------

uniform bool Detector2 <
    ui_label = "Detector 2";
    ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
    ui_category = "UI Detection";
    ui_spacing = 2;
> = false;

uniform float3 DetectorColor2 <
    ui_type = "color";
    ui_label = "Color";
    ui_tooltip = "Color to match for detection.";
    ui_category = "UI Detection";
> = float3(1, 1, 1);

uniform float3 DetectorThreshold2 <
    ui_type = "drag";
    ui_label = "Threshold";
    ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
    ui_min = 0.0f;
    ui_max = 255.0f;
    ui_step = 1.0f;
    ui_category = "UI Detection";
> = float3(15,15,15);

uniform float2 DetectorOffset2 <
    ui_type = "drag";
    ui_label = "Offset";
    ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
    ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_category = "UI Detection";
> = 0.0f;

uniform bool DetectorFollowCursor2 <
    ui_label = "Follow Cursor";
    ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
    ui_category = "UI Detection";
> = false;

uniform bool DetectorInverted2 <
    ui_label = "Inverted Matching";
    ui_tooltip = "Inverse the matched and not matched states.";
    ui_category = "UI Detection";
> = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 3
// ------------------------------------------------------------------------------------------------------------------------

uniform bool Detector3 <
    ui_label = "Detector 3";
    ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
    ui_category = "UI Detection";
    ui_spacing = 2;
> = false;

uniform float3 DetectorColor3 <
    ui_type = "color";
    ui_label = "Color";
    ui_tooltip = "Color to match for detection.";
    ui_category = "UI Detection";
> = float3(1, 1, 1);

uniform float3 DetectorThreshold3 <
    ui_type = "drag";
    ui_label = "Threshold";
    ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
    ui_min = 0.0f;
    ui_max = 255.0f;
    ui_step = 1.0f;
    ui_category = "UI Detection";
> = float3(15,15,15);

uniform float2 DetectorOffset3 <
    ui_type = "drag";
    ui_label = "Offset";
    ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
    ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
    ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    ui_step = 1.0f;
    ui_category = "UI Detection";
> = 0.0f;

uniform bool DetectorFollowCursor3 <
    ui_label = "Follow Cursor";
    ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
    ui_category = "UI Detection";
> = false;

uniform bool DetectorInverted3 <
    ui_label = "Inverted Matching";
    ui_tooltip = "Inverse the matched and not matched states.";
    ui_category = "UI Detection";
> = false;

// ------------------------------------------------------------------------------------------------------------------------
// Hotkeys
// ------------------------------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------------------------------
// Hidden or Static Variables
// ------------------------------------------------------------------------------------------------------------------------

static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);

uniform float2 MousePoint < source = "mousepoint"; >;

// uniform float2 MouseDelta < source = "mousedelta"; >;
// uniform float FrameTime < source = "frametime"; >;
// uniform bool SpaceBar <source = "key"; keycode = 0x20; mode = ""; >;

/*
To Do:

UI Detection:
Set position and color (height, width, color, threshold, anchor, position)
Show Detector (red border = no match; green border = match)
Invert Detector

Performance optimizations:
Move shape variables and math into uniform globals to prevent recalculating every pixel

- Fix rotation direction.
- Increase shape count.
- Make rectangle outer outline have rounded corners or give triangles sharp corners
- Fix weird triangle inner and outer overlay overlap issue
- option to use png image layer instead of shape
- hotkey enable/disable shapes

*/

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

texture detectorTarget { Width = 3; Height = 1; Format = R8; };
sampler detectorSampler { Texture = detectorTarget; };

texture overlayTarget < pooled = true; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
sampler overlaySampler { Texture = overlayTarget;};

texture overlayTargetSSAAx4 < pooled = true; > { Width = BUFFER_WIDTH * 2.0; Height = BUFFER_HEIGHT * 2.0; Format = RGBA8; };
sampler overlaySamplerSSAAx4 { Texture = overlayTargetSSAAx4;};

// texture overlayTargetSSAAx8 < pooled = true; > { Width = BUFFER_WIDTH * 3.0; Height = BUFFER_HEIGHT * 3.0; Format = RGBA8; };
// sampler overlaySamplerSSAAx8 { Texture = overlayTargetSSAAx8;};

// texture overlayTargetSSAAx16 < pooled = true; > { Width = BUFFER_WIDTH * 4.0; Height = BUFFER_HEIGHT * 4.0; Format = RGBA8; };
// sampler overlaySamplerSSAAx16 { Texture = overlayTargetSSAAx16;};

#include "ReShade.fxh";

// ------------------------------------------------------------------------------------------------------------------------
// Structs
// ------------------------------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------------------------------
// Functions
// ------------------------------------------------------------------------------------------------------------------------

float2 GetAnchorOffset(int anchor) {
    switch (anchor) {
        default:
        case 0: // Top Left
            return float2(0, 0);
        case 1: // Top Center
            return float2(0.5f, 0);
        case 2: // Top Right
            return float2(1.0f, 0);
        case 3: // Center Left
            return float2(0, 0.5f);
        case 4: // Center
            return float2(0.5f, 0.5f);
        case 5: // Center Right
            return float2(1.0f, 0.5f);
        case 6: // Bottom Left
            return float2(0, 1.0f);
        case 7: // Bottom Center
            return float2(0.5f, 1.0f);
        case 8: //Bottom Right
            return float2(1.0f, 1.0f);
    }
}

float4 DrawColor(float4 baseColor, float4 newColor) {
    if (baseColor.a > 0.0f && newColor.a < 1.0f)
        return lerp(baseColor, newColor, newColor.a);
    else
        return newColor;
}

float4 DrawRectangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float2 anchorOffset) {
    const float2 fillStartPos = fillPos - fillSize * anchorOffset;
    const float2 fillEndPos = fillStartPos + fillSize;
    const float2 gapStartPos = fillStartPos + fillSize / 2.0 - gapSize / 2.0f + gapOffset;
    const float2 gapEndPos = gapStartPos + gapSize;
    if (basePos.x >= fillStartPos.x && basePos.x < fillEndPos.x && basePos.y >= fillStartPos.y && basePos.y < fillEndPos.y)
        if (gapSize.x == 0 || gapSize.y == 0 || basePos.x < gapStartPos.x || basePos.x >= gapEndPos.x || basePos.y < gapStartPos.y || basePos.y >= gapEndPos.y)
            return DrawColor(baseColor, fillColor);
    
    if (outlineSize > 0)
        if (basePos.x >= fillStartPos.x - outlineSize && basePos.x < fillEndPos.x + outlineSize && basePos.y >= fillStartPos.y - outlineSize && basePos.y < fillEndPos.y + outlineSize)
            if (gapSize.x == 0
                || gapSize.y == 0
                    || outlineSize >= gapSize.x / 2
                        || outlineSize >= gapSize.y / 2
                            || basePos.x < gapStartPos.x + outlineSize
                                || basePos.x >= gapEndPos.x - outlineSize
                                    || basePos.y < gapStartPos.y + outlineSize
                                        || basePos.y >= gapEndPos.y - outlineSize)
                return DrawColor(baseColor, outlineColor);

    return baseColor;
}

float4 DrawEllipse(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float2 anchorOffset, float2 section) {
    if (fillSize.x < 1 || fillSize.y < 1 || section.x >= section.y || section.y <= section.x)
        return baseColor;
    
    const float2 centerPos = float2(fillPos.x + fillSize.x * (0.5f - anchorOffset.x), fillPos.y + fillSize.y * (0.5f - anchorOffset.y));
    const float2 centeredPos = basePos - centerPos;
    const float centeredAngle = degrees(atan2(centeredPos.y, centeredPos.x)) + 180.0f;
    const float2 gappedPos = centeredPos + gapOffset;
    if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f, 2) <= 1)
        if (gapSize.x == 0 || gapSize.y == 0 || pow(gappedPos.x, 2) / pow(gapSize.x / 2.0f, 2) + pow(gappedPos.y, 2) / pow(gapSize.y / 2.0f, 2) > 1)
            if (centeredAngle >= section.x && (centeredAngle < section.y || section.y == 360))
                return DrawColor(baseColor, fillColor);

    if (outlineSize > 0) {
        if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f + outlineSize, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f + outlineSize, 2) <= 1) {
            if (gapSize.x == 0 || gapSize.y == 0 || outlineSize >= gapSize.x / 2 || outlineSize >= gapSize.y / 2 || pow(gappedPos.x, 2) / pow(gapSize.x / 2.0f - outlineSize, 2) + pow(gappedPos.y, 2) / pow(gapSize.y / 2.0f - outlineSize, 2) > 1) {
                if (centeredAngle >= section.x && (centeredAngle < section.y || section.y == 360)) 
                    return DrawColor(baseColor, outlineColor);
                else if (section.x > 0 || section.y < 360) {
                    float2 rotatedPos = float2((basePos.x - centerPos.x) * cos(-radians(section.x)) - (basePos.y - centerPos.y) * sin(-radians(section.x)) + centerPos.x, (basePos.x - centerPos.x) * sin(-radians(section.x)) + (basePos.y - centerPos.y) * cos(-radians(section.x)) + centerPos.y);
                    float2 fillStartPos = centerPos - float2(fillPos.x + outlineSize, 0);
                    float2 fillEndPos = centerPos + float2(0, outlineSize);
                    if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                        return DrawColor(baseColor, outlineColor);
                    
                    rotatedPos = float2((basePos.x - centerPos.x) * cos(-radians(section.y)) - (basePos.y - centerPos.y) * sin(-radians(section.y)) + centerPos.x, (basePos.x - centerPos.x) * sin(-radians(section.y)) + (basePos.y - centerPos.y) * cos(-radians(section.y)) + centerPos.y);
                    fillStartPos = centerPos - float2(fillPos.x + outlineSize, outlineSize);
                    fillEndPos = centerPos;
                    if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                        return DrawColor(baseColor, outlineColor);
                    
                    if (pow(centeredPos.x, 2) + pow(centeredPos.y, 2) < pow(outlineSize, 2)) 
                        return DrawColor(baseColor, outlineColor);
                }
            }
        }
    }

    return baseColor;
}

float4 DrawTriangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float2 anchorOffset, float skew) {
    if (anchorOffset.y == 0.5f)
        anchorOffset.y = 2.0f / 3.0f;
    
    const float2 centerPos = float2(fillPos.x + fillSize.x * (0.5f - anchorOffset.x), fillPos.y + fillSize.y * (2.0f / 3.0f - anchorOffset.y));

    const float2 A = float2 (centerPos.x - fillSize.x / 2.0 * (1 + skew / 90.0f), centerPos.y + fillSize.y / 3.0);
    const float2 B = float2 (centerPos.x + fillSize.x * skew / 90.0f, centerPos.y - fillSize.y * 2.0 / 3.0);
    const float2 C = float2 (centerPos.x + fillSize.x / 2.0 * (1 - skew / 90.0f), centerPos.y + fillSize.y / 3.0);
    
    // // Debugging skew
    // const float2 avgCenter = (A + B + C) / 3.0f;
    // if (distance(basePos, centerPos) <= 3) return float4(1,0,0,1);
    // if (distance(basePos, avgCenter) <= 3) return float4(0,0,1,1);
    
    const float2 AP = basePos - A;
    const float2 BP = basePos - B;
    const float2 CP = basePos - C;

    const float2 AB = B - A;
    const float2 BC = C - B;
    const float2 CA = A - C;

    const bool inTriangle = (AB.x * AP.y - AB.y * AP.x > 0) == (BC.x * BP.y - BC.y * BP.x > 0) && (AB.x * AP.y - AB.y * AP.x > 0) == (CA.x * CP.y - CA.y * CP.x > 0);
    bool inTriangleGap = false;

    float rotation;
    float2 rotatedPos;
    float2 fillStartPos;
    float2 fillEndPos;

    if (gapSize.x > 0 && gapSize.y > 0) {
        const float2 D = float2 (centerPos.x - gapSize.x / 2.0 * (1 + skew / 90.0f), centerPos.y + gapSize.y / 3.0) + gapOffset;
        const float2 E = float2 (centerPos.x + gapSize.x * skew / 90.0f, centerPos.y - gapSize.y * 2.0 / 3.0) + gapOffset;
        const float2 F = float2 (centerPos.x + gapSize.x / 2.0 * (1 - skew / 90.0f), centerPos.y + gapSize.y / 3.0) + gapOffset;
        
        const float2 DP = basePos - D;
        const float2 EP = basePos - E;
        const float2 FP = basePos - F;

        const float2 DE = E - D;
        const float2 EF = F - E;
        const float2 FD = D - F;
        
        inTriangleGap = ((DE.x * DP.y - DE.y * DP.x > 0) == (EF.x * EP.y - EF.y * EP.x > 0) && (DE.x * DP.y - DE.y * DP.x > 0) == (FD.x * FP.y - FD.y * FP.x > 0));
        
        // inside fill with gap
        if (inTriangle && !inTriangleGap) 
            return DrawColor(baseColor, fillColor);

        // inside outline
        if (inTriangle && inTriangleGap && outlineSize > 0) {
            rotation = 0;
            rotatedPos = float2((basePos.x - D.x) * cos(-rotation) - (basePos.y - D.y) * sin(-rotation) + D.x, (basePos.x - D.x) * sin(-rotation) + (basePos.y - D.y) * cos(-rotation) + D.y);
            fillStartPos = D + float2(0, -outlineSize);
            fillEndPos = D + float2(F.x - D.x, 0);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                return DrawColor(baseColor, outlineColor);

            rotation = atan(gapSize.y / (F.x - E.x));
            if (skew <= 30)
                rotation += radians(180);
            rotatedPos = float2((basePos.x - F.x) * cos(-rotation) - (basePos.y - F.y) * sin(-rotation) + F.x, (basePos.x - F.x) * sin(-rotation) + (basePos.y - F.y) * cos(-rotation) + F.y);
            fillStartPos = F + float2(0, -outlineSize);
            fillEndPos = F + float2(distance(F,E), 0);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                return DrawColor(baseColor, outlineColor);

            rotation = atan(gapSize.y / (D.x - E.x));
            if (skew > -30)
                rotation += radians(180);
            rotatedPos = float2((basePos.x - D.x) * cos(-rotation) - (basePos.y - D.y) * sin(-rotation) + D.x, (basePos.x - D.x) * sin(-rotation) + (basePos.y - D.y) * cos(-rotation) + D.y);
            fillStartPos = D - float2(distance(E,D), outlineSize);
            fillEndPos = D + float2(0, 0);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                return DrawColor(baseColor, outlineColor);
        }

        // inside outline intersection with outside outline
        if (!inTriangle && inTriangleGap && outlineSize > 0) {
            // get slope: y1 - y2 = mx1 + b - mx2 - b | m = (y1 - y2) / (x1 - x2)
            const float ACm = (C.y - A.y) / (C.x - A.x);
            const float ABm = (B.y - A.y) / (B.x - A.x);
            const float BCm = (C.y - B.y) / (C.x - B.x);
            const float DFm = (F.y - D.y) / (F.x - D.x);
            const float DEm = (E.y - D.y) / (E.x - D.x);
            const float EFm = (F.y - E.y) / (F.x - E.x);
            
            // get y intercept: y = mx + b | b = y - mx
            const float ACb = A.y - ACm * A.x;
            const float ABb = A.y - ABm * A.x;
            const float BCb = B.y - BCm * B.x;
            const float DFb = D.y - DFm * D.x;
            const float DEb = D.y - DEm * D.x;
            const float EFb = E.y - EFm * E.x;
            
            // find intersect
            const float2 ACDE = float2((DEb - ACb) / (ACm - DEm), ACm * (DEb - ACb) / (ACm - DEm) + ACb);
            const float2 ACEF = float2((EFb - ACb) / (ACm - EFm), ACm * (EFb - ACb) / (ACm - EFm) + ACb);
            // AC cannot intersect DF, always parallel
            const float2 ABDF = float2((DFb - ABb) / (ABm - DFm), ABm * (DFb - ABb) / (ABm - DFm) + ABb);
            const float2 ABDE = float2((DEb - ABb) / (ABm - DEm), ABm * (DEb - ABb) / (ABm - DEm) + ABb);
            const float2 ABEF = float2((EFb - ABb) / (ABm - EFm), ABm * (EFb - ABb) / (ABm - EFm) + ABb);
            const float2 BCDF = float2((DFb - BCb) / (BCm - DFm), BCm * (DFb - BCb) / (BCm - DFm) + BCb);
            const float2 BCDE = float2((DEb - BCb) / (BCm - DEm), BCm * (DEb - BCb) / (BCm - DEm) + BCb);
            const float2 BCEF = float2((EFb - BCb) / (BCm - EFm), BCm * (EFb - BCb) / (BCm - EFm) + BCb);

            // // debugging visualizer
            // outlineColor = float4(1,0,0,1);

            // // if (distance(basePos, float2(basePos.x, EFm * basePos.x + EFb)) <= outlineSize)
            // //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);

            // if (distance(basePos, A) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, B) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, C) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, D) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, E) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, F) <= outlineSize)
            //     return lerp(baseColor, float4(0,0,1,1), outlineColor.a);
            // if (distance(basePos, ACDE) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, ACEF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, ABDF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, ABDE) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, ABEF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, BCDF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, BCDE) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            // if (distance(basePos, BCEF) <= outlineSize)
            //     return lerp(baseColor, outlineColor, outlineColor.a);
            
            // test intersect
            if (distance(basePos, ACDE) <= outlineSize && dot(ACDE - A, C - A) >= 0 && dot(ACDE - A, C - A) < dot(C - A, C - A) && dot(ACDE - E, D - E) >= 0 && dot(ACDE - E, D - E) < dot(D - E, D - E)) 
                return DrawColor(baseColor, outlineColor);
            if (distance(basePos, ACEF) <= outlineSize && dot(ACEF - A, C - A) >= 0 && dot(ACEF - A, C - A) < dot(C - A, C - A) && dot(ACEF - F, E - F) >= 0 && dot(ACEF - F, E - F) < dot(E - F, E - F)) 
                return DrawColor(baseColor, outlineColor);
            if (distance(basePos, ABDF) <= outlineSize && dot(ABDF - A, B - A) >= 0 && dot(ABDF - A, B - A) < dot(B - A, B - A) && dot(ABDF - F, D - F) >= 0 && dot(ABDF - F, D - F) < dot(D - F, D - F)) 
                return DrawColor(baseColor, outlineColor);
            if (distance(basePos, ABDE) <= outlineSize && dot(ABDE - A, B - A) >= 0 && dot(ABDE - A, B - A) < dot(B - A, B - A) && dot(ABDE - E, D - E) >= 0 && dot(ABDE - E, D - E) < dot(D - E, D - E)) 
                return DrawColor(baseColor, outlineColor);
            if (distance(basePos, ABEF) <= outlineSize && dot(ABEF - A, B - A) >= 0 && dot(ABEF - A, B - A) < dot(B - A, B - A) && dot(ABEF - E, F - E) >= 0 && dot(ABEF - E, F - E) < dot(F - E, F - E)) 
                return DrawColor(baseColor, outlineColor);
            if (distance(basePos, BCDF) <= outlineSize && dot(BCDF - B, C - B) >= 0 && dot(BCDF - B, C - B) < dot(C - B, C - B) && dot(BCDF - F, D - F) >= 0 && dot(BCDF - F, D - F) < dot(D - F, D - F)) 
                return DrawColor(baseColor, outlineColor);
            if (distance(basePos, BCDE) <= outlineSize && dot(BCDE - B, C - B) >= 0 && dot(BCDE - B, C - B) < dot(C - B, C - B) && dot(BCDE - E, D - E) >= 0 && dot(BCDE - E, D - E) < dot(D - E, D - E)) 
                return DrawColor(baseColor, outlineColor);
            if (distance(basePos, BCEF) <= outlineSize && dot(BCEF - B, C - B) >= 0 && dot(BCEF - B, C - B) < dot(C - B, C - B) && dot(BCEF - E, F - E) >= 0 && dot(BCEF - E, F - E) < dot(F - E, F - E)) 
                return DrawColor(baseColor, outlineColor);
        }
    }

    // inside fill with no gap
    if (inTriangle && !inTriangleGap) 
        return DrawColor(baseColor, fillColor);
    
    // outside outline
    if (!inTriangle && !inTriangleGap && outlineSize > 0) {
        if (distance(basePos, A) < outlineSize) 
            return DrawColor(baseColor, outlineColor);
        if (distance(basePos, B) < outlineSize) 
            return DrawColor(baseColor, outlineColor);
        if (distance(basePos, C) < outlineSize) 
            return DrawColor(baseColor, outlineColor);

        rotation = 0;
        rotatedPos = float2((basePos.x - A.x) * cos(-rotation) - (basePos.y - A.y) * sin(-rotation) + A.x, (basePos.x - A.x) * sin(-rotation) + (basePos.y - A.y) * cos(-rotation) + A.y);
        fillStartPos = A;
        fillEndPos = A + float2(C.x - A.x, outlineSize);
        if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
            return DrawColor(baseColor, outlineColor);

        rotation = atan(fillSize.y / (C.x - B.x));
        if (skew <= 30)
            rotation += radians(180);
        rotatedPos = float2((basePos.x - C.x) * cos(-rotation) - (basePos.y - C.y) * sin(-rotation) + C.x, (basePos.x - C.x) * sin(-rotation) + (basePos.y - C.y) * cos(-rotation) + C.y);
        fillStartPos = C;
        fillEndPos = C + float2(distance(C,B), outlineSize);
        if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
            return DrawColor(baseColor, outlineColor);

        rotation = atan(fillSize.y / (A.x - B.x));
        if (skew > -30)
            rotation += radians(180);
        rotatedPos = float2((basePos.x - A.x) * cos(-rotation) - (basePos.y - A.y) * sin(-rotation) + A.x, (basePos.x - A.x) * sin(-rotation) + (basePos.y - A.y) * cos(-rotation) + A.y);
        fillStartPos = A - float2(distance(B,A), 0);
        fillEndPos = A + float2(0, outlineSize);
        if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
            return DrawColor(baseColor, outlineColor);
    }

    return baseColor;
}

float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float rotation, int anchor, float2 section, float skew) {
    switch (Antialiasing) {
        case 0:
        default:
            break;
        case 1:
            fillPos *= 2.0f;
            fillSize *= 2.0f;
            gapSize *= 2.0f;
            gapOffset *= 2.0f;
            outlineSize *= 2.0f;
            break;
        case 2:
            fillPos *= 3.0f;
            fillSize *= 3.0f;
            gapSize *= 3.0f;
            gapOffset *= 3.0f;
            outlineSize *= 3.0f;
            break;
        case 3:
            fillPos *= 4.0f;
            fillSize *= 4.0f;
            gapSize *= 4.0f;
            gapOffset *= 4.0f;
            outlineSize *= 4.0f;
            break;
    }

    if (rotation > 0) {
        rotation = radians(rotation);
        basePos = float4((basePos.x - fillPos.x) * cos(-rotation) - (basePos.y - fillPos.y) * sin(-rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(-rotation) + (basePos.y - fillPos.y) * cos(-rotation) + fillPos.y, 0, 0);
    }
    
    switch (shape) {
        case 0:
        default:
            return baseColor;
        case 1:
            return DrawRectangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, GetAnchorOffset(anchor));
        case 2:
            return DrawTriangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, GetAnchorOffset(anchor), skew);
        case 3:
            return DrawEllipse(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, GetAnchorOffset(anchor), section);
    }
}

bool DetectorMatch(float4 color, float3 detectorColor, float3 detectorThreshold, bool inverted) {
    if (abs(color.r - detectorColor.r) <= detectorThreshold.r / 255.0f
        && abs(color.g - detectorColor.g) <= detectorThreshold.g / 255.0f
            && abs(color.b - detectorColor.b) <= detectorThreshold.b / 255.0f)
        return !inverted;
    
    return inverted;
}

float4 DrawShapes(float4 color, float4 pos) {
    if (ShowDebug) color = float4(DebugColor.rgb, 0);

    const bool detectorMatched1 = tex2D(detectorSampler, float2(0, 0) / 3.0f).r > 0.0f;
    const bool detectorMatched2 = tex2D(detectorSampler, float2(1, 0) / 3.0f).r > 0.0f;
    const bool detectorMatched3 = tex2D(detectorSampler, float2(2, 0) / 3.0f).r > 0.0f;
    
    if (ShowDetectors) {
        if (Detector1) {
            const float2 detectorPos = (DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1;
            const float4 outlineColor = detectorMatched1 ? float4(0,1,0,1) : float4(1,0,0,1);
            color = DrawShape(3, color, pos, detectorPos, float2(6,6), float4(DetectorColor1, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 0.0f, 4, float2(0.0f, 360.0f), 0.0f);
        }
        if (Detector2) {
            const float2 detectorPos = (DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2;
            const float4 outlineColor = detectorMatched2 ? float4(0,1,0,1) : float4(1,0,0,1);
            color = DrawShape(3, color, pos, detectorPos, float2(6,6), float4(DetectorColor2, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 0.0f, 4, float2(0.0f, 360.0f), 0.0f);
        }
        if (Detector3) {
            const float2 detectorPos = (DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3;
            const float4 outlineColor = detectorMatched3 ? float4(0,1,0,1) : float4(1,0,0,1);
            color = DrawShape(3, color, pos, detectorPos, float2(6,6), float4(DetectorColor3, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 0.0f, 4, float2(0.0f, 360.0f), 0.0f);
        }
    }

    if (Detector1 || Detector2 || Detector3) {
        if (DetectorBehavior == 1) { // OR
            if (!detectorMatched1 && !detectorMatched2 && !detectorMatched3)
                return color;
        }
        else { // AND
            if ((Detector1 && !detectorMatched1) || (Detector2 && !detectorMatched2) || (Detector3 && !detectorMatched3))
                return color;
        }
    }

    if (FollowCursor) {
        if (ShapeEnabled1) color = DrawShape(Shape1, color, pos, MousePoint + Offset + Offset1, FillSize1, FillColor1, GapSize1, GapOffset1, OutlineSize1, OutlineColor1, Rotation1, Anchor1, Section1, Skew1);
        if (ShapeEnabled2) color = DrawShape(Shape2, color, pos, MousePoint + Offset + Offset2, FillSize2, FillColor2, GapSize2, GapOffset2, OutlineSize2, OutlineColor2, Rotation2, Anchor2, Section2, Skew2);
        if (ShapeEnabled3) color = DrawShape(Shape3, color, pos, MousePoint + Offset + Offset3, FillSize3, FillColor3, GapSize3, GapOffset3, OutlineSize3, OutlineColor3, Rotation3, Anchor3, Section3, Skew3);
        if (ShapeEnabled4) color = DrawShape(Shape4, color, pos, MousePoint + Offset + Offset4, FillSize4, FillColor4, GapSize4, GapOffset4, OutlineSize4, OutlineColor4, Rotation4, Anchor4, Section4, Skew4);
        if (ShapeEnabled5) color = DrawShape(Shape5, color, pos, MousePoint + Offset + Offset5, FillSize5, FillColor5, GapSize5, GapOffset5, OutlineSize5, OutlineColor5, Rotation5, Anchor5, Section5, Skew5);
        if (ShapeEnabled6) color = DrawShape(Shape6, color, pos, MousePoint + Offset + Offset6, FillSize6, FillColor6, GapSize6, GapOffset6, OutlineSize6, OutlineColor6, Rotation6, Anchor6, Section6, Skew6);
    }
    else {
        if (ShapeEnabled1) color = DrawShape(Shape1, color, pos, CenterPoint + Offset + Offset1, FillSize1, FillColor1, GapSize1, GapOffset1, OutlineSize1, OutlineColor1, Rotation1, Anchor1, Section1, Skew1);
        if (ShapeEnabled2) color = DrawShape(Shape2, color, pos, CenterPoint + Offset + Offset2, FillSize2, FillColor2, GapSize2, GapOffset2, OutlineSize2, OutlineColor2, Rotation2, Anchor2, Section2, Skew2);
        if (ShapeEnabled3) color = DrawShape(Shape3, color, pos, CenterPoint + Offset + Offset3, FillSize3, FillColor3, GapSize3, GapOffset3, OutlineSize3, OutlineColor3, Rotation3, Anchor3, Section3, Skew3);
        if (ShapeEnabled4) color = DrawShape(Shape4, color, pos, CenterPoint + Offset + Offset4, FillSize4, FillColor4, GapSize4, GapOffset4, OutlineSize4, OutlineColor4, Rotation4, Anchor4, Section4, Skew4);
        if (ShapeEnabled5) color = DrawShape(Shape5, color, pos, CenterPoint + Offset + Offset5, FillSize5, FillColor5, GapSize5, GapOffset5, OutlineSize5, OutlineColor5, Rotation5, Anchor5, Section5, Skew5);
        if (ShapeEnabled6) color = DrawShape(Shape6, color, pos, CenterPoint + Offset + Offset6, FillSize6, FillColor6, GapSize6, GapOffset6, OutlineSize6, OutlineColor6, Rotation6, Anchor6, Section6, Skew6);
    }

    return color;
}



// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

float PS_UIDetect(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    float4 color;
    if (pos.x == 0.5f && Detector1) {
        if (DetectorFollowCursor1)
            color = tex2D(ReShade::BackBuffer, BUFFER_PIXEL_SIZE * (MousePoint + DetectorOffset1));
        else
            color = tex2D(ReShade::BackBuffer, BUFFER_PIXEL_SIZE * (CenterPoint + DetectorOffset1));

        if (DetectorMatch(color, DetectorColor1, DetectorThreshold1, DetectorInverted1))
            return 1.0f;
    }
    if (pos.x == 1.5f && Detector2) {
        if (DetectorFollowCursor2)
            color = tex2D(ReShade::BackBuffer, BUFFER_PIXEL_SIZE * (MousePoint + DetectorOffset2));
        else
            color = tex2D(ReShade::BackBuffer, BUFFER_PIXEL_SIZE * (CenterPoint + DetectorOffset2));

        if (DetectorMatch(color, DetectorColor2, DetectorThreshold2, DetectorInverted2))
            return 1.0f;
    }
    if (pos.x == 2.5f && Detector3) {
        if (DetectorFollowCursor3)
            color = tex2D(ReShade::BackBuffer, BUFFER_PIXEL_SIZE * (MousePoint + DetectorOffset3));
        else
            color = tex2D(ReShade::BackBuffer, BUFFER_PIXEL_SIZE * (CenterPoint + DetectorOffset3));

        if (DetectorMatch(color, DetectorColor3, DetectorThreshold3, DetectorInverted3))
            return 1.0f;
    }

    return 0.0f;
}

float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    if (Antialiasing != 0) discard;
    
    return DrawShapes(float4(tex2D(ReShade::BackBuffer, texCoord).rgb, 0), pos);
}

float4 PS_CustomCrosshairSSAAx4(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    if (Antialiasing != 1) discard;
    
    return DrawShapes(float4(tex2D(ReShade::BackBuffer, texCoord).rgb, 0), pos);
}

// float4 PS_CustomCrosshairSSAAx8(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
//     if (Antialiasing != 3) discard;
    
//     return DrawShapes(float4(tex2D(ReShade::BackBuffer, texCoord).rgb, 0), pos);
// }

// float4 PS_CustomCrosshairSSAAx16(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
//     if (Antialiasing != 3) discard;
    
//     return DrawShapes(float4(tex2D(ReShade::BackBuffer, texCoord).rgb, 0), pos);
// }

float4 PS_final(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
    float4 overlay;
    switch (Antialiasing) {
        case 0:
        default:
            overlay = tex2D(overlaySampler, texCoord);
            break;
        case 1:
            overlay = (tex2D(overlaySamplerSSAAx4, texCoord + BUFFER_PIXEL_SIZE / 2.0f * float2(0, 0))
                + tex2D(overlaySamplerSSAAx4, texCoord + BUFFER_PIXEL_SIZE / 2.0f * float2(1, 0))
                + tex2D(overlaySamplerSSAAx4, texCoord + BUFFER_PIXEL_SIZE / 2.0f * float2(0, 1))
                + tex2D(overlaySamplerSSAAx4, texCoord + BUFFER_PIXEL_SIZE / 2.0f * float2(1, 1))
                ) / 4;
            break;
        // case 2:
        //     overlay = (tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(0, 0))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(1, 0))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(2, 0))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(0, 1))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(1, 1))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(2, 1))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(0, 2))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(1, 2))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 3.0f * float2(2, 2))
        //         ) / 9;
        //     break;
        // case 3:
        //     overlay = (tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(0, 0))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(1, 0))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(2, 0))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(3, 0))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(0, 1))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(1, 1))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(2, 1))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(3, 1))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(0, 2))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(1, 2))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(2, 2))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(3, 2))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(0, 3))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(1, 3))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(2, 3))
        //         + tex2D(overlaySamplerSSAAx16, texCoord + BUFFER_PIXEL_SIZE / 4.0f * float2(3, 3))
        //         ) / 16;
        //     break;
    }
    
    if (ShowDebug)
        return overlay;
    
    return lerp(tex2D(ReShade::BackBuffer, texCoord), overlay, overlay.a);
}

// ------------------------------------------------------------------------------------------------------------------------
// Techniques
// ------------------------------------------------------------------------------------------------------------------------

technique CustomCrosshair {
    // pass test {
    //     VertexShader = PostProcessVS;
    //     PixelShader = PS_UIDetect;
    // }
    pass detector {
        VertexShader = PostProcessVS;
        PixelShader = PS_UIDetect;
        RenderTarget = detectorTarget;
        ClearRenderTargets = true;
    }
    pass overlay {
        VertexShader = PostProcessVS;
        PixelShader = PS_CustomCrosshair;
        RenderTarget = overlayTarget;
    }
    pass overlaySSAAx4 {
        VertexShader = PostProcessVS;
        PixelShader = PS_CustomCrosshairSSAAx4;
        RenderTarget = overlayTargetSSAAx4;
    }
    // pass overlaySSAAx8 {
    //     VertexShader = PostProcessVS;
    //     PixelShader = PS_CustomCrosshairSSAAx8;
    //     RenderTarget = overlayTargetSSAAx8;
    // }
    // pass overlaySSAAx16 {
    //     VertexShader = PostProcessVS;
    //     PixelShader = PS_CustomCrosshairSSAAx16;
    //     RenderTarget = overlayTargetSSAAx16;
    // }
    pass final {
        VertexShader = PostProcessVS;
        PixelShader = PS_final;
    }
}