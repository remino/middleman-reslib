require "kramdown"

class ::Kramdown::Converter::Html
  def element_is_empty_text?(el)
    el && el.type == :text && el.value.strip.empty?
  end

  def element_is_image_or_linked_image?(el)
    el && (el.type == :img || (el.type == :a && el.children.first.type == :img))
  end

  def starts_with_image?(el)
    element_is_image_or_linked_image?(el.children.first)
  end

  def convert_p(el, indent)
    if el.options[:transparent]
      inner(el, indent)
    else
      tag = starts_with_image?(el) ? "figure" : "p"

      if tag == "figure"
        html_images = []

        while element_is_image_or_linked_image?(el.children.first) || element_is_empty_text?(el.children.first)
          case true
          when element_is_image_or_linked_image?(el.children.first)
            html_images << convert(el.children.shift)
          when element_is_empty_text?(el.children.first)
            el.children.shift
          end
        end

        html_figcaption = el.children.map { |c| convert c }.join
        inner_html = html_images.join("")
        inner_html << "<figcaption>#{html_figcaption}</figcaption>" if html_figcaption.length > 0
        format_as_block_html(tag, el.attr, inner_html, indent)
      else
        format_as_block_html(tag, el.attr, inner(el, indent), indent)
      end
    end
  end
end
