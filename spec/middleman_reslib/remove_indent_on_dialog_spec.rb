require "spec_helper"
require "middleman-reslib/remove_indent_on_dialog"

RSpec.describe MiddlemanReslib::RemoveIndentOnDialog do
  let(:app) { instance_double("app") }
  let(:middleware) { described_class.new(app) }

  it "adds no-indent to paragraphs with two em-dash dialogue lines" do
    html = <<~HTML
      <html><body><article><p>— First line<br>— Second line</p></article></body></html>
    HTML
    headers = { "Content-Type" => "text/html" }

    allow(app).to receive(:call).and_return([200, headers, [html]])

    status, returned_headers, response = middleware.call({})

    expect(status).to eq(200)
    expect(returned_headers["Content-Length"]).to eq(response.join.bytesize.to_s)
    expect(response.join).to include('<p class="no-indent">')
  end

  it "uses a custom class name when provided" do
    html = <<~HTML
      <html><body><article><p>— First line<br>— Second line</p></article></body></html>
    HTML
    headers = { "Content-Type" => "text/html" }

    middleware = described_class.new(app, class_name: "dialogue")
    allow(app).to receive(:call).and_return([200, headers, [html]])

    _status, _returned_headers, response = middleware.call({})

    expect(response.join).to include('<p class="dialogue">')
  end
end
