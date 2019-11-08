require 'rubygems'
require 'ptools'
require 'os'
require 'open-uri'
require 'zlib'

PROTO_DIR = File.join('src', 'svc', 'proto')
PROTO_FILE = 'mather.proto'
PROTO_OUTPUT_FILES = Dir.glob(File.join('src', 'svc', 'proto', '*pb.*'))
BUILD_DIR = '.build'
BIN_DIR = '.bin'
GEMSPEC_FILE = 'mather-rb.gemspec'
GEMFILE = 'Gemfile'
RUBYGEMS_ORG = 'https://rubygems.org'
EXE_DIR = 'exe'
SRC_DIRS = [EXE_DIR, 'src']
GEMFILE_LOCK = 'Gemfile.lock'
EXE_FILE = 'mather-rb-server'
VENDOR_DIR = 'vendor/bundle'
RUBYC_DIR = '/tmp/rubyc'
INSTALL_LOCATION = File.join('/usr', 'local', 'bin', EXE_FILE)

task default: %w[protoc_build]

task :rubyc_install_dependencies, %i[platform architecture] do |tasks, args|
  sh 'yum install -y squashfs-tools' if File.which('yum')
  sh 'apt-get install -y squashfs-tools' if File.which('apt')
  sh 'brew install squashfs-tools' if File.which('brew')

  if (OS.linux?)
    download =
      if OS.linux?
        open(
          'https://github.com/kontena/ruby-packer/releases/download/2.6.0-0.6.0/rubyc-2.6.0-0.6.0-linux-amd64.gz'
        )
      else
        OS.mac &&
          open(
            'https://github.com/kontena/ruby-packer/releases/download/2.6.0-0.6.0/rubyc-2.6.0-0.6.0-osx-amd64.gz'
          )
      end
    gz = Zlib::GzipReader.new(download)
    TARGET_FILE =
      File.join(
        '/usr',
        'local',
        'bin',
        "rubyc-#{args[:platform]}-#{args[:architecture]}"
      )
    IO.copy_stream(gz, TARGET_FILE)
    FileUtils.chmod('+x', TARGET_FILE)
  end
end

task :protoc_build do
  Dir.chdir(PROTO_DIR) do
    sh "grpc_tools_ruby_protoc --ruby_out=. --grpc_out=. #{PROTO_FILE}"
  end
end

task :rubyc_build_binary, %i[platform architecture] do |tasks, args|
  TARGET_FILE = "#{EXE_FILE}-#{args[:platform]}-#{args[:architecture]}"
  FileUtils.mkdir_p(BUILD_DIR)
  FileUtils.mkdir_p(BIN_DIR)

  specification = Gem::Specification.load(GEMSPEC_FILE)
  dependencies =
    specification.dependencies.map do |dependency|
      {
        name: dependency.name,
        version: dependency.requirement.requirements[0][1].version
      }
    end

  if File.exist?(File.join(BUILD_DIR, VENDOR_DIR))
    FileUtils.rm_rf(File.join(BUILD_DIR, VENDOR_DIR))
  end
  SRC_DIRS.each do |f|
    if File.exist?(File.join(BUILD_DIR, f))
      FileUtils.rm_rf(File.join(BUILD_DIR, f))
    end
    FileUtils.cp_r(f, BUILD_DIR)
  end
  if File.exist?(File.join(BUILD_DIR, GEMFILE_LOCK))
    File.delete(File.join(BUILD_DIR, GEMFILE_LOCK))
  end

  File.write(
    File.join(BUILD_DIR, GEMFILE),
    dependencies.reduce("source \"#{RUBYGEMS_ORG}\"\n\n") do |sum, element|
      sum + "gem '#{element[:name]}', '~> #{element[:version]}'\n"
    end
  )

  Dir.chdir(BUILD_DIR) do
    sh "bundle install --path #{VENDOR_DIR}"

    lock_file = File.read(GEMFILE_LOCK)

    lock_file_without_bundled_with =
      lock_file.split(")\n\nBUNDLED WITH")[0] + ')'

    File.write(GEMFILE_LOCK, lock_file_without_bundled_with)

    sh "#{
         File.join(
           '/usr',
           'local',
           'bin',
           "rubyc-#{args[:platform]}-#{args[:architecture]}"
         )
       } -o #{File.join('..', BIN_DIR, TARGET_FILE)} #{
         File.join(EXE_DIR, EXE_FILE)
       }"
  end
end

task :rubyc_install_binary, %i[platform architecture] do |tasks, args|
  TARGET_FILE = "#{EXE_FILE}-#{args[:platform]}-#{args[:architecture]}"
  FileUtils.chmod('+x', File.join(BIN_DIR, TARGET_FILE))

  FileUtils.copy_file(File.join(BIN_DIR, TARGET_FILE), INSTALL_LOCATION)
end

task :clean do
  FileUtils.rm_rf(BIN_DIR) if File.exists?(BIN_DIR)
  FileUtils.rm_rf(BUILD_DIR) if File.exist?(BUILD_DIR)
  FileUtils.rm_rf(RUBYC_DIR) if File.exist?(RUBYC_DIR)
  PROTO_OUTPUT_FILES.each { |file| File.delete(file) if File.exists?(file) }
end

task :run do
  ruby File.join(EXE_DIR, "#{EXE_FILE} start")
end
