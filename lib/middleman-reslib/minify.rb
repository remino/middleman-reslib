require "middleman-core"

Middleman::Extensions.register :reslib_minify do
  require "middleman-reslib/minify/extension"
  MiddlemanReslibMinify
end
