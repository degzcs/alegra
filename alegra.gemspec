# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alegra/version'

Gem::Specification.new do |spec|
  spec.name          = "alegra"
  spec.version       = Alegra::VERSION
  spec.authors       = ["Diego Gomez"]
  spec.email         = ["diego.f.gomez.pardo@gmail.com"]

  spec.summary       = %q{Gem to wrap Alegra API.}
  spec.description   = %q{Gem to wrap Alegra API. This is unofficial gem (until now)}
  spec.homepage      = "https://github.com/degzcs/alegra"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 3"
  spec.add_development_dependency "webmock", "~> 2.1"
  spec.add_development_dependency "jazz_fingers", "~> 4"

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "json", "~> 1.7"
end
