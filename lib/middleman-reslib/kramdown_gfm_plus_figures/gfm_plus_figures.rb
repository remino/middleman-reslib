require 'kramdown'
require 'kramdown-parser-gfm'

module ::Kramdown
	module Parser
		class GFMPlusFigures < GFM
			FIGURE_BLOCK_RE = %r{\*\*\!\[(.*?)\]\(([^ ]+)\s*(?:\"([^\"]+)\")?\s*(?:\[([^\]]+)\])?\)\*\*}

			def initialize(source, options)
				super
				@span_parsers.insert(0, :figure_block)
			end

			def parse_figure_block
				if @src.scan(FIGURE_BLOCK_RE)
					alt = @src[1]
					file_path = @src[2]
					title = @src[3] || alt
					href = @src[4]

					# Create figure element with image
					figure = Element.new(:html_element, 'figure', {})
					img = Element.new(:html_element, 'img', { 'src' => file_path, 'alt' => alt })

					if href
						link = Element.new(:html_element, 'a', { 'href' => href })
						link.children << img
						figure.children << link
					else
						figure.children << img
					end

					# Add caption if title is present
					if title
						caption = Element.new(:html_element, 'figcaption', {})
						caption.children << Element.new(:text, title)
						figure.children << caption
					end

					@tree.children << figure
				else
					add_text(@src.matched)
				end
			end

			define_parser(:figure_block, FIGURE_BLOCK_RE, 'parse_figure_block')
		end
	end
end
