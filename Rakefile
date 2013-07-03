require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'

# Customize lint option
task :lint do
  PuppetLint.configuration.send("disable_80chars")
  PuppetLint.configuration.send("disable_class_parameter_defaults")
end

# Initialize vagrant instance for testing
task :vagrant do
  Rake::Task["spec_prep"].execute
  IO.popen('vagrant up --provider=vmware_fusion') do |io|
    io.each{ |line| print line }
  end
end

# Cleanup vagrant environment
task :vagrant_clean do
  `vagrant destroy`
  Rake::Task["spec_clean"].execute
end
