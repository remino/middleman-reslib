require 'kramdown'

class ::Kramdown::Converter::Html
	def starts_with_image?(el)
		el.children.first.type == :img ||
			(el.children.first.type == :a && el.children.first.children.first.type == :img)
	end

	def convert_p(el, indent)
		if el.options[:transparent]
			inner(el, indent)
		else
			tag = starts_with_image?(el) ? 'figure' : 'p'

			if tag == 'figure'
				html_image = el.children.first
				html_figcaption = el.children.slice(1..-1).map { |c| convert c }.join
				inner_html = "#{convert(html_image)}<figcaption>#{html_figcaption}</figcaption>"
				format_as_block_html(tag, el.attr, inner_html, indent)
			else
				format_as_block_html(tag, el.attr, inner(el, indent), indent)
			end
		end
	end
end
