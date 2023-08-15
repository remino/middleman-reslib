require "middleman-core"

Middleman::Extensions.register :reslib_image_sizes do
  require "middleman-reslib/image_sizes/extension"
  MiddlemanReslibImageSizes
end
