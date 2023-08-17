# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanReslibMinify < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		require_relative 'rack'

		app.use ::MiddlemanReslib::Minify::Rack

		super
	end
end
