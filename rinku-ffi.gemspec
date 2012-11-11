# encoding: UTF-8

Gem::Specification.new do |s|
  s.name = 'rinku-ffi'
  s.version = '1.0.1'
  s.summary = "rinku for jruby"
 s.description = <<-EOF
    add a FFI layer to original rinku
  EOF
  s.email = 'xiefei@gtan.com'
  s.homepage = 'http://github.com/centaur/rinku-ffi'
  s.authors = ["Vicent Marti", "Xie Fei"]
  # = MANIFEST =
  s.files = %w[
    COPYING
    README.markdown
    Rakefile
    ext/rinku/rinku.c
    ext/rinku/rinku.h
    ext/rinku/autolink.c
    ext/rinku/autolink.h
    ext/rinku/buffer.c
    ext/rinku/buffer.h
    ext/rinku/extconf.rb
    lib/rinku.rb
    lib/rinku-ffi.rb
    lib/rails_rinku.rb
    rinku-ffi.gemspec
    test/autolink_test.rb
  ]
  # = MANIFEST =
  s.test_files = ["test/autolink_test.rb"]
  s.extra_rdoc_files = ["COPYING"]
  s.extensions = ["ext/rinku/extconf.rb"]
  s.require_paths = ["lib"]
  s.add_dependency('ffi') if RUBY_PLATFORM == 'java'
end
