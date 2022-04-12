# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rolemodel_tables/version'

Gem::Specification.new do |s|
  s.name        = 'rolemodel_tables'
  s.version     = RoleModelTables::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jeremy Walton']
  s.email       = 'consult@rolemodelsoftware.com'

  s.summary     = 'Rolemodel Tables!'
  s.description = 'Helpers for advanced table functionality.'
  s.homepage    = 'https://github.com/RoleModel/rolemodel_tables'

  s.license     = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency 'kaminari', '~> 1.2'
  s.add_dependency 'ransack', '~> 2.5'
  s.add_dependency 'slim', '~> 4.1'
end
