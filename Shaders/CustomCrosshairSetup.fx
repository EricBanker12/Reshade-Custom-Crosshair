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
    > = float4(1, 1, 1, 0.75f);

    uniform float4 OutlineColor <
        ui_type = "color";
        ui_label = "Outline Color";
        ui_category = "Crosshair Setup";
        ui_category_closed = true;

    > = float4(0, 0, 0, 0.5f);

    uniform float OutlineSize <
        ui_type = "drag";
        ui_label = "Outline Size";
        ui_min = 0;
        ui_max = 200.0f;
        ui_step = 1.0f;
        ui_category = "Crosshair Setup";
        ui_category_closed = true;
    > = 1.0f;

    // uniform bool Antialiasing <
    //     ui_label = "Antialiasing";
    //     ui_tooltip = "Applies SSAA x4.";
    //     ui_category = "Crosshair Setup";
    //     ui_category_closed = true;
    // > = true;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = float2(10,2);

    uniform float2 GapSize1 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset1 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = float2(5, 0);

    uniform float2 GapOffset1 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation1 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = 0;

    uniform float Skew1 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice1 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 01";
        ui_category_closed = true;
    > = 0;

    // uniform float4 FillColor1 <
    //     ui_type = "color";
    //     ui_label = "Fill Color";
    //     ui_category = "Crosshair Shape 01";
    //    ui_category_closed = true;
    // > = float4(1, 1, 1, 0.9f);

    // uniform float OutlineSize1 <
    //     ui_type = "drag";
    //     ui_label = "Outline Size";
    //     ui_min = 0;
    //     ui_max = 200.0f;
    //     ui_step = 1.0f;
    //     ui_category = "Crosshair Shape 01";
    //    ui_category_closed = true;
    // > = 1.0f;

    // uniform float4 OutlineColor1 <
    //     ui_type = "color";
    //     ui_label = "Outline Color";
    //     ui_category = "Crosshair Shape 01";
    //    ui_category_closed = true;
    // > = float4(0, 0, 0, 0.9f);

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = float2(2,10);

    uniform float2 GapSize2 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset2 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = float2(0, 5);

    uniform float2 GapOffset2 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation2 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Skew2 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice2 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 02";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = float2(10,2);

    uniform float2 GapSize3 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset3 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = float2(-5, 0);

    uniform float2 GapOffset3 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation3 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Skew3 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice3 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 03";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = float2(2,10);

    uniform float2 GapSize4 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset4 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = float2(0, -5);

    uniform float2 GapOffset4 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation4 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Skew4 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice4 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 04";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = float2(2,2);

    uniform float2 GapSize5 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset5 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset5 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation5 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = 0;

    uniform float Skew5 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice5 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 05";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = float2(22,22);

    uniform float2 GapSize6 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = float2(18,18);

    uniform float2 Offset6 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset6 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation6 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = 0;

    uniform float Skew6 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice6 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 06";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize7 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset7 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset7 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation7 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = 0;

    uniform float Skew7 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice7 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 07";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize8 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset8 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset8 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation8 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = 0;

    uniform float Skew8 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice8 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 08";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize9 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset9 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset9 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation9 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = 0;

    uniform float Skew9 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice9 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 09";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize10 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset10 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset10 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation10 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = 0;

    uniform float Skew10 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice10 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 10";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize11 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset11 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset11 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation11 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = 0;

    uniform float Skew11 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice11 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 11";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize12 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset12 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset12 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation12 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = 0;

    uniform float Skew12 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice12 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 12";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize13 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset13 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset13 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation13 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = 0;

    uniform float Skew13 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice13 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 13";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize14 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset14 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset14 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation14 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = 0;

    uniform float Skew14 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice14 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 14";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize15 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset15 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset15 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation15 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = 0;

    uniform float Skew15 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice15 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 15";
        ui_category_closed = true;
    > = 0;

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
        ui_min = 1;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = float2(10,10);

    uniform float2 GapSize16 <
        ui_type = "drag";
        ui_label = "Gap Size";
        ui_min = 0;
        ui_max = 1000;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = float2(0,0);

    uniform float2 Offset16 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Offset";
        ui_tooltip = "Horizontal and Vertical offset for the shape relative to the window center or mouse cursor.";
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float2 GapOffset16 <
        ui_type = "drag";
        ui_min = float2(BUFFER_WIDTH / -2.0f, BUFFER_HEIGHT / -2.0f);
        ui_max = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
        ui_step = 1.0f;
        ui_label = "Gap Offset";
        ui_tooltip = "Horizontal and Vertical offset for the gap relative to the shape center.";
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = float2(0, 0);

    uniform float Rotation16 <
        ui_type = "drag";
        ui_label = "Rotation";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = 0;

    uniform float Skew16 <
        ui_type = "drag";
        ui_label = "Skew";
        ui_tooltip = "The skew of a Triangle to render in degrees. No effect on Rectangles or Ellipses.";
        ui_min = -90;
        ui_max = 90;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = 0.0f;

    uniform float Slice16 <
        ui_type = "drag";
        ui_label = "Slice";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair Shape 16";
        ui_category_closed = true;
    > = 0;

