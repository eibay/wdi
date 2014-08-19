require 'httparty'

puts "Gimme a tag"
tag = gets.chomp

# with original api endpoint with access_token
# response = HTTParty.get("https://api.instagram.com/v1/tags/snow/media/recent?access_token=290200498.f59def8.b9c76b65344a4d14bcd367c2d5d6bf2e")

# OKAY - SO WHAT I COPIED AND PASTED WAS AN EXAMPLE - NOT THE GENERIC CODE

response = HTTParty.get("https://api.instagram.com/v1/tags/snow/media/recent?")

# after the GET is the path that we should have put in after v1:

# GET/tags/tag-name/media/recent

# tag-name is the variable we needed to modify and you add it through string interpolation

# here's Jeff's example - in it tag-name is represented as #{tag}

instagram_things = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")



puts response

# HERE I WOULD HAVE HAD TO FIGURE OUT THE DATA STRUCTURE OF RESPONSE AND THEN GO IN AND GET THE ITEMS NEEDED



end

