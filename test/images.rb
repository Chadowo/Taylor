class TestImage < MTest::Unit::TestCase
  def test_image_load
    image = load_image('test/assets/test.png')
    assert_equal fixture_image_load, image.data
    unload_image(image)
  end

  def test_image_generate_colour
    image = generate_image_colour(10, 10, RAYWHITE)
    assert_equal fixture_generate_colour, image.data
    unload_image(image)
  end

  def test_image_copy
    image = generate_image_colour(10, 10, BLUE)
    copy = image_copy(image)
    assert_equal image.data, copy.data
    unload_image(image)
    unload_image(copy)
  end

  def test_image_from_image
    image = load_image('test/assets/test.png')
    new_image = image_from_image(image, Rectangle.new(1, 1, 2, 2))
    assert_equal fixture_image_from_image, new_image.data
    unload_image(image)
    unload_image(new_image)
  end
end
