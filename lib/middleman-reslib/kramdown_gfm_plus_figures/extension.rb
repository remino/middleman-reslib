# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanReslibKramdownGFMPlusFigures < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		require 'middleman-reslib/kramdown_gfm_plus_figures/gfm_plus_figures'

		super
	end
end
