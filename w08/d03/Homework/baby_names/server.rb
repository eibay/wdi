require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'haml'

# when the server starts # 
# get & parse the babies # 

f = File.read "./public/ny-baby-names.json"
json_data = JSON.parse f

# we'll ignore all but the core data for now # 
array_of_baby_arrays = json_data["data"]


# transform the data into hash form # 
baby_hashes = 
array_of_baby_arrays.map do |baby_array|
  {
    gender: baby_array[11],
    county: baby_array[10], 
      name: baby_array[9], 
     count: baby_array[12], 
      year: baby_array[8] 
  }
end

# define & call a method to sort babies by year #

def year_sort_babies data 
  sorted_babies = {}
  data.each do |baby_obj|  
    if sorted_babies.has_key? baby_obj[:year] 
      sorted_babies[baby_obj[:year]] << baby_obj 
    else
      sorted_babies[baby_obj[:year]] = []
      sorted_babies[baby_obj[:year]] << baby_obj 
    end 
  end 
  sorted_babies
end 

year_sorted_babies = year_sort_babies baby_hashes
years = year_sorted_babies.keys
babies_num = year_sorted_babies.inject({}) { |h, (k, v)| h[k] = v.length; h }

get '/' do
  haml :index, {locals: {years: years, babies_num: babies_num}}  
end

get "/years/:year" do 
  year = params[:year]
  babies = year_sorted_babies[year]
  haml :year, {locals: {babies: babies, year: year}}
end 