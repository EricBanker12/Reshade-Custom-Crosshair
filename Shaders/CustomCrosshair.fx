#include "ReShadeUI.fxh"
// ------------------------------------------------------------------------------------------------------------------------
// Crosshair
// ------------------------------------------------------------------------------------------------------------------------

    uniform bool ConfigNotice <
        ui_label = "To apply changes to the config \nin this section, the technique \n\"Custom Crosshair Setup\" must \nbe enabled.\n ";
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = false;

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

    uniform float2 Section1 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section2 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section3 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section4 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section5 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section6 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section7 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section8 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section9 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section10 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section11 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section12 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section13 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section14 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section15 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
    > = float2(0,360);

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

    uniform float2 Section16 <
        ui_type = "drag";
        ui_label = "Section";
        ui_tooltip = "The section of an Ellipse to render in degrees. No effect on Rectangles or Triangles.";
        ui_min = 0;
        ui_max = 360;
        ui_step = 1.0f;
        ui_category = "Crosshair";
        ui_category_closed = true;
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
        ui_category_closed = true;
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
        ui_max = float2(1000,1000);
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
        ui_max = float2(1000,1000);
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
        ui_max = float2(1000,1000);
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
        ui_max = float2(1000,1000);
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
        ui_max = float2(1000,1000);
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
        ui_max = float2(1000,1000);
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
        ui_max = float2(1000,1000);
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
        ui_max = float2(1000,1000);
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

    uniform float2 MousePoint < source = "mousepoint"; >;

    // uniform float2 MouseDelta < source = "mousedelta"; >;
    // uniform float FrameTime < source = "frametime"; >;
    // uniform bool SpaceBar <source = "key"; keycode = 0x20; mode = ""; >;

    /*
    To Do:

    - Make rectangle outer outline have rounded corners or give triangles sharp corners - use two rectangles as mask for eachother
    - Fix weird triangle inner and outer overlay overlap issue - draw rectangle masked by gap and outline
    - option to use png image layer instead of shape - see https://github.com/CeeJayDK/SweetFX/blob/master/Shaders/Layer.fx
    - hotkey enable/disable shapes - might be easier to duplicate fx file for switching between different crosshairs
    - hotkey animated transformations - likely too expensive unless pre-rendered - could use overlay LoD for frames?

    */

// ------------------------------------------------------------------------------------------------------------------------
// Textures
// ------------------------------------------------------------------------------------------------------------------------

    texture detectorTexture <pooled = true; > { Width = 8; Height = 1; Format = R8; };
    sampler detectorSampler { Texture = detectorTexture; };

    texture overlayTexture <pooled = false; > { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8; };
    sampler overlaySampler { Texture = overlayTexture;};

    texture overlayTextureSSAA <pooled = true; > { Width = BUFFER_WIDTH * 2.0; Height = BUFFER_HEIGHT * 2.0; Format = RGBA8; };
    sampler overlaySamplerSSAAx4 { Texture = overlayTextureSSAA;};

// ------------------------------------------------------------------------------------------------------------------------
// Imports
// ------------------------------------------------------------------------------------------------------------------------

    #include "ReShade.fxh"

