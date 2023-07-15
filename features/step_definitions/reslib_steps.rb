Then('I should see a lazyload image') do
	expect(page).to have_css('template.lazyload', visible: false)
	expect(page).to have_css('noscript', visible: false)
end
