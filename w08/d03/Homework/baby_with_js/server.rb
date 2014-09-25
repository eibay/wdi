require 'sinatra'
require 'json'
require 'haml'
require 'redcarpet'

# baby parsing methods # 

def get_baby_objs  
  f = File.read "./public/ny-baby-names.json"
  json_data = JSON.parse f
  array_of_baby_arrays = json_data["data"]
  array_of_baby_arrays.map do |baby_array|
    {
      "gender" => baby_array[11],
      "county" => baby_array[10], 
        "name" => baby_array[9], 
       "count" => baby_array[12], 
        "year" => baby_array[8]
    }
  end
end 

def year_sort_babies data 
  sorted_babies = {}
  data.each do |baby_obj|  
    if sorted_babies.has_key? baby_obj["year"] 
      sorted_babies[baby_obj["year"]] << baby_obj 
    else
      sorted_babies[baby_obj["year"]] = []
      sorted_babies[baby_obj["year"]] << baby_obj 
    end 
  end
  baby_years = sorted_babies.keys 
  baby_nums = count_by_year sorted_babies 
  [sorted_babies, baby_years, baby_nums] 
end 

def count_by_year year_sorted_data 
  # create a hash w/ the years & 
  # the number of babies born that year # 
  year_sorted_data.inject({}) { |h, (k, v)| h[k] = v.length; h }
end 

# when the server starts # 
# get & parse the babies # 

year_sorted_babies, baby_years, baby_nums = year_sort_babies get_baby_objs 

get '/' do
  haml :index, {locals: {baby_years: baby_years, baby_nums: baby_nums}}  
end

get "/years/:year" do 
  haml :year, {locals: {year: params[:year]}}
end 

get "/json/:year" do 
  content_type :json 
  baby_array = year_sorted_babies[params[:year]]
  baby_array.to_json 
end 