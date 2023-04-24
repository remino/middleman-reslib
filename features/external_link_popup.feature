Feature: External Link Popup

	Scenario: Rendering external link to open in a new window or tab
		Given the Server is running at "external_link_popup_app"
		When I go to "/external.html"
		Then I should see '<a href="http://example.com/" target="_blank">External</a>'

	Scenario: Rendering internal links as usual
		Given the Server is running at "external_link_popup_app"
		When I go to "/internal.html"
		Then I should see '<a href="/">Internal</a>'
