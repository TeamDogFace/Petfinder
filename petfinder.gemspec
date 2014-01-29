# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'petfinder/version'

Gem::Specification.new do |spec|
  spec.name          = "petfinder"
  spec.version       = Petfinder::VERSION
  spec.authors       = ["Tyler Ewing"]
  spec.email         = ["tewing10@gmail.com"]
  spec.description   = %q{Ruby wrapper for the Petfinder REST API}
  spec.summary       = %q{Ruby wrapper for the Petfinder REST API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
