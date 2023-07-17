#include "ReShadeUI.fxh"
// ------------------------------------------------------------------------------------------------------------------------
// Crosshair Setup
// ------------------------------------------------------------------------------------------------------------------------

    uniform int ConfigNotice <
        ui_type = "radio";
        ui_label = " ";
        ui_text = "\"CustomCrosshair\" must be enabled to see results.\n"
                    "Once crosshair color and shape are configured,\n"
                    "disable this effect for performance.";
        ui_category = "Crosshair Setup";
        ui_category_closed = true;
    >;

    uniform float4 FillColor <
        ui_type = "color";
        ui_label = "Fill Color";
        ui_category = "Crosshair Setup";
        ui_category_closed = true;
    > = float4(1.0, 1.0, 1.0, 0.75);

    uniform float4 OutlineColor <
        ui_type = "color";
        ui_label = "Outline Color";
        ui_category = "Crosshair Setup";
        ui_category_closed = true;

    > = float4(0.0, 0.0, 0.0, 0.5);

    uniform float OutlineSize <
        ui_type = "drag";
        ui_label = "Outline Size";
        ui_min = 0.0;
        ui_max = 200.0;
        ui_step = 1.0;
        ui_category = "Crosshair Setup";
        ui_category_closed = true;
    > = 1.0;

    uniform bool Antialiasing <
        ui_label = "Antialiasing";
        ui_tooltip = "Applies SSAA x4.";
        ui_category = "Crosshair Setup";
        ui_category_closed = true;
    > = true;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 1
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled1 <
        ui_label = "Shape 1";
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = true;

    uniform int Shape1 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor1 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = 3;

    uniform float2 FillSize1 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = float2(10.0, 2.0);

    uniform float2 GapSize1 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset1 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = float2(5.0, 0.0);

    uniform float2 GapOffset1 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation1 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew1 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice1 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = 0.0;

    // uniform float4 FillColor1 <
    //     ui_type = "color";
    //     ui_label = "Fill Color";
    //     ui_category = "Crosshair Shape 01";
    //    ui_category_closed = true;
    // > = float4(1.0, 1.0, 1.0, 0.9);

    // uniform float OutlineSize1 <
    //     ui_type = "drag";
    //     ui_label = "Outline Size";
    //     ui_min = 0;
    //     ui_max = 200.0;
    //     ui_step = 1.0;
    //     ui_category = "Crosshair Shape 01";
    //    ui_category_closed = true;
    // > = 1.0;

    // uniform float4 OutlineColor1 <
    //     ui_type = "color";
    //     ui_label = "Outline Color";
    //     ui_category = "Crosshair Shape 01";
    //    ui_category_closed = true;
    // > = float4(0.0, 0.0, 0.0, 0.9);

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 2
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled2 <
        ui_label = "Shape 2";
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = true;

    uniform int Shape2 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor2 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = 1;

    uniform float2 FillSize2 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = float2(2.0, 10.0);

    uniform float2 GapSize2 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset2 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = float2(0.0, 5.0);

    uniform float2 GapOffset2 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation2 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew2 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice2 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 3
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled3 <
        ui_label = "Shape 3";
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = true;

    uniform int Shape3 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor3 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = 5;

    uniform float2 FillSize3 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = float2(10.0, 2.0);

    uniform float2 GapSize3 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset3 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = float2(-5.0, 0.0);

    uniform float2 GapOffset3 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation3 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew3 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice3 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 4
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled4 <
        ui_label = "Shape 4";
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = true;

    uniform int Shape4 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor4 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = 7;

    uniform float2 FillSize4 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = float2(2.0, 10.0);

    uniform float2 GapSize4 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset4 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = float2(0.0, -5.0);

    uniform float2 GapOffset4 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation4 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew4 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice4 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 5
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled5 <
        ui_label = "Shape 5";
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = true;

    uniform int Shape5 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor5 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize5 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = float2(2.0, 2.0);

    uniform float2 GapSize5 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset5 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset5 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation5 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew5 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice5 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 6
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled6 <
        ui_label = "Shape 6";
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = true;

    uniform int Shape6 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = 2;

    uniform int Anchor6 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize6 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = float2(22.0, 22.0);

    uniform float2 GapSize6 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = float2(18.0, 18.0);

    uniform float2 Offset6 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset6 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation6 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew6 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice6 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 7
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled7 <
        ui_label = "Shape 7";
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = false;

    uniform int Shape7 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor7 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize7 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize7 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset7 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset7 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation7 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew7 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice7 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 8
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled8 <
        ui_label = "Shape 8";
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = false;

    uniform int Shape8 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor8 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize8 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize8 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset8 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset8 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation8 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew8 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice8 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 9
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled9 <
        ui_label = "Shape 9";
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = false;

    uniform int Shape9 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor9 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize9 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize9 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset9 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset9 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation9 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew9 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice9 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 10
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled10 <
        ui_label = "Shape 10";
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = false;

    uniform int Shape10 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor10 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize10 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize10 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset10 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset10 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation10 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew10 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice10 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 11
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled11 <
        ui_label = "Shape 11";
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = false;

    uniform int Shape11 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor11 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize11 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize11 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset11 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset11 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation11 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew11 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice11 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 12
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled12 <
        ui_label = "Shape 12";
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = false;

    uniform int Shape12 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor12 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize12 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize12 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset12 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset12 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation12 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew12 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice12 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 13
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled13 <
        ui_label = "Shape 13";
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = false;

    uniform int Shape13 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor13 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize13 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize13 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset13 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset13 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation13 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew13 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice13 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 14
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled14 <
        ui_label = "Shape 14";
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = false;

    uniform int Shape14 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor14 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize14 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize14 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset14 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset14 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation14 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew14 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice14 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 15
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled15 <
        ui_label = "Shape 15";
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = false;

    uniform int Shape15 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor15 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize15 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize15 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset15 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset15 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation15 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew15 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice15 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Crosshair > Shape 16
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ShapeEnabled16 <
        ui_label = "Shape 16";
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = false;

    uniform int Shape16 <
        ui_type = "combo";
        ui_label = "Shape";
        ui_items = "Rectangle\0Triangle\0Ellipse\0";
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = 0;

    uniform int Anchor16 <
        ui_type = "combo";
        ui_label = "Anchor";
        ui_items = "Top Left\0Top Center\0Top Right\0Center Left\0Center\0Center Right\0Bottom Left\0Bottom Center\0Bottom Right\0";
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = 4;

    uniform float2 FillSize16 <
        ui_type = "drag";
        ui_label = "Size";
        ui_min = 1.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = float2(10.0, 10.0);

    uniform float2 GapSize16 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0.0;
        ui_max = 1000.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 Offset16 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float2 GapOffset16 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0, BUFFER_HEIGHT / -2.0);
        ui_max = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
        ui_step = 1.0;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = float2(0.0, 0.0);

    uniform float Rotation16 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = 0.0;

    uniform float Skew16 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90.0;
        ui_max = 90.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = 0.0;

    uniform float Slice16 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0.0;
        ui_max = 360.0;
        ui_step = 1.0;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = 0.0;

