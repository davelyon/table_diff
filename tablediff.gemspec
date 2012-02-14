# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tablediff/version"

Gem::Specification.new do |s|
  s.name        = "tablediff"
  s.version     = Tablediff::VERSION
  s.authors     = ["Dave Lyon"]
  s.email       = ["dave@davelyon.net"]
  s.homepage    = ""
  s.summary     = %q{Table Difference library for use in testing}
  s.description = %q{TODO: Write a gem description}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
