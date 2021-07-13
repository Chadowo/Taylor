MRuby::Build.new do |conf|
  conf.toolchain
  conf.gembox "default"

  conf.gem github: 'iij/mruby-dir'
  conf.gem github: 'iij/mruby-iijson'
  conf.gem github: 'iij/mruby-mtest'
  conf.gem github: 'hellrok/mruby-require'
end
