Feature: Lazyload Images

	Scenario: Rendering lazyload images
		Given the Server is running at "lazyload_images_app"
		When I go to "/lazyload_images.html"
		Then I should see a lazyload image
