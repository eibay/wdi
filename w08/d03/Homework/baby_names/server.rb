require 'sinatra'
require 'json'
require 'haml'
require 'redcarpet'

# when the server starts # 
# get & parse the babies # 

def get_baby_objs  
  f = File.read "./public/ny-baby-names.json"
  json_data = JSON.parse f
  array_of_baby_arrays = json_data["data"]
  array_of_baby_arrays.map do |baby_array|
    {
      gender: baby_array[11],
      county: baby_array[10], 
        name: baby_array[9], 
       count: baby_array[12], 
        year: baby_array[8]
    }
  end
end 

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
  # create a hash w/ the years & the count 
  babies_num = sorted_babies.inject({}) { |h, (k, v)| h[k] = v.length; h }
  [sorted_babies, sorted_babies.keys, babies_num] 
end 

year_sorted_babies, years, babies_num = year_sort_babies get_baby_objs 

get '/' do
  haml :index, {locals: {years: years, babies_num: babies_num}}  
end

get "/years/:year" do 
  year = params[:year]
  babies = year_sorted_babies[year]
  haml :year, {locals: {babies: babies, year: year}}
end 