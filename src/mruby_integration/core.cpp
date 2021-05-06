#include <cstdlib>
#include "raylib.h"
#include "mruby.h"
#include "mruby/string.h"

#include "mruby_integration/models/vector2.hpp"
#include "mruby_integration/struct_types.hpp"

mrb_value mrb_init_window(mrb_state *mrb, mrb_value) {
  mrb_int width, height;
  char* title;
  mrb_get_args(mrb, "iiz", &width, &height, &title);

  InitWindow(width, height, title);
  return mrb_nil_value();
}

mrb_value mrb_window_should_close(mrb_state*, mrb_value) {
  return mrb_bool_value(WindowShouldClose());
}

mrb_value mrb_close_window(mrb_state*, mrb_value) {
  CloseWindow();
  return mrb_nil_value();
}

mrb_value mrb_clear_background(mrb_state *mrb, mrb_value) {
  Color *colour;
  mrb_get_args(mrb, "d", &colour, &Colour_type);

  ClearBackground(*colour);
  return mrb_nil_value();
}

mrb_value mrb_begin_drawing(mrb_state*, mrb_value) {
  BeginDrawing();
  return mrb_nil_value();
}

mrb_value mrb_end_drawing(mrb_state*, mrb_value) {
  EndDrawing();
  return mrb_nil_value();
}

mrb_value mrb_begin_mode2D(mrb_state *mrb, mrb_value) {
  Camera2D *camera;
  mrb_get_args(mrb, "d", &camera, &Camera2D_type);

  BeginMode2D(*camera);
  return mrb_nil_value();
}

mrb_value mrb_end_mode2D(mrb_state*, mrb_value) {
  EndMode2D();
  return mrb_nil_value();
}

mrb_value mrb_get_frame_time(mrb_state *mrb, mrb_value) {
  return mrb_float_value(mrb, GetFrameTime());
}

mrb_value mrb_get_world_to_screen2D(mrb_state *mrb, mrb_value) {
  Vector2 *vector;
  Camera2D *camera;
  mrb_get_args(mrb, "dd", &vector, &Vector2_type, &camera, &Camera2D_type);

  Vector2 *new_vector = (Vector2 *)malloc(sizeof(Vector2));
  *new_vector = GetWorldToScreen2D(*vector, *camera);
  mrb_value obj = mrb_obj_value(Data_Wrap_Struct(mrb, Vector2_class, &Vector2_type, new_vector));

  setup_Vector2(mrb, obj, new_vector, new_vector->x, new_vector->y);

  return obj;
}

mrb_value mrb_get_screen_to_world2D(mrb_state *mrb, mrb_value) {
  Vector2 *vector;
  Camera2D *camera;
  mrb_get_args(mrb, "dd", &vector, &Vector2_type, &camera, &Camera2D_type);

  Vector2 *new_vector = (Vector2 *)malloc(sizeof(Vector2));
  *new_vector = GetScreenToWorld2D(*vector, *camera);
  mrb_value obj = mrb_obj_value(Data_Wrap_Struct(mrb, Vector2_class, &Vector2_type, new_vector));

  setup_Vector2(mrb, obj, new_vector, new_vector->x, new_vector->y);

  return obj;
}

mrb_value mrb_set_target_fps(mrb_state *mrb, mrb_value) {
  mrb_int fps;
  mrb_get_args(mrb, "i", &fps);

  SetTargetFPS(fps);
  return mrb_nil_value();
}

mrb_value mrb_get_fps(mrb_state *mrb, mrb_value) {
  return mrb_int_value(mrb, GetFPS());
}

mrb_value mrb_set_config_flags(mrb_state *mrb, mrb_value) {
  mrb_int flags;
  mrb_get_args(mrb, "i", &flags);

  SetConfigFlags(flags);
  return mrb_nil_value();
}

mrb_value mrb_is_key_down(mrb_state *mrb, mrb_value) {
  mrb_int key;
  mrb_get_args(mrb, "i", &key);

  return mrb_bool_value(IsKeyDown(key));
}

mrb_value mrb_is_key_pressed(mrb_state *mrb, mrb_value) {
  mrb_int key;
  mrb_get_args(mrb, "i", &key);

  return mrb_bool_value(IsKeyPressed(key));
}

mrb_value mrb_is_gamepad_available(mrb_state *mrb, mrb_value) {
  mrb_int index;
  mrb_get_args(mrb, "i", &index);

  return mrb_bool_value(IsGamepadAvailable(index));
}

mrb_value mrb_get_gamepad_name(mrb_state *mrb, mrb_value) {
  mrb_int index;
  mrb_get_args(mrb, "i", &index);

  const char* name = GetGamepadName(index);
  return mrb_str_new_cstr(mrb, name);
}

mrb_value mrb_is_gamepad_button_down(mrb_state *mrb, mrb_value) {
  mrb_int index, button;
  mrb_get_args(mrb, "ii", &index, &button);

  return mrb_bool_value(IsGamepadButtonDown(index, button));
}

mrb_value mrb_get_gamepad_button_pressed(mrb_state *mrb, mrb_value) {
  return mrb_int_value(mrb, GetGamepadButtonPressed());
}

mrb_value mrb_get_gamepad_axis_count(mrb_state *mrb, mrb_value) {
  mrb_int index;
  mrb_get_args(mrb, "i", &index);

  return mrb_int_value(mrb, GetGamepadAxisCount(index));
}

