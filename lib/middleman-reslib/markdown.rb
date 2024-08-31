require "middleman-core"

Middleman::Extensions.register :reslib_markdown do
  require "middleman-reslib/markdown/extension"
  MiddlemanReslibMarkdown
end
