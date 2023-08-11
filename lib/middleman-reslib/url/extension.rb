# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanReslibUrl < ::Middleman::Extension
	option :base_url, nil, 'Set base URL of the site'

	def initialize(app, options_hash={}, &block)
		super

		unless options.base_url
			raise "The base_url option is required for the middleman-reslib-url extension."
		end
	end

	helpers do
		def absolute_url(path = nil)
			path ||= current_page.url
			return path if path =~ %r{^([a-zA-Z0-9\-_]+\:)?//}
			File.join(*[app.data.site.url, path].compact)
		end
	end
end