// ------------------------------------------------------------------------------------------------------------------------
// Hidden or Static Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0, BUFFER_HEIGHT / 2.0);
    static const float2 PixelOffset = float2(0.5, 0.5);
    static const float2 AnchorOffsets[9] = {float2(0.5, 0.5), float2(0.0, 0.5), float2(-0.5, 0.5), float2(0.5, 0.0), float2(0.0, 0.0), float2(-0.5, 0.0), float2(0.5, -0.5), float2(0.0, -0.5), float2(-0.5, -0.5)};

    /*
    To Do:
    - option to use png image layer instead of shape - see https://github.com/CeeJayDK/SweetFX/blob/master/Shaders/Layer.fx
    */

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture2D CustomCrosshairBoundingBoxTexture < pooled = false; > { Width = 4; Height = 1; Format = R32F; };
    sampler2D CustomCrosshairBoundingBoxSampler { Texture = CustomCrosshairBoundingBoxTexture; };
    // storage2D CustomCrosshairBoundingBoxStorage { Texture = CustomCrosshairBoundingBoxTexture; };

    texture2D CustomCrosshairVertexTexture < pooled = true; > { Width = 64; Height = 1; Format = RG32F; };
    sampler2D CustomCrosshairVertexSampler { Texture = CustomCrosshairVertexTexture; };

    texture2D CustomCrosshairOverlayTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler2D CustomCrosshairOverlaySampler { Texture = CustomCrosshairOverlayTexture;};

    texture2D CustomCrosshairOverlayShapeTexture <pooled = true; > { Width = BUFFER_WIDTH * 2.0; Height = BUFFER_HEIGHT * 2.0; Format = RGBA8; };
    sampler2D CustomCrosshairOverlayShapeSampler { Texture = CustomCrosshairOverlayShapeTexture;};

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
    float sdBox( in float2 p, in float2 b ) {
        float2 d = abs(p)-b;
        return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
    }

    float sdPie( in float2 p, in float2 c, in float r ) {
        p.x = abs(p.x);
        float l = length(p) - r;
        float m = length(p-c*clamp(dot(p, c), 0.0, r)); // c=sin/cos of aperture
        return max(l, m*sign(c.y*p.x-c.x*p.y));
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
    
    float4 DrawRectangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, int anchor, float outlineSize) {
        const float2 center = fillPos + fillSize * AnchorOffsets[anchor];
        const float sdFill = sdBox(basePos - center, fillSize / 2.0);
        float sdGap = 1.0;

        if (gapSize.x > 0.0 && gapSize.y > 0.0)
            sdGap = sdBox(basePos - center - gapOffset, gapSize / 2.0);
        
        if (sdFill <= outlineSize && sdGap > -outlineSize)
            return fillColor;

        return baseColor;
    }

    float4 DrawEllipse(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, int anchor, float slice, float outlineSize) {
        const float2 center = fillPos + fillSize * AnchorOffsets[anchor];
        fillSize /= 2.0;
        
        const float sdFill = sdEllipse(basePos - center, fillSize);
        float sdGap = 1.0;
        float sdSlice = -1.0;

        if (gapSize.x > 0.0 && gapSize.y > 0.0)
            sdGap = sdEllipse(basePos - center - gapOffset, gapSize / 2.0);
            
        if (slice > 0.0) {
            slice = radians(180.0 - slice / 2.0);
            sdSlice = sdPie(basePos - center, float2(sin(slice), cos(slice)), max(fillSize.x, fillSize.y));
        }

        if (sdFill <= outlineSize && sdGap > -outlineSize && sdSlice <= outlineSize)
            return fillColor;

        return baseColor;
    }

    float4 DrawTriangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, int anchor, float skew, float outlineSize) {
        // float2 AnchorOffsets[9] = {float2(0.5, 0.67), float2(0.0, 0.67), float2(-0.5, 0.67), float2(0.5, 0), float2(0.0, 0), float2(-0.5, 0), float2(0.5, -0.33), float2(0.0, -0.33), float2(-0.5, -0.33)};
        float2 anchorOffset = AnchorOffsets[anchor];
        if (anchorOffset.y != 0.0) anchorOffset.y += 1.0 / 6.0;

        const float2 center = fillPos + fillSize * anchorOffset;
        float2 A = float2 (-fillSize.x / 2.0 * (1.0 + skew / 90.0), fillSize.y / 3.0);
        float2 B = float2 (fillSize.x * skew / 90.0, -fillSize.y * 2.0 / 3.0);
        float2 C = float2 (fillSize.x / 2.0 * (1.0 - skew / 90.0), fillSize.y / 3.0);
        const float sdFill = sdTriangle(basePos - center, A, B, C);
        float sdGap = 1.0;

        if (gapSize.x > 0.0 && gapSize.y > 0.0) {
            A = float2 (-gapSize.x / 2.0 * (1.0 + skew / 90.0), gapSize.y / 3.0);
            B = float2 (gapSize.x * skew / 90.0, -gapSize.y * 2.0 / 3.0);
            C = float2 (gapSize.x / 2.0 * (1.0 - skew / 90.0), gapSize.y / 3.0);
            sdGap = sdTriangle(basePos - center - gapOffset, A, B, C);
        }

        if (sdFill <= outlineSize && sdGap > -outlineSize)
            return fillColor;
        
        return baseColor;
    }

    float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float rotation, int anchor, float slice, float skew, float outlineSize) {
        if (Antialiasing) {
            fillPos += fillPos;
            fillSize += fillSize;
            gapSize += gapSize;
            gapOffset += gapOffset;
            outlineSize += outlineSize;
        }

        if (rotation > 0.0) {
            rotation = -radians(rotation);
            basePos = float4((basePos.x - fillPos.x) * cos(rotation) - (basePos.y - fillPos.y) * sin(rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(rotation) + (basePos.y - fillPos.y) * cos(rotation) + fillPos.y, 0.0, 0.0);
        }
        
        if (shape == 1) return DrawTriangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, anchor, skew, outlineSize);
        else if (shape == 2) return DrawEllipse(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, anchor, slice, outlineSize);
        else return DrawRectangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, anchor, outlineSize);
    }

    float2 GetBoundingBoxVertex(int id, int shape, float2 fillPos, float2 fillSize, float rotation, int anchor, float skew, float outlineSize) {
        float2 retVal;
        outlineSize += 1.0;

        if (shape == 1) { //triangle
            float2 anchorOffset = AnchorOffsets[anchor];
            if (anchorOffset.y != 0.0) anchorOffset.y += 1.0 / 6.0;

            const float2 center = fillPos + fillSize * anchorOffset;
            
            retVal.x = (id < 2) ?
                min(center.x - fillSize.x / 2.0 * (1.0 + skew / 90.0), center.x + fillSize.x * skew / 90.0) -  outlineSize :
                max(center.x + fillSize.x / 2.0 * (1.0 - skew / 90.0), center.x + fillSize.x * skew / 90.0) +  outlineSize;
            
            retVal.y = (id == 0 || id == 2) ?
                center.y - fillSize.y * 2.0 / 3.0 - outlineSize :
                center.y + fillSize.y / 3.0 + outlineSize;
        }
        else { //other
            const float2 center = fillPos + fillSize * AnchorOffsets[anchor];

            retVal.x = (id < 2) ?
                center.x - fillSize.x / 2.0 - outlineSize :
                center.x + fillSize.x / 2.0 +  outlineSize;
            
            retVal.y = (id == 0 || id == 2) ?
                center.y - fillSize.y / 2.0 - outlineSize :
                center.y + fillSize.y / 2.0 + outlineSize;
        }

        if (rotation > 0.0) {
            rotation = radians(rotation);
            retVal.xy = float2((retVal.x - fillPos.x) * cos(rotation) - (retVal.y - fillPos.y) * sin(rotation) + fillPos.x, (retVal.x - fillPos.x) * sin(rotation) + (retVal.y - fillPos.y) * cos(rotation) + fillPos.y);
        }

        retVal /= (Antialiasing) ? BUFFER_SCREEN_SIZE : BUFFER_SCREEN_SIZE * 2.0;
        
        return retVal;
    }

    float2 GetBoundingBoxVertexTL(int id, int shape, float2 fillPos, float2 fillSize, float rotation, int anchor, float skew, float outlineSize) {
        id = id % 6;
        if (id > 2) id -= 2;
        return GetBoundingBoxVertex(id, shape, fillPos, fillSize, rotation, anchor, skew, outlineSize);
    }

