require 'middleman-core'
require 'middleman-reslib/image_sizes/lib'

class MiddlemanReslibLazyloadImages < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		super
	end

	helpers do
		def get_image_size(res)
			return {} unless res
			::MiddlemanReslib::ImageSizes::Lib.get_size_attrs_from_file(res.source_file)
		end

		def get_aspect_ratio_from_size(width, height)
			::MiddlemanReslib::ImageSizes::Lib.get_style_attr_aspect_ratio_from_size(width, height)
		end
	
		def image_tag(path, params = {})
			if !params.has_key?(:width) && !params.has_key?(:height) &&
				!path.include?('://')
				params.merge! get_image_size(sitemap.find_resource_by_destination_path url_for path)

				lazy_params = params.dup
				lazy_params[:class] = "#{lazy_params[:class]} lazyload".strip
				lazy_params[:data] = (lazy_params[:data] || {}).merge({ src: image_path(path) })
				lazy_params[:src] = 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'
				lazy_params.merge! get_aspect_ratio_from_size(params[:width], params[:height])
	
				return "<template class=lazyload>#{super(path, lazy_params)}</template><noscript>#{super(path, params)}</noscript>"
			end
	
			super(path, params)
		end
	end
end
