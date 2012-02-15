require 'puppet'
require 'rspec-puppet'

def param_value(subject, type, title, param)
  subject.resource(type, title).send(:parameters)[param.to_sym]
end

RSpec.configure do |c|
  c.module_path = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures/modules'))
  # Using an empty site.pp file to avoid: https://github.com/rodjek/rspec-puppet/issues/15
  c.manifest_dir = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures/manifests'))
end

#desc "Run specs check on puppet manifests"
#RSpec::Core::RakeTask.new(:spec) do |t|
#  #   t.pattern = './demo-puppet/modules/**/*_spec.rb' # don't need this, it's default
#  t.verbose = true
#  t.rspec_opts = "--format documentation --color"
#end
