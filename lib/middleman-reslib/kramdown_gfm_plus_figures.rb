require "middleman-core"

Middleman::Extensions.register :reslib_kramdown_gfm_plus_figures do
  require "middleman-reslib/kramdown_gfm_plus_figures/extension"
  MiddlemanReslibKramdownGFMPlusFigures
end
