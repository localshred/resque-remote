require 'spec_helper'

describe Resque::Plugins::Remote do
	
	let(:queue_name) { :critical }
	
	before :each do
		Resque.remove_queue(queue_name)
	end
	
	it "should pass resque lint" do
	  lambda {
			Resque::Plugin.lint(Resque::Plugins::Remote)
		}.should_not raise_error
	end
	
	it "should respond to remote_enqueue" do
	  Resque.should respond_to :remote_enqueue
	end
	
	it "should respond to remote_dequeue" do
	  Resque.should respond_to :remote_dequeue
	end
	
	it "should be able to queue a job with a string as the class name" do
		lambda {
			Resque.remote_enqueue('MyJobClass', queue_name, :param1, :param2)
		}.should change{ Resque.size(queue_name) }.from(0).to(1)
	end
	
	it "should be able to pull a job off of a queue" do
		Resque.remote_enqueue('MyJobClass', queue_name, :param1, :param2)
		Resque.size(queue_name).should == 1
		
		lambda {
			Resque.remote_dequeue('MyJobClass', queue_name, :param1, :param2)
		}.should change{ Resque.size(queue_name) }.from(1).to(0)
	end
	
end