require "middleman-core"

Middleman::Extensions.register :reslib_url do
  require "middleman-reslib/url/extension"
  MiddlemanReslibUrl
end