mrb_value mrb_get_gamepad_axis_movement(mrb_state *mrb, mrb_value) {
  mrb_int index, axis;
  mrb_get_args(mrb, "ii", &index, &axis);

  return mrb_float_value(mrb, GetGamepadAxisMovement(index, axis));
}

mrb_value mrb_is_mouse_button_pressed(mrb_state *mrb, mrb_value) {
  mrb_int button;
  mrb_get_args(mrb, "i", &button);

  return mrb_bool_value(IsMouseButtonPressed(button));
}

mrb_value mrb_is_mouse_button_down(mrb_state *mrb, mrb_value) {
  mrb_int button;
  mrb_get_args(mrb, "i", &button);

  return mrb_bool_value(IsMouseButtonDown(button));
}

mrb_value mrb_get_mouse_position(mrb_state *mrb, mrb_value) {
  Vector2 *position = (Vector2 *)malloc(sizeof(Vector2));
  *position = GetMousePosition();

  return mrb_obj_value(Data_Wrap_Struct(mrb, Vector2_class, &Vector2_type, position));
}

mrb_value mrb_get_mouse_wheel_move(mrb_state *mrb, mrb_value) {
  return mrb_float_value(mrb, GetMouseWheelMove());
}

mrb_value mrb_get_touch_position(mrb_state *mrb, mrb_value) {
  mrb_int index;
  mrb_get_args(mrb, "i", &index);

  Vector2 *position = (Vector2 *)malloc(sizeof(Vector2));
  *position = GetTouchPosition(index);

  return mrb_obj_value(Data_Wrap_Struct(mrb, Vector2_class, &Vector2_type, position));
}

mrb_value mrb_set_gestures_enabled(mrb_state *mrb, mrb_value) {
  mrb_int flags;
  mrb_get_args(mrb, "i", &flags);

  SetGesturesEnabled(flags);

  return mrb_nil_value();
}

mrb_value mrb_get_gesture_detected(mrb_state *mrb, mrb_value) {
  return mrb_int_value(mrb, GetGestureDetected());
}

void append_core(mrb_state *mrb) {
  mrb_define_method(mrb, mrb->kernel_module, "init_window", mrb_init_window, MRB_ARGS_REQ(3));
  mrb_define_method(mrb, mrb->kernel_module, "window_should_close?", mrb_window_should_close, MRB_ARGS_NONE());
  mrb_define_method(mrb, mrb->kernel_module, "close_window", mrb_close_window, MRB_ARGS_NONE());

  mrb_define_method(mrb, mrb->kernel_module, "clear_background", mrb_clear_background, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "begin_drawing", mrb_begin_drawing, MRB_ARGS_NONE());
  mrb_define_method(mrb, mrb->kernel_module, "end_drawing", mrb_end_drawing, MRB_ARGS_NONE());
  mrb_define_method(mrb, mrb->kernel_module, "begin_mode2D", mrb_begin_mode2D, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "end_mode2D", mrb_end_mode2D, MRB_ARGS_NONE());

  mrb_define_method(mrb, mrb->kernel_module, "get_world_to_screen2D", mrb_get_world_to_screen2D, MRB_ARGS_REQ(2));
  mrb_define_method(mrb, mrb->kernel_module, "get_screen_to_world2D", mrb_get_screen_to_world2D, MRB_ARGS_REQ(2));

  mrb_define_method(mrb, mrb->kernel_module, "get_frame_time", mrb_get_frame_time, MRB_ARGS_NONE());
  mrb_define_method(mrb, mrb->kernel_module, "set_target_fps", mrb_set_target_fps, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "get_fps", mrb_get_fps, MRB_ARGS_NONE());

  mrb_define_method(mrb, mrb->kernel_module, "set_config_flags", mrb_set_config_flags, MRB_ARGS_REQ(1));

  mrb_define_method(mrb, mrb->kernel_module, "is_key_down", mrb_is_key_down, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "is_key_pressed", mrb_is_key_pressed, MRB_ARGS_REQ(1));

  mrb_define_method(mrb, mrb->kernel_module, "is_gamepad_available", mrb_is_gamepad_available, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "get_gamepad_name", mrb_get_gamepad_name, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "is_gamepad_button_down", mrb_is_gamepad_button_down, MRB_ARGS_REQ(2));
  mrb_define_method(mrb, mrb->kernel_module, "get_gamepad_button_pressed", mrb_get_gamepad_button_pressed, MRB_ARGS_NONE());
  mrb_define_method(mrb, mrb->kernel_module, "get_gamepad_axis_count", mrb_get_gamepad_axis_count, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "get_gamepad_axis_movement", mrb_get_gamepad_axis_movement, MRB_ARGS_REQ(2));

  mrb_define_method(mrb, mrb->kernel_module, "is_mouse_button_pressed", mrb_is_mouse_button_pressed, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "is_mouse_button_down", mrb_is_mouse_button_down, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "get_mouse_position", mrb_get_mouse_position, MRB_ARGS_NONE());
  mrb_define_method(mrb, mrb->kernel_module, "get_mouse_wheel_move", mrb_get_mouse_wheel_move, MRB_ARGS_NONE());

  mrb_define_method(mrb, mrb->kernel_module, "get_touch_position", mrb_get_touch_position, MRB_ARGS_REQ(1));

  mrb_define_method(mrb, mrb->kernel_module, "set_gestures_enabled", mrb_get_gesture_detected, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, mrb->kernel_module, "get_gesture_detected", mrb_get_gesture_detected, MRB_ARGS_NONE());
}
