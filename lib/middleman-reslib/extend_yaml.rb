# Require core library
require 'middleman-core'
require 'yaml'

# Override Middleman's default YAML parser to specify permitted classes.
# Tried to override YAML directly, but it's a C extension and can't be monkey-patched.
module ::Middleman::Util::Data
	class << self
		def parse_yaml(content, full_path)
			c = begin
				::Middleman::Util.instrument 'parse.yaml' do
					::YAML.load(content, permitted_classes: [Date, Symbol, Time])
				end
			rescue ::StandardError, ::Psych::SyntaxError => error
				warn "YAML Exception parsing #{full_path}: #{error.message}"
				{}
			end

			c ? symbolize_recursive(c) : {}
		end
	end
end
