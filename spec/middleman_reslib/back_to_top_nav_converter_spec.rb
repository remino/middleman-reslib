require "spec_helper"
require "middleman-reslib/back_to_top_nav_converter"

RSpec.describe MiddlemanReslib::BackToTopNavConverter do
  let(:app) { instance_double("app") }
  let(:middleware) { described_class.new(app) }

  it "wraps back-to-top links in nav elements" do
    html = '<html><body><p><a href="#">Back to top</a></p></body></html>'
    headers = { "Content-Type" => "text/html" }

    allow(app).to receive(:call).and_return([200, headers, [html]])

    status, returned_headers, response = middleware.call({})

    expect(status).to eq(200)
    expect(returned_headers["Content-Length"]).to eq(response.join.bytesize.to_s)
    expect(response.join).to include('<nav class="back-to-top-nav"><a href="#">Back to top</a></nav>')
  end

  it "omits the class when nil is provided" do
    html = '<html><body><p><a href="#">Back to top</a></p></body></html>'
    headers = { "Content-Type" => "text/html" }

    middleware = described_class.new(app, class_name: nil)
    allow(app).to receive(:call).and_return([200, headers, [html]])

    _status, _returned_headers, response = middleware.call({})

    expect(response.join).to include('<nav><a href="#">Back to top</a></nav>')
    expect(response.join).not_to include('back-to-top-nav')
  end
end
