require 'bundler'
Bundler::GemHelper.install_tasks

require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber, 'Run features that should pass') do |t|
  t.cucumber_opts = ['--color', '--tags', '"not @wip"', '--strict']
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rake/clean'

task test: [:cucumber, :spec]

task default: :test
