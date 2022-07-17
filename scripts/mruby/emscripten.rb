MRuby::CrossBuild.new('emscripten') do |conf|
  toolchain :clang

  conf.cc.command = 'emcc'
  conf.cc.flags += %w[-O3]
  conf.linker.command = 'emcc'
  conf.linker.flags += %w[-s ASYNCIFY]
  conf.archiver.command = 'emar'

   #These are the default libraries
  conf.gembox "stdlib"
  conf.gembox "stdlib-ext"
  conf.gembox "stdlib-io"
  conf.gembox "math"
  conf.gembox "metaprog"

  conf.gem core: 'mruby-exit'
  conf.gem core: 'mruby-sleep'
  conf.gem github: 'iij/mruby-dir'
  conf.gem github: 'iij/mruby-env'
  conf.gem github: 'iij/mruby-iijson'
  conf.gem github: 'iij/mruby-mtest'
  conf.gem github: 'hellrok/mruby-regexp-pcre'
  conf.gem github: 'katzer/mruby-tiny-opt-parser'
  conf.gem github: 'Asmod4n/mruby-uri-parser'
  conf.gem github: 'matsumotory/mruby-simplehttp'
  # I dunno if it ever makes sense to enable this for web?
  #conf.gem github: 'matsumotory/mruby-simplehttpserver'
  conf.gem github: 'mattn/mruby-base64'
  conf.gem github: 'mattn/mruby-require'
end
