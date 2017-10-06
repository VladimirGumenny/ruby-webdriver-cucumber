require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rake/testtask'

Cucumber::Rake::Task.new(:default) do |t|
  t.profile = "default"
  t.cucumber_opts = ["--tags", "#{ENV["tag"]}"]
end