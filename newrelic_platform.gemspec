require File.expand_path('../lib/newrelic_platform/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Travis Reeder", "Chad Arimura"]
  gem.email         = ["travis@iron.io"]
  gem.description   = "Ruby wrapper around the New Relic HTTP API. Makes it very easy to post component and metric data to the API."
  gem.summary       = "Ruby wrapper around the New Relic HTTP API."
  gem.homepage      = "https://github.com/newrelic-platform/iron_sdk"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "newrelic_platform"
  gem.require_paths = ["lib"]
  gem.version       = NewRelic::VERSION

  gem.required_rubygems_version = ">= 1.3.6"
  gem.required_ruby_version = Gem::Requirement.new(">= 1.8")
  gem.add_runtime_dependency "rest"

  gem.add_development_dependency "uber_config"

end

