require 'rake'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'

# Active Record Rake Tasks
namespace :db do
  task :load_config do
    require "./app"
  end
end

# RSpec Tests
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation'
end

# Default to RSPEC tests
task :default => :test