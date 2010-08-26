module Resque
	module Plugins
		module Remote
			
			def remote_enqueue(klass, queue, *args)
				Resque::Job.create(queue.to_sym, klass, *args)
			end
			
			def remote_dequeue(klass, queue, *args)
				Resque::Job.destroy(queue.to_sym, klass, *args)
			end
		end
	end
	
	# Pull the remote methods into the Resque module
	extend Plugins::Remote
end
