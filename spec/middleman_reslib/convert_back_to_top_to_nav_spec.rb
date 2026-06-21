require "spec_helper"
require "middleman-reslib/convert_back_to_top_to_nav"

RSpec.describe MiddlemanReslib::ConvertBackToTopToNav do
  let(:app) { instance_double("app") }
  let(:middleware) { described_class.new(app) }

  it "wraps back-to-top links in nav elements" do
    html = '<html><body><p><a href="#">Back to top</a></p></body></html>'
    headers = { "Content-Type" => "text/html" }

    allow(app).to receive(:call).and_return([200, headers, [html]])

    status, returned_headers, response = middleware.call({})

    expect(status).to eq(200)
    expect(returned_headers["Content-Length"]).to eq(response.join.bytesize.to_s)
    expect(response.join).to include("<nav><a href=\"#\">Back to top</a></nav>")
  end
end
