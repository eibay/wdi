require 'sinatra'
require 'sinatra/reloader'
require 'nokogiri'
require 'HTTParty'

get '/reddit' do
  reddit_raw = HTTParty.get('http://reddit.com')
    # HTTParty request to reddit for all HTML 

  reddit_parsed = Nokogiri::HTML(reddit_raw)
    # nokogiri takes the large, relationship-less string, and parses into a tree object of relationships
    # Then we parse with nokogiri so we can search through for relevant data

  array_of_hashes = []

  reddit_parsed.css('a.title').each do |t|
    # search for the  a class="title" 

    hash = {title: t.text, link: t["href"]}
      # take out the relevant details and creates a hash
    array_of_hashes << hash
      # shovels hash into the array_of_hashes
  end


  array_of_hashes.to_json
    # change array_of_hashes to json to display
    
end



# erb(:index, {locals: {title_may_blank: title_may_blank} })
# end

