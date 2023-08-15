Feature: Image Sizes

	Scenario: Rendering images with sizes
		Given the Server is running at "image_sizes_app"
		When I go to "/image_sizes.html"
		Then I should see an image with sizes
