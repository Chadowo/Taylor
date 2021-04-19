#include "mruby_integration/models/colour.hpp"
#include "mruby_integration/models/texture2d.hpp"
#include "mruby_integration/models/vector2.hpp"

void append_structs(mrb_state *mrb) {
  append_models_Colour(mrb);
  append_models_Texture2D(mrb);
  append_models_Vector2(mrb);
}
