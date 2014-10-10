require 'sinatra'
require 'sinatra/reloader'

require 'pry'
require 'httparty'
require 'nokogiri'


# get "/" do

# html = HTTParty.get("http://www.nytimes.com/")
# parsed = Nokogiri::HTML(html)

# headlines = []

# parsed.css("h2.story-heading a").each do |element|
#   headlines << {title: element.text, link: element.attr("href") }
# end

# return headlines.to_json

# end

# binding.pry

# The above slows down our website very much bc it keeps making requests to nytimes each time people go to our website which will slow it down and then nytimes will block our ap.

html = HTTParty.get("http://www.nytimes.com/")
parsed = Nokogiri::HTML(html)

headlines = []

parsed.css("h2.story-heading a").each do |element|
  headlines << {title: element.text, link: element.attr("href") }
end


get "/" do

return headlines.to_json

end


# U gotta store tha data to ensure that u dont keep making requests to nytimes to scrape their website so do the above instead to make runtime faster. The above way is known as caching. The downside is we set it in a way where it freshes every ten minutes so it isnt as fresh but rather than every time a user comes on bc so we dont bother the user with a slow experience and we dont bother the nytimes api so its a small price to pay.
