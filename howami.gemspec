# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'howami/version'

Gem::Specification.new do |gem|
  gem.name          = "howami"
  gem.version       = Howami::VERSION
  gem.authors       = ["Matthew Rothenberg"]
  gem.email         = ["mrothenberg@gmail.com"]
  gem.description   = %q{CLI tool to show a summary of Fitbit health statistics.}
  gem.summary       = %q{CLI tool to show a summary of Fitbit health statistics.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('rdoc', '~> 4.0.1')
  gem.add_development_dependency('aruba', '~> 0.5.3')
  gem.add_development_dependency('rake', '~> 10.0.4')
  gem.add_development_dependency('rspec', '~> 2.13.0')
  gem.add_development_dependency('fakefs', '~> 0.4.2')
  gem.add_development_dependency('vcr', '~> 2.5.0')
  gem.add_development_dependency('webmock', '~> 1.11.0')
  gem.add_development_dependency('travis',  '~> 1.6.6')

  gem.add_dependency('methadone', '~> 1.3.1')
  gem.add_dependency('fitgem', '~> 0.8.0')
end
