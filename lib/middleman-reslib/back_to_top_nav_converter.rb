require "nokogiri"

class MiddlemanReslib
  class BackToTopNavConverter
    def initialize(app)
      @app = app
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
        node.parent.replace(new_node)
      end

      doc.to_html
    end
  end
end