// ------------------------------------------------------------------------------------------------------------------------
// Vertex Shaders
// ------------------------------------------------------------------------------------------------------------------------

    void VS_DrawShapes(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD) {
        texcoord.xy = float2(0.0, 0.0);

        int idShape = floor(id / 6);
        if (idShape == 0 && ShapeEnabled1) texcoord.xy = GetBoundingBoxVertexTL(id, Shape1, CenterPoint + Offset1, FillSize1, Rotation1, Anchor1, Skew1, OutlineSize);
        if (idShape == 1 && ShapeEnabled2) texcoord.xy = GetBoundingBoxVertexTL(id, Shape2, CenterPoint + Offset2, FillSize2, Rotation2, Anchor2, Skew2, OutlineSize);
        if (idShape == 2 && ShapeEnabled3) texcoord.xy = GetBoundingBoxVertexTL(id, Shape3, CenterPoint + Offset3, FillSize3, Rotation3, Anchor3, Skew3, OutlineSize);
        if (idShape == 3 && ShapeEnabled4) texcoord.xy = GetBoundingBoxVertexTL(id, Shape4, CenterPoint + Offset4, FillSize4, Rotation4, Anchor4, Skew4, OutlineSize);
        if (idShape == 4 && ShapeEnabled5) texcoord.xy = GetBoundingBoxVertexTL(id, Shape5, CenterPoint + Offset5, FillSize5, Rotation5, Anchor5, Skew5, OutlineSize);
        if (idShape == 5 && ShapeEnabled6) texcoord.xy = GetBoundingBoxVertexTL(id, Shape6, CenterPoint + Offset6, FillSize6, Rotation6, Anchor6, Skew6, OutlineSize);
        if (idShape == 6 && ShapeEnabled7) texcoord.xy = GetBoundingBoxVertexTL(id, Shape7, CenterPoint + Offset7, FillSize7, Rotation7, Anchor7, Skew7, OutlineSize);
        if (idShape == 7 && ShapeEnabled8) texcoord.xy = GetBoundingBoxVertexTL(id, Shape8, CenterPoint + Offset8, FillSize8, Rotation8, Anchor8, Skew8, OutlineSize);
        if (idShape == 8 && ShapeEnabled9) texcoord.xy = GetBoundingBoxVertexTL(id, Shape9, CenterPoint + Offset9, FillSize9, Rotation9, Anchor9, Skew9, OutlineSize);
        if (idShape == 9 && ShapeEnabled10) texcoord.xy = GetBoundingBoxVertexTL(id, Shape10, CenterPoint + Offset10, FillSize10, Rotation10, Anchor10, Skew10, OutlineSize);
        if (idShape == 10 && ShapeEnabled11) texcoord.xy = GetBoundingBoxVertexTL(id, Shape11, CenterPoint + Offset11, FillSize11, Rotation11, Anchor11, Skew11, OutlineSize);
        if (idShape == 11 && ShapeEnabled12) texcoord.xy = GetBoundingBoxVertexTL(id, Shape12, CenterPoint + Offset12, FillSize12, Rotation12, Anchor12, Skew12, OutlineSize);
        if (idShape == 12 && ShapeEnabled13) texcoord.xy = GetBoundingBoxVertexTL(id, Shape13, CenterPoint + Offset13, FillSize13, Rotation13, Anchor13, Skew13, OutlineSize);
        if (idShape == 13 && ShapeEnabled14) texcoord.xy = GetBoundingBoxVertexTL(id, Shape14, CenterPoint + Offset14, FillSize14, Rotation14, Anchor14, Skew14, OutlineSize);
        if (idShape == 14 && ShapeEnabled15) texcoord.xy = GetBoundingBoxVertexTL(id, Shape15, CenterPoint + Offset15, FillSize15, Rotation15, Anchor15, Skew15, OutlineSize);
        if (idShape == 15 && ShapeEnabled16) texcoord.xy = GetBoundingBoxVertexTL(id, Shape16, CenterPoint + Offset16, FillSize16, Rotation16, Anchor16, Skew16, OutlineSize);
        
        position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float4 PS_DrawShapeOutline(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (OutlineSize < 1.0 || OutlineColor.a == 0.0) discard;
        
        float4 color;
        if (ShapeEnabled1) color = DrawShape(Shape1, color, pos, CenterPoint + Offset1, FillSize1, OutlineColor, GapSize1, GapOffset1, Rotation1, Anchor1, Slice1, Skew1, OutlineSize);
        if (ShapeEnabled2) color = DrawShape(Shape2, color, pos, CenterPoint + Offset2, FillSize2, OutlineColor, GapSize2, GapOffset2, Rotation2, Anchor2, Slice2, Skew2, OutlineSize);
        if (ShapeEnabled3) color = DrawShape(Shape3, color, pos, CenterPoint + Offset3, FillSize3, OutlineColor, GapSize3, GapOffset3, Rotation3, Anchor3, Slice3, Skew3, OutlineSize);
        if (ShapeEnabled4) color = DrawShape(Shape4, color, pos, CenterPoint + Offset4, FillSize4, OutlineColor, GapSize4, GapOffset4, Rotation4, Anchor4, Slice4, Skew4, OutlineSize);
        if (ShapeEnabled5) color = DrawShape(Shape5, color, pos, CenterPoint + Offset5, FillSize5, OutlineColor, GapSize5, GapOffset5, Rotation5, Anchor5, Slice5, Skew5, OutlineSize);
        if (ShapeEnabled6) color = DrawShape(Shape6, color, pos, CenterPoint + Offset6, FillSize6, OutlineColor, GapSize6, GapOffset6, Rotation6, Anchor6, Slice6, Skew6, OutlineSize);
        if (ShapeEnabled7) color = DrawShape(Shape7, color, pos, CenterPoint + Offset7, FillSize7, OutlineColor, GapSize7, GapOffset7, Rotation7, Anchor7, Slice7, Skew7, OutlineSize);
        if (ShapeEnabled8) color = DrawShape(Shape8, color, pos, CenterPoint + Offset8, FillSize8, OutlineColor, GapSize8, GapOffset8, Rotation8, Anchor8, Slice8, Skew8, OutlineSize);
        if (ShapeEnabled9) color = DrawShape(Shape9, color, pos, CenterPoint + Offset9, FillSize9, OutlineColor, GapSize9, GapOffset9, Rotation9, Anchor9, Slice9, Skew9, OutlineSize);
        if (ShapeEnabled10) color = DrawShape(Shape10, color, pos, CenterPoint + Offset10, FillSize10, OutlineColor, GapSize10, GapOffset10, Rotation10, Anchor10, Slice10, Skew10, OutlineSize);
        if (ShapeEnabled11) color = DrawShape(Shape11, color, pos, CenterPoint + Offset11, FillSize11, OutlineColor, GapSize11, GapOffset11, Rotation11, Anchor11, Slice11, Skew11, OutlineSize);
        if (ShapeEnabled12) color = DrawShape(Shape12, color, pos, CenterPoint + Offset12, FillSize12, OutlineColor, GapSize12, GapOffset12, Rotation12, Anchor12, Slice12, Skew12, OutlineSize);
        if (ShapeEnabled13) color = DrawShape(Shape13, color, pos, CenterPoint + Offset13, FillSize13, OutlineColor, GapSize13, GapOffset13, Rotation13, Anchor13, Slice13, Skew13, OutlineSize);
        if (ShapeEnabled14) color = DrawShape(Shape14, color, pos, CenterPoint + Offset14, FillSize14, OutlineColor, GapSize14, GapOffset14, Rotation14, Anchor14, Slice14, Skew14, OutlineSize);
        if (ShapeEnabled15) color = DrawShape(Shape15, color, pos, CenterPoint + Offset15, FillSize15, OutlineColor, GapSize15, GapOffset15, Rotation15, Anchor15, Slice15, Skew15, OutlineSize);
        if (ShapeEnabled16) color = DrawShape(Shape16, color, pos, CenterPoint + Offset16, FillSize16, OutlineColor, GapSize16, GapOffset16, Rotation16, Anchor16, Slice16, Skew16, OutlineSize);
        
        if (color.a > 0.0) return color;
        
        discard;
    }

    float4 PS_DrawShapeFill(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (FillColor.a == 0.0) discard;
        
        float4 color;
        if (ShapeEnabled1) color = DrawShape(Shape1, color, pos, CenterPoint + Offset1, FillSize1, FillColor, GapSize1, GapOffset1, Rotation1, Anchor1, Slice1, Skew1, 0.0);
        if (ShapeEnabled2) color = DrawShape(Shape2, color, pos, CenterPoint + Offset2, FillSize2, FillColor, GapSize2, GapOffset2, Rotation2, Anchor2, Slice2, Skew2, 0.0);
        if (ShapeEnabled3) color = DrawShape(Shape3, color, pos, CenterPoint + Offset3, FillSize3, FillColor, GapSize3, GapOffset3, Rotation3, Anchor3, Slice3, Skew3, 0.0);
        if (ShapeEnabled4) color = DrawShape(Shape4, color, pos, CenterPoint + Offset4, FillSize4, FillColor, GapSize4, GapOffset4, Rotation4, Anchor4, Slice4, Skew4, 0.0);
        if (ShapeEnabled5) color = DrawShape(Shape5, color, pos, CenterPoint + Offset5, FillSize5, FillColor, GapSize5, GapOffset5, Rotation5, Anchor5, Slice5, Skew5, 0.0);
        if (ShapeEnabled6) color = DrawShape(Shape6, color, pos, CenterPoint + Offset6, FillSize6, FillColor, GapSize6, GapOffset6, Rotation6, Anchor6, Slice6, Skew6, 0.0);
        if (ShapeEnabled7) color = DrawShape(Shape7, color, pos, CenterPoint + Offset7, FillSize7, FillColor, GapSize7, GapOffset7, Rotation7, Anchor7, Slice7, Skew7, 0.0);
        if (ShapeEnabled8) color = DrawShape(Shape8, color, pos, CenterPoint + Offset8, FillSize8, FillColor, GapSize8, GapOffset8, Rotation8, Anchor8, Slice8, Skew8, 0.0);
        if (ShapeEnabled9) color = DrawShape(Shape9, color, pos, CenterPoint + Offset9, FillSize9, FillColor, GapSize9, GapOffset9, Rotation9, Anchor9, Slice9, Skew9, 0.0);
        if (ShapeEnabled10) color = DrawShape(Shape10, color, pos, CenterPoint + Offset10, FillSize10, FillColor, GapSize10, GapOffset10, Rotation10, Anchor10, Slice10, Skew10, 0.0);
        if (ShapeEnabled11) color = DrawShape(Shape11, color, pos, CenterPoint + Offset11, FillSize11, FillColor, GapSize11, GapOffset11, Rotation11, Anchor11, Slice11, Skew11, 0.0);
        if (ShapeEnabled12) color = DrawShape(Shape12, color, pos, CenterPoint + Offset12, FillSize12, FillColor, GapSize12, GapOffset12, Rotation12, Anchor12, Slice12, Skew12, 0.0);
        if (ShapeEnabled13) color = DrawShape(Shape13, color, pos, CenterPoint + Offset13, FillSize13, FillColor, GapSize13, GapOffset13, Rotation13, Anchor13, Slice13, Skew13, 0.0);
        if (ShapeEnabled14) color = DrawShape(Shape14, color, pos, CenterPoint + Offset14, FillSize14, FillColor, GapSize14, GapOffset14, Rotation14, Anchor14, Slice14, Skew14, 0.0);
        if (ShapeEnabled15) color = DrawShape(Shape15, color, pos, CenterPoint + Offset15, FillSize15, FillColor, GapSize15, GapOffset15, Rotation15, Anchor15, Slice15, Skew15, 0.0);
        if (ShapeEnabled16) color = DrawShape(Shape16, color, pos, CenterPoint + Offset16, FillSize16, FillColor, GapSize16, GapOffset16, Rotation16, Anchor16, Slice16, Skew16, 0.0);
        
        if (color.a > 0.0) return color;
        
        discard;
    }

    float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (!Antialiasing)
            return tex2Dfetch(CustomCrosshairOverlayShapeSampler, floor(pos.xy), 0);
        
        // alpha-weighted bilinear downscale
        const int2 intPos = floor(pos.xy) * 2;
        float4 p0 = tex2Dfetch(CustomCrosshairOverlayShapeSampler, intPos, 0);
        float4 p1 = tex2Dfetch(CustomCrosshairOverlayShapeSampler, intPos + int2(1, 0), 0);
        float4 p2 = tex2Dfetch(CustomCrosshairOverlayShapeSampler, intPos + int2(0, 1), 0);
        float4 p3 = tex2Dfetch(CustomCrosshairOverlayShapeSampler, intPos + int2(1, 1), 0);
        float w4 = p0.a + p1.a + p2.a + p3.a;
        return float4(p0.rgb * p0.a / w4 + p1.rgb * p1.a / w4 + p2.rgb * p2.a / w4 + p3.rgb * p3.a / w4, w4 / 4.0);
    }

    float2 PS_VertexCoord(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        int idShape = floor(pos.x / 4);
        int idVertex = pos.x % 4;

        float2 texcoord = Antialiasing ? 0.5 : 0.25;
        if (idShape == 0 && ShapeEnabled1) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape1, CenterPoint + Offset1, FillSize1, Rotation1, Anchor1, Skew1, OutlineSize);
        if (idShape == 1 && ShapeEnabled2) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape2, CenterPoint + Offset2, FillSize2, Rotation2, Anchor2, Skew2, OutlineSize);
        if (idShape == 2 && ShapeEnabled3) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape3, CenterPoint + Offset3, FillSize3, Rotation3, Anchor3, Skew3, OutlineSize);
        if (idShape == 3 && ShapeEnabled4) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape4, CenterPoint + Offset4, FillSize4, Rotation4, Anchor4, Skew4, OutlineSize);
        if (idShape == 4 && ShapeEnabled5) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape5, CenterPoint + Offset5, FillSize5, Rotation5, Anchor5, Skew5, OutlineSize);
        if (idShape == 5 && ShapeEnabled6) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape6, CenterPoint + Offset6, FillSize6, Rotation6, Anchor6, Skew6, OutlineSize);
        if (idShape == 6 && ShapeEnabled7) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape7, CenterPoint + Offset7, FillSize7, Rotation7, Anchor7, Skew7, OutlineSize);
        if (idShape == 7 && ShapeEnabled8) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape8, CenterPoint + Offset8, FillSize8, Rotation8, Anchor8, Skew8, OutlineSize);
        if (idShape == 8 && ShapeEnabled9) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape9, CenterPoint + Offset9, FillSize9, Rotation9, Anchor9, Skew9, OutlineSize);
        if (idShape == 9 && ShapeEnabled10) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape10, CenterPoint + Offset10, FillSize10, Rotation10, Anchor10, Skew10, OutlineSize);
        if (idShape == 10 && ShapeEnabled11) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape11, CenterPoint + Offset11, FillSize11, Rotation11, Anchor11, Skew11, OutlineSize);
        if (idShape == 11 && ShapeEnabled12) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape12, CenterPoint + Offset12, FillSize12, Rotation12, Anchor12, Skew12, OutlineSize);
        if (idShape == 12 && ShapeEnabled13) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape13, CenterPoint + Offset13, FillSize13, Rotation13, Anchor13, Skew13, OutlineSize);
        if (idShape == 13 && ShapeEnabled14) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape14, CenterPoint + Offset14, FillSize14, Rotation14, Anchor14, Skew14, OutlineSize);
        if (idShape == 14 && ShapeEnabled15) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape15, CenterPoint + Offset15, FillSize15, Rotation15, Anchor15, Skew15, OutlineSize);
        if (idShape == 15 && ShapeEnabled16) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape16, CenterPoint + Offset16, FillSize16, Rotation16, Anchor16, Skew16, OutlineSize);
        if (!Antialiasing) texcoord *= 2.0;
        return texcoord;
    }

    float PS_BoundingBox(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        int id = floor(pos.x);
        float retval = 0.5;
        float2 vertCoord;
        for (int i = 0; i < 64; i++) {
            vertCoord.xy = tex2Dfetch(CustomCrosshairVertexSampler, int2(i, 0), 0).rg;
            if (id == 0) retval = min(retval, vertCoord.x);
            if (id == 1) retval = min(retval, vertCoord.y);
            if (id == 2) retval = max(retval, vertCoord.x);
            if (id == 3) retval = max(retval, vertCoord.y);
        }
        return retval;
    }

