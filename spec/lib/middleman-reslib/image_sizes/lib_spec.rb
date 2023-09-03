require 'middleman-reslib/image_sizes/lib'

RSpec.describe MiddlemanReslib::ImageSizes::Lib do
	describe '#get_aspect_ratio_from_size' do
		it 'raises an error if width and height are not specified' do
			expect { subject.get_aspect_ratio_from_size(nil, nil) }.to raise_error(RuntimeError, 'Width and height must be specified')
		end

		it 'returns the correct aspect ratio' do
			expect(subject.get_aspect_ratio_from_size(16, 12)).to eq([ 4, 3 ])
		end

		it 'returns the correct aspect ratio for a square' do
			expect(subject.get_aspect_ratio_from_size(16, 16)).to eq([ 1, 1 ])
		end
	end

	describe '#get_image_size_from_file' do
		it 'raises an error if the file does not exist' do
			expect { subject.get_image_size_from_file('does_not_exist.jpg') }.to raise_error(RuntimeError, /doesn't exist/)
		end

		it 'raises an error if the file is not an image' do
			expect { subject.get_image_size_from_file('spec/fixtures/images/invalid.txt') }.to raise_error(RuntimeError, /Couldn't determine dimensions for image spec\/fixtures\/images\/invalid.txt/)
		end

		it 'returns the correct size' do
			expect(subject.get_image_size_from_file('spec/fixtures/images/img.gif')).to eq([ 16, 12 ])
		end
	end

	describe '#get_size_attrs_from_file' do
		it 'raises an error if the file does not exist' do
			expect { subject.get_size_attrs_from_file('does_not_exist.jpg') }.to raise_error(RuntimeError, /doesn't exist/)
		end

		it 'raises an error if the file is not an image' do
			expect { subject.get_size_attrs_from_file('spec/fixtures/images/invalid.txt') }.to raise_error(RuntimeError, /Couldn't determine dimensions for image spec\/fixtures\/images\/invalid.txt/)
		end

		it 'returns the correct size' do
			expect(subject.get_size_attrs_from_file('spec/fixtures/images/img.gif')).to eq({ width: 16, height: 12 })
		end
	end

	describe '#get_size_attrs_from_size' do
		it 'returns the correct size' do
			expect(subject.get_size_attrs_from_size(16, 12)).to eq({ width: 16, height: 12 })
		end
	end

	describe '#get_style_attr_aspect_ratio_from_size' do
		it 'raises an error if width and height are not specified' do
			expect { subject.get_style_attr_aspect_ratio_from_size(nil, nil) }.to raise_error(RuntimeError, 'Width and height must be specified')
		end

		it 'returns the correct aspect ratio' do
			expect(subject.get_style_attr_aspect_ratio_from_size(16, 12)).to eq({ style: "aspect-ratio: 4 / 3" })
		end

		it 'returns the correct aspect ratio for a square' do
			expect(subject.get_style_attr_aspect_ratio_from_size(16, 16)).to eq({ style: "aspect-ratio: 1 / 1" })
		end
	end
end
