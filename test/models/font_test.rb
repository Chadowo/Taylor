class Test
  class Models
    class Font_Test < MTest::Unit::TestCaseWithAnalytics
      def test_initialize
        font = Font.new("./assets/tiny.ttf")

        assert_kind_of Font, font
        assert_equal 32, font.size
        assert_equal 95, font.glyph_count
        assert_equal 4, font.glyph_padding

        font.unload
      end

      def test_initialize_with_args
        font = Font.new("./assets/tiny.ttf", size: 6, glyph_count: 100)

        assert_kind_of Font, font
        assert_equal 6, font.size
        assert_equal 100, font.glyph_count
        assert_equal 4, font.glyph_padding

        font.unload
      end

      def test_to_h
        font = Font.new("./assets/tiny.ttf")

        assert_equal(32, font.to_h[:size])
        assert_equal(95, font.to_h[:glyph_count])
        assert_equal(4, font.to_h[:glyph_padding])
      ensure
        font.unload
      end

      def test_ready?
        font = Font.new("./assets/tiny.ttf")
        assert_true font.ready?
      ensure
        font.unload
      end

      def test_draw
        skip_unless_display_present

        set_window_title(__method__.to_s)
        font = Font.new("./assets/tiny.ttf", size: 6)
        clear_and_draw do
          font.draw("xx")
        end

        assert_equal fixture_font_draw, get_screen_data.data
      ensure
        font.unload
      end

      def test_draw_with_position
        skip_unless_display_present

        set_window_title(__method__.to_s)
        font = Font.new("./assets/tiny.ttf", size: 6)
        clear_and_draw do
          font.draw(
            "x",
            position: Vector2.new(2, 2)
          )
        end

        assert_equal fixture_font_draw_with_position, get_screen_data.data
      ensure
        font.unload
      end

      def test_draw_with_x_and_y
        skip_unless_display_present

        set_window_title(__method__.to_s)
        font = Font.new("./assets/tiny.ttf", size: 6)
        clear_and_draw do
          font.draw(
            "x",
            x: 2, y: 0
          )
        end

        assert_equal fixture_font_draw_with_x_and_y, get_screen_data.data
      ensure
        font.unload
      end

      def test_draw_with_colour
        skip_unless_display_present

        set_window_title(__method__.to_s)
        font = Font.new("./assets/tiny.ttf", size: 6)
        clear_and_draw do
          font.draw(
            "O",
            colour: GREEN
          )
        end

        assert_equal fixture_font_draw_with_colour, get_screen_data.data
      ensure
        font.unload
      end

      def test_unload
        font = Font.new("./assets/tiny.ttf")
        assert_true font.ready?
      ensure
        font.unload
      end

      def test_draw_with_spacing
        skip_unless_display_present

        set_window_title(__method__.to_s)
        font = Font.new("./assets/tiny.ttf", size: 6)
        clear_and_draw do
          font.draw(
            "xx",
            spacing: 1
          )
        end

        assert_equal fixture_font_draw_with_spacing, get_screen_data.data
      ensure
        font.unload
      end

      def test_measure
        skip_unless_display_present

        set_window_title(__method__.to_s)
        font = Font.new("./assets/tiny.ttf", size: 6)
        assert_equal 8, font.measure("xx").width
        assert_equal 6, font.measure("xx").height
      ensure
        font.unload
      end

      def test_measure_with_size
        skip_unless_display_present

        set_window_title(__method__.to_s)
        font = Font.new("./assets/tiny.ttf", size: 6)
        assert_equal 16, font.measure("xx", size: 12).width
        assert_equal 12, font.measure("xx", size: 12).height
      ensure
        font.unload
      end

      def test_measure_with_spacing
        skip_unless_display_present

        set_window_title(__method__.to_s)
        font = Font.new("./assets/tiny.ttf", size: 6)
        assert_equal 9, font.measure("xx", spacing: 1).width
        assert_equal 6, font.measure("xx", spacing: 1).height
      ensure
        font.unload
      end
    end
  end
end
