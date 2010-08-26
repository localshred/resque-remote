module Resque
	module Plugins
		module Remote
			
			class << self
				def remote_enqueue(klass, queue, *args)
					Resque::Job.create(queue.to_sym, klass, *args)
				end
				
				def remote_dequeue(klass, queue, *args)
					Resque::Job.destroy(queue.to_sym, klass, *args)
				end
			end
			
		end
	end
end
