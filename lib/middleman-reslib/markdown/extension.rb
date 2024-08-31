# Require core library
require 'middleman-core'
require 'nokogiri'

# Extension namespace
class MiddlemanReslibMarkdown < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		super
	end

	helpers do
		def get_first_element_html(html)
			Nokogiri::HTML.fragment(html).css('*').first&.inner_html
		end
	
		def render_inline_markdown(source)
			get_first_element_html render_markdown source
		end
	
		def render_markdown(source)
			Tilt['markdown'].new(config.markdown) { source.to_s }.render self
		end
	end
end
