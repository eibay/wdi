doc = Nokogiri::HTML(open("http://www.reddit.com/"))
a = doc.css("a.title")

a.each do |blah|
	blah blah
end