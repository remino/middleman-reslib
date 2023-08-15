require 'kramdown'

class ::Kramdown::Converter::Html
	def convert_p(el, indent)
		if el.options[:transparent]
			inner(el, indent)
		else
			tag = el.children.size == 1 && el.children.first.type == :img ? 'figure' : 'p'
			format_as_block_html(tag, el.attr, inner(el, indent), indent)
		end
	end
end
