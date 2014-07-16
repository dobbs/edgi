# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edgi/version'

Gem::Specification.new do |spec|
  spec.name          = "edgi"
  spec.version       = Edgi::VERSION
  spec.authors       = ["Eric Dobbs"]
  spec.email         = ["eric@dobbse.net"]
  spec.summary       = %q{Edges, nodes, and their attributes}
  spec.description   = %q{simplest thing that could possibly work for graphs}
  spec.homepage      = "https://github.com/dobbs/edgi"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"
end
