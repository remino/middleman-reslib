require "nokogiri"

class MiddlemanReslib
  class BackToTopNavConverter
    def initialize(app, options = {})
      @app = app
      @class_name = options.fetch(:class_name, "back-to-top-nav")
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

      doc.css('p > a[href="#"]').each do |node|
        new_node = Nokogiri::XML::Node.new("nav", doc)
        new_node.inner_html = node.parent.inner_html
        new_node["class"] = @class_name if @class_name
        node.parent.replace(new_node)
      end

      doc.to_html
    end
  end
end
