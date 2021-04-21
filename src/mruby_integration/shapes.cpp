#include "raylib.h"
#include "mruby.h"

#include "mruby_integration/struct_types.hpp"

mrb_value mrb_draw_circle(mrb_state *mrb, mrb_value) {
  mrb_int x, y;
  mrb_float radius;
  Color *colour;

  mrb_get_args(mrb, "iifd", &x, &y, &radius, &colour, &Colour_type);

  DrawCircle(x, y, radius, *colour);
  return mrb_nil_value();
}

mrb_value mrb_draw_rectangle(mrb_state *mrb, mrb_value) {
  mrb_int x, y, width, height;
  Color *colour;

  mrb_get_args(mrb, "iiiid", &x, &y, &width, &height, &colour, &Colour_type);

  DrawRectangle(x, y, width, height, *colour);
  return mrb_nil_value();
}

mrb_value mrb_draw_rectangle_rec(mrb_state *mrb, mrb_value) {
  Rectangle *rectangle;
  Color *colour;

  mrb_get_args(mrb, "dd", &rectangle, &Rectangle_type, &colour, &Colour_type);

  DrawRectangleRec(*rectangle, *colour);
  return mrb_nil_value();
}

mrb_value mrb_draw_rectangle_lines(mrb_state *mrb, mrb_value) {
  mrb_int x, y, width, height;
  Color *colour;

  mrb_get_args(mrb, "iiiid", &x, &y, &width, &height, &colour, &Colour_type);

  DrawRectangleLines(x, y, width, height, *colour);
  return mrb_nil_value();
}

mrb_value mrb_draw_circle_v(mrb_state *mrb, mrb_value) {
  Vector2 *vector;
  mrb_float radius;
  Color *colour;

  mrb_get_args(mrb, "dfd", &vector, &Vector2_type, &radius, &colour, &Colour_type);

  DrawCircleV(*vector, radius, *colour);
  return mrb_nil_value();
}

mrb_value mrb_draw_triangle(mrb_state *mrb, mrb_value) {
  Vector2 *left, *right, *top;
  Color *colour;

  mrb_get_args(mrb, "dddd", &left, &Vector2_type, &right, &Vector2_type, &top, &Vector2_type, &colour, &Colour_type);

  DrawTriangle(*left, *right, *top, *colour);
  return mrb_nil_value();
}

mrb_value mrb_check_collision_point_rec(mrb_state *mrb, mrb_value) {
  Vector2 *vector;
  Rectangle *rectangle;

  mrb_get_args(mrb, "dd", &vector, &Vector2_type, &rectangle, &Rectangle_type);

  return mrb_bool_value(CheckCollisionPointRec(*vector, *rectangle));
}

void append_shapes(mrb_state *mrb) {
  mrb_define_method(mrb, mrb->kernel_module, "draw_circle", mrb_draw_circle, MRB_ARGS_REQ(4));
  mrb_define_method(mrb, mrb->kernel_module, "draw_circle_v", mrb_draw_circle_v, MRB_ARGS_REQ(3));
  mrb_define_method(mrb, mrb->kernel_module, "draw_rectangle", mrb_draw_rectangle, MRB_ARGS_REQ(5));
  mrb_define_method(mrb, mrb->kernel_module, "draw_rectangle_rec", mrb_draw_rectangle_rec, MRB_ARGS_REQ(2));
  mrb_define_method(mrb, mrb->kernel_module, "draw_rectangle_lines", mrb_draw_rectangle_lines, MRB_ARGS_REQ(5));
  mrb_define_method(mrb, mrb->kernel_module, "draw_triangle", mrb_draw_triangle, MRB_ARGS_REQ(4));

  mrb_define_method(mrb, mrb->kernel_module, "check_collision_point_rec", mrb_check_collision_point_rec, MRB_ARGS_REQ(2));
}
