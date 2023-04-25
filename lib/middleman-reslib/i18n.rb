require "middleman-core"

Middleman::Extensions.register :reslib_i18n do
  require "middleman-reslib/i18n/extension"
  MiddlemanReslibI18n
end
