require 'bundler/gem_tasks'
require 'fileutils'

task default: %w[build_protoc]

task :build_protoc do
  Dir.chdir(File.join('src', 'svc', 'proto')) do
    sh 'grpc_tools_ruby_protoc --ruby_out=. --grpc_out=. mather.proto'
  end
end

task :build_binary, %i[platform architecture] do |tasks, args|
  target_file = "mather-rb-server-#{args[:platform]}-#{args[:architecture]}"
  FileUtils.mkdir_p('.bin')
  sh "rubyc -o #{File.join('.bin', target_file)} --clean-tmpdir #{
       File.join('exe', 'mather-rb-server')
     }"
end

task :install_binary, %i[platform architecture] do |tasks, args|
  target_file = "mather-rb-server-#{args[:platform]}-#{args[:architecture]}"
  FileUtils.chmod('+x', File.join('.bin', target_file))

  FileUtils.copy_file(
    File.join('.bin', target_file),
    File.join('/', 'usr', 'local', 'bin', 'mather-rb-server')
  )
end

task :clean do
  FileUtils.rm_rf('.bin')
  Dir.glob(File.join('src', 'svc', 'proto', '*pb.*')).each do |file|
    File.delete(file)
  end
end

task :run do
  ruby File.join('exe', 'mather-rb-server')
end
