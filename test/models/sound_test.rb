class Test
  class Models
    class Sound_Test < MTest::Unit::TestCaseWithAnalytics
      def test_initialize
        skip "Can't open and close audio more than once in WINE." if windows?
        Audio.open
        sound = Sound.new("./assets/test.wav")

        assert_equal 1, sound.volume
        assert_equal 1, sound.pitch
        assert_equal 24228, sound.frame_count
      ensure
        sound&.unload
        Audio.close
      end

      def test_initialize_with_arguments
        skip "Can't open and close audio more than once in WINE." if windows?
        Audio.open
        sound = Sound.new("./assets/test.wav", volume: 0.5, pitch: 1.3)

        assert_equal 0.5, sound.volume
        assert_equal 1.3, sound.pitch
        assert_equal 24228, sound.frame_count
      ensure
        sound&.unload
        Audio.close
      end

      def test_initialize_fail_not_found
        assert_raise(Sound::NotFound) {
          Sound.new("./assets/fail.wav")
        }
      end

      def test_initialize_fail_volume
        begin
          Sound.new("./assets/test.wav", volume: 1.1)
          fail "Previous line should have raised"
        rescue ArgumentError => e
          assert_equal "Volume must be within (0.0..1.0)", e.message
        end

        begin
          Sound.new("./assets/test.wav", volume: -0.1)
          fail "Previous line should have raised"
        rescue ArgumentError => e
          assert_equal "Volume must be within (0.0..1.0)", e.message
        end
      end

      def test_to_h
        skip "Can't open and close audio more than once in WINE." if windows?
        Audio.open
        sound = Sound.new("./assets/test.wav")

        assert_equal(
          {
            frame_count: 24228,
            volume: 1.0,
            pitch: 1.0
          },
          sound.to_h
        )
      ensure
        sound&.unload
        Audio.close
      end
    end
  end
end
