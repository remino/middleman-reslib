# Merging date and i18n test fixture apps into one,
# because Cucumber or Aruba or some other piece of shit
# is being a dick and refuses to move on to the second app when
# reaching the next feature.

activate :i18n
activate :reslib_date
activate :reslib_i18n
activate :reslib_title

%w(id long month_year rfc2822 short).each do |format|
	proxy "/date/#{format}.html", '/date.html', locals: { format: format }
end

ignore '/date.html'
