Feature: Kramdown GFM Plus Figures
	Scenario: Rendering figure blocks using special syntax
		Given the Server is running at "kramdown_gfm_plus_figures_app"
		When I go to "/index.html"
		Then I should see a figure with an image and a figcaption
		And I should see a figure with a linked image and a figcaption
