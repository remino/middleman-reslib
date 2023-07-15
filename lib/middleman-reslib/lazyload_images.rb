require "middleman-core"

Middleman::Extensions.register :reslib_lazyload_images do
  require "middleman-reslib/lazyload_images/extension"
  MiddlemanReslibLazyloadImages
end
