Feature: Kramdown Figure Blocks
	Scenario: Rendering figure blocks without paragraph
		Given the Server is running at "kramdown_figure_blocks_app"
		When I go to "/index.html"
		Then I should see a figure with image not wrapped in a paragraph