// ------------------------------------------------------------------------------------------------------------------------
// Compute Shaders
// ------------------------------------------------------------------------------------------------------------------------

    // groupshared int boundingBox[4];

    // void CS_BoundingBox(uint3 tid: SV_GROUPTHREADID) {
    //     int idShape = floor(tid.x / 4);
    //     int idVertex = tid.x % 4;

    //     float2 texcoord = CenterPoint;
    //     if (idShape == 0 && ShapeEnabled1) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape1, CenterPoint + Offset1, FillSize1, Rotation1, Anchor1, Skew1, OutlineSize);
    //     if (idShape == 1 && ShapeEnabled2) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape2, CenterPoint + Offset2, FillSize2, Rotation2, Anchor2, Skew2, OutlineSize);
    //     if (idShape == 2 && ShapeEnabled3) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape3, CenterPoint + Offset3, FillSize3, Rotation3, Anchor3, Skew3, OutlineSize);
    //     if (idShape == 3 && ShapeEnabled4) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape4, CenterPoint + Offset4, FillSize4, Rotation4, Anchor4, Skew4, OutlineSize);
    //     if (idShape == 4 && ShapeEnabled5) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape5, CenterPoint + Offset5, FillSize5, Rotation5, Anchor5, Skew5, OutlineSize);
    //     if (idShape == 5 && ShapeEnabled6) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape6, CenterPoint + Offset6, FillSize6, Rotation6, Anchor6, Skew6, OutlineSize);
    //     if (idShape == 6 && ShapeEnabled7) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape7, CenterPoint + Offset7, FillSize7, Rotation7, Anchor7, Skew7, OutlineSize);
    //     if (idShape == 7 && ShapeEnabled8) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape8, CenterPoint + Offset8, FillSize8, Rotation8, Anchor8, Skew8, OutlineSize);
    //     if (idShape == 8 && ShapeEnabled9) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape9, CenterPoint + Offset9, FillSize9, Rotation9, Anchor9, Skew9, OutlineSize);
    //     if (idShape == 9 && ShapeEnabled10) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape10, CenterPoint + Offset10, FillSize10, Rotation10, Anchor10, Skew10, OutlineSize);
    //     if (idShape == 10 && ShapeEnabled11) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape11, CenterPoint + Offset11, FillSize11, Rotation11, Anchor11, Skew11, OutlineSize);
    //     if (idShape == 11 && ShapeEnabled12) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape12, CenterPoint + Offset12, FillSize12, Rotation12, Anchor12, Skew12, OutlineSize);
    //     if (idShape == 12 && ShapeEnabled13) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape13, CenterPoint + Offset13, FillSize13, Rotation13, Anchor13, Skew13, OutlineSize);
    //     if (idShape == 13 && ShapeEnabled14) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape14, CenterPoint + Offset14, FillSize14, Rotation14, Anchor14, Skew14, OutlineSize);
    //     if (idShape == 14 && ShapeEnabled15) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape15, CenterPoint + Offset15, FillSize15, Rotation15, Anchor15, Skew15, OutlineSize);
    //     if (idShape == 15 && ShapeEnabled16) texcoord.xy = GetBoundingBoxVertex(idVertex, Shape16, CenterPoint + Offset16, FillSize16, Rotation16, Anchor16, Skew16, OutlineSize);

    //     int2 texpos = Antialiasing ? floor(texcoord.xy * BUFFER_SCREEN_SIZE) : floor(texcoord.xy * BUFFER_SCREEN_SIZE * 2.0);
        
    //     atomicMin(boundingBox[0], texpos.x);
    //     atomicMin(boundingBox[1], texpos.y);
    //     atomicMax(boundingBox[2], texpos.x);
    //     atomicMax(boundingBox[3], texpos.y);
    //     groupMemoryBarrier();
    //     barrier();

    //     if (tid.x == 0) {
    //         tex2Dstore(CustomCrosshairBoundingBoxStorage, int2(0, 0), float(boundingBox[0] / BUFFER_WIDTH));
    //         tex2Dstore(CustomCrosshairBoundingBoxStorage, int2(1, 0), float(boundingBox[1] / BUFFER_HEIGHT));
    //         tex2Dstore(CustomCrosshairBoundingBoxStorage, int2(2, 0), float(boundingBox[2] / BUFFER_WIDTH));
    //         tex2Dstore(CustomCrosshairBoundingBoxStorage, int2(3, 0), float(boundingBox[3] / BUFFER_HEIGHT));
    //     }
    // }

