class TestShapesCircle < MTest::Unit::TestCase
  def test_draw_circle
    init_window(10, 10, 'hi')

    begin_drawing
    draw_circle(5, 5, 3, PURPLE)
    end_drawing

    assert_equal fixture_draw_circle, get_screen_data.data

    close_window
  end

  def test_draw_circle_v
    init_window(10, 10, 'hi')

    begin_drawing
    draw_circle_v(Vector2.new(5, 5), 3, PURPLE)
    end_drawing

    assert_equal fixture_draw_circle, get_screen_data.data

    close_window
  end
end
