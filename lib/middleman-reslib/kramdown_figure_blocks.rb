require "middleman-core"

Middleman::Extensions.register :reslib_kramdown_figure_blocks do
  require "middleman-reslib/kramdown_figure_blocks/extension"
  MiddlemanReslibKramdownFigureBlocks
end
