# Clears the screen with the specified colour
# @param colour [Colour]
# @return [nil]
def clear_background(colour)
  # mrb_clear_background
  # src/mruby_integration/core/drawing.cpp
  nil
end

# Starts drawing to the screen
# @return [nil]
def begin_drawing()
  # mrb_begin_drawing
  # src/mruby_integration/core/drawing.cpp
  nil
end

# Ends drawing to the screen
# @return [nil]
def end_drawing()
  # mrb_end_drawing
  # src/mruby_integration/core/drawing.cpp
  nil
end

# Starts drawing from the perspective of the camera
# @param camera [Camera2D]
# @return [nil]
def begin_mode2D(camera)
  # mrb_begin_mode2D
  # src/mruby_integration/core/drawing.cpp
  nil
end

# Stops drawing from the perspective of the camera
# @return [nil]
def end_mode2D()
  # mrb_end_mode2D
  # src/mruby_integration/core/drawing.cpp
  nil
end

# In scissor mode only draw calls within the defined area will actually be drawn
# @param x [Integer]
# @param y [Integer]
# @param width [Integer]
# @param height [Integer]
# @return [nil]
def begin_scissor_mode(x, y, width, height)
  # mrb_begin_scissor_mode
  # src/mruby_integration/core/drawing.cpp
  nil
end

# End scissor mode
# @return [nil]
def end_scissor_mode()
  # mrb_end_scissor_mode
  # src/mruby_integration/core/drawing.cpp
  nil
end
