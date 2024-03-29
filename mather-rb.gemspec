Gem::Specification.new do |spec|
  spec.name = 'mather-rb'
  spec.version = '0.0.7'
  spec.authors = ['Felicitas Pojtinger']
  spec.email = %w[felicitas@pojtinger.com]

  spec.summary = 'Simple Ruby gRPC microservice that does math.'
  spec.homepage = 'https://pojntfx.github.io/mather-rb/'
  spec.license = 'AGPL-3.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/pojntfx/mather-rb'

  spec.files =
    Dir.glob('{src,cmd}/**/*', File::FNM_DOTMATCH).reject do |f|
      File.directory?(f)
    end
  spec.bindir = File.join('cmd', 'mather-rb-server')
  spec.executables = spec.files.grep(%r{^cmd/}) { |f| File.basename(f) }
  spec.require_paths = %w[src]

  spec.add_dependency 'grpc', '~> 1.25'
  spec.add_dependency 'commander', '~> 4.4'
  spec.add_dependency 'bundler', '~> 2.0'
  spec.add_dependency 'ougai', '~> 1.8'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rerun', '~> 0.13.0'
  spec.add_development_dependency 'grpc-tools', '~> 1.25'
  spec.add_development_dependency 'ptools', '~> 1.3'
  spec.add_development_dependency 'os', '~> 1.0'
  spec.add_development_dependency 'minitest', '~> 5.13'
end
