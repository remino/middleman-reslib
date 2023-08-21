# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanReslibKramdownFigureBlocks < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		require 'middleman-reslib/kramdown_figure_blocks/override'

		super
	end
end
