# -*- encoding: utf-8 -*-
# stub: stripe-rails 2.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "stripe-rails".freeze
  s.version = "2.6.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Charles Lowell".freeze, "Nola Stowe".freeze, "SengMing Tan".freeze]
  s.date = "2024-08-12"
  s.description = "A gem to integrate stripe into your rails app".freeze
  s.email = ["sengming@sanemen.com".freeze]
  s.homepage = "https://github.com/tansengming/stripe-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.11".freeze
  s.summary = "A gem to integrate stripe into your rails app".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rails>.freeze, [">= 5.1".freeze])
  s.add_runtime_dependency(%q<stripe>.freeze, [">= 3.15.0".freeze])
  s.add_runtime_dependency(%q<responders>.freeze, [">= 0".freeze])
end