// ------------------------------------------------------------------------------------------------------------------------
// Functions
// ------------------------------------------------------------------------------------------------------------------------
    float4 DrawRectangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, int anchor) {
        float2 anchorOffset;
        switch (anchor) {
            default:
            case 0: // Top Left
                anchorOffset = float2(0, 0);
                break;
            case 1: // Top Center
                anchorOffset = float2(0.5f, 0);
                break;
            case 2: // Top Right
                anchorOffset = float2(1.0f, 0);
                break;
            case 3: // Center Left
                anchorOffset = float2(0, 0.5f);
                break;
            case 4: // Center
                anchorOffset = float2(0.5f, 0.5f);
                break;
            case 5: // Center Right
                anchorOffset = float2(1.0f, 0.5f);
                break;
            case 6: // Bottom Left
                anchorOffset = float2(0, 1.0f);
                break;
            case 7: // Bottom Center
                anchorOffset = float2(0.5f, 1.0f);
                break;
            case 8: //Bottom Right
                anchorOffset = float2(1.0f, 1.0f);
                break;
        }

        const float2 fillStartPos = fillPos - fillSize * anchorOffset;
        const float2 fillEndPos = fillStartPos + fillSize;

        if (basePos.x < fillStartPos.x - outlineSize
            || basePos.y < fillStartPos.y - outlineSize
                || basePos.x > fillEndPos.x + outlineSize
                    || basePos.y > fillEndPos.y + outlineSize)
            return baseColor;

        const float2 gapStartPos = fillStartPos + fillSize / 2.0 - gapSize / 2.0f + gapOffset;
        const float2 gapEndPos = gapStartPos + gapSize;
        
        if (basePos.x >= fillStartPos.x && basePos.x < fillEndPos.x && basePos.y >= fillStartPos.y && basePos.y < fillEndPos.y)
            if (gapSize.x == 0 || gapSize.y == 0 || basePos.x < gapStartPos.x || basePos.x >= gapEndPos.x || basePos.y < gapStartPos.y || basePos.y >= gapEndPos.y)
                if (baseColor.a > 0.0f && fillColor.a < 1.0f) { return lerp(baseColor, fillColor, fillColor.a); } else { return fillColor; }
        
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
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }

        return baseColor;
    }

    float4 DrawEllipse(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, int anchor, float2 section) {
        if (section.x >= section.y || section.y <= section.x)
            return baseColor;

        float2 anchorOffset;
        switch (anchor) {
            default:
            case 0: // Top Left
                anchorOffset = float2(0, 0);
                break;
            case 1: // Top Center
                anchorOffset = float2(0.5f, 0);
                break;
            case 2: // Top Right
                anchorOffset = float2(1.0f, 0);
                break;
            case 3: // Center Left
                anchorOffset = float2(0, 0.5f);
                break;
            case 4: // Center
                anchorOffset = float2(0.5f, 0.5f);
                break;
            case 5: // Center Right
                anchorOffset = float2(1.0f, 0.5f);
                break;
            case 6: // Bottom Left
                anchorOffset = float2(0, 1.0f);
                break;
            case 7: // Bottom Center
                anchorOffset = float2(0.5f, 1.0f);
                break;
            case 8: //Bottom Right
                anchorOffset = float2(1.0f, 1.0f);
                break;
        }
        
        const float2 centerPos = float2(fillPos.x + fillSize.x * (0.5f - anchorOffset.x), fillPos.y + fillSize.y * (0.5f - anchorOffset.y));

        if (basePos.x < centerPos.x - fillSize.x / 2.0f - outlineSize
            || basePos.y < centerPos.y - fillSize.y / 2.0f - outlineSize
                || basePos.x > centerPos.x + fillSize.x / 2.0f + outlineSize
                    || basePos.y > centerPos.y + fillSize.y / 2.0f + outlineSize)
            return baseColor;

        const float2 centeredPos = basePos - centerPos;
        const float centeredAngle = degrees(atan2(centeredPos.y, centeredPos.x)) + 180.0f;
        const float2 gappedPos = centeredPos + gapOffset;
        if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f, 2) <= 1)
            if (gapSize.x < 1 || gapSize.y < 1 || (gapSize.x > 0 && gapSize.y > 0 && pow(gappedPos.x, 2) / pow(gapSize.x / 2.0f, 2) + pow(gappedPos.y, 2) / pow(gapSize.y / 2.0f, 2) > 1))
                if (centeredAngle >= section.x && (centeredAngle < section.y || section.y == 360))
                    if (baseColor.a > 0.0f && fillColor.a < 1.0f) { return lerp(baseColor, fillColor, fillColor.a); } else { return fillColor; }

        if (outlineSize > 0) {
            if (pow(centeredPos.x, 2) / pow(fillSize.x / 2.0f + outlineSize, 2) + pow(centeredPos.y, 2) / pow(fillSize.y / 2.0f + outlineSize, 2) <= 1) {
                if (gapSize.x < 1 || gapSize.y < 1 || outlineSize >= gapSize.x / 2 || outlineSize >= gapSize.y / 2 || (gapSize.x > 0 && gapSize.y > 0 && pow(gappedPos.x, 2) / pow(gapSize.x / 2.0f - outlineSize, 2) + pow(gappedPos.y, 2) / pow(gapSize.y / 2.0f - outlineSize, 2) > 1)) {
                    if (centeredAngle >= section.x && (centeredAngle < section.y || section.y == 360)) 
                        if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                    else if (section.x > 0 || section.y < 360) {
                        float2 rotatedPos = float2((basePos.x - centerPos.x) * cos(-radians(section.x)) - (basePos.y - centerPos.y) * sin(-radians(section.x)) + centerPos.x, (basePos.x - centerPos.x) * sin(-radians(section.x)) + (basePos.y - centerPos.y) * cos(-radians(section.x)) + centerPos.y);
                        float2 fillStartPos = centerPos - float2(fillPos.x + outlineSize, 0);
                        float2 fillEndPos = centerPos + float2(0, outlineSize);
                        if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                            if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                        
                        rotatedPos = float2((basePos.x - centerPos.x) * cos(-radians(section.y)) - (basePos.y - centerPos.y) * sin(-radians(section.y)) + centerPos.x, (basePos.x - centerPos.x) * sin(-radians(section.y)) + (basePos.y - centerPos.y) * cos(-radians(section.y)) + centerPos.y);
                        fillStartPos = centerPos - float2(fillPos.x + outlineSize, outlineSize);
                        fillEndPos = centerPos;
                        if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                            if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                        
                        if (pow(centeredPos.x, 2) + pow(centeredPos.y, 2) < pow(outlineSize, 2)) 
                            if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                    }
                }
            }
        }

        return baseColor;
    }

    float4 DrawTriangle(float4 baseColor, float2 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, int anchor, float skew) {
        float2 anchorOffset;
        switch (anchor) {
            default:
            case 0: // Top Left
                anchorOffset = float2(0, 0);
                break;
            case 1: // Top Center
                anchorOffset = float2(0.5f, 0);
                break;
            case 2: // Top Right
                anchorOffset = float2(1.0f, 0);
                break;
            case 3: // Center Left
                anchorOffset = float2(0, 2.0f / 3.0f);
                break;
            case 4: // Center
                anchorOffset = float2(0.5f, 2.0f / 3.0f);
                break;
            case 5: // Center Right
                anchorOffset = float2(1.0f, 2.0f / 3.0f);
                break;
            case 6: // Bottom Left
                anchorOffset = float2(0, 1.0f);
                break;
            case 7: // Bottom Center
                anchorOffset = float2(0.5f, 1.0f);
                break;
            case 8: //Bottom Right
                anchorOffset = float2(1.0f, 1.0f);
                break;
        }
        
        const float2 centerPos = float2(fillPos.x + fillSize.x * (0.5f - anchorOffset.x), fillPos.y + fillSize.y * (2.0f / 3.0f - anchorOffset.y));

        const float2 A = float2 (centerPos.x - fillSize.x / 2.0 * (1 + skew / 90.0f), centerPos.y + fillSize.y / 3.0);
        const float2 B = float2 (centerPos.x + fillSize.x * skew / 90.0f, centerPos.y - fillSize.y * 2.0 / 3.0);
        const float2 C = float2 (centerPos.x + fillSize.x / 2.0 * (1 - skew / 90.0f), centerPos.y + fillSize.y / 3.0);

        if (basePos.x < min(A.x, B.x) - outlineSize
            || basePos.y < B.y - outlineSize
                || basePos.x > max(C.x, B.x) + outlineSize
                    || basePos.y > C.y + outlineSize)
            return baseColor;
        
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
                if (baseColor.a > 0.0f && fillColor.a < 1.0f) { return lerp(baseColor, fillColor, fillColor.a); } else { return fillColor; }

            // inside outline
            if (inTriangle && inTriangleGap && outlineSize > 0) {
                rotation = 0;
                rotatedPos = float2((basePos.x - D.x) * cos(-rotation) - (basePos.y - D.y) * sin(-rotation) + D.x, (basePos.x - D.x) * sin(-rotation) + (basePos.y - D.y) * cos(-rotation) + D.y);
                fillStartPos = D + float2(0, -outlineSize);
                fillEndPos = D + float2(F.x - D.x, 0);
                if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }

                rotation = atan(gapSize.y / (F.x - E.x));
                if (skew <= 30)
                    rotation += radians(180);
                rotatedPos = float2((basePos.x - F.x) * cos(-rotation) - (basePos.y - F.y) * sin(-rotation) + F.x, (basePos.x - F.x) * sin(-rotation) + (basePos.y - F.y) * cos(-rotation) + F.y);
                fillStartPos = F + float2(0, -outlineSize);
                fillEndPos = F + float2(distance(F,E), 0);
                if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }

                rotation = atan(gapSize.y / (D.x - E.x));
                if (skew > -30)
                    rotation += radians(180);
                rotatedPos = float2((basePos.x - D.x) * cos(-rotation) - (basePos.y - D.y) * sin(-rotation) + D.x, (basePos.x - D.x) * sin(-rotation) + (basePos.y - D.y) * cos(-rotation) + D.y);
                fillStartPos = D - float2(distance(E,D), outlineSize);
                fillEndPos = D + float2(0, 0);
                if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
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
                
                // test intersect
                if (distance(basePos, ACDE) <= outlineSize && dot(ACDE - A, C - A) >= 0 && dot(ACDE - A, C - A) < dot(C - A, C - A) && dot(ACDE - E, D - E) >= 0 && dot(ACDE - E, D - E) < dot(D - E, D - E)) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                if (distance(basePos, ACEF) <= outlineSize && dot(ACEF - A, C - A) >= 0 && dot(ACEF - A, C - A) < dot(C - A, C - A) && dot(ACEF - F, E - F) >= 0 && dot(ACEF - F, E - F) < dot(E - F, E - F)) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                if (distance(basePos, ABDF) <= outlineSize && dot(ABDF - A, B - A) >= 0 && dot(ABDF - A, B - A) < dot(B - A, B - A) && dot(ABDF - F, D - F) >= 0 && dot(ABDF - F, D - F) < dot(D - F, D - F)) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                if (distance(basePos, ABDE) <= outlineSize && dot(ABDE - A, B - A) >= 0 && dot(ABDE - A, B - A) < dot(B - A, B - A) && dot(ABDE - E, D - E) >= 0 && dot(ABDE - E, D - E) < dot(D - E, D - E)) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                if (distance(basePos, ABEF) <= outlineSize && dot(ABEF - A, B - A) >= 0 && dot(ABEF - A, B - A) < dot(B - A, B - A) && dot(ABEF - E, F - E) >= 0 && dot(ABEF - E, F - E) < dot(F - E, F - E)) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                if (distance(basePos, BCDF) <= outlineSize && dot(BCDF - B, C - B) >= 0 && dot(BCDF - B, C - B) < dot(C - B, C - B) && dot(BCDF - F, D - F) >= 0 && dot(BCDF - F, D - F) < dot(D - F, D - F)) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                if (distance(basePos, BCDE) <= outlineSize && dot(BCDE - B, C - B) >= 0 && dot(BCDE - B, C - B) < dot(C - B, C - B) && dot(BCDE - E, D - E) >= 0 && dot(BCDE - E, D - E) < dot(D - E, D - E)) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
                if (distance(basePos, BCEF) <= outlineSize && dot(BCEF - B, C - B) >= 0 && dot(BCEF - B, C - B) < dot(C - B, C - B) && dot(BCEF - E, F - E) >= 0 && dot(BCEF - E, F - E) < dot(F - E, F - E)) 
                    if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
            }
        }

        // inside fill with no gap
        if (inTriangle && !inTriangleGap) 
            if (baseColor.a > 0.0f && fillColor.a < 1.0f) { return lerp(baseColor, fillColor, fillColor.a); } else { return fillColor; }
        
        // outside outline
        if (!inTriangle && !inTriangleGap && outlineSize > 0) {
            if (distance(basePos, A) < outlineSize) 
                if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
            if (distance(basePos, B) < outlineSize) 
                if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
            if (distance(basePos, C) < outlineSize) 
                if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }

            rotation = 0;
            rotatedPos = float2((basePos.x - A.x) * cos(-rotation) - (basePos.y - A.y) * sin(-rotation) + A.x, (basePos.x - A.x) * sin(-rotation) + (basePos.y - A.y) * cos(-rotation) + A.y);
            fillStartPos = A;
            fillEndPos = A + float2(C.x - A.x, outlineSize);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }

            rotation = atan(fillSize.y / (C.x - B.x));
            if (skew <= 30)
                rotation += radians(180);
            rotatedPos = float2((basePos.x - C.x) * cos(-rotation) - (basePos.y - C.y) * sin(-rotation) + C.x, (basePos.x - C.x) * sin(-rotation) + (basePos.y - C.y) * cos(-rotation) + C.y);
            fillStartPos = C;
            fillEndPos = C + float2(distance(C,B), outlineSize);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }

            rotation = atan(fillSize.y / (A.x - B.x));
            if (skew > -30)
                rotation += radians(180);
            rotatedPos = float2((basePos.x - A.x) * cos(-rotation) - (basePos.y - A.y) * sin(-rotation) + A.x, (basePos.x - A.x) * sin(-rotation) + (basePos.y - A.y) * cos(-rotation) + A.y);
            fillStartPos = A - float2(distance(B,A), 0);
            fillEndPos = A + float2(0, outlineSize);
            if (rotatedPos.x >= fillStartPos.x && rotatedPos.x < fillEndPos.x && rotatedPos.y >= fillStartPos.y && rotatedPos.y < fillEndPos.y) 
                if (baseColor.a > 0.0f && outlineColor.a < 1.0f) { return lerp(baseColor, outlineColor, outlineColor.a); } else { return outlineColor; }
        }

        return baseColor;
    }

    float4 DrawShape(int shape, float4 baseColor, float4 basePos, float2 fillPos, float2 fillSize, float4 fillColor, float2 gapSize, float2 gapOffset, float outlineSize, float4 outlineColor, float rotation, int anchor, float2 section, float skew) {
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
        
        switch (shape) {
            default:
            case 0:
                return DrawRectangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchor);
            case 1:
                return DrawTriangle(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchor, skew);
            case 2:
                return DrawEllipse(baseColor, basePos.xy, fillPos, fillSize, fillColor, gapSize, gapOffset, outlineSize, outlineColor, anchor, section);
        }
    }

    bool DetectorMatchAll(float2 pos, float2 size, float3 detectorColor, float3 detectorThreshold, bool inverted) {
        const int2 pixelCount = int2(round(size.x), round(size.y));
        float4 color;
        
        for (int y = 0; y < pixelCount.y; y++) {
            for (int x = 0; x < pixelCount.x; x++) {
                color = tex2Dlod(ReShade::BackBuffer, float4(BUFFER_PIXEL_SIZE * (pos + float2(x,y)), 0, 0));
                if (abs(color.r - detectorColor.r) <= detectorThreshold.r / 255.0f && abs(color.g - detectorColor.g) <= detectorThreshold.g / 255.0f && abs(color.b - detectorColor.b) <= detectorThreshold.b / 255.0f) {
                    if (inverted) return false;
                }
                else return false;
            }
        }
        
        return true;
    }

