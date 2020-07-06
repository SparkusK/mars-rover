# frozen_string_literal: true

require_relative 'lib/mars_rover/version'

Gem::Specification.new do |spec|
  spec.name          = 'mars_rover'
  spec.version       = MarsRover::VERSION
  spec.authors       = ['Shane Kelly']
  spec.email         = ['shane.sparky.kelly@gmail.com']

  spec.summary     = 'Implementation of the Mars Rover technical challenge.'
  spec.description = 'Make a bunch of robots scout a plateau.'
  spec.homepage    = 'https://github.com/SparkusK/mars-rover'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/SparkusK/mars-rover'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faker'

  spec.add_development_dependency 'awesome_print',       '~> 1.8'
  spec.add_development_dependency 'pry',                 '~> 0.12.2'
  spec.add_development_dependency 'rubocop',             '~> 0.77'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5', '>= 1.5.1'
  spec.add_development_dependency 'rubocop-rspec',       '~> 1.37'
end
