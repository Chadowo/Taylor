def fixture_models_image_load
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    o, t, p,
    t, o, t,
    p, t, o
  ]
end

def fixture_models_generate_default
  100.times.map { Colour::RAYWHITE }
end

def fixture_models_generate
  100.times.map { Colour::GREEN }
end

def fixture_models_copy_with_source
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  [
    o, t,
    t, o
  ]
end

def fixture_models_image_resize_bicubic_scaing!
  [
    Colour[212, 139, 4], Colour[226, 176, 73], Colour[254, 255, 224], Colour[247, 221, 255], Colour[205, 73, 232], Colour[186, 5, 212],
    Colour[226, 176, 73], Colour[232, 194, 107], Colour[245, 232, 179], Colour[240, 206, 219], Colour[216, 115, 228], Colour[205, 73, 232],
    Colour[254, 255, 224], Colour[245, 232, 179], Colour[227, 181, 82], Colour[225, 172, 96], Colour[240, 206, 219], Colour[247, 221, 255],
    Colour[247, 221, 255], Colour[240, 206, 219], Colour[225, 172, 96], Colour[227, 181, 82], Colour[245, 232, 179], Colour[254, 255, 224],
    Colour[205, 73, 232], Colour[216, 115, 228], Colour[240, 206, 219], Colour[245, 232, 179], Colour[232, 194, 107], Colour[226, 176, 73],
    Colour[186, 5, 212], Colour[205, 73, 232], Colour[247, 221, 255], Colour[254, 255, 224], Colour[226, 176, 73], Colour[212, 139, 4]
  ]
end

def fixture_models_image_resize_default_scaing!
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    o, o, t, t, p, p,
    o, o, t, t, p, p,
    t, t, o, o, t, t,
    t, t, o, o, t, t,
    p, p, t, t, o, o,
    p, p, t, t, o, o
  ]
end

def fixture_models_image_crop!
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    o, t,
    t, o,
    p, t
  ]
end

def fixture_models_image_alpha_mask
  t = Colour[255, 255, 255, 0]
  o = Colour[218, 154, 37, 255]
  p = Colour[195, 37, 218, 0]
  [
    o, t, p,
    t, o, t,
    p, t, o
  ]
end

def fixture_models_image_flip_vertical!
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    p, t, p,
    t, o, t,
    o, t, p
  ]
end

def fixture_models_image_flip_horizontal!
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    p, t, o,
    t, o, t,
    p, t, p
  ]
end

def fixture_models_image_rotate_nil!
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    p, t, o,
    t, o, t,
    p, t, p
  ]
end

def fixture_models_image_rotate_cw!
  fixture_models_image_rotate_nil!
end

def fixture_models_image_rotate_ccw!
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    p, t, p,
    t, o, t,
    o, t, p
  ]
end

def fixture_models_image_tint!
  [
    Colour[0, 108, 45]
  ]
end

def fixture_models_image_invert!
  [
    Colour::WHITE
  ]
end

def fixture_models_image_grayscale!
  [
    [Colour[99, 99, 99]],
    [Colour[98, 98, 98]],
    [Colour[139, 139, 139]]
  ]
end

def fixture_models_image_contrast!
  [
    [Colour[0, 164, 30]],
    [Colour[24, 152, 62]]
  ]
end

def fixture_models_image_brightness!
  [
    [Colour[145, 70, 200]],
    [Colour[125, 50, 180]]
  ]
end

def fixture_models_image_replace!
  b = Colour::BLUE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    o, b, p,
    b, o, b,
    p, b, o
  ]
end

def fixture_models_image_draw_no_args!
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  p = Colour[195, 37, 218]
  [
    o, t, p,
    t, o, t,
    p, t, o
  ]
end

def fixture_models_image_draw!
  r = Colour::RAYWHITE
  t = Colour::WHITE
  o = Colour[218, 154, 37]
  [
    r, r, r,
    r, o, t,
    r, t, o
  ]
end
