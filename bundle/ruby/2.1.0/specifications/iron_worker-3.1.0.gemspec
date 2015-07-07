# -*- encoding: utf-8 -*-
# stub: iron_worker 3.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "iron_worker"
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Travis Reeder"]
  s.date = "2015-05-12"
  s.description = "The official IronWorker gem for IronWorker by Iron.io. http://iron.io"
  s.email = ["travis@iron.io"]
  s.homepage = "https://github.com/iron-io/iron_worker_ruby"
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.2.2"
  s.summary = "The official IronWorker gem for IronWorker by Iron.io. http://iron.io"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<iron_core>, [">= 0.5.1"])
      s.add_runtime_dependency(%q<rest>, [">= 3.0.6"])
    else
      s.add_dependency(%q<iron_core>, [">= 0.5.1"])
      s.add_dependency(%q<rest>, [">= 3.0.6"])
    end
  else
    s.add_dependency(%q<iron_core>, [">= 0.5.1"])
    s.add_dependency(%q<rest>, [">= 3.0.6"])
  end
end
