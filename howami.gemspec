# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'howami/version'

Gem::Specification.new do |gem|
  gem.name          = "howami"
  gem.version       = Howami::VERSION
  gem.authors       = ["Matthew Rothenberg"]
  gem.email         = ["mrothenberg@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('rdoc')
  gem.add_development_dependency('aruba', '~> 0.5.2')
  gem.add_development_dependency('rake', '~> 10.0.3')
  gem.add_development_dependency('rspec', '~> 2.13.0')
  gem.add_development_dependency('fakefs')
  gem.add_development_dependency('vcr', '~> 2.4.0')
  gem.add_development_dependency('webmock', '~> 1.9.3')

  gem.add_dependency('methadone', '~> 1.2.6')
  gem.add_dependency('fitgem', '~> 0.6.1')
  gem.add_dependency('colored')
end
