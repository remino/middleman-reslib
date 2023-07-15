require 'fastimage'
require 'middleman-core'

class MiddlemanReslibLazyloadImages < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		super
	end

	helpers do
		def get_image_size(res)
			return {} unless res
	
			full_path = res.source_file
	
			if File.exists?(full_path)
				begin
					width, height = ::FastImage.size full_path, raise_on_failure: true
					{ height: height, width: width }
				rescue ::FastImage::UnknownImageType
					# No message, it's just not supported
					{}
				rescue
					warn "Couldn't determine dimensions for image #{path}: #{$!.message}"
				end
			end
		end
	
		def image_tag(path, params = {})
			if !params.has_key?(:width) && !params.has_key?(:height) &&
				!path.include?('://')
				params.merge! get_image_size(sitemap.find_resource_by_destination_path url_for path)
	
				lazy_params = params.dup
				lazy_params[:class] = "#{lazy_params[:class]} lazyload".strip
				lazy_params[:data] = (lazy_params[:data] || {}).merge({ src: path })
				lazy_params[:src] = 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'
				lazy_params[:style] = "aspect-ratio: #{lazy_params[:width]} / #{lazy_params[:height]};"
	
				return "<template class='lazyload'>#{super(path, lazy_params)}</template><noscript>#{super(path, params)}</noscript>"
			end
	
			super(path, params)
		end
	end
end
