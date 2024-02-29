class Image
  # Loads an image file off of the disk. If the file does not exist, it will
  # raise an {Image::NotFound} error.
  #
  # Supported image types are png, jpg, bmp, qoi, gif, dds, hdr.
  #
  # ```ruby
  # image = Image.new("/assets/image.png")
  # ```
  #
  # @param path [Integer]
  # @return [Image]
  # @raise [Image::NotFound]
  def initialize(path)
    # mrb_Image_initialize
    # src/mruby_integration/models/image.cpp
    Image.new
  end

  # Returns an array containing the image data as an array of Colour objects
  # @return [Array<Colour>]
  def data
    # mrb_Image_get_data
    # src/mruby_integration/models/image.cpp
    [Colour.new]
  end
end
