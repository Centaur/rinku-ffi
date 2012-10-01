Rinku for JRuby
==================

For now , the bundle built by jruby cannot be loaded correctly by ffi-lib,
you have to manually build it with mri ruby.

Install,

    $ gem install rinku-ffi

Build native extension manually,

    $ cd ~/.rvm/gems/jruby-1.7.0.RC1/gems/rinku-ffi-1.0.0/ext/rinku
    $ make realclean
    $ rvm use 1.9.3
    $ ruby extconf.rb
    $ make
    $ rvm use jruby-1.7.0.RC1

Run tests,

    $ cd ~/.rvm/gems/jruby-1.7.0.RC1/gems/rinku-ffi-1.0.0
    $ ruby test/autolink_test.rb

Try it in irb,

    $ irb
    jruby-1.7.0.RC1 :001 > require 'rinku-ffi'
     => true
    jruby-1.7.0.RC1 :002 > Rinku.auto_link("hello http://world.com")
     => "hello <a href=\"http://world.com\">http://world.com</a>"

Use in Rails, the same way as the original rinku.

	
    require 'rails-rinku'


License
-------

See original rinku license.