# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'guides/version'

os = Gem::Platform.local.os
is_mingw = (os == "mingw32")

Gem::Specification.new do |s|
  s.name        = "guides"
  s.version     = Guides::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Yehuda Katz"]
  s.email       = ["wycats@gmail.com"]
  s.homepage    = "http://yehudakatz.com"
  s.summary     = %q{Extracting the Rails Guides framework for the rest of us}
  s.description = %q{A tool for creating version controlled guides for open source projects, based on the Rails Guides framework}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "guides"

  s.add_dependency "actionpack", "~> 4.0"
  s.add_dependency "activesupport", "~> 4.0"
  s.add_dependency "rack", "~> 1.6"
  s.add_dependency "RedCloth", "~> 4.2.7"
  s.add_dependency "maruku", "~> 0.6.0"
  s.add_dependency "thor", "~> 0.14"
  s.add_dependency "thin", "~> 1.2.7"

  if is_mingw
    s.add_dependency 'eventmachine', '~> 1.0.0.beta'
  end

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables        = %w(guides)
  s.require_paths      = ["lib"]
end
