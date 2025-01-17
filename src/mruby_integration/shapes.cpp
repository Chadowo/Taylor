#include "mruby.h"
#include "raylib.h"

#include "mruby_integration/shapes/circle.hpp"
#include "mruby_integration/shapes/ellipse.hpp"
#include "mruby_integration/shapes/line.hpp"
#include "mruby_integration/shapes/pixel.hpp"
#include "mruby_integration/shapes/rectangle.hpp"
#include "mruby_integration/shapes/ring.hpp"
#include "mruby_integration/shapes/triangle.hpp"

#include "mruby_integration/shapes/collision.hpp"

void
append_shapes(mrb_state* mrb)
{
  append_shapes_circle(mrb);
  append_shapes_ellipse(mrb);
  append_shapes_line(mrb);
  append_shapes_pixel(mrb);
  append_shapes_rectangle(mrb);
  append_shapes_ring(mrb);
  append_shapes_triangle(mrb);

  append_shapes_collision(mrb);
}
