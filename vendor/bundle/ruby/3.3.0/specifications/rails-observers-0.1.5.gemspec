# -*- encoding: utf-8 -*-
# stub: rails-observers 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-observers".freeze
  s.version = "0.1.5".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rafael Mendon\u00E7a Fran\u00E7a".freeze, "Steve Klabnik".freeze]
  s.date = "2017-07-16"
  s.description = "Rails observer (removed from core in Rails 4.0)".freeze
  s.email = ["rafaelmfranca@gmail.com".freeze, "steve@steveklabnik.com".freeze]
  s.homepage = "https://github.com/rails/rails-observers".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "ActiveModel::Observer, ActiveRecord::Observer and ActionController::Caching::Sweeper extracted from Rails.".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<activemodel>.freeze, [">= 4.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, [">= 3".freeze])
  s.add_development_dependency(%q<railties>.freeze, [">= 4.0".freeze])
  s.add_development_dependency(%q<activerecord>.freeze, [">= 4.0".freeze])
  s.add_development_dependency(%q<actionmailer>.freeze, [">= 4.0".freeze])
  s.add_development_dependency(%q<actionpack>.freeze, [">= 4.0".freeze])
  s.add_development_dependency(%q<activeresource>.freeze, [">= 4.0".freeze])
  s.add_development_dependency(%q<sqlite3>.freeze, [">= 1.3".freeze])
end
