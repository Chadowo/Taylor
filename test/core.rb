class TestCore < MTest::Unit::TestCase
  def test_init_window
    init_window(10, 10, 'test_init_window')
    assert_equal fixture_init_window, get_screen_data.data
    close_window
  end

  def test_clear_background
    init_window(10, 10, 'test_clear_background')
    clear_background(RED)
    assert_equal fixture_clear_background, get_screen_data.data
    close_window
  end

  def test_get_world_to_screen2D
    init_window(10, 10, 'test_get_world_to_screen2D')
    vector = Vector2.new(5, 5)
    camera = Camera2D.new(Vector2.new(0, 0), Vector2.new(0, 0), 0, 1)

    assert_equal Vector2.new(5, 5), get_world_to_screen2D(vector, camera)

    camera.target.x = 5
    camera.target.y = 5

    assert_equal Vector2.new(0, 0), get_world_to_screen2D(vector, camera)

    close_window
  end

  def test_get_screen_to_world2D
    init_window(10, 10, 'test_get_screen_to_world2D')
    vector = Vector2.new(5, 5)
    camera = Camera2D.new(Vector2.new(0, 0), Vector2.new(0, 0), 0, 1)

    assert_equal Vector2.new(5, 5), get_screen_to_world2D(vector, camera)

    camera.target.x = 5
    camera.target.y = 5

    assert_equal Vector2.new(10, 10), get_screen_to_world2D(vector, camera)

    close_window
  end

  def test_mode2D
    init_window(10, 10, 'test_mode2D')
    rectangle = Rectangle.new(2, 2, 6, 6)
    camera = Camera2D.new(Vector2.new(0, 0), Vector2.new(0, 0), 0, 1)

    begin_drawing
    begin_mode2D(camera)
    draw_rectangle_rec(rectangle, RED)
    end_mode2D
    end_drawing

    assert_equal fixture_mode2D[0], get_screen_data.data
    clear_background(RAYWHITE)

    camera.offset.x = -2
    camera.offset.y = -2

    begin_drawing
    begin_mode2D(camera)
    draw_rectangle_rec(rectangle, RED)
    end_mode2D

    assert_equal fixture_mode2D[1], get_screen_data.data

    end_drawing
    close_window
  end

  def test_set_window_state_fullscreen
    current_monitor = get_current_monitor
    init_window(get_monitor_width(current_monitor), get_monitor_height(current_monitor), 'test_set_window_state_fullscreen')

    assert_false is_window_state?(FLAG_FULLSCREEN_MODE)

    set_window_state(FLAG_FULLSCREEN_MODE)
    flush_frame

    assert_true is_window_state?(FLAG_FULLSCREEN_MODE)
    assert_true is_window_fullscreen?

    clear_window_state(FLAG_FULLSCREEN_MODE)
    flush_frame

    assert_false is_window_state?(FLAG_FULLSCREEN_MODE)

    close_window
  end

  def test_set_window_state_hidden
    init_window(10, 10, 'test_set_window_state_hidden')

    assert_false is_window_state?(FLAG_WINDOW_HIDDEN)

    set_window_state(FLAG_WINDOW_HIDDEN)
    flush_frame

    assert_true is_window_state?(FLAG_WINDOW_HIDDEN)
    assert_true is_window_hidden?

    clear_window_state(FLAG_WINDOW_HIDDEN)
    flush_frame

    assert_false is_window_state?(FLAG_WINDOW_HIDDEN)

    close_window
  end

  def test_set_window_state_minimised
    init_window(10, 10, 'test_set_window_state_minimised')

    assert_false is_window_state?(FLAG_WINDOW_MINIMISED)

    set_target_fps 60
    set_window_state(FLAG_WINDOW_MINIMISED)
    # Need to actually wait for the window to minimise
    flush_frames(10)

    assert_true is_window_state?(FLAG_WINDOW_MINIMISED)
    assert_true is_window_minimised?

    close_window
  end

  def test_set_window_state_maximised
    init_window(10, 10, 'test_set_window_state_maximised')

    assert_false is_window_state?(FLAG_WINDOW_MAXIMISED)

    set_window_state(FLAG_WINDOW_MAXIMISED | FLAG_WINDOW_RESIZABLE)
    flush_frame

    assert_true is_window_state?(FLAG_WINDOW_MAXIMISED)
    assert_true is_window_maximised?

    restore_window
    flush_frame

    assert_false is_window_state?(FLAG_WINDOW_MINIMISED)

    close_window
  end

  def test_set_window_state_other
    init_window(10, 10, 'test_set_window_state_other')

    [
      FLAG_WINDOW_ALWAYS_RUN,
      FLAG_WINDOW_RESIZABLE,
      FLAG_WINDOW_TOPMOST,
      FLAG_WINDOW_UNDECORATED,
    ].each do |state|
      assert_false is_window_state?(state)

      set_window_state(state)
      flush_frame

      assert_true is_window_state?(state)

      clear_window_state(state)
      flush_frame

      assert_false is_window_state?(state)
    end

    close_window
  end

  def test_window_position
    init_window(10, 10, 'test_window_position')

    set_window_position 10, 10
    flush_frames(10)
    assert_equal Vector2.new(10, 10), get_window_position

    set_window_position 20, 20
    flush_frames(10)
    assert_equal Vector2.new(20, 20), get_window_position

    close_window
  end

  def test_set_window_size
    init_window(32, 24, 'test_set_window_size')

    assert_equal 32, get_screen_width
    assert_equal 24, get_screen_height

    set_window_size 64, 48

    flush_frame
    assert_equal 64, get_screen_width
    assert_equal 48, get_screen_height

    close_window
  end

  def test_clipboard
    init_window(32, 24, 'test_clipboard')

    set_clipboard_text('TEST STRING')
    assert_equal 'TEST STRING', get_clipboard_text

    close_window
  end
end
