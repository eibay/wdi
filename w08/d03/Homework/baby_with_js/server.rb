require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

parsed_baby_names = JSON.parse(File.read(File.expand_path('../public/ny-baby-names.json', __FILE__)))
baby_names = parsed_baby_names["data"]

get '/' do
  erb(:index)
end

get '/2007' do

  babies2007 = []
  baby_names.each do |baby|
    if baby[8] == "2007"
      hash_2007 = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count: baby[12]
      }

      babies2007 << hash_2007
    end
  end
  babies2007.to_json
end

get '/2008' do
    content_type :json
    babies2008 = []
    baby_names.each do |baby|
      if baby[8] == "2008"
        hash_2008 ={
          name: baby[9],
          county: baby[10],
          gender: baby[11],
          count: baby[12]
        }

        babies2008 << hash_2008
      end
    end
    babies2008.to_json
end

get '/2009' do
    content_type :json
    babies2009 = []
    baby_names.each do |baby|
      if baby[8] == "2009"
        hash_2009 ={
          name: baby[9],
          county: baby[10],
          gender: baby[11],
          count: baby[12]
        }

        babies2009 << hash_2009
      end
    end
    babies2009.to_json
end

get '/2010' do
    content_type :json
    babies2010 = []
    baby_names.each do |baby|
      if baby[8] == "2010"
        hash_2010 ={
          name: baby[9],
          county: baby[10],
          gender: baby[11],
          count: baby[12]
        }

        babies2010 << hash_2010
      end
    end
    babies2010.to_json
end

get '/2011' do
    content_type :json
    babies2011 = []
    baby_names.each do |baby|
      if baby[8] == "2011"
        hash_2011 ={
          name: baby[9],
          county: baby[10],
          gender: baby[11],
          count: baby[12]
        }

        babies2011 << hash_2011
      end
    end
    babies2011.to_json
end

get '/2012' do
    content_type :json
    babies2012 = []
    baby_names.each do |baby|
      if baby[8] == "2012"
        hash_2012 ={
          name: baby[9],
          county: baby[10],
          gender: baby[11],
          count: baby[12]
        }

        babies2012 << hash_2012
      end
    end
    babies2012.to_json
end

get '/babies' do
  content_type :json
  babies = {}
  years = baby_names.map{|baby| baby[8]}.uniq
  baby_hashes = baby_names.map{|baby|
    {
      name: baby[9],
      year: baby[8],
      county: baby[10],
      gender: baby[11],
      count: baby[12]
    }
  }
  years.each do |year|
    babies[year] = baby_hashes.select do |baby|
      # iterates over each element in the array and only only keeps the elements which meets the conditions that are set in the block
      baby[:year] == year
    end
  end
  babies.to_json
end





# * Delete the code which renders the table server side, and instead make an ajax call (using jQuery ajax) to retrieve all of the baby names from your server after the page loads.
#   * Then render the table dynamically in the DOM. You can use [underscore.js](http://underscorejs.org/) to work with the big JSON data structure.
#   * Should also be year-paginated, ie `/2012` gives all the baby names in 2012...