# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
	# Formerly remino-reslib, part of @remino/reslib JS package
	s.name        = "middleman-remino"
	s.version     = "0.2.0"
	s.platform    = Gem::Platform::RUBY
	s.authors     = ["Rémino Rem"]
	s.homepage    = "https://remino.net"
	s.summary     = %q{Collection of Middleman plugins for Rémino sites}

	s.files         = `git ls-files -- lib/*`.split("\n")
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.require_paths = ["lib"]

	# The version of middleman-core your extension depends on
	s.add_runtime_dependency("middleman-core", [">= 4.4.2"])

	# Additional dependencies
	# s.add_runtime_dependency("gem-name", "gem-version")
end
