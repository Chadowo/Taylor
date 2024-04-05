#include "mruby.h"
#include "raylib.h"
#include <cstdlib>

#include "mruby_integration/models/music.hpp"
#include "mruby_integration/struct_types.hpp"

auto
mrb_set_music_volume(mrb_state* mrb, mrb_value) -> mrb_value
{
  Music* music;
  mrb_float volume;
  mrb_get_args(mrb, "df", &music, &Music_type, &volume);

  SetMusicVolume(*music, volume);

  return mrb_nil_value();
}

auto
mrb_set_music_pitch(mrb_state* mrb, mrb_value) -> mrb_value
{
  Music* music;
  mrb_float pitch;
  mrb_get_args(mrb, "df", &music, &Music_type, &pitch);

  SetMusicPitch(*music, pitch);

  return mrb_nil_value();
}

void
append_audio_music(mrb_state* mrb)
{
  mrb_define_method(mrb,
                    mrb->kernel_module,
                    "set_music_volume",
                    mrb_set_music_volume,
                    MRB_ARGS_REQ(2));
  mrb_define_method(mrb,
                    mrb->kernel_module,
                    "set_music_pitch",
                    mrb_set_music_pitch,
                    MRB_ARGS_REQ(2));
}
