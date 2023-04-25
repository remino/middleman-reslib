Feature: I18n Wrapper
	Scenario: Rendering a localized string in another locale
		Given the Server is running at "i18n_app"
		When I go to "/i18n/fr.html"
		Then I should see 'Localisé'

	Scenario: Rendering a localized object
		Given the Server is running at "i18n_app"
		When I go to "/i18n/l.html"
		Then I should see '2023-04-25'

	Scenario: Rendering a localized string
		Given the Server is running at "i18n_app"
		When I go to "/i18n/t.html"
		Then I should see 'Localized'
