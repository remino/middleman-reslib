require "nokogiri"

class MiddlemanReslib
  class DashedDialogClassifier
    def initialize(app, options = {})
      @app = app
      @class_name = options.fetch(:class_name, "dashed-dialog")
      @selector = options.fetch(:selector, "p")
    end

    def call(env)
      status, headers, response = @app.call(env)

      if headers["Content-Type"]&.include?("text/html")
        response_body = response.join("")
        modified_body = convert_html(response_body)
        response = [modified_body]
        headers["Content-Length"] = modified_body.bytesize.to_s
      end

      [status, headers, response]
    end

    private

    def convert_html(html)
      doc = Nokogiri::HTML.parse(html)

      doc.css(@selector).each do |paragraph|
        next unless dashed_dialog_paragraph?(paragraph)

        classes = paragraph["class"].to_s.split(/\s+/)
        classes << @class_name unless classes.include?(@class_name)
        paragraph["class"] = classes.join(" ")
      end

      doc.to_html
    end

    def dashed_dialog_paragraph?(paragraph)
      text = Nokogiri::HTML.fragment(paragraph.inner_html).text.gsub(/\s+/, " ").strip
      text.start_with?("—")
    end
  end
end
