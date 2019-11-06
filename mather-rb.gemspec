lib = File.expand_path('src', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'mather-rb'
  spec.version = '1.0.0'
  spec.authors = ['Felix Pojtinger']
  spec.email = %w[felix@pojtinger.com]

  spec.summary =
    'A simple math gRPC microservice, for the purpose of learning and evaluating Ruby and gRPC.'
  spec.homepage = 'https://pojntfx.github.io/mather-rb/'
  spec.license = 'AGPL-3.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/pojntfx/mather-rb'

  spec.files =
    Dir.chdir(File.expand_path('..', __FILE__)) do
      `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
      end
    end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[src]

  spec.add_dependency 'grpc'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
