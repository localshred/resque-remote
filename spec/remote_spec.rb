require 'spec_helper'
require 'resque'

describe Resque::Plugins::Remote do
	
	it "should pass resque lint" do
	  lambda {
			Resque::Plugin.lint(Resque::Plugins::Remote)
		}.should_not raise_error
	end
	
	it "should respond to remote_enqueue" do
	  Resque::Plugins::Remote.should respond_to :remote_enqueue
	end
	
end