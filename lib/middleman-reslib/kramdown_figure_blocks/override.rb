require "kramdown"

class ::Kramdown::Converter::Html
  def starts_with_image?(el)
    el.children.first.type == :img ||
      (el.children.first.type == :a && el.children.first.children.first.type == :img)
  end

  def convert_p(el, indent)
    if el.options[:transparent]
      inner(el, indent)
    else
      tag = starts_with_image?(el) ? "figure" : "p"

      if tag == "figure"
        html_images = []

        while el.children.first.type == :img || (el.children.first.type == :a && el.children.first.children.first.type == :img)
          html_images << convert(el.children.first)
          el.children.shift
        end

        html_figcaption = el.children.map { |c| convert c }.join
        inner_html = "#{html_images.join("")}<figcaption>#{html_figcaption}</figcaption>"
        format_as_block_html(tag, el.attr, inner_html, indent)
      else
        format_as_block_html(tag, el.attr, inner(el, indent), indent)
      end
    end
  end
end
