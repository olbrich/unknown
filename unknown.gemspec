# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unknown/version'

Gem::Specification.new do |spec|
  spec.name          = "unknown"
  spec.version       = UnknownClass::VERSION
  spec.authors       = ["Kevin Olbrich"]
  spec.email         = ["kevin.olbrich@gmail.com"]

  spec.summary       = %q{Handles doing math with unknown values}
  spec.description   = %q{Handles doing math with unknown values so you can avoid doing nil checks on formulas}
  spec.homepage      = "https://github.com/olbrich/unknown"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
end
