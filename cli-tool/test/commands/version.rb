class TestCommandsVersion < MTest::Unit::TestCase
  def test_call
    version_command = Taylor::Commands::Version.new
    assert_equal "Taylor #{TAYLOR_VERSION}", version_command.puts_data
  end
end