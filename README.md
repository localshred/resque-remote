> **Please note that Resque Remote depends on Resque versions < 1.18.0. resque-remote is not necessary in Resque >= 1.18 as `Resque.enqueue_at` became a standard
API method which does exactly what resque-remote aims to provide.**

Resque Remote is a plugin to allow remote job droppability. Try saying that 10 times fast.

Resque is great and so is queue-based job processing with redis. Resque Remote aims to provide you the ability to queue a job without having the processing class (e.g. the Job handler itself) loaded into memory. 

Resque Remote's simple goal is to allow you to add a job to a queue with a string identifier for the class rather than the class constant. It is assumed that the worker-side of the equation _will_ have the class in memory and hence will be able to run it no problem. If this isn't the case, the worker will explode in a fiery ball. Probably getting some on you as a result.

# Installation

**Note: You must have a version of Resque installed or added to your Gemfile for Resque Remote to work. Resque Version 0.10.0 has been tested to work with the current release of Resque Remote.**

Install the gem ad-hoc:

	$ gem install resque -v 0.10.0
	$ gem install resque-remote
	
Or, add it to your Bundler `Gemfile`:

	# Gemfile
	gem 'resque', '0.10.0'
	gem 'resque-remote'
	
And then run a `bundle install`.
	
Without Bundler, in your appropriate config location for your app:

	require 'resque'
	require 'resque-remote'
	
If you're using bundler, just setup your gemset normally.

# Usage

## (De)Queueing
To queue a job, tell resque to `remote_enqueue` your job by passing the string representation of your job's class name, the name of the queue to use, and whatever parameters are appropriate for the job.

	Resque.remote_enqueue('MyJobClass', :low_priority, param1, param2, ...)
	
To dequeue, call `remote_dequeue` instead:

	Resque.remote_dequeue('MyJobClass', :low_priority, param1, param2, ...)
	
## Worker processing

Resque Remotes purpose is to make remote job processing doable. Hence, your workers won't be running the same application code that actually queued the job for you in the first place. So, assuming I queued the jobs from above, your separate application should have an implementing class that your workers have access to.

Note that the queue this job belongs to isn't defined in our job class because it's metadata that Resque uses when it first queues the job, which we've already done. So, no `@queue = :low_priority` needed here.

	class MyJobClass
		# no queue needed
		
		def self.perform(param1, param2)
			# ... process the job herre
		end
	end

# Errata

Feedback, comments and questions are welcome at bj [dot] neilsen [at] gmail [dot] com.
