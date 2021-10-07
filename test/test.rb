set_trace_log_level 5

require 'test/mtest_extensions'
require 'test/helpers'

require 'test/fixtures/core'
require 'test/fixtures/image'
require 'test/fixtures/shapes'
require 'test/fixtures/text'
require 'test/fixtures/texture'
require 'test/fixtures/models'

require 'test/core'
require 'test/core/drawing'
require 'test/images'
require 'test/text'
require 'test/textures'
require 'test/shapes/circle'
require 'test/shapes/ellipse'
require 'test/shapes/collision'
require 'test/shapes/line'
require 'test/shapes/pixel'
require 'test/shapes/rectangle'
require 'test/shapes/ring'
require 'test/shapes/triangle'
require 'test/models/camera2d'
require 'test/models/colour'
require 'test/models/font'
require 'test/models/image'
require 'test/models/music'
require 'test/models/rectangle'
require 'test/models/sound'
require 'test/models/texture2d'
require 'test/models/vector2'

init_window(10, 10, 'blah') unless ENV.fetch('DISPLAY', '').empty?
exit 1 if MTest::Unit.new.run.positive?
close_window unless ENV.fetch('DISPLAY', '').empty?
