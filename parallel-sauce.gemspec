lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parallel/sauce/version'

Gem::Specification.new do |spec|
  spec.name          = 'parallel-sauce'
  spec.version       = Parallel::Sauce::VERSION
  spec.authors       = ['Slavko Krucaj']
  spec.email         = ['slavko.krucaj@gmail.com']

  spec.summary       = 'Ruby gem to parallelize running xcuitest on sauce labs'
  spec.homepage      = 'https://github.com/SlavkoKrucaj/parallel-sauce'
  spec.license       = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'parallel', '~> 1.17'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
