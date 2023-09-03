require 'fastimage'

class MiddlemanReslib
	module ImageSizes
		module Lib
			class << self
				def get_aspect_ratio_from_size(width, height)
					raise "Width and height must be specified" unless width && height

					ratio = Rational(width, height)
					ratio_width = ratio.numerator
					ratio_height = ratio.denominator

					[ ratio_width, ratio_height ]
				end

				def get_image_size_from_file(full_path)
					raise "File #{full_path} doesn't exist" unless File.exists?(full_path)
					width, height = ::FastImage.size full_path, raise_on_failure: true
					[ width, height ]
				rescue ::FastImage::UnknownImageType
					# No message, it's just not supported
					raise "File #{full_path} is not an image or not supported."
				rescue
					raise "Couldn't determine dimensions for image #{full_path}: #{$!.message}"
				end

				def get_size_attrs_from_file(full_path)
					width, height = get_image_size_from_file(full_path)
					get_size_attrs_from_size(width, height)
				end

				def get_size_attrs_from_size(width, height)
					{ width: width, height: height }
				end

				def get_style_attr_aspect_ratio_from_size(width, height)
					ratio_width, ratio_height = get_aspect_ratio_from_size(width, height)
					{ style: "aspect-ratio: #{ratio_width} / #{ratio_height}" }
				end
			end
		end
	end
end
