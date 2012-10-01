Rinku for JRuby
==================

For now , the bundle built by jruby cannot be loaded correctly by ffi-lib,
you have to manually build it with mri ruby.

After installation,

    $ cd ~/.rvm/gems/jruby-1.7.0.RC1/gems/rinku-ffi-1.7.0/ext/rinku
    $ make realclean
    $ rvm use 1.9.3
    $ ruby extconf.rb
    $ make
    $ rvm use jruby-1.7.0.RC1

Run tests,

    $ cd ~/.rvm/gems/jruby-1.7.0.RC1/gems/rinku-ffi-1.7.0
    $ ruby text/autolink_test.rb

Try it in irb,

    $ irb
    jruby-1.7.0.RC1 :001 > require 'rinku-ffi'
     => true
    jruby-1.7.0.RC1 :002 > Rinku.auto_link("hello http://world.com")
     => "hello <a href=\"http://world.com\">http://world.com</a>"



license
-------

See original rinku license.