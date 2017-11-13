# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'NAME/version'

Gem::Specification.new do |spec|
  spec.name             = "NAME"
  spec.version          = NAME::VERSION
  spec.authors          = ['Rudi Strydom']
  spec.email            = ['iam@thatguy.co.za']
  spec.summary          = %q{Short summary of your project}
  spec.description      = %q{Longer description of your project}
  spec.homepage         = "https://github.com/drpain/NAME"
  spec.license          = "MIT"

  spec.files            = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  spec.executables      = ['app.rb']
  spec.test_files       = ['tests/test_NAME.rb']
  spec.require_paths    = ["lib"]
end