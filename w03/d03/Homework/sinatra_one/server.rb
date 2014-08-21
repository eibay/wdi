require 'sinatra'
require 'pry'
require 'httparty'

get("/") do
  erb(:index)
end

get("/tag") do
  thing = request.params["thing_name"]

  instagram_images = HTTParty.get("https://api.instagram.com/v1/tags/#{thing}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8")
  # binding.pry
  erb(:image_list, { locals: { thing: thing, insta: instagram_images } })
end




    instagram_images = HTTParty.get("https://api.instagram.com/v1/tags/#{thing}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8", headers: {"User-Agent" => "Httparty"})

    instagram_images["data"].each do |image|
      array.push(image['images']['low_resolution']['url'])
    end

    fat_string = array.join('')

    image_page = html.gsub('{{search_word}}', thing)
    final_page = image_page.gsub('{{image}}', fat_string)

    client.puts(final_page)


    # instagram_images = HTTParty.get("https://api.instagram.com/v1/tags/#{thing}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8", headers: {"User-Agent" => "Httparty"})

    # instagram_images["data"].each do |image|
    #   array.push "<img src='" + image['images']['low_resolution']['url'] + "'/>"
    # end

    # fat_string = array.join('')

    # image_page = html.gsub('{{search_word}}', thing)
    # final_page = image_page.gsub('{{image}}', fat_string)

    # client.puts(final_page)

    	