// ------------------------------------------------------------------------------------------------------------------------
// Hidden or Static Variables
// ------------------------------------------------------------------------------------------------------------------------

    static const float2 CenterPoint = float2(BUFFER_WIDTH / 2.0f, BUFFER_HEIGHT / 2.0f);
    static const float2 PixelOffset = float2(0.5f, 0.5f);
    static const float2 anchorOffsets[9] = {float2(0.5f, 0.5f), float2(0, 0.5f), float2(-0.5f, 0.5f), float2(0.5f, 0), float2(0, 0), float2(-0.5f, 0), float2(0.5f, -0.5f), float2(0, -0.5f), float2(-0.5f, -0.5f)};
    
    uniform float2 MousePoint < source = "mousepoint"; >;

    /*
    To Do:
    - option to use png image layer instead of shape - see https://github.com/CeeJayDK/SweetFX/blob/master/Shaders/Layer.fx
    - hotkey enable/disable shapes - might be easier to duplicate fx file for switching between different crosshairs
    - hotkey animated transformations - likely too expensive unless pre-rendered - could use overlay LoD for frames?

    */

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture CustomCrosshairOverlayTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler CustomCrosshairOverlaySampler { Texture = CustomCrosshairOverlayTexture;};

    // texture CustomCrosshairOverlayShapeTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    // sampler CustomCrosshairOverlayShapeSampler { Texture = CustomCrosshairOverlayShapeTexture;};

    texture CustomCrosshairOverlayShapeSSAATexture <pooled = false; > { Width = BUFFER_WIDTH * 2.0; Height = BUFFER_HEIGHT * 2.0; Format = RGBA8; };
    sampler CustomCrosshairOverlayShapeSSAASampler { Texture = CustomCrosshairOverlayShapeSSAATexture;};

    texture CustomCrosshairOverlaySSAATexture <pooled = false; > { Width = BUFFER_WIDTH * 2.0; Height = BUFFER_HEIGHT * 2.0; Format = RGBA8; };
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
    
    float4 DrawRectangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, int anchor, float outlineSize) {
        const float2 center = fillPos + fillSize * anchorOffsets[anchor];
        const float sdFill = sdBox(basePos - center, fillSize / 2.0f);
        float sdGap = 1.0f;

        if (gapSize.x > 0 && gapSize.y > 0)
            sdGap = sdBox(basePos - center - gapOffset, gapSize / 2.0f);
        
        if (sdFill <= outlineSize && sdGap > -outlineSize)
            return fillColor;

        return baseColor;
    }

    float4 DrawEllipse(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, int anchor, float slice, float outlineSize) {
        const float2 center = fillPos + fillSize * anchorOffsets[anchor];
        fillSize /= 2.0f;
        
        const float sdFill = sdEllipse(basePos - center, fillSize);
        float sdGap = 1.0f;
        float sdSlice = -1.0f;

        if (gapSize.x > 0 && gapSize.y > 0)
            sdGap = sdEllipse(basePos - center - gapOffset, gapSize / 2.0f);
            
        if (slice > 0) {
            slice = radians(180.0f - slice / 2.0f);
            sdSlice = sdPie(basePos - center, float2(sin(slice), cos(slice)), max(fillSize.x, fillSize.y));
        }

        if (sdFill <= outlineSize && sdGap > -outlineSize && sdSlice <= outlineSize)
            return fillColor;

        return baseColor;
    }

    float4 DrawTriangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, int anchor, float skew, float outlineSize) {
        // float2 anchorOffsets[9] = {float2(0.5f, 0.67f), float2(0, 0.67f), float2(-0.5f, 0.67f), float2(0.5f, 0), float2(0, 0), float2(-0.5f, 0f), float2(0.5f, -0.33f), float2(0, -0.33f), float2(-0.5f, -0.33f)};
        float2 anchorOffset = anchorOffsets[anchor];
        if (anchorOffset.y != 0.0f) anchorOffset.y += 1.0f / 6.0f;

        const float2 center = fillPos + fillSize * anchorOffset;
        float2 A = float2 (-fillSize.x / 2.0f * (1 + skew / 90.0f), fillSize.y / 3.0f);
        float2 B = float2 (fillSize.x * skew / 90.0f, -fillSize.y * 2.0f / 3.0f);
        float2 C = float2 (fillSize.x / 2.0f * (1 - skew / 90.0f), fillSize.y / 3.0f);
        const float sdFill = sdTriangle(basePos - center, A, B, C);
        float sdGap = 1.0f;

        if (gapSize.x > 0 && gapSize.y > 0) {
            A = float2 (-gapSize.x / 2.0f * (1 + skew / 90.0f), gapSize.y / 3.0f);
            B = float2 (gapSize.x * skew / 90.0f, -gapSize.y * 2.0f / 3.0f);
            C = float2 (gapSize.x / 2.0f * (1 - skew / 90.0f), gapSize.y / 3.0f);
            sdGap = sdTriangle(basePos - center - gapOffset, A, B, C);
        }

        if (sdFill <= outlineSize && sdGap > -outlineSize)
            return fillColor;
        
        return baseColor;
    }

    float4 DrawShapeRectangle(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float rotation, int anchor, float slice, float skew, float outlineSize) {
        fillPos += fillPos;
        fillSize += fillSize;
        gapSize += gapSize;
        gapOffset += gapOffset;
        outlineSize += outlineSize;

        if (rotation > 0) {
            rotation = -radians(rotation);
            basePos = float4((basePos.x - fillPos.x) * cos(rotation) - (basePos.y - fillPos.y) * sin(rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(rotation) + (basePos.y - fillPos.y) * cos(rotation) + fillPos.y, 0, 0);
        }
        
        // if (shape == 1) return DrawTriangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, anchor, skew, outlineSize);
        // if (shape == 2) return DrawEllipse(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, anchor, slice, outlineSize);
        return DrawRectangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, anchor, outlineSize);
    }

    float4 DrawShapeTriangle(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float rotation, int anchor, float slice, float skew, float outlineSize) {
        fillPos += fillPos;
        fillSize += fillSize;
        gapSize += gapSize;
        gapOffset += gapOffset;
        outlineSize += outlineSize;

        if (rotation > 0) {
            rotation = -radians(rotation);
            basePos = float4((basePos.x - fillPos.x) * cos(rotation) - (basePos.y - fillPos.y) * sin(rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(rotation) + (basePos.y - fillPos.y) * cos(rotation) + fillPos.y, 0, 0);
        }
        
        return DrawTriangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, anchor, skew, outlineSize);
    }

    float4 DrawShapeEllipse(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float rotation, int anchor, float slice, float skew, float outlineSize) {
        fillPos += fillPos;
        fillSize += fillSize;
        gapSize += gapSize;
        gapOffset += gapOffset;
        outlineSize += outlineSize;

        if (rotation > 0) {
            rotation = -radians(rotation);
            basePos = float4((basePos.x - fillPos.x) * cos(rotation) - (basePos.y - fillPos.y) * sin(rotation) + fillPos.x, (basePos.x - fillPos.x) * sin(rotation) + (basePos.y - fillPos.y) * cos(rotation) + fillPos.y, 0, 0);
        }
        
        return DrawEllipse(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, anchor, slice, outlineSize);
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float4 PS_CustomCrosshairShapeSSAA(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        int2 intPos = floor(pos.xy);
        
        float4 color = tex2Dfetch(CustomCrosshairOverlayShapeSSAASampler, intPos, 0);
        if (color.a > 0) return color;
        
        discard;
    }

    float4 PS_CustomCrosshairSSAARectangleFill(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (FillColor.a == 0.0f) discard;

        float4 color;

        // fill
        if (ShapeEnabled1 && Shape1 == 0) color = DrawShapeRectangle(Shape1, color, pos, CenterPoint + Offset1, FillSize1, FillColor, GapSize1, GapOffset1, Rotation1, Anchor1, Slice1, Skew1, 0);
        if (ShapeEnabled2 && Shape2 == 0) color = DrawShapeRectangle(Shape2, color, pos, CenterPoint + Offset2, FillSize2, FillColor, GapSize2, GapOffset2, Rotation2, Anchor2, Slice2, Skew2, 0);
        if (ShapeEnabled3 && Shape3 == 0) color = DrawShapeRectangle(Shape3, color, pos, CenterPoint + Offset3, FillSize3, FillColor, GapSize3, GapOffset3, Rotation3, Anchor3, Slice3, Skew3, 0);
        if (ShapeEnabled4 && Shape4 == 0) color = DrawShapeRectangle(Shape4, color, pos, CenterPoint + Offset4, FillSize4, FillColor, GapSize4, GapOffset4, Rotation4, Anchor4, Slice4, Skew4, 0);
        if (ShapeEnabled5 && Shape5 == 0) color = DrawShapeRectangle(Shape5, color, pos, CenterPoint + Offset5, FillSize5, FillColor, GapSize5, GapOffset5, Rotation5, Anchor5, Slice5, Skew5, 0);
        if (ShapeEnabled6 && Shape6 == 0) color = DrawShapeRectangle(Shape6, color, pos, CenterPoint + Offset6, FillSize6, FillColor, GapSize6, GapOffset6, Rotation6, Anchor6, Slice6, Skew6, 0);
        if (ShapeEnabled7 && Shape7 == 0) color = DrawShapeRectangle(Shape7, color, pos, CenterPoint + Offset7, FillSize7, FillColor, GapSize7, GapOffset7, Rotation7, Anchor7, Slice7, Skew7, 0);
        if (ShapeEnabled8 && Shape8 == 0) color = DrawShapeRectangle(Shape8, color, pos, CenterPoint + Offset8, FillSize8, FillColor, GapSize8, GapOffset8, Rotation8, Anchor8, Slice8, Skew8, 0);
        if (ShapeEnabled9 && Shape9 == 0) color = DrawShapeRectangle(Shape9, color, pos, CenterPoint + Offset9, FillSize9, FillColor, GapSize9, GapOffset9, Rotation9, Anchor9, Slice9, Skew9, 0);
        if (ShapeEnabled10 && Shape10 == 0) color = DrawShapeRectangle(Shape10, color, pos, CenterPoint + Offset10, FillSize10, FillColor, GapSize10, GapOffset10, Rotation10, Anchor10, Slice10, Skew10, 0);
        if (ShapeEnabled11 && Shape11 == 0) color = DrawShapeRectangle(Shape11, color, pos, CenterPoint + Offset11, FillSize11, FillColor, GapSize11, GapOffset11, Rotation11, Anchor11, Slice11, Skew11, 0);
        if (ShapeEnabled12 && Shape12 == 0) color = DrawShapeRectangle(Shape12, color, pos, CenterPoint + Offset12, FillSize12, FillColor, GapSize12, GapOffset12, Rotation12, Anchor12, Slice12, Skew12, 0);
        if (ShapeEnabled13 && Shape13 == 0) color = DrawShapeRectangle(Shape13, color, pos, CenterPoint + Offset13, FillSize13, FillColor, GapSize13, GapOffset13, Rotation13, Anchor13, Slice13, Skew13, 0);
        if (ShapeEnabled14 && Shape14 == 0) color = DrawShapeRectangle(Shape14, color, pos, CenterPoint + Offset14, FillSize14, FillColor, GapSize14, GapOffset14, Rotation14, Anchor14, Slice14, Skew14, 0);
        if (ShapeEnabled15 && Shape15 == 0) color = DrawShapeRectangle(Shape15, color, pos, CenterPoint + Offset15, FillSize15, FillColor, GapSize15, GapOffset15, Rotation15, Anchor15, Slice15, Skew15, 0);
        if (ShapeEnabled16 && Shape16 == 0) color = DrawShapeRectangle(Shape16, color, pos, CenterPoint + Offset16, FillSize16, FillColor, GapSize16, GapOffset16, Rotation16, Anchor16, Slice16, Skew16, 0);

        return color;
    }

    float4 PS_CustomCrosshairSSAARectangleOutline(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (OutlineSize < 1 || OutlineColor.a == 0.0f) discard;

        float4 color;

        // outline
        if (ShapeEnabled1 && Shape1 == 0) color = DrawShapeRectangle(Shape1, color, pos, CenterPoint + Offset1, FillSize1, OutlineColor, GapSize1, GapOffset1, Rotation1, Anchor1, Slice1, Skew1, OutlineSize);
        if (ShapeEnabled2 && Shape2 == 0) color = DrawShapeRectangle(Shape2, color, pos, CenterPoint + Offset2, FillSize2, OutlineColor, GapSize2, GapOffset2, Rotation2, Anchor2, Slice2, Skew2, OutlineSize);
        if (ShapeEnabled3 && Shape3 == 0) color = DrawShapeRectangle(Shape3, color, pos, CenterPoint + Offset3, FillSize3, OutlineColor, GapSize3, GapOffset3, Rotation3, Anchor3, Slice3, Skew3, OutlineSize);
        if (ShapeEnabled4 && Shape4 == 0) color = DrawShapeRectangle(Shape4, color, pos, CenterPoint + Offset4, FillSize4, OutlineColor, GapSize4, GapOffset4, Rotation4, Anchor4, Slice4, Skew4, OutlineSize);
        if (ShapeEnabled5 && Shape5 == 0) color = DrawShapeRectangle(Shape5, color, pos, CenterPoint + Offset5, FillSize5, OutlineColor, GapSize5, GapOffset5, Rotation5, Anchor5, Slice5, Skew5, OutlineSize);
        if (ShapeEnabled6 && Shape6 == 0) color = DrawShapeRectangle(Shape6, color, pos, CenterPoint + Offset6, FillSize6, OutlineColor, GapSize6, GapOffset6, Rotation6, Anchor6, Slice6, Skew6, OutlineSize);
        if (ShapeEnabled7 && Shape7 == 0) color = DrawShapeRectangle(Shape7, color, pos, CenterPoint + Offset7, FillSize7, OutlineColor, GapSize7, GapOffset7, Rotation7, Anchor7, Slice7, Skew7, OutlineSize);
        if (ShapeEnabled8 && Shape8 == 0) color = DrawShapeRectangle(Shape8, color, pos, CenterPoint + Offset8, FillSize8, OutlineColor, GapSize8, GapOffset8, Rotation8, Anchor8, Slice8, Skew8, OutlineSize);
        if (ShapeEnabled9 && Shape9 == 0) color = DrawShapeRectangle(Shape9, color, pos, CenterPoint + Offset9, FillSize9, OutlineColor, GapSize9, GapOffset9, Rotation9, Anchor9, Slice9, Skew9, OutlineSize);
        if (ShapeEnabled10 && Shape10 == 0) color = DrawShapeRectangle(Shape10, color, pos, CenterPoint + Offset10, FillSize10, OutlineColor, GapSize10, GapOffset10, Rotation10, Anchor10, Slice10, Skew10, OutlineSize);
        if (ShapeEnabled11 && Shape11 == 0) color = DrawShapeRectangle(Shape11, color, pos, CenterPoint + Offset11, FillSize11, OutlineColor, GapSize11, GapOffset11, Rotation11, Anchor11, Slice11, Skew11, OutlineSize);
        if (ShapeEnabled12 && Shape12 == 0) color = DrawShapeRectangle(Shape12, color, pos, CenterPoint + Offset12, FillSize12, OutlineColor, GapSize12, GapOffset12, Rotation12, Anchor12, Slice12, Skew12, OutlineSize);
        if (ShapeEnabled13 && Shape13 == 0) color = DrawShapeRectangle(Shape13, color, pos, CenterPoint + Offset13, FillSize13, OutlineColor, GapSize13, GapOffset13, Rotation13, Anchor13, Slice13, Skew13, OutlineSize);
        if (ShapeEnabled14 && Shape14 == 0) color = DrawShapeRectangle(Shape14, color, pos, CenterPoint + Offset14, FillSize14, OutlineColor, GapSize14, GapOffset14, Rotation14, Anchor14, Slice14, Skew14, OutlineSize);
        if (ShapeEnabled15 && Shape15 == 0) color = DrawShapeRectangle(Shape15, color, pos, CenterPoint + Offset15, FillSize15, OutlineColor, GapSize15, GapOffset15, Rotation15, Anchor15, Slice15, Skew15, OutlineSize);
        if (ShapeEnabled16 && Shape16 == 0) color = DrawShapeRectangle(Shape16, color, pos, CenterPoint + Offset16, FillSize16, OutlineColor, GapSize16, GapOffset16, Rotation16, Anchor16, Slice16, Skew16, OutlineSize);
        
        return color;
    }

    float4 PS_CustomCrosshairSSAATriangleFill(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (FillColor.a == 0.0f) discard;

        float4 color;

        // fill
        if (ShapeEnabled1 && Shape1 == 1) color = DrawShapeTriangle(Shape1, color, pos, CenterPoint + Offset1, FillSize1, FillColor, GapSize1, GapOffset1, Rotation1, Anchor1, Slice1, Skew1, 0);
        if (ShapeEnabled2 && Shape2 == 1) color = DrawShapeTriangle(Shape2, color, pos, CenterPoint + Offset2, FillSize2, FillColor, GapSize2, GapOffset2, Rotation2, Anchor2, Slice2, Skew2, 0);
        if (ShapeEnabled3 && Shape3 == 1) color = DrawShapeTriangle(Shape3, color, pos, CenterPoint + Offset3, FillSize3, FillColor, GapSize3, GapOffset3, Rotation3, Anchor3, Slice3, Skew3, 0);
        if (ShapeEnabled4 && Shape4 == 1) color = DrawShapeTriangle(Shape4, color, pos, CenterPoint + Offset4, FillSize4, FillColor, GapSize4, GapOffset4, Rotation4, Anchor4, Slice4, Skew4, 0);
        if (ShapeEnabled5 && Shape5 == 1) color = DrawShapeTriangle(Shape5, color, pos, CenterPoint + Offset5, FillSize5, FillColor, GapSize5, GapOffset5, Rotation5, Anchor5, Slice5, Skew5, 0);
        if (ShapeEnabled6 && Shape6 == 1) color = DrawShapeTriangle(Shape6, color, pos, CenterPoint + Offset6, FillSize6, FillColor, GapSize6, GapOffset6, Rotation6, Anchor6, Slice6, Skew6, 0);
        if (ShapeEnabled7 && Shape7 == 1) color = DrawShapeTriangle(Shape7, color, pos, CenterPoint + Offset7, FillSize7, FillColor, GapSize7, GapOffset7, Rotation7, Anchor7, Slice7, Skew7, 0);
        if (ShapeEnabled8 && Shape8 == 1) color = DrawShapeTriangle(Shape8, color, pos, CenterPoint + Offset8, FillSize8, FillColor, GapSize8, GapOffset8, Rotation8, Anchor8, Slice8, Skew8, 0);
        if (ShapeEnabled9 && Shape9 == 1) color = DrawShapeTriangle(Shape9, color, pos, CenterPoint + Offset9, FillSize9, FillColor, GapSize9, GapOffset9, Rotation9, Anchor9, Slice9, Skew9, 0);
        if (ShapeEnabled10 && Shape10 == 1) color = DrawShapeTriangle(Shape10, color, pos, CenterPoint + Offset10, FillSize10, FillColor, GapSize10, GapOffset10, Rotation10, Anchor10, Slice10, Skew10, 0);
        if (ShapeEnabled11 && Shape11 == 1) color = DrawShapeTriangle(Shape11, color, pos, CenterPoint + Offset11, FillSize11, FillColor, GapSize11, GapOffset11, Rotation11, Anchor11, Slice11, Skew11, 0);
        if (ShapeEnabled12 && Shape12 == 1) color = DrawShapeTriangle(Shape12, color, pos, CenterPoint + Offset12, FillSize12, FillColor, GapSize12, GapOffset12, Rotation12, Anchor12, Slice12, Skew12, 0);
        if (ShapeEnabled13 && Shape13 == 1) color = DrawShapeTriangle(Shape13, color, pos, CenterPoint + Offset13, FillSize13, FillColor, GapSize13, GapOffset13, Rotation13, Anchor13, Slice13, Skew13, 0);
        if (ShapeEnabled14 && Shape14 == 1) color = DrawShapeTriangle(Shape14, color, pos, CenterPoint + Offset14, FillSize14, FillColor, GapSize14, GapOffset14, Rotation14, Anchor14, Slice14, Skew14, 0);
        if (ShapeEnabled15 && Shape15 == 1) color = DrawShapeTriangle(Shape15, color, pos, CenterPoint + Offset15, FillSize15, FillColor, GapSize15, GapOffset15, Rotation15, Anchor15, Slice15, Skew15, 0);
        if (ShapeEnabled16 && Shape16 == 1) color = DrawShapeTriangle(Shape16, color, pos, CenterPoint + Offset16, FillSize16, FillColor, GapSize16, GapOffset16, Rotation16, Anchor16, Slice16, Skew16, 0);

        return color;
    }

    float4 PS_CustomCrosshairSSAATriangleOutline(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (OutlineSize < 1 || OutlineColor.a == 0.0f) discard;

        float4 color;

        // outline
        if (ShapeEnabled1 && Shape1 == 1) color = DrawShapeTriangle(Shape1, color, pos, CenterPoint + Offset1, FillSize1, OutlineColor, GapSize1, GapOffset1, Rotation1, Anchor1, Slice1, Skew1, OutlineSize);
        if (ShapeEnabled2 && Shape2 == 1) color = DrawShapeTriangle(Shape2, color, pos, CenterPoint + Offset2, FillSize2, OutlineColor, GapSize2, GapOffset2, Rotation2, Anchor2, Slice2, Skew2, OutlineSize);
        if (ShapeEnabled3 && Shape3 == 1) color = DrawShapeTriangle(Shape3, color, pos, CenterPoint + Offset3, FillSize3, OutlineColor, GapSize3, GapOffset3, Rotation3, Anchor3, Slice3, Skew3, OutlineSize);
        if (ShapeEnabled4 && Shape4 == 1) color = DrawShapeTriangle(Shape4, color, pos, CenterPoint + Offset4, FillSize4, OutlineColor, GapSize4, GapOffset4, Rotation4, Anchor4, Slice4, Skew4, OutlineSize);
        if (ShapeEnabled5 && Shape5 == 1) color = DrawShapeTriangle(Shape5, color, pos, CenterPoint + Offset5, FillSize5, OutlineColor, GapSize5, GapOffset5, Rotation5, Anchor5, Slice5, Skew5, OutlineSize);
        if (ShapeEnabled6 && Shape6 == 1) color = DrawShapeTriangle(Shape6, color, pos, CenterPoint + Offset6, FillSize6, OutlineColor, GapSize6, GapOffset6, Rotation6, Anchor6, Slice6, Skew6, OutlineSize);
        if (ShapeEnabled7 && Shape7 == 1) color = DrawShapeTriangle(Shape7, color, pos, CenterPoint + Offset7, FillSize7, OutlineColor, GapSize7, GapOffset7, Rotation7, Anchor7, Slice7, Skew7, OutlineSize);
        if (ShapeEnabled8 && Shape8 == 1) color = DrawShapeTriangle(Shape8, color, pos, CenterPoint + Offset8, FillSize8, OutlineColor, GapSize8, GapOffset8, Rotation8, Anchor8, Slice8, Skew8, OutlineSize);
        if (ShapeEnabled9 && Shape9 == 1) color = DrawShapeTriangle(Shape9, color, pos, CenterPoint + Offset9, FillSize9, OutlineColor, GapSize9, GapOffset9, Rotation9, Anchor9, Slice9, Skew9, OutlineSize);
        if (ShapeEnabled10 && Shape10 == 1) color = DrawShapeTriangle(Shape10, color, pos, CenterPoint + Offset10, FillSize10, OutlineColor, GapSize10, GapOffset10, Rotation10, Anchor10, Slice10, Skew10, OutlineSize);
        if (ShapeEnabled11 && Shape11 == 1) color = DrawShapeTriangle(Shape11, color, pos, CenterPoint + Offset11, FillSize11, OutlineColor, GapSize11, GapOffset11, Rotation11, Anchor11, Slice11, Skew11, OutlineSize);
        if (ShapeEnabled12 && Shape12 == 1) color = DrawShapeTriangle(Shape12, color, pos, CenterPoint + Offset12, FillSize12, OutlineColor, GapSize12, GapOffset12, Rotation12, Anchor12, Slice12, Skew12, OutlineSize);
        if (ShapeEnabled13 && Shape13 == 1) color = DrawShapeTriangle(Shape13, color, pos, CenterPoint + Offset13, FillSize13, OutlineColor, GapSize13, GapOffset13, Rotation13, Anchor13, Slice13, Skew13, OutlineSize);
        if (ShapeEnabled14 && Shape14 == 1) color = DrawShapeTriangle(Shape14, color, pos, CenterPoint + Offset14, FillSize14, OutlineColor, GapSize14, GapOffset14, Rotation14, Anchor14, Slice14, Skew14, OutlineSize);
        if (ShapeEnabled15 && Shape15 == 1) color = DrawShapeTriangle(Shape15, color, pos, CenterPoint + Offset15, FillSize15, OutlineColor, GapSize15, GapOffset15, Rotation15, Anchor15, Slice15, Skew15, OutlineSize);
        if (ShapeEnabled16 && Shape16 == 1) color = DrawShapeTriangle(Shape16, color, pos, CenterPoint + Offset16, FillSize16, OutlineColor, GapSize16, GapOffset16, Rotation16, Anchor16, Slice16, Skew16, OutlineSize);
        
        return color;
    }

    float4 PS_CustomCrosshairSSAAEllipseFill(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (FillColor.a == 0.0f) discard;

        float4 color;

        // fill
        if (ShapeEnabled1 && Shape1 == 2) color = DrawShapeEllipse(Shape1, color, pos, CenterPoint + Offset1, FillSize1, FillColor, GapSize1, GapOffset1, Rotation1, Anchor1, Slice1, Skew1, 0);
        if (ShapeEnabled2 && Shape2 == 2) color = DrawShapeEllipse(Shape2, color, pos, CenterPoint + Offset2, FillSize2, FillColor, GapSize2, GapOffset2, Rotation2, Anchor2, Slice2, Skew2, 0);
        if (ShapeEnabled3 && Shape3 == 2) color = DrawShapeEllipse(Shape3, color, pos, CenterPoint + Offset3, FillSize3, FillColor, GapSize3, GapOffset3, Rotation3, Anchor3, Slice3, Skew3, 0);
        if (ShapeEnabled4 && Shape4 == 2) color = DrawShapeEllipse(Shape4, color, pos, CenterPoint + Offset4, FillSize4, FillColor, GapSize4, GapOffset4, Rotation4, Anchor4, Slice4, Skew4, 0);
        if (ShapeEnabled5 && Shape5 == 2) color = DrawShapeEllipse(Shape5, color, pos, CenterPoint + Offset5, FillSize5, FillColor, GapSize5, GapOffset5, Rotation5, Anchor5, Slice5, Skew5, 0);
        if (ShapeEnabled6 && Shape6 == 2) color = DrawShapeEllipse(Shape6, color, pos, CenterPoint + Offset6, FillSize6, FillColor, GapSize6, GapOffset6, Rotation6, Anchor6, Slice6, Skew6, 0);
        if (ShapeEnabled7 && Shape7 == 2) color = DrawShapeEllipse(Shape7, color, pos, CenterPoint + Offset7, FillSize7, FillColor, GapSize7, GapOffset7, Rotation7, Anchor7, Slice7, Skew7, 0);
        if (ShapeEnabled8 && Shape8 == 2) color = DrawShapeEllipse(Shape8, color, pos, CenterPoint + Offset8, FillSize8, FillColor, GapSize8, GapOffset8, Rotation8, Anchor8, Slice8, Skew8, 0);
        if (ShapeEnabled9 && Shape9 == 2) color = DrawShapeEllipse(Shape9, color, pos, CenterPoint + Offset9, FillSize9, FillColor, GapSize9, GapOffset9, Rotation9, Anchor9, Slice9, Skew9, 0);
        if (ShapeEnabled10 && Shape10 == 2) color = DrawShapeEllipse(Shape10, color, pos, CenterPoint + Offset10, FillSize10, FillColor, GapSize10, GapOffset10, Rotation10, Anchor10, Slice10, Skew10, 0);
        if (ShapeEnabled11 && Shape11 == 2) color = DrawShapeEllipse(Shape11, color, pos, CenterPoint + Offset11, FillSize11, FillColor, GapSize11, GapOffset11, Rotation11, Anchor11, Slice11, Skew11, 0);
        if (ShapeEnabled12 && Shape12 == 2) color = DrawShapeEllipse(Shape12, color, pos, CenterPoint + Offset12, FillSize12, FillColor, GapSize12, GapOffset12, Rotation12, Anchor12, Slice12, Skew12, 0);
        if (ShapeEnabled13 && Shape13 == 2) color = DrawShapeEllipse(Shape13, color, pos, CenterPoint + Offset13, FillSize13, FillColor, GapSize13, GapOffset13, Rotation13, Anchor13, Slice13, Skew13, 0);
        if (ShapeEnabled14 && Shape14 == 2) color = DrawShapeEllipse(Shape14, color, pos, CenterPoint + Offset14, FillSize14, FillColor, GapSize14, GapOffset14, Rotation14, Anchor14, Slice14, Skew14, 0);
        if (ShapeEnabled15 && Shape15 == 2) color = DrawShapeEllipse(Shape15, color, pos, CenterPoint + Offset15, FillSize15, FillColor, GapSize15, GapOffset15, Rotation15, Anchor15, Slice15, Skew15, 0);
        if (ShapeEnabled16 && Shape16 == 2) color = DrawShapeEllipse(Shape16, color, pos, CenterPoint + Offset16, FillSize16, FillColor, GapSize16, GapOffset16, Rotation16, Anchor16, Slice16, Skew16, 0);

        return color;
    }

    float4 PS_CustomCrosshairSSAAEllipseOutline(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (OutlineSize < 1 || OutlineColor.a == 0.0f) discard;

        float4 color;

        // outline
        if (ShapeEnabled1 && Shape1 == 2) color = DrawShapeEllipse(Shape1, color, pos, CenterPoint + Offset1, FillSize1, OutlineColor, GapSize1, GapOffset1, Rotation1, Anchor1, Slice1, Skew1, OutlineSize);
        if (ShapeEnabled2 && Shape2 == 2) color = DrawShapeEllipse(Shape2, color, pos, CenterPoint + Offset2, FillSize2, OutlineColor, GapSize2, GapOffset2, Rotation2, Anchor2, Slice2, Skew2, OutlineSize);
        if (ShapeEnabled3 && Shape3 == 2) color = DrawShapeEllipse(Shape3, color, pos, CenterPoint + Offset3, FillSize3, OutlineColor, GapSize3, GapOffset3, Rotation3, Anchor3, Slice3, Skew3, OutlineSize);
        if (ShapeEnabled4 && Shape4 == 2) color = DrawShapeEllipse(Shape4, color, pos, CenterPoint + Offset4, FillSize4, OutlineColor, GapSize4, GapOffset4, Rotation4, Anchor4, Slice4, Skew4, OutlineSize);
        if (ShapeEnabled5 && Shape5 == 2) color = DrawShapeEllipse(Shape5, color, pos, CenterPoint + Offset5, FillSize5, OutlineColor, GapSize5, GapOffset5, Rotation5, Anchor5, Slice5, Skew5, OutlineSize);
        if (ShapeEnabled6 && Shape6 == 2) color = DrawShapeEllipse(Shape6, color, pos, CenterPoint + Offset6, FillSize6, OutlineColor, GapSize6, GapOffset6, Rotation6, Anchor6, Slice6, Skew6, OutlineSize);
        if (ShapeEnabled7 && Shape7 == 2) color = DrawShapeEllipse(Shape7, color, pos, CenterPoint + Offset7, FillSize7, OutlineColor, GapSize7, GapOffset7, Rotation7, Anchor7, Slice7, Skew7, OutlineSize);
        if (ShapeEnabled8 && Shape8 == 2) color = DrawShapeEllipse(Shape8, color, pos, CenterPoint + Offset8, FillSize8, OutlineColor, GapSize8, GapOffset8, Rotation8, Anchor8, Slice8, Skew8, OutlineSize);
        if (ShapeEnabled9 && Shape9 == 2) color = DrawShapeEllipse(Shape9, color, pos, CenterPoint + Offset9, FillSize9, OutlineColor, GapSize9, GapOffset9, Rotation9, Anchor9, Slice9, Skew9, OutlineSize);
        if (ShapeEnabled10 && Shape10 == 2) color = DrawShapeEllipse(Shape10, color, pos, CenterPoint + Offset10, FillSize10, OutlineColor, GapSize10, GapOffset10, Rotation10, Anchor10, Slice10, Skew10, OutlineSize);
        if (ShapeEnabled11 && Shape11 == 2) color = DrawShapeEllipse(Shape11, color, pos, CenterPoint + Offset11, FillSize11, OutlineColor, GapSize11, GapOffset11, Rotation11, Anchor11, Slice11, Skew11, OutlineSize);
        if (ShapeEnabled12 && Shape12 == 2) color = DrawShapeEllipse(Shape12, color, pos, CenterPoint + Offset12, FillSize12, OutlineColor, GapSize12, GapOffset12, Rotation12, Anchor12, Slice12, Skew12, OutlineSize);
        if (ShapeEnabled13 && Shape13 == 2) color = DrawShapeEllipse(Shape13, color, pos, CenterPoint + Offset13, FillSize13, OutlineColor, GapSize13, GapOffset13, Rotation13, Anchor13, Slice13, Skew13, OutlineSize);
        if (ShapeEnabled14 && Shape14 == 2) color = DrawShapeEllipse(Shape14, color, pos, CenterPoint + Offset14, FillSize14, OutlineColor, GapSize14, GapOffset14, Rotation14, Anchor14, Slice14, Skew14, OutlineSize);
        if (ShapeEnabled15 && Shape15 == 2) color = DrawShapeEllipse(Shape15, color, pos, CenterPoint + Offset15, FillSize15, OutlineColor, GapSize15, GapOffset15, Rotation15, Anchor15, Slice15, Skew15, OutlineSize);
        if (ShapeEnabled16 && Shape16 == 2) color = DrawShapeEllipse(Shape16, color, pos, CenterPoint + Offset16, FillSize16, OutlineColor, GapSize16, GapOffset16, Rotation16, Anchor16, Slice16, Skew16, OutlineSize);
        
        return color;
    }

    float4 PS_CustomCrosshairSSAA(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        const int2 intPos = floor(pos.xy) * 2;
        float4 p0 = tex2Dfetch(CustomCrosshairOverlaySSAASampler, intPos, 0);
        float4 p1 = tex2Dfetch(CustomCrosshairOverlaySSAASampler, intPos + int2(1,0), 0);
        float4 p2 = tex2Dfetch(CustomCrosshairOverlaySSAASampler, intPos + int2(0,1), 0);
        float4 p3 = tex2Dfetch(CustomCrosshairOverlaySSAASampler, intPos + int2(1,1), 0);
        float w4 = p0.a + p1.a + p2.a + p3.a;
        return float4(p0.rgb * p0.a / w4 + p1.rgb * p1.a / w4 + p2.rgb * p2.a / w4 + p3.rgb * p3.a / w4, (p0.a + p1.a + p2.a + p3.a) / 4.0f);
    }

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
        // Build Overlay w/ Antialiasing
        pass CustomCrosshairOverlaySSAARectangleOutline {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAARectangleOutline;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = true;
        }
        pass CustomCrosshairOverlaySSAATriangleOutline {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAATriangleOutline;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        pass CustomCrosshairOverlaySSAAEllipseOutline {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAAEllipseOutline;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        pass CustomCrosshairOverlaySSAARectangleFill {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAARectangleFill;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        pass CustomCrosshairOverlaySSAATriangleFill {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAATriangleFill;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        pass CustomCrosshairOverlaySSAAEllipseFill {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAAEllipseFill;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        // Transfer overlaySSAA to overlay texture
        pass overlaySSAA {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAA;
            RenderTarget = CustomCrosshairOverlayTexture;
            ClearRenderTargets = true;
        }
    }

    technique CustomCrosshairSetup <
        ui_label = "CustomCrosshairSetup";
        ui_tooltip = "Enable to apply config changes to \"CustomCrosshair.\"\n"
                        "Disable for performance";
    > {
        // Build Overlay w/ Antialiasing
        pass CustomCrosshairOverlaySSAARectangleOutline {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAARectangleOutline;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = true;
        }
        pass CustomCrosshairOverlaySSAATriangleOutline {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAATriangleOutline;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        pass CustomCrosshairOverlaySSAAEllipseOutline {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAAEllipseOutline;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        pass CustomCrosshairOverlaySSAARectangleFill {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAARectangleFill;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        pass CustomCrosshairOverlaySSAATriangleFill {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAATriangleFill;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        pass CustomCrosshairOverlaySSAAEllipseFill {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAAEllipseFill;
            RenderTarget = CustomCrosshairOverlayShapeSSAATexture;
            ClearRenderTargets = true;
        }
        pass {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairShapeSSAA;
            RenderTarget = CustomCrosshairOverlaySSAATexture;
            ClearRenderTargets = false;
        }
        // Transfer overlaySSAA to overlay texture
        pass overlaySSAA {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAA;
            RenderTarget = CustomCrosshairOverlayTexture;
            ClearRenderTargets = true;
        }
    }
