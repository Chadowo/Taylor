class Test
  class Models
    class Image_Test < MTest::Unit::TestCaseWithAnalytics
      def test_initialize
        image = Image.new("./assets/test.png")
        assert_equal fixture_models_image_new, image.data
      ensure
        image.unload
      end

      def test_initialize_fail
        assert_raise(Image::NotFound) {
          Image.new("./assets/fail.png")
        }
      end

      def test_to_h
        image = Image.new("./assets/test.png")

        assert_equal(
          {
            width: 3,
            height: 3,
            mipmaps: 1,
            format: 4
          },
          image.to_h
        )
      ensure
        image.unload
      end

      def test_export
        path = "./green-#{Time.now.to_i}.png"
        image = Image.generate(width: 10, height: 10, colour: Colour::GREEN)
        image.export(path)

        exported_image = Image.new(path)
        assert_equal fixture_models_image_export, exported_image.data
      ensure
        image.unload
        exported_image.unload
        File.delete(path)
      end

      def test_generate_default
        image = Image.generate(width: 10, height: 10)
        assert_equal fixture_models_image_generate_default, image.data
      ensure
        image.unload
      end

      def test_generate
        image = Image.generate(width: 10, height: 10, colour: Colour::GREEN)
        assert_equal fixture_models_image_generate, image.data
      ensure
        image.unload
      end

      def test_copy
        image = Image.generate(width: 10, height: 10, colour: Colour::GREEN)
        copy = image.copy
        assert_equal image.data, copy.data
      ensure
        image.unload
        copy.unload
      end

      def test_copy_with_source
        image = Image.new("assets/test.png")
        new_image = image.copy(source: Rectangle.new(1, 1, 2, 2))
        assert_equal fixture_models_image_copy_with_source, new_image.data
      ensure
        image.unload
        new_image.unload
      end

      def test_to_texture
        skip_unless_display_present

        set_window_title(__method__.to_s)
        image = Image.new("./assets/test.png")
        texture = image.to_texture

        assert_equal image.width, texture.width
        assert_equal image.height, texture.height

        clear_and_draw do
          texture.draw(destination: Rectangle[3, 3, 3, 3])
        end

        assert_equal fixture_models_image_to_texture, get_screen_data.data
      ensure
        texture.unload
        image.unload
      end

      def test_resize_bang_default_scaler
        image = Image.new("./assets/test.png")
        image.resize!(width: 6, height: 12)
        assert_equal fixture_models_image_resize_bang_default_scaler, image.data
        assert_equal 6, image.width
        assert_equal 12, image.height
      ensure
        image.unload
      end

      def test_resize_bang_bicubic_scaler
        image = Image.new("./assets/test.png")
        image.resize!(width: 6, height: 6, scaler: :bicubic)
        assert_equal fixture_models_image_resize_bang_bicubic_scaler, image.data
        assert_equal 6, image.width
        assert_equal 6, image.height
      ensure
        image.unload
      end

      def test_resize_bang_incorrect_scaler
        image = Image.new("./assets/test.png")

        begin
          image.resize!(width: 6, height: 6, scaler: :nope)
        rescue ArgumentError => e
          assert_equal "Invalid scaler provided, you must provide :bicubic or :nearest_neighbour",
            e.message
        end
      ensure
        image.unload
      end

      def test_crop!
        image = Image.new("./assets/test.png")
        image.crop!(source: Rectangle.new(0, 0, 2, 3))
        assert_equal fixture_models_image_crop!, image.data
        assert_equal 2, image.width
        assert_equal 3, image.height
      ensure
        image.unload
      end

      def test_alpha_mask!
        image = Image.new("./assets/test.png")
        mask = Image.new("./assets/alpha.png")

        image.alpha_mask!(mask)

        assert_equal fixture_models_image_alpha_mask!, image.data
      ensure
        mask.unload
        image.unload
      end

      def test_generate_mipmaps!
        image = Image.new("./assets/test.png")
        assert_equal 1, image.mipmaps

        image.generate_mipmaps!
        assert_equal 2, image.mipmaps
      ensure
        image.unload
      end

      def test_image_flip_vertically!
        image = Image.new("assets/asymettrical.png")

        image.flip_vertically!
        assert_equal fixture_models_image_flip_vertically!, image.data
      ensure
        image.unload
      end

      def test_image_flip_horizontally!
        image = Image.new("assets/asymettrical.png")

        image.flip_horizontally!
        assert_equal fixture_models_image_flip_horizontally!, image.data
      ensure
        image.unload
      end

      def test_image_rotate_clockwise!
        image = Image.new("assets/asymettrical.png")

        image.rotate_clockwise!
        assert_equal fixture_models_image_rotate_clockwise!, image.data
      ensure
        image.unload
      end

      def test_image_rotate_counter_clockwise!
        image = Image.new("assets/asymettrical.png")

        image.rotate_counter_clockwise!
        assert_equal fixture_models_image_rotate_counter_clockwise!, image.data
      ensure
        image.unload
      end

      def test_image_tint!
        image = Image.generate(width: 1, height: 1, colour: Colour::BLUE)

        image.tint!(Colour::GREEN)
        assert_equal fixture_models_image_tint!, image.data
      ensure
        image.unload
      end

      def test_image_invert!
        image = Image.generate(width: 1, height: 1, colour: Colour::BLACK)

        image.invert!
        assert_equal fixture_models_image_invert!, image.data
      ensure
        image.unload
      end

      def test_image_grayscale!
        red = Image.generate(width: 1, height: 1, colour: Colour::RED)
        blue = Image.generate(width: 1, height: 1, colour: Colour::BLUE)
        green = Image.generate(width: 1, height: 1, colour: Colour::GREEN)

        red.grayscale!
        blue.grayscale!
        green.grayscale!

        assert_equal fixture_models_image_grayscale![0], red.data
        assert_equal fixture_models_image_grayscale![1], blue.data
        assert_equal fixture_models_image_grayscale![2], green.data
      ensure
        red.unload
        blue.unload
        green.unload
      end

      def test_image_contrast!
        darken = Image.generate(width: 1, height: 1, colour: Colour::LIME)
        lighten = Image.generate(width: 1, height: 1, colour: Colour::LIME)

        darken.contrast!(10)
        lighten.contrast!(-10)

        assert_equal fixture_models_image_contrast![0], darken.data
        assert_equal fixture_models_image_contrast![1], lighten.data
      ensure
        darken.unload
        lighten.unload
      end

      def test_image_contrast_too_low
        image = Image.generate(width: 1, height: 1, colour: Colour::LIME)

        assert_raise(ArgumentError) {
          image.contrast!(-101)
        }
      ensure
        image.unload
      end

      def test_image_contrast_too_high
        image = Image.generate(width: 1, height: 1, colour: Colour::LIME)

        assert_raise(ArgumentError) {
          image.contrast!(101)
        }
      ensure
        image.unload
      end

      def test_image_brightness!
        darken = Image.generate(width: 1, height: 1, colour: Colour::VIOLET)
        lighten = Image.generate(width: 1, height: 1, colour: Colour::VIOLET)

        darken.brightness!(-10)
        lighten.brightness!(10)

        assert_equal fixture_models_image_brightness![1], darken.data
        assert_equal fixture_models_image_brightness![0], lighten.data
      ensure
        darken.unload
        lighten.unload
      end

      def test_image_brightness_too_low
        image = Image.generate(width: 1, height: 1, colour: Colour::VIOLET)

        assert_raise(ArgumentError) {
          image.brightness!(-256)
        }
      ensure
        image.unload
      end

      def test_image_brightness_too_high
        image = Image.generate(width: 1, height: 1, colour: Colour::VIOLET)

        assert_raise(ArgumentError) {
          image.brightness!(256)
        }
      ensure
        image.unload
      end

      def test_image_replace!
        image = Image.new("assets/test.png")

        image.replace!(Colour::WHITE, Colour::BLUE)
        assert_equal fixture_models_image_replace!, image.data
      ensure
        image.unload
      end

      def test_image_draw!
        image = Image.generate(width: 3, height: 3, colour: Colour::RAYWHITE)
        to_copy = Image.new("assets/test.png")

        image.draw!(
          image: to_copy,
          source: Rectangle.new(0, 0, 2, 2),
          destination: Rectangle.new(1, 1, 2, 2)
        )
        assert_equal fixture_models_image_draw!, image.data
      ensure
        image.unload
        to_copy.unload
      end

      def test_image_draw_no_args!
        image = Image.generate(width: 3, height: 3, colour: Colour::RAYWHITE)
        to_copy = Image.new("assets/test.png")

        image.draw!(image: to_copy)
        assert_equal fixture_models_image_draw_no_args!, image.data
      ensure
        image.unload
        to_copy.unload
      end
    end
  end
end