// ------------------------------------------------------------------------------------------------------------------------
// Pixel Shaders
// ------------------------------------------------------------------------------------------------------------------------

    float PS_UIDetect(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        const int pixelNumber = round(pos.x - PixelOffset.x) + 1;
        switch (pixelNumber) {
            case 1:
                if (Detector1 && DetectorMatchAll((DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1 - PixelOffset, DetectorSize1, DetectorColor1, DetectorThreshold1, DetectorInverted1))
                    return 1.0f;
                break;
            case 2:
                if (Detector2 && DetectorMatchAll((DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2 - PixelOffset, DetectorSize2, DetectorColor2, DetectorThreshold2, DetectorInverted2))
                    return 1.0f;
                break;
            case 3:
                if (Detector3 && DetectorMatchAll((DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3 - PixelOffset, DetectorSize3, DetectorColor3, DetectorThreshold3, DetectorInverted3))
                    return 1.0f;
                break;
            case 4:
                if (Detector4 && DetectorMatchAll((DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4 - PixelOffset, DetectorSize4, DetectorColor4, DetectorThreshold4, DetectorInverted4))
                    return 1.0f;
                break;
            case 5:
                if (Detector5 && DetectorMatchAll((DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5 - PixelOffset, DetectorSize5, DetectorColor5, DetectorThreshold5, DetectorInverted5))
                    return 1.0f;
                break;
            case 6:
                if (Detector6 && DetectorMatchAll((DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6 - PixelOffset, DetectorSize6, DetectorColor6, DetectorThreshold6, DetectorInverted6))
                    return 1.0f;
                break;
            case 7:
                if (Detector7 && DetectorMatchAll((DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7 - PixelOffset, DetectorSize7, DetectorColor7, DetectorThreshold7, DetectorInverted7))
                    return 1.0f;
                break;
            case 8:
                if (Detector8 && DetectorMatchAll((DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8 - PixelOffset, DetectorSize8, DetectorColor8, DetectorThreshold8, DetectorInverted8))
                    return 1.0f;
                break;
            default:
                return 0.0f;
        }

        return 0.0f;
    }

    float4 PS_CustomCrosshairSSAAx4(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (!Antialiasing) discard;

        float4 color = float4(OutlineColor.rgb, 0);
        if (OutlineSize < 1) color = float4(FillColor.rgb, 0);

        const float2 crosshairPos = (FollowCursor ? MousePoint : CenterPoint) + Offset;
        if (ShapeEnabled1) color = DrawShape(Shape1, color, pos, crosshairPos + Offset1, FillSize1, FillColor, GapSize1, GapOffset1, OutlineSize, OutlineColor, Rotation1, Anchor1, Section1, Skew1);
        if (ShapeEnabled2) color = DrawShape(Shape2, color, pos, crosshairPos + Offset2, FillSize2, FillColor, GapSize2, GapOffset2, OutlineSize, OutlineColor, Rotation2, Anchor2, Section2, Skew2);
        if (ShapeEnabled3) color = DrawShape(Shape3, color, pos, crosshairPos + Offset3, FillSize3, FillColor, GapSize3, GapOffset3, OutlineSize, OutlineColor, Rotation3, Anchor3, Section3, Skew3);
        if (ShapeEnabled4) color = DrawShape(Shape4, color, pos, crosshairPos + Offset4, FillSize4, FillColor, GapSize4, GapOffset4, OutlineSize, OutlineColor, Rotation4, Anchor4, Section4, Skew4);
        if (ShapeEnabled5) color = DrawShape(Shape5, color, pos, crosshairPos + Offset5, FillSize5, FillColor, GapSize5, GapOffset5, OutlineSize, OutlineColor, Rotation5, Anchor5, Section5, Skew5);
        if (ShapeEnabled6) color = DrawShape(Shape6, color, pos, crosshairPos + Offset6, FillSize6, FillColor, GapSize6, GapOffset6, OutlineSize, OutlineColor, Rotation6, Anchor6, Section6, Skew6);
        if (ShapeEnabled7) color = DrawShape(Shape7, color, pos, crosshairPos + Offset7, FillSize7, FillColor, GapSize7, GapOffset7, OutlineSize, OutlineColor, Rotation7, Anchor7, Section7, Skew7);
        if (ShapeEnabled8) color = DrawShape(Shape8, color, pos, crosshairPos + Offset8, FillSize8, FillColor, GapSize8, GapOffset8, OutlineSize, OutlineColor, Rotation8, Anchor8, Section8, Skew8);
        if (ShapeEnabled9) color = DrawShape(Shape9, color, pos, crosshairPos + Offset9, FillSize9, FillColor, GapSize9, GapOffset9, OutlineSize, OutlineColor, Rotation9, Anchor9, Section9, Skew9);
        if (ShapeEnabled10) color = DrawShape(Shape10, color, pos, crosshairPos + Offset10, FillSize10, FillColor, GapSize10, GapOffset10, OutlineSize, OutlineColor, Rotation10, Anchor10, Section10, Skew10);
        if (ShapeEnabled11) color = DrawShape(Shape11, color, pos, crosshairPos + Offset11, FillSize11, FillColor, GapSize11, GapOffset11, OutlineSize, OutlineColor, Rotation11, Anchor11, Section11, Skew11);
        if (ShapeEnabled12) color = DrawShape(Shape12, color, pos, crosshairPos + Offset12, FillSize12, FillColor, GapSize12, GapOffset12, OutlineSize, OutlineColor, Rotation12, Anchor12, Section12, Skew12);
        if (ShapeEnabled13) color = DrawShape(Shape13, color, pos, crosshairPos + Offset13, FillSize13, FillColor, GapSize13, GapOffset13, OutlineSize, OutlineColor, Rotation13, Anchor13, Section13, Skew13);
        if (ShapeEnabled14) color = DrawShape(Shape14, color, pos, crosshairPos + Offset14, FillSize14, FillColor, GapSize14, GapOffset14, OutlineSize, OutlineColor, Rotation14, Anchor14, Section14, Skew14);
        if (ShapeEnabled15) color = DrawShape(Shape15, color, pos, crosshairPos + Offset15, FillSize15, FillColor, GapSize15, GapOffset15, OutlineSize, OutlineColor, Rotation15, Anchor15, Section15, Skew15);
        if (ShapeEnabled16) color = DrawShape(Shape16, color, pos, crosshairPos + Offset16, FillSize16, FillColor, GapSize16, GapOffset16, OutlineSize, OutlineColor, Rotation16, Anchor16, Section16, Skew16);

        return color;
    }

    float4 PS_CustomCrosshair(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        if (Antialiasing)
            return (
                tex2Dlod(overlaySamplerSSAAx4, float4(((pos.xy - PixelOffset) * 2.0f + PixelOffset + float2(0, 0)) * BUFFER_PIXEL_SIZE / 2.0f, 0, 0))
                + tex2Dlod(overlaySamplerSSAAx4, float4(((pos.xy - PixelOffset) * 2.0f + PixelOffset + float2(1, 0)) * BUFFER_PIXEL_SIZE / 2.0f, 0, 0))
                + tex2Dlod(overlaySamplerSSAAx4, float4(((pos.xy - PixelOffset) * 2.0f + PixelOffset + float2(0, 1)) * BUFFER_PIXEL_SIZE / 2.0f, 0, 0))
                + tex2Dlod(overlaySamplerSSAAx4, float4(((pos.xy - PixelOffset) * 2.0f + PixelOffset + float2(1, 1)) * BUFFER_PIXEL_SIZE / 2.0f, 0, 0))
                ) / 4.0f;
        else {
            float4 color = float4(OutlineColor.rgb, 0);
            if (OutlineSize < 1) color = float4(FillColor.rgb, 0);

            const float2 crosshairPos = (FollowCursor ? MousePoint : CenterPoint) + Offset;
            if (ShapeEnabled1) color = DrawShape(Shape1, color, pos, crosshairPos + Offset1, FillSize1, FillColor, GapSize1, GapOffset1, OutlineSize, OutlineColor, Rotation1, Anchor1, Section1, Skew1);
            if (ShapeEnabled2) color = DrawShape(Shape2, color, pos, crosshairPos + Offset2, FillSize2, FillColor, GapSize2, GapOffset2, OutlineSize, OutlineColor, Rotation2, Anchor2, Section2, Skew2);
            if (ShapeEnabled3) color = DrawShape(Shape3, color, pos, crosshairPos + Offset3, FillSize3, FillColor, GapSize3, GapOffset3, OutlineSize, OutlineColor, Rotation3, Anchor3, Section3, Skew3);
            if (ShapeEnabled4) color = DrawShape(Shape4, color, pos, crosshairPos + Offset4, FillSize4, FillColor, GapSize4, GapOffset4, OutlineSize, OutlineColor, Rotation4, Anchor4, Section4, Skew4);
            if (ShapeEnabled5) color = DrawShape(Shape5, color, pos, crosshairPos + Offset5, FillSize5, FillColor, GapSize5, GapOffset5, OutlineSize, OutlineColor, Rotation5, Anchor5, Section5, Skew5);
            if (ShapeEnabled6) color = DrawShape(Shape6, color, pos, crosshairPos + Offset6, FillSize6, FillColor, GapSize6, GapOffset6, OutlineSize, OutlineColor, Rotation6, Anchor6, Section6, Skew6);
            if (ShapeEnabled7) color = DrawShape(Shape7, color, pos, crosshairPos + Offset7, FillSize7, FillColor, GapSize7, GapOffset7, OutlineSize, OutlineColor, Rotation7, Anchor7, Section7, Skew7);
            if (ShapeEnabled8) color = DrawShape(Shape8, color, pos, crosshairPos + Offset8, FillSize8, FillColor, GapSize8, GapOffset8, OutlineSize, OutlineColor, Rotation8, Anchor8, Section8, Skew8);
            if (ShapeEnabled9) color = DrawShape(Shape9, color, pos, crosshairPos + Offset9, FillSize9, FillColor, GapSize9, GapOffset9, OutlineSize, OutlineColor, Rotation9, Anchor9, Section9, Skew9);
            if (ShapeEnabled10) color = DrawShape(Shape10, color, pos, crosshairPos + Offset10, FillSize10, FillColor, GapSize10, GapOffset10, OutlineSize, OutlineColor, Rotation10, Anchor10, Section10, Skew10);
            if (ShapeEnabled11) color = DrawShape(Shape11, color, pos, crosshairPos + Offset11, FillSize11, FillColor, GapSize11, GapOffset11, OutlineSize, OutlineColor, Rotation11, Anchor11, Section11, Skew11);
            if (ShapeEnabled12) color = DrawShape(Shape12, color, pos, crosshairPos + Offset12, FillSize12, FillColor, GapSize12, GapOffset12, OutlineSize, OutlineColor, Rotation12, Anchor12, Section12, Skew12);
            if (ShapeEnabled13) color = DrawShape(Shape13, color, pos, crosshairPos + Offset13, FillSize13, FillColor, GapSize13, GapOffset13, OutlineSize, OutlineColor, Rotation13, Anchor13, Section13, Skew13);
            if (ShapeEnabled14) color = DrawShape(Shape14, color, pos, crosshairPos + Offset14, FillSize14, FillColor, GapSize14, GapOffset14, OutlineSize, OutlineColor, Rotation14, Anchor14, Section14, Skew14);
            if (ShapeEnabled15) color = DrawShape(Shape15, color, pos, crosshairPos + Offset15, FillSize15, FillColor, GapSize15, GapOffset15, OutlineSize, OutlineColor, Rotation15, Anchor15, Section15, Skew15);
            if (ShapeEnabled16) color = DrawShape(Shape16, color, pos, crosshairPos + Offset16, FillSize16, FillColor, GapSize16, GapOffset16, OutlineSize, OutlineColor, Rotation16, Anchor16, Section16, Skew16);

            return color;
        }
    }

    float4 PS_Final(float4 pos: SV_POSITION, float2 texCoord: TEXCOORD) : SV_TARGET {
        float4 color = tex2Dlod(ReShade::BackBuffer, float4(texCoord, 0, 0));
        const float4 overlay = tex2Dlod(overlaySampler, float4(texCoord, 0, 0));

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

            if (Detector1) detectorMatches1 = tex2Dlod(detectorSampler, float4((PixelOffset + float2(0, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector2) detectorMatches2 = tex2Dlod(detectorSampler, float4((PixelOffset + float2(1, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector3) detectorMatches3 = tex2Dlod(detectorSampler, float4((PixelOffset + float2(2, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector4) detectorMatches4 = tex2Dlod(detectorSampler, float4((PixelOffset + float2(3, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector5) detectorMatches5 = tex2Dlod(detectorSampler, float4((PixelOffset + float2(4, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector6) detectorMatches6 = tex2Dlod(detectorSampler, float4((PixelOffset + float2(5, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector7) detectorMatches7 = tex2Dlod(detectorSampler, float4((PixelOffset + float2(6, 0)) / 8.0f, 0, 0)).r > 0.0f;
            if (Detector8) detectorMatches8 = tex2Dlod(detectorSampler, float4((PixelOffset + float2(7, 0)) / 8.0f, 0, 0)).r > 0.0f;

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
                
                if (Detector1) {
                    detectorPos = (DetectorFollowCursor1 ? MousePoint : CenterPoint) + DetectorOffset1;
                    outlineColor = detectorMatches1 ? float4(0,1,0,1) : float4(1,0,0,1);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize1, float4(DetectorColor1, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector2) {
                    detectorPos = (DetectorFollowCursor2 ? MousePoint : CenterPoint) + DetectorOffset2;
                    outlineColor = detectorMatches2 ? float4(0,1,0,1) : float4(1,0,0,1);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize2, float4(DetectorColor2, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector3) {
                    detectorPos = (DetectorFollowCursor3 ? MousePoint : CenterPoint) + DetectorOffset3;
                    outlineColor = detectorMatches3 ? float4(0,1,0,1) : float4(1,0,0,1);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize3, float4(DetectorColor3, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector4) {
                    detectorPos = (DetectorFollowCursor4 ? MousePoint : CenterPoint) + DetectorOffset4;
                    outlineColor = detectorMatches4 ? float4(0,1,0,1) : float4(1,0,0,1);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize4, float4(DetectorColor4, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector5) {
                    detectorPos = (DetectorFollowCursor5 ? MousePoint : CenterPoint) + DetectorOffset5;
                    outlineColor = detectorMatches5 ? float4(0,1,0,1) : float4(1,0,0,1);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize5, float4(DetectorColor5, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector6) {
                    detectorPos = (DetectorFollowCursor6 ? MousePoint : CenterPoint) + DetectorOffset6;
                    outlineColor = detectorMatches6 ? float4(0,1,0,1) : float4(1,0,0,1);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize6, float4(DetectorColor6, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector7) {
                    detectorPos = (DetectorFollowCursor7 ? MousePoint : CenterPoint) + DetectorOffset7;
                    outlineColor = detectorMatches7 ? float4(0,1,0,1) : float4(1,0,0,1);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize7, float4(DetectorColor7, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
                if (Detector8) {
                    detectorPos = (DetectorFollowCursor8 ? MousePoint : CenterPoint) + DetectorOffset8;
                    outlineColor = detectorMatches8 ? float4(0,1,0,1) : float4(1,0,0,1);
                    color = DrawRectangle(color, pos.xy, detectorPos, DetectorSize8, float4(DetectorColor8, 1), float2(0,0), float2(0,0), 1.0f, outlineColor, 4);
                }
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
        timeout = 1000;
    > {
        pass overlaySSAAx4 {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAAx4;
            RenderTarget = overlayTextureSSAA;
        }
        pass overlay {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshair;
            RenderTarget = overlayTexture;
        }
    }

    technique CustomCrosshairSetup <
        ui_label = "Custom Crosshair Setup";
        ui_tooltip = "Enable this to apply Crosshair config changes to \"Custom Crosshair.\"\nDisable for performance.";
    > {
        pass overlaySSAAx4 {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshairSSAAx4;
            RenderTarget = overlayTextureSSAA;
        }
        pass overlay {
            VertexShader = PostProcessVS;
            PixelShader = PS_CustomCrosshair;
            RenderTarget = overlayTexture;
        }
    }

    technique CustomCrosshair <
        ui_label = "Custom Crosshair";
        ui_tooltip = "Enable \"Custom Crosshair Setup\" to apply Crosshair config changes.";
    > {
        pass detector {
            VertexShader = PostProcessVS;
            PixelShader = PS_UIDetect;
            RenderTarget = detectorTexture;
            ClearRenderTargets = true;
        }
        pass final {
            VertexShader = PostProcessVS;
            PixelShader = PS_Final;
        }
    }
