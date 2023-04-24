require "middleman-core"

Middleman::Extensions.register :reslib_date do
  require "middleman-reslib/date/extension"
  MiddlemanReslibDate
end
