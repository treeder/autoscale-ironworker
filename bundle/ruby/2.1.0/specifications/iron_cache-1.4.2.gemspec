# -*- encoding: utf-8 -*-
# stub: iron_cache 1.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "iron_cache"
  s.version = "1.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Travis Reeder"]
  s.date = "2014-02-06"
  s.description = "Ruby client for IronCache by www.iron.io"
  s.email = ["treeder@gmail.com"]
  s.homepage = "https://github.com/iron-io/iron_cache_ruby"
  s.required_ruby_version = Gem::Requirement.new(">= 1.8")
  s.rubygems_version = "2.2.2"
  s.summary = "Ruby client for IronCache by www.iron.io"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<iron_core>, [">= 0.5.1"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<memcache-client>, [">= 0"])
      s.add_development_dependency(%q<uber_config>, [">= 0"])
    else
      s.add_dependency(%q<iron_core>, [">= 0.5.1"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<memcache-client>, [">= 0"])
      s.add_dependency(%q<uber_config>, [">= 0"])
    end
  else
    s.add_dependency(%q<iron_core>, [">= 0.5.1"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<memcache-client>, [">= 0"])
    s.add_dependency(%q<uber_config>, [">= 0"])
  end
end
