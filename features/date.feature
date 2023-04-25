Feature: Format Date

	Scenario: Rendering date
		Given the Server is running at "i18n_app"
		When I go to "/date/id.html"
		Then I should see "20230424"
		When I go to "/date/long.html"
		Then I should see "Monday 24 April 2023"
		When I go to "/date/month_year.html"
		Then I should see "April 2023"
		When I go to "/date/rfc2822.html"
		Then I should see "Mon, 24 Apr 2023 00:00:00 +0900"
		When I go to "/date/short.html"
		Then I should see "2023-04-24"
