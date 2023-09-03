require 'middleman-core'
require 'middleman-reslib/image_sizes/lib'

class MiddlemanReslibImageSizes < ::Middleman::Extension
	def initialize(app, options_hash={}, &block)
		super
	end

	helpers do
		def get_image_size(res)
			return {} unless res
			::MiddlemanReslib::ImageSizes::Lib.get_size_attrs_from_file(res.source_file)
		end
	
		def image_tag(path, params = {})
			if !params.has_key?(:width) && !params.has_key?(:height) &&
				!path.include?('://')
				params.merge! get_image_size(sitemap.find_resource_by_destination_path url_for path.gsub(/#.*$/, ''))
			end
	
			super(path, params)
		end
	end
end
