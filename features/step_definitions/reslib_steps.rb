Then('I should see a lazyload image') do
	expect(page).to have_css('template.lazyload', visible: false)
	expect(page).to have_css('noscript', visible: false)
end

Then('I should see an image with sizes') do
	expect(page).to have_css('img[height]', visible: false)
	expect(page).to have_css('img[width]', visible: false)
end

Then('I should see a figure with image not wrapped in a paragraph') do
	expect(page).to have_css('figure', visible: false)
	expect(page).to have_css('figure > img', visible: false)
	expect(page).to_not have_css('p > figure > img', visible: false)
	expect(page).to_not have_css('figure > p', visible: false)
end

Then('I should see a figure with a linked image not wrapped in a paragraph') do
	expect(page).to have_css('figure', visible: false)
	expect(page).to have_css('figure > a > img', visible: false)
	expect(page).to_not have_css('p > a > img', visible: false)
end