// ------------------------------------------------------------------------------------------------------------------------
// Techniques
// ------------------------------------------------------------------------------------------------------------------------

    technique CustomCrosshairStartup <
        ui_label = "CustomCrosshairStartup";
        ui_tooltip = "Apply settings and cache overlay texture.";
        hidden = true;
        enabled = true;
        timeout = 1;
    > {
        // pass BoundingBox {
        //     ComputeShader = CS_BoundingBox<64,1,1>;
        //     DispatchSizeX = 1;
        //     DispatchSizeY = 1;
		//     DispatchSizeZ = 1;
        // }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_VertexCoord;
            RenderTarget = CustomCrosshairVertexTexture;
        }
        pass BoundingBox {
            VertexShader = PostProcessVS;
            PixelShader = PS_BoundingBox;
            RenderTarget = CustomCrosshairBoundingBoxTexture;
        }
        // Build Overlay
        pass Outline {
            VertexCount = 96;
            VertexShader = VS_DrawShapes;
            PixelShader = PS_DrawShapeOutline;
            RenderTarget = CustomCrosshairOverlayShapeTexture;
            ClearRenderTargets = true;
        }
        pass Fill {
            VertexCount = 96;
            VertexShader = VS_DrawShapes;
            PixelShader = PS_DrawShapeFill;
            RenderTarget = CustomCrosshairOverlayShapeTexture;
        }
        // Transfer overlayShape to overlay texture
        pass Downscale {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshair;
            RenderTarget = CustomCrosshairOverlayTexture;
        }
    }

    technique CustomCrosshairSetup <
        ui_label = "CustomCrosshairSetup";
        ui_tooltip = "Enable to apply config changes to \"CustomCrosshair.\"\n"
                        "Disable for performance\n\n"
                        "\"CustomCrosshair\" must be enabled to see results.";
    > {
        // pass BoundingBox {
        //     ComputeShader = CS_BoundingBox<64,1,1>;
        //     DispatchSizeX = 1;
        //     DispatchSizeY = 1;
		//     DispatchSizeZ = 1;
        // }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_VertexCoord;
            RenderTarget = CustomCrosshairVertexTexture;
        }
        pass BoundingBox {
            VertexShader = PostProcessVS;
            PixelShader = PS_BoundingBox;
            RenderTarget = CustomCrosshairBoundingBoxTexture;
        }
        // Build Overlay
        pass Outline {
            VertexCount = 96;
            VertexShader = VS_DrawShapes;
            PixelShader = PS_DrawShapeOutline;
            RenderTarget = CustomCrosshairOverlayShapeTexture;
            ClearRenderTargets = true;
        }
        pass Fill {
            VertexCount = 96;
            VertexShader = VS_DrawShapes;
            PixelShader = PS_DrawShapeFill;
            RenderTarget = CustomCrosshairOverlayShapeTexture;
        }
        // Transfer overlayShape to overlay texture
        pass Downscale {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshair;
            RenderTarget = CustomCrosshairOverlayTexture;
        }
    }
