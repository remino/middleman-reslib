Feature: Format Date

	Scenario: Rendering date
		Given the Server is running at "date_app"
		When I go to "/id.html"
		Then I should see "20230424"
		When I go to "/long.html"
		Then I should see "Monday 24 April 2023"
		When I go to "/month_year.html"
		Then I should see "April 2023"
		When I go to "/rfc2822.html"
		Then I should see "Mon, 24 Apr 2023 00:00:00 +0900"
		When I go to "/short.html"
		Then I should see "2023-04-24"
