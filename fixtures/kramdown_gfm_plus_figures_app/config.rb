require "#{PROJECT_ROOT_PATH}/lib/middleman-reslib/kramdown_gfm_plus_figures"

activate :reslib_kramdown_gfm_plus_figures

set :images_dir, '.'
set :markdown,
	fenced_code_blocks: true,
	smartypants: true,
	input: ::Kramdown::Parser::GFMPlusFigures
