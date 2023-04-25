# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanReslibI18n < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		super
	end

	helpers do
		def l(...)
			::I18n.l(...)
		end
	
		def t(...)
			::I18n.t(...)
		end
	end
end
