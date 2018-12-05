
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'filipinomemes/version'

Gem::Specification.new do |spec|
  spec.name          = 'filipinomemes'
  spec.version       = Filipinomemes::VERSION
  spec.authors       = ['Jan Paul Carag']
  spec.email         = ['zephyrum14@gmail.com']
  spec.description   = 'Filipinomemes Programming Language'
  spec.summary       = 'Filipinomemes is a programming language that uses filipino memes as its syntax'
  spec.homepage      = 'https://github.com/zephyrum14/filipinomemes'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby2ruby'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
