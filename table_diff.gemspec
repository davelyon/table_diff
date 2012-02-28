# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "table_diff/version"

Gem::Specification.new do |s|
  s.name        = "table_diff"
  s.version     = TableDiff::VERSION
  s.authors     = ["Dave Lyon"]
  s.email       = ["dave@davelyon.net"]
  s.homepage    = "https://github.com/davelyon/table_diff"
  s.summary     = %q{Table Difference library for use in testing}
  s.description = %q{A simple library for use in testing to compare an actual and expected table. Compatible with Cucumber, Rspec, and Turnip}

  s.executables   = []
  s.files         = Dir['lib/*'] + %w(README.md)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "turnip"

  s.add_runtime_dependency "diff-lcs"
end
