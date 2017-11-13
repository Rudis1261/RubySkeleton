require 'rake/testtask'
require "sinatra/activerecord/rake"

Rake::TestTask.new do |t|
  t.libs << "tests"
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end

namespace :db do
  task :load_config do
    require "./app"
  end
end