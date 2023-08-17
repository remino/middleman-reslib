Feature: Minify
	Scenario: Rendering minified HTML
		Given the Server is running at "minify_app"
		When I go to "/index.html"
		Then I should see '<!DOCTYPE html><html lang=en class=top><title>Page</title><style>body{background:#fff}</style><script>console.log("Hey")</script><h1>Page</h1>'
