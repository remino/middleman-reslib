Then('I should see a lazyload image') do
	expect(page).to have_css('template.lazyload', visible: false)
	expect(page).to have_css('noscript', visible: false)
end

Then('I should see an image with sizes') do
	expect(page).to have_css('img[height]', visible: false)
	expect(page).to have_css('img[width]', visible: false)
end
