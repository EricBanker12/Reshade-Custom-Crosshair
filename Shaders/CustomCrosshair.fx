#include "ReShadeUI.fxh"
// ------------------------------------------------------------------------------------------------------------------------
// Crosshair
// ------------------------------------------------------------------------------------------------------------------------

    uniform int ConfigNotice <
        ui_type = "radio";
        ui_label = " ";
        ui_text = "To apply changes to the config in this section,\n"
                    "enable the technique \"Custom Crosshair Setup\"\n";
        ui_category = "Crosshair";
        ui_category_closed = true;
    >;

    uniform float4 FillColor <
        ui_type = "color";
        ui_label = "Fill Color";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float4(1, 1, 1, 0.8f);

    uniform float4 OutlineColor <
        ui_type = "color";
        ui_label = "Outline Color";
        ui_category = "Crosshair";
        ui_category_closed = true;

    > = float4(0, 0, 0, 0.8f);

    uniform float OutlineSize <
        ui_type = "drag";
        ui_label = "Outline Size";
        ui_min = 0;
        ui_max = 200.0f;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 1.0f;

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

    uniform bool FollowCursor <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply crosshair relative to mouse cursor instead of the window center.";
        ui_category = "Crosshair";
        ui_category_closed = true;

    > = false;
    uniform bool Antialiasing <
        ui_label = "Antialiasing";
        ui_tooltip = "Applies SSAA x4.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = true;


// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 1
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled1 <
        ui_label = "Shape 1";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = true;

    uniform int Shape1 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor1 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 3;

    uniform float2 FillSize1 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,2);

    uniform float2 GapSize1 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset1 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(5, 0);

    uniform float2 GapOffset1 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation1 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew1 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice1 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    // uniform float4 FillColor1 <
    //     ui_type = "color";
    //     ui_label = "Fill Color";
    //     ui_category = "Crosshair";
    //    ui_category_closed = true;
    // > = float4(1, 1, 1, 0.9f);

    // uniform float OutlineSize1 <
    //     ui_type = "drag";
    //     ui_label = "Outline Size";
    //     ui_min = 0;
    //     ui_max = 200.0f;
    //     ui_step = 1.0f;
    //     ui_category = "Crosshair";
    //    ui_category_closed = true;
    // > = 1.0f;

    // uniform float4 OutlineColor1 <
    //     ui_type = "color";
    //     ui_label = "Outline Color";
    //     ui_category = "Crosshair";
    //    ui_category_closed = true;
    // > = float4(0, 0, 0, 0.9f);

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 2
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled2 <
        ui_label = "Shape 2";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = true;

    uniform int Shape2 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor2 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 1;

    uniform float2 FillSize2 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(2,10);

    uniform float2 GapSize2 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset2 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 5);

    uniform float2 GapOffset2 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation2 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Skew2 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice2 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 3
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled3 <
        ui_label = "Shape 3";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = true;

    uniform int Shape3 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor3 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 5;

    uniform float2 FillSize3 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,2);

    uniform float2 GapSize3 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset3 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(-5, 0);

    uniform float2 GapOffset3 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation3 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Skew3 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice3 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 4
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled4 <
        ui_label = "Shape 4";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = true;

    uniform int Shape4 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor4 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 7;

    uniform float2 FillSize4 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(2,10);

    uniform float2 GapSize4 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset4 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, -5);

    uniform float2 GapOffset4 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation4 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Skew4 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice4 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 5
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled5 <
        ui_label = "Shape 5";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = true;

    uniform int Shape5 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor5 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize5 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 GapSize5 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset5 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset5 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation5 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew5 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice5 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 6
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled6 <
        ui_label = "Shape 6";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape6 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor6 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize6 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize6 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset6 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset6 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation6 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew6 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice6 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 7
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled7 <
        ui_label = "Shape 7";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape7 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor7 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize7 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize7 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset7 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset7 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation7 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew7 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice7 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 8
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled8 <
        ui_label = "Shape 8";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape8 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor8 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize8 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize8 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset8 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset8 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation8 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew8 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice8 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 9
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled9 <
        ui_label = "Shape 9";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape9 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor9 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize9 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize9 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset9 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset9 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation9 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew9 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice9 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 10
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled10 <
        ui_label = "Shape 10";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape10 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor10 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize10 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize10 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset10 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset10 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation10 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew10 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice10 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 11
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled11 <
        ui_label = "Shape 11";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape11 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor11 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize11 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize11 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset11 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset11 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation11 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew11 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice11 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 12
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled12 <
        ui_label = "Shape 12";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape12 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor12 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize12 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize12 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset12 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset12 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation12 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew12 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice12 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 13
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled13 <
        ui_label = "Shape 13";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape13 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor13 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize13 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize13 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset13 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset13 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation13 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew13 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice13 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 14
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled14 <
        ui_label = "Shape 14";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape14 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor14 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize14 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize14 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset14 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset14 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation14 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew14 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice14 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 15
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled15 <
        ui_label = "Shape 15";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape15 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor15 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize15 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize15 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset15 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset15 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation15 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew15 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice15 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 16
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled16 <
        ui_label = "Shape 16";
        ui_category = "Crosshair";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform int Shape16 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor16 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize16 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize16 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset16 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset16 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation16 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0;

    uniform float Skew16 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice16 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
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
        ui_label = "Detector 1";
        ui_category = "UI Detection";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor1 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold1 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize1 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset1 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor1 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted1 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 2
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector2 <
        ui_label = "Detector 2";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor2 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold2 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize2 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset2 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor2 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted2 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 3
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector3 <
        ui_label = "Detector 3";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor3 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold3 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize3 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset3 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor3 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted3 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 4
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector4 <
        ui_label = "Detector 4";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor4 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold4 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize4 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset4 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor4 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted4 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 5
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector5 <
        ui_label = "Detector 5";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor5 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold5 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize5 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset5 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor5 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted5 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 6
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector6 <
        ui_label = "Detector 6";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor6 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold6 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize6 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset6 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor6 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted6 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 7
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector7 <
        ui_label = "Detector 7";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor7 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold7 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize7 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset7 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor7 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted7 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// UI Detection > Detector 8
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool Detector8 <
        ui_label = "Detector 8";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
        ui_spacing = 2;
    > = false;

    uniform float3 DetectorColor8 <
        ui_type = "color";
        ui_label = "Color";
        ui_tooltip = "Color to match for detection.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(1, 1, 1);

    uniform float3 DetectorThreshold8 <
        ui_type = "drag";
        ui_label = "Threshold";
        ui_tooltip = "Color matching threshold for the detector for Red, Green, and Blue respectively.";
        ui_min = 0.0f;
        ui_max = 255.0f;
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float3(15,15,15);

    uniform float2 DetectorSize8 <
        ui_type = "drag";
        ui_label = "Size";
        ui_tooltip = "Width and height for within the detector will match.";
        ui_min = float2(1,1);
        ui_max = float2(100,100);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 DetectorOffset8 <
        ui_type = "drag";
        ui_label = "Offset";
        ui_tooltip = "Horizontal and vertical offset for the detector relative to the window center.";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = float2(0,0);

    uniform bool DetectorFollowCursor8 <
        ui_label = "Follow Cursor";
        ui_tooltip = "Apply detector relative to mouse cursor instead of the window center.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

    uniform bool DetectorInverted8 <
        ui_label = "Inverted Matching";
        ui_tooltip = "Inverse the matched and not matched states.";
        ui_category = "UI Detection";
        ui_category_closed = true;
    > = false;

