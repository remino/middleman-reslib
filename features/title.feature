Feature: Title
	Scenario: Rendering the title of the site when a page title is missing
		Given the Server is running at "i18n_app"
		When I go to "/title/index.html"
		Then I should see '<title>The Site</title>'

	Scenario: Rendering the title of the page
		Given the Server is running at "i18n_app"
		When I go to "/title/about.html"
		Then I should see '<title>About - The Site</title>'

	Scenario: Rendering the title of the site
		Given the Server is running at "i18n_app"
		When I go to "/title/title.html"
		Then I should see '<h1>The Site</h1>'
