activate :i18n
activate :reslib_date

%w(id long month_year rfc2822 short).each do |format|
	proxy "/#{format}.html", '/index.html', locals: { format: format }
end

ignore '/index.html'
