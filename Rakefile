require "bundler"
Bundler::GemHelper.install_tasks

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

task :default => :console

task :environment do
  require './spec/spec_helper'
end

desc 'Opens a Pry/IRB session with the environment loaded'
task :console => :environment do
  #gotcha!
  binding.pry
end
