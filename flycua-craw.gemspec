# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "flycua/craw/version"

Gem::Specification.new do |spec|
  spec.name          = "flycua-craw"
  spec.version       = Flycua::Craw::VERSION
  spec.authors       = ["parsons"]
  spec.email         = ["parsons@139.com"]

  spec.summary       = %q{a application which can craw the flycua}
  spec.description   = %q{a application which can craw the flycua}
  spec.homepage      = "https://github.com/parsonssss?tab=repositories"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "require_all"
  spec.add_development_dependency "http"
  spec.add_development_dependency "json"
  spec.add_development_dependency "sendgrid-ruby"
  spec.add_development_dependency "whenever"



end
