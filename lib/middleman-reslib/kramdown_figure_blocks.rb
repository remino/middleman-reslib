require 'kramdown'

class ::Kramdown::Converter::Html
	def convert_p(el, indent)
		if el.options[:transparent]
			inner(el, indent)
		else
			tag = el.children.find { |c| c.type != :img && c.value.strip != '' } ? 'p' : 'figure'
			format_as_block_html(tag, el.attr, inner(el, indent), indent)
		end
	end
end
