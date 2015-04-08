# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'similar/version'

Gem::Specification.new do |gem|
  gem.name          = 'similar'
  gem.version       = Similar::VERSION
  gem.authors       = ['Scott Barr']
  gem.email         = ['scottjbarr@gmail.com']
  gem.description   = <<-EOF
    Similar is a library of functions to assist in determining the similarity
    of arbitrary sets of data.
  EOF
  gem.summary       = %q{Determine similarity of arbitrary sets of data}
  gem.homepage      = 'http://github.com/scottbarr/similar'
  gem.license = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-core'
  gem.add_development_dependency 'rspec-expectations'
  gem.add_development_dependency 'rspec-mocks'
  gem.add_development_dependency 'builder'
end
