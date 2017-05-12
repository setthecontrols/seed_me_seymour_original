# coding: utf-8



lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
tasks = File.expand_path('../tasks', __FILE__)
$LOAD_PATH.unshift(tasks) unless $LOAD_PATH.include?(tasks)
require 'seed_me_seymour/version'

Gem::Specification.new do |spec|
  spec.name          = "seed_me_seymour"
  spec.version       = '0.1.22'
  spec.authors       = ["Tony S.", "Brandon G." ]
  spec.email         = ["saric.tony@gmail.com\n", "bmg.oak@gmail.com\n"]
  spec.licenses      = ['MIT']
  spec.summary       = %q{This gem will analyze your current database and make a seed file with pre-populated seed information using faker}
  spec.homepage      = "https://github.com/antoniosaric/seed_me_seymour"

  # Prevent pushing this gem to   RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "https://rubygems.org"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "tasks"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.6"


end
