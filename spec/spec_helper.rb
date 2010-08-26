require 'rubygems'
require 'bundler/setup'
require 'rspec'

$: << File.expand_path('../lib', File.dirname(__FILE__))

require 'resque-remote'