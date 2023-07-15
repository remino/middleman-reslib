require "middleman-core"

Middleman::Extensions.register :reslib_title do
  require "middleman-reslib/title/extension"
  MiddlemanReslibTitle
end
