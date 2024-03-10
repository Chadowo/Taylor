# Change the brightness of the image.
# @param image [Image]
# @param brightness [Float] A value between -255 and 255.
# @return [nil]
def image_colour_brightness!(image, brightness)
  # mrb_image_colour_brightness
  # src/mruby_integration/image.cpp
  nil
end

# Replace the old Colour with the new Colour.
# @param image [Image]
# @param old_colour [Colour]
# @param new_colour [Colour]
# @return [nil]
def image_colour_replace!(image, old_colour, new_colour)
  # mrb_image_colour_replace
  # src/mruby_integration/image.cpp
  nil
end

# Draws the specified portion of the source image into the specified region of
# the destination image.
# @param destination [Image]
# @param source [Image]
# @param source_rectangle [Rectangle]
# @param destination_rectangle [Rectangle]
# @param colour [Colour]
# @return [nil]
def image_draw!(destination, source, source_rectangle, destination_rectangle, colour)
  # mrb_image_draw
  # src/mruby_integration/image.cpp
  nil
end

# Returns an Image object with the screen data.
# @return [Image]
def get_screen_data
  # mrb_get_screen_data
  # src/mruby_integration/image.cpp
  Image.new
end
