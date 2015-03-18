# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-brapp/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Levent Ali"]
  gem.email         = ["levent@purebreeze.com"]
  gem.description   = %q{Official OmniAuth strategy for Brapp.}
  gem.summary       = %q{Official OmniAuth strategy for Brapp.}
  gem.homepage      = "https://github.com/brappmusic/omniauth-brapp"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-brapp"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Brapp::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  # Nothing lower than omniauth-oauth2 1.1.1
  # http://www.rubysec.com/advisories/CVE-2012-6134/
  gem.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
