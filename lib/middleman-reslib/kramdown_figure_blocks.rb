require 'kramdown'

class ::Kramdown::Converter::Html
	def has_non_images?(el)
		el.children.find do |c|
			return has_non_images?(c) if c.type == :a
			c.type != :img && c.value&.strip != ''
		end
	end

	def has_only_images?(el)
		!has_non_images?(el)
	end

	def convert_p(el, indent)
		if el.options[:transparent]
			inner(el, indent)
		else
			tag = has_only_images?(el) ? 'figure' : 'p'
			format_as_block_html(tag, el.attr, inner(el, indent), indent)
		end
	end
end
