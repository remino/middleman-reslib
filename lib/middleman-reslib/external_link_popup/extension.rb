# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanReslibExternalLinkPopup < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		super
	end

	helpers do
		def link_to(*args, &block)
			url_arg_index = block_given? ? 0 : 1
			options_index = block_given? ? 1 : 2
	
			url = args[url_arg_index]
			options = args[options_index] || {}
	
			if !options[:target] && url =~ %r{^([a-zA-Z0-9]+:)?//}
				options[:target] = '_blank'
			end
	
			args[url_arg_index] = url
			args[options_index] = options
	
			super(*args, &block)
		end
	end
end
