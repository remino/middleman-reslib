require "#{PROJECT_ROOT_PATH}/lib/middleman-reslib/kramdown_figure_blocks"

activate :reslib_kramdown_figure_blocks

set :images_dir, '.'
set :markdown, fenced_code_blocks: true, smartypants: true
