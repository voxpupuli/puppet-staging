require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

task :default do
  sh %{rake -T}
end

task :test  => [:spec]
task :tests => [:spec]
task :specs => [:spec]

desc "Run all rspec-puppet tests"
RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = ['--color']
end

desc "Build puppet module package"
task :build do
  system("puppet-module build")
end
