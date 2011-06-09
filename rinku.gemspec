Gem::Specification.new do |s|
  s.name = 'rinku'
  s.version = File.open('VERSION').read.strip
  s.summary = "Mostly autolinking"
  s.description = <<-EOF
    A fast and very smart autolinking library that
    acts as a drop-in replacement for Rails `auto_link`
  EOF
  s.email = 'vicent@github.com'
  s.homepage = 'http://github.com/tanoku/rinku'
  s.authors = ["Vicent Martí"]
  # = MANIFEST =
  s.files = %w[
    COPYING
    VERSION
    README.markdown
    Rakefile
    ext/rinku/rinku.c
    ext/rinku/autolink.c
    ext/rinku/autolink.h
    ext/rinku/buffer.c
    ext/rinku/buffer.h
    ext/rinku/html_autolink.c
    ext/rinku/extconf.rb
    lib/rinku.rb
    rinku.gemspec
    test/autolink_test.rb
  ]
  # = MANIFEST =
  s.test_files = ["test/autolink_test.rb"]
  s.extra_rdoc_files = ["COPYING"]
  s.extensions = ["ext/rinku/extconf.rb"]
  s.require_paths = ["lib"]
end