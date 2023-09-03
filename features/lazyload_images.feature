Feature: Lazyload Images

	Scenario: Rendering lazyload images
		Given the Server is running at "lazyload_images_app"
		When I go to "/lazyload_images.html"
		Then I should see a lazyload image
		Then I should see '<template class=lazyload><img src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" width="1" height="1" class="lazyload" data-src="/img.gif" style="aspect-ratio: 1 / 1" alt="" /></template><noscript><img src="/img.gif" width="1" height="1" alt="" /></noscript>'
