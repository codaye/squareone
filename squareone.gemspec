# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'squareone/version'

Gem::Specification.new do |spec|
  spec.name          = "squareone"
  spec.version       = Squareone::VERSION
  spec.authors       = ["Joshua Azemoh"]
  spec.email         = ["joshazemoh@gmail.com"]

  spec.summary       = %q{Jekyll site generator with gulp for task automation.}
  spec.description   = %q{Jekyll starter site generator with gulp task automation workflow.}
  spec.homepage      = "http://codaye.github.io/squareone"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = ["squareone"]
  spec.default_executable = "squareone"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", "~> 0.19"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
end
