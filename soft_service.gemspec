# -*- encoding: utf-8 -*-

require File.expand_path('../lib/soft_service/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "soft_service"
  gem.version       = SoftService::VERSION
  gem.summary       = %q{Mixins for service objects.}
  gem.description   = %q{A pattern for service object interfaces.}
  gem.license       = "MIT"
  gem.authors       = ["Don Morrison"]
  gem.email         = "don@elskwid.net"
  gem.homepage      = "https://github.com/elskwid/soft_service#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.2'
  gem.add_development_dependency 'minitest', '~> 5.0'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
