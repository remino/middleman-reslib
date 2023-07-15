# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanReslibTitle < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		super
	end

	helpers do
		def site_title
			t 'title.site'
		end

		def title
			return site_title unless current_page.data.title
			t 'title.page', page: current_page.data.title, site: site_title
		end
	end
end
