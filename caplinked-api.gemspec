lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caplinked/version'

Gem::Specification.new do |spec|
  spec.name = 'caplinked-api'
  spec.version = Caplinked::Version
  spec.authors = ['Jordan Fowler', 'Jazz Garcha']
  spec.email = %w(dev@caplinked.com)
  spec.description = "Ruby SDK for Caplinked's API."
  spec.summary = spec.description
  spec.homepage = 'https://github.com/caplinked/caplinked-api-ruby'
  spec.licenses = %w(MIT)

  spec.files = %w(README.md caplinked-api.gemspec) + Dir['lib/**/*.rb']
  spec.require_paths = %w(lib)
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'activesupport', '~> 4.0'
  spec.add_dependency 'addressable', '~> 2.3'
  spec.add_dependency 'http', '~> 2.0'
  spec.add_dependency 'http-form_data', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.0'
end
