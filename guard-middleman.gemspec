# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/middleman/version"

Gem::Specification.new do |s|
  s.name        = "guard-middleman"
  s.version     = Guard::Middleman::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthias Döring"]
  s.email       = ["matt@foryourcontent.de"]
  s.homepage    = "http://rubygems.org/gems/guard-middleman"
  s.summary     = %q{Guard gem for Middleman}
  s.description = %q{Guard gem for Middleman - automatically runs mm-build}

  s.rubyforge_project = "guard-middleman"

  s.add_dependency 'guard', '>= 0.4.2'
  s.add_dependency 'middleman', '>= 1.2.7'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
