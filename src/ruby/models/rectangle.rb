# The Rectangle class is used for drawing and also collision checking.
class Rectangle
  # @return [Integer]
  attr_reader :x, :y, :width, :height

  # Return the object represented by a Hash
  # @return [Hash]
  def to_h
    {
      x: x,
      y: y,
      width: width,
      height: height
    }
  end

  # Draws a rectangle in several configurations
  # @param origin [Vector2]
  # @param rotation [Float] only usable when outline and rounded are false
  # @param outline [Boolean]
  # @param thickness [Integer] only used when outline is true
  # @param rounded [Boolean]
  # @param radius [Float] A value between 0.0 and 1.0 and only used when rounded is true
  # @raise [ArgumentError] If the radius is out of bounds
  # @return [Rectangle]
  def draw(
    origin: Vector2::ZERO,
    rotation: 0,    # only usable when outline and rounded are false
    outline: false,
    thickness: 2,   # only used when outline is true
    rounded: false,
    radius: 0.5,    # only used when rounded is true
    segments: 8,    # only used when rounded is true
    colour: BLACK
  )

    if rounded
      unless (0..1).cover?(radius)
        raise ArgumentError, "Radius must fall between 0 and 1, you gave me #{radius}"
      end

      if outline
        draw_rectangle_rounded_lines(self, radius, segments, thickness, colour)
      else
        draw_rectangle_rounded(self, radius, segments, colour)
      end
    elsif outline
      draw_rectangle_lines_ex(self, thickness, colour)
    else
      draw_rectangle_pro(self, origin, rotation, colour)
    end
  end
end
