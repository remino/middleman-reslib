require "middleman-core"

Middleman::Extensions.register :reslib_external_link_popup do
  require "middleman-reslib/external_link_popup/extension"
  MiddlemanReslibExternalLinkPopup
end
