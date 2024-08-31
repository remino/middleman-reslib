Feature: Markdown

	Scenario: Rendering block Markdown
		Given the Server is running at "markdown_app"
		When I go to "/block.html"
		Then I should see '<p>Block</p>'

	Scenario: Rendering inline Markdown
		Given the Server is running at "markdown_app"
		When I go to "/inline.html"
		Then I should see '<span>Inline</span>'
