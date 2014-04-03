# -*- encoding: utf-8 -*-
require File.expand_path('../lib/resque-remote/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'resque-remote'
  s.version     = Resque::Plugins::Remote::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'WTFPL'
  s.authors     = ['BJ Neilsen']
  s.email       = ['bj.neilsen@gmail.com']
  s.homepage    = 'http://github.com/localshred/resque-remote'
  s.summary     = 'Resque plugin to allow remote job droppability compatible with Resque 1.x'
  s.description = %Q{
Compatible with Resque 1.x. Use Resque.push if you are using >= 2.x.

Resque is great. So is job processing with redis. Our biggest drawback has been that
resque requires the class that will be processing a job to be loaded when the job
is enqueued. But what happens when the implementing job is defined in a separate application
and isn't currently loaded into memory?

Enter Resque Remote.

Resque Remote's simple goal is to allow you to add a job to a queue with a string
identifier for the class rather than the class constant. It is assumed that the worker-side of
the equation _will_ have the class in memory and hence will be able to run it no problem.

Feedback, comments and questions are welcome at bj [dot] neilsen [at] gmail [dot] com.
}

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'resque-remote'

  s.add_dependency 'resque', '< 2.0'

  s.add_development_dependency 'bundler', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 2.8'

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
