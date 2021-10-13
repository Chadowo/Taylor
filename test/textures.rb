class TestTexture < MTest::Unit::TestCase
  def test_draw_texture
    skip_unless_display_present

    set_window_title(__method__.to_s)
    texture = Texture2D.load('test/assets/test.png')
    clear_and_draw do
      draw_texture(texture, 3, 3, WHITE)
    end

    assert_equal fixture_draw_texture, get_screen_data.data
    texture.unload
  end

  def test_draw_texture_pro
    skip_unless_display_present

    set_window_title(__method__.to_s)
    texture = Texture2D.load('test/assets/test.png')
    clear_and_draw do
      draw_texture_pro(
        texture,
        Rectangle.new(0, 0, 3, 3),
        Rectangle.new(0, 0, 9, 9),
        Vector2.new(0 ,0),
        0,
        WHITE
      )
    end

    assert_equal fixture_draw_texture_pro, get_screen_data.data
    texture.unload
  end
end