// ------------------------------------------------------------------------------------------------------------------------
// Hotkeys
// ------------------------------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------------------------------
// Hidden or Static Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    static const float2 PixelOffset = float2(0.5f, 0.5f);
    static const float2 anchorOffsets[9] = {float2(0.5f, 0.5f), float2(0, 0.5f), float2(-0.5f, 0.5f), float2(0.5f, 0), float2(0, 0), float2(-0.5f, 0), float2(0.5f, -0.5f), float2(0, -0.5f), float2(-0.5f, -0.5f)};
    
    uniform float2 MousePoint < source = "mousepoint"; >;

    // uniform bool SpaceBar <source = "key"; keycode = 0x20; mode = ""; >;
    // uniform bool left_mouse_button_down < source = "mousebutton"; keycode = 0; mode = ""; >;

    /*
    To Do:
    - option to use png image layer instead of shape - see https://github.com/CeeJayDK/SweetFX/blob/master/Shaders/Layer.fx
    - hotkey enable/disable shapes - might be easier to duplicate fx file for switching between different crosshairs
    - hotkey animated transformations - likely too expensive unless pre-rendered - could use overlay LoD for frames?

    */

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture CustomCrosshairDetectorTexture <pooled = false; > { Width = 8; Height = 1; Format = R8; };
    sampler CustomCrosshairDetectorSampler { Texture = CustomCrosshairDetectorTexture; };

    texture CustomCrosshairOverlayTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler CustomCrosshairOverlaySampler { Texture = CustomCrosshairOverlayTexture;};

    texture CustomCrosshairOverlaySSAATexture <pooled = true; > { Width = BUFFER_WIDTH * 2.0; Height = BUFFER_HEIGHT * 2.0; Format = RGBA8; };
    sampler CustomCrosshairOverlaySSAASampler { Texture = CustomCrosshairOverlaySSAATexture;};

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

    float sdPie( in float2 p, in float2 c, in float r )
    {
        p.x = abs(p.x);
        float l = length(p) - r;
        float m = length(p-c*clamp(dot(p,c),0.0,r)); // c=sin/cos of aperture
        return max(l,m*sign(c.y*p.x-c.x*p.y));
    }

    float sdEllipse( in float2 p, in float2 ab )
    {
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
        if (d < 0.0f)
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

    float sdTriangle( in float2 p, in float2 p0, in float2 p1, in float2 p2 )
    {
        float2 e0 = p1-p0, e1 = p2-p1, e2 = p0-p2;
        float2 v0 = p -p0, v1 = p -p1, v2 = p -p2;
        float2 pq0 = v0 - e0*clamp( dot(v0,e0)/dot(e0,e0), 0.0, 1.0 );
        float2 pq1 = v1 - e1*clamp( dot(v1,e1)/dot(e1,e1), 0.0, 1.0 );
        float2 pq2 = v2 - e2*clamp( dot(v2,e2)/dot(e2,e2), 0.0, 1.0 );
        float s = sign( e0.x*e2.y - e0.y*e2.x );
        float2 d = min(min(float2(dot(pq0,pq0), s*(v0.x*e0.y-v0.y*e0.x)),
                        float2(dot(pq1,pq1), s*(v1.x*e1.y-v1.y*e1.x))),
                        float2(dot(pq2,pq2), s*(v2.x*e2.y-v2.y*e2.x)));
        return -sqrt(d.x)*sign(d.y);
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

    float4 DrawEllipse(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, int anchor, float slice) {
        const float2 center = fillPos + fillSize * anchorOffsets[anchor];
        fillSize /= 2.0f;
        const float sdFill = sdEllipse(basePos - center, fillSize);

        if (gapSize.x > 0 && gapSize.y > 0) {
            gapSize /= 2.0f;
            const float sdGap = sdEllipse(basePos - center - gapOffset, gapSize);
            
            if (slice > 0) {
                slice = radians(180.0f - slice / 2.0f);
                const float sdSlice = sdPie(basePos - center, float2(sin(slice), cos(slice)), max(fillSize.x, fillSize.y));

                if (sdFill <= 0 && sdGap > 0 && sdSlice <= 0) return lerp(fillColor, baseColor, baseColor.a);
                if (sdFill <= outlineSize && sdGap > -outlineSize && sdSlice <= outlineSize) return lerp(outlineColor, baseColor, baseColor.a);
            }
            else {
                if (sdFill <= 0 && sdGap > 0) return lerp(fillColor, baseColor, baseColor.a);
                if (sdFill <= outlineSize && sdGap > -outlineSize) return lerp(outlineColor, baseColor, baseColor.a);
            }
        }
        else {
            if (slice > 0) {
                slice = radians(180.0f - slice / 2.0f);
                const float sdSlice = sdPie(basePos - center, float2(sin(slice), cos(slice)), max(fillSize.x, fillSize.y));

                if (sdFill <= 0 && sdSlice <= 0) return lerp(fillColor, baseColor, baseColor.a);
                if (sdFill <= outlineSize && sdSlice <= outlineSize) return lerp(outlineColor, baseColor, baseColor.a);
            }
            else {
                if (sdFill <= 0) return lerp(fillColor, baseColor, baseColor.a);
                if (sdFill <= outlineSize) return lerp(outlineColor, baseColor, baseColor.a);
            }
        }

        return baseColor;
    }

    float4 DrawTriangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, int anchor, float skew) {
        // float2 anchorOffsets[9] = {float2(0.5f, 0.67f), float2(0, 0.67f), float2(-0.5f, 0.67f), float2(0.5f, 0), float2(0, 0), float2(-0.5f, 0f), float2(0.5f, -0.33f), float2(0, -0.33f), float2(-0.5f, -0.33f)};
        float2 anchorOffset = anchorOffsets[anchor];
        if (anchorOffset.y != 0.0f) anchorOffset.y += 1.0f / 6.0f;

        const float2 center = fillPos + fillSize * anchorOffset;
        float2 A = float2 (-fillSize.x / 2.0f * (1 + skew / 90.0f), fillSize.y / 3.0f);
        float2 B = float2 (fillSize.x * skew / 90.0f, -fillSize.y * 2.0f / 3.0f);
        float2 C = float2 (fillSize.x / 2.0f * (1 - skew / 90.0f), fillSize.y / 3.0f);
        const float sdFill = sdTriangle(basePos - center, A, B, C);

        if (gapSize.x > 0 && gapSize.y > 0) {
            A = float2 (-gapSize.x / 2.0f * (1 + skew / 90.0f), gapSize.y / 3.0f);
            B = float2 (gapSize.x * skew / 90.0f, -gapSize.y * 2.0f / 3.0f);
            C = float2 (gapSize.x / 2.0f * (1 - skew / 90.0f), gapSize.y / 3.0f);
            const float sdGap = sdTriangle(basePos - center - gapOffset, A, B, C);

            if (sdFill <= 0 && sdGap > 0) return lerp(fillColor, baseColor, baseColor.a);
            if (sdFill <= outlineSize && sdGap > -outlineSize) return lerp(outlineColor, baseColor, baseColor.a);
        }
        else {
            if (sdFill <= 0) return lerp(fillColor, baseColor, baseColor.a);
            if (sdFill <= outlineSize) return lerp(outlineColor, baseColor, baseColor.a);
        }

        return baseColor;
    }

    float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float rotation, int anchor, float slice, float skew) {
        if (Antialiasing) {
                fillPos *= 2.0f;
                fillSize *= 2.0f;
                gapSize *= 2.0f;
                gapOffset *= 2.0f;
                outlineSize *= 2.0f;
        }

        if (rotation > 0) {
            rotation = -radians(rotation);
            basePos = float4((basePos.x - fillPos.x) * cos(rotation) - (basePos.y - fillPos.y) * sin(rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(rotation) + (basePos.y - fillPos.y) * cos(rotation) + fillPos.y, 0, 0);
        }
        
        if (shape == 1) return DrawTriangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchor, skew);
        if (shape == 2) return DrawEllipse(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchor, slice);
        return DrawRectangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchor);
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

    float PS_UIDetect(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        const int pixelNumber = round(texCoord.x * 8 + PixelOffset.x);
        if (pixelNumber == 1 && Detector1) return DetectorMatchAll((DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1 - PixelOffset, DetectorSize1, DetectorColor1, DetectorThreshold1, DetectorInverted1);
        if (pixelNumber == 2 && Detector2) return DetectorMatchAll((DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2 - PixelOffset, DetectorSize2, DetectorColor2, DetectorThreshold2, DetectorInverted2);
        if (pixelNumber == 3 && Detector3) return DetectorMatchAll((DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3 - PixelOffset, DetectorSize3, DetectorColor3, DetectorThreshold3, DetectorInverted3);
        if (pixelNumber == 4 && Detector4) return DetectorMatchAll((DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4 - PixelOffset, DetectorSize4, DetectorColor4, DetectorThreshold4, DetectorInverted4);
        if (pixelNumber == 5 && Detector5) return DetectorMatchAll((DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5 - PixelOffset, DetectorSize5, DetectorColor5, DetectorThreshold5, DetectorInverted5);
        if (pixelNumber == 6 && Detector6) return DetectorMatchAll((DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6 - PixelOffset, DetectorSize6, DetectorColor6, DetectorThreshold6, DetectorInverted6);
        if (pixelNumber == 7 && Detector7) return DetectorMatchAll((DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7 - PixelOffset, DetectorSize7, DetectorColor7, DetectorThreshold7, DetectorInverted7);
        if (pixelNumber == 8 && Detector8) return DetectorMatchAll((DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8 - PixelOffset, DetectorSize8, DetectorColor8, DetectorThreshold8, DetectorInverted8);
        return 0.0f;
    }

    float4 PS_CustomCrosshairSSAA(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (!Antialiasing) discard;

        float4 color = float4(OutlineColor.rgb, 0);
        if (OutlineSize < 1) color = float4(FillColor.rgb, 0);

        if (ShapeEnabled1) color = DrawShape(Shape1, color, pos, CenterPoint + Offset1, FillSize1, FillColor, GapSize1, GapOffset1, OutlineSize, OutlineColor, Rotation1, Anchor1, Slice1, Skew1);
        if (ShapeEnabled2) color = DrawShape(Shape2, color, pos, CenterPoint + Offset2, FillSize2, FillColor, GapSize2, GapOffset2, OutlineSize, OutlineColor, Rotation2, Anchor2, Slice2, Skew2);
        if (ShapeEnabled3) color = DrawShape(Shape3, color, pos, CenterPoint + Offset3, FillSize3, FillColor, GapSize3, GapOffset3, OutlineSize, OutlineColor, Rotation3, Anchor3, Slice3, Skew3);
        if (ShapeEnabled4) color = DrawShape(Shape4, color, pos, CenterPoint + Offset4, FillSize4, FillColor, GapSize4, GapOffset4, OutlineSize, OutlineColor, Rotation4, Anchor4, Slice4, Skew4);
        if (ShapeEnabled5) color = DrawShape(Shape5, color, pos, CenterPoint + Offset5, FillSize5, FillColor, GapSize5, GapOffset5, OutlineSize, OutlineColor, Rotation5, Anchor5, Slice5, Skew5);
        if (ShapeEnabled6) color = DrawShape(Shape6, color, pos, CenterPoint + Offset6, FillSize6, FillColor, GapSize6, GapOffset6, OutlineSize, OutlineColor, Rotation6, Anchor6, Slice6, Skew6);
        if (ShapeEnabled7) color = DrawShape(Shape7, color, pos, CenterPoint + Offset7, FillSize7, FillColor, GapSize7, GapOffset7, OutlineSize, OutlineColor, Rotation7, Anchor7, Slice7, Skew7);
        if (ShapeEnabled8) color = DrawShape(Shape8, color, pos, CenterPoint + Offset8, FillSize8, FillColor, GapSize8, GapOffset8, OutlineSize, OutlineColor, Rotation8, Anchor8, Slice8, Skew8);
        if (ShapeEnabled9) color = DrawShape(Shape9, color, pos, CenterPoint + Offset9, FillSize9, FillColor, GapSize9, GapOffset9, OutlineSize, OutlineColor, Rotation9, Anchor9, Slice9, Skew9);
        if (ShapeEnabled10) color = DrawShape(Shape10, color, pos, CenterPoint + Offset10, FillSize10, FillColor, GapSize10, GapOffset10, OutlineSize, OutlineColor, Rotation10, Anchor10, Slice10, Skew10);
        if (ShapeEnabled11) color = DrawShape(Shape11, color, pos, CenterPoint + Offset11, FillSize11, FillColor, GapSize11, GapOffset11, OutlineSize, OutlineColor, Rotation11, Anchor11, Slice11, Skew11);
        if (ShapeEnabled12) color = DrawShape(Shape12, color, pos, CenterPoint + Offset12, FillSize12, FillColor, GapSize12, GapOffset12, OutlineSize, OutlineColor, Rotation12, Anchor12, Slice12, Skew12);
        if (ShapeEnabled13) color = DrawShape(Shape13, color, pos, CenterPoint + Offset13, FillSize13, FillColor, GapSize13, GapOffset13, OutlineSize, OutlineColor, Rotation13, Anchor13, Slice13, Skew13);
        if (ShapeEnabled14) color = DrawShape(Shape14, color, pos, CenterPoint + Offset14, FillSize14, FillColor, GapSize14, GapOffset14, OutlineSize, OutlineColor, Rotation14, Anchor14, Slice14, Skew14);
        if (ShapeEnabled15) color = DrawShape(Shape15, color, pos, CenterPoint + Offset15, FillSize15, FillColor, GapSize15, GapOffset15, OutlineSize, OutlineColor, Rotation15, Anchor15, Slice15, Skew15);
        if (ShapeEnabled16) color = DrawShape(Shape16, color, pos, CenterPoint + Offset16, FillSize16, FillColor, GapSize16, GapOffset16, OutlineSize, OutlineColor, Rotation16, Anchor16, Slice16, Skew16);

        return color;
    }

    float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (Antialiasing)
            return (
                tex2Dlod(CustomCrosshairOverlaySSAASampler, float4(((pos.xy - PixelOffset) * 2.0f + PixelOffset + float2(0, 0)) * BUFFER_PIXEL_SIZE / 2.0f, 0, 0))
                + tex2Dlod(CustomCrosshairOverlaySSAASampler, float4(((pos.xy - PixelOffset) * 2.0f + PixelOffset + float2(1, 0)) * BUFFER_PIXEL_SIZE / 2.0f, 0, 0))
                + tex2Dlod(CustomCrosshairOverlaySSAASampler, float4(((pos.xy - PixelOffset) * 2.0f + PixelOffset + float2(0, 1)) * BUFFER_PIXEL_SIZE / 2.0f, 0, 0))
                + tex2Dlod(CustomCrosshairOverlaySSAASampler, float4(((pos.xy - PixelOffset) * 2.0f + PixelOffset + float2(1, 1)) * BUFFER_PIXEL_SIZE / 2.0f, 0, 0))
                ) / 4.0f;
        else {
            float4 color = float4(OutlineColor.rgb, 0);
            if (OutlineSize < 1) color = float4(FillColor.rgb, 0);

            if (ShapeEnabled1) color = DrawShape(Shape1, color, pos, CenterPoint + Offset1, FillSize1, FillColor, GapSize1, GapOffset1, OutlineSize, OutlineColor, Rotation1, Anchor1, Slice1, Skew1);
            if (ShapeEnabled2) color = DrawShape(Shape2, color, pos, CenterPoint + Offset2, FillSize2, FillColor, GapSize2, GapOffset2, OutlineSize, OutlineColor, Rotation2, Anchor2, Slice2, Skew2);
            if (ShapeEnabled3) color = DrawShape(Shape3, color, pos, CenterPoint + Offset3, FillSize3, FillColor, GapSize3, GapOffset3, OutlineSize, OutlineColor, Rotation3, Anchor3, Slice3, Skew3);
            if (ShapeEnabled4) color = DrawShape(Shape4, color, pos, CenterPoint + Offset4, FillSize4, FillColor, GapSize4, GapOffset4, OutlineSize, OutlineColor, Rotation4, Anchor4, Slice4, Skew4);
            if (ShapeEnabled5) color = DrawShape(Shape5, color, pos, CenterPoint + Offset5, FillSize5, FillColor, GapSize5, GapOffset5, OutlineSize, OutlineColor, Rotation5, Anchor5, Slice5, Skew5);
            if (ShapeEnabled6) color = DrawShape(Shape6, color, pos, CenterPoint + Offset6, FillSize6, FillColor, GapSize6, GapOffset6, OutlineSize, OutlineColor, Rotation6, Anchor6, Slice6, Skew6);
            if (ShapeEnabled7) color = DrawShape(Shape7, color, pos, CenterPoint + Offset7, FillSize7, FillColor, GapSize7, GapOffset7, OutlineSize, OutlineColor, Rotation7, Anchor7, Slice7, Skew7);
            if (ShapeEnabled8) color = DrawShape(Shape8, color, pos, CenterPoint + Offset8, FillSize8, FillColor, GapSize8, GapOffset8, OutlineSize, OutlineColor, Rotation8, Anchor8, Slice8, Skew8);
            if (ShapeEnabled9) color = DrawShape(Shape9, color, pos, CenterPoint + Offset9, FillSize9, FillColor, GapSize9, GapOffset9, OutlineSize, OutlineColor, Rotation9, Anchor9, Slice9, Skew9);
            if (ShapeEnabled10) color = DrawShape(Shape10, color, pos, CenterPoint + Offset10, FillSize10, FillColor, GapSize10, GapOffset10, OutlineSize, OutlineColor, Rotation10, Anchor10, Slice10, Skew10);
            if (ShapeEnabled11) color = DrawShape(Shape11, color, pos, CenterPoint + Offset11, FillSize11, FillColor, GapSize11, GapOffset11, OutlineSize, OutlineColor, Rotation11, Anchor11, Slice11, Skew11);
            if (ShapeEnabled12) color = DrawShape(Shape12, color, pos, CenterPoint + Offset12, FillSize12, FillColor, GapSize12, GapOffset12, OutlineSize, OutlineColor, Rotation12, Anchor12, Slice12, Skew12);
            if (ShapeEnabled13) color = DrawShape(Shape13, color, pos, CenterPoint + Offset13, FillSize13, FillColor, GapSize13, GapOffset13, OutlineSize, OutlineColor, Rotation13, Anchor13, Slice13, Skew13);
            if (ShapeEnabled14) color = DrawShape(Shape14, color, pos, CenterPoint + Offset14, FillSize14, FillColor, GapSize14, GapOffset14, OutlineSize, OutlineColor, Rotation14, Anchor14, Slice14, Skew14);
            if (ShapeEnabled15) color = DrawShape(Shape15, color, pos, CenterPoint + Offset15, FillSize15, FillColor, GapSize15, GapOffset15, OutlineSize, OutlineColor, Rotation15, Anchor15, Slice15, Skew15);
            if (ShapeEnabled16) color = DrawShape(Shape16, color, pos, CenterPoint + Offset16, FillSize16, FillColor, GapSize16, GapOffset16, OutlineSize, OutlineColor, Rotation16, Anchor16, Slice16, Skew16);

            return color;
        }
    }

    float4 PS_Final(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        float4 color = tex2Dlod(ReShade::BackBuffer, float4(texCoord, 0, 0));
        const float2 overlayOffset = Offset + FollowCursor ? CenterPoint - MousePoint : 0;
        const float4 overlay = tex2Dlod(CustomCrosshairOverlaySampler, float4(texCoord + overlayOffset * BUFFER_PIXEL_SIZE, 0, 0));

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

            if (Detector1) detectorMatches1 = tex2Dlod(CustomCrosshairDetectorSampler, float4((PixelOffset + float2(0, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector2) detectorMatches2 = tex2Dlod(CustomCrosshairDetectorSampler, float4((PixelOffset + float2(1, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector3) detectorMatches3 = tex2Dlod(CustomCrosshairDetectorSampler, float4((PixelOffset + float2(2, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector4) detectorMatches4 = tex2Dlod(CustomCrosshairDetectorSampler, float4((PixelOffset + float2(3, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector5) detectorMatches5 = tex2Dlod(CustomCrosshairDetectorSampler, float4((PixelOffset + float2(4, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector6) detectorMatches6 = tex2Dlod(CustomCrosshairDetectorSampler, float4((PixelOffset + float2(5, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector7) detectorMatches7 = tex2Dlod(CustomCrosshairDetectorSampler, float4((PixelOffset + float2(6, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector8) detectorMatches8 = tex2Dlod(CustomCrosshairDetectorSampler, float4((PixelOffset + float2(7, 0)) / 8.0f, 0, 0)).r > 0.0f;

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

    technique CustomCrosshairStartup <
        ui_label = "Custom Crosshair Startup";
        ui_tooltip = "Apply settings and cache overlay texture.";
        hidden = true;
        enabled = true;
        timeout = 1;
    > {
        pass overlaySSAA {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
        }
        pass overlay {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshair;
            RenderTarget = CustomCrosshairOverlayTexture;
        }
    }

    technique CustomCrosshairSetup <
        ui_label = "Custom Crosshair Setup";
        ui_tooltip = "Enable to apply config changes to \"Custom Crosshair.\"\n"
                        "Disable for performance";
    > {
        pass overlaySSAA {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
        }
        pass overlay {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshair;
            RenderTarget = CustomCrosshairOverlayTexture;
        }
    }

    technique CustomCrosshair <
        ui_label = "Custom Crosshair";
        ui_tooltip = "Enable \"Custom Crosshair Setup\" to apply config changes.";
    > {
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetect;
            RenderTarget = CustomCrosshairDetectorTexture;
        }
        pass final {
            VertexShader = PostProcessVS;
            PixelShader = PS_Final;
        }
    }

    technique CustomCrosshairDetectorDebug <
        ui_label = "Custom Crosshair Detector Debug";
        hidden = true;
    > {
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetect;
        }
    }
