Feature: URL
	Scenario: Rendering an absolute URL based on the site URL and given path
		Given the Server is running at "url_app"
		When I go to "/index.html"
		Then I should see 'http://example.com/file.txt'
