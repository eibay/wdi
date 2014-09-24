require 'json'
require 'pry'
require 'humanize'

f = File.read "./public/ny-baby-names.json"
json_data = JSON.parse f
array_of_baby_arrays = json_data["data"]

# This is what a baby array looks like: 
# [
#     [ 0] 29622,
#     [ 1] "04C82442-B31E-431F-A0F5-CAA86BF1CDC5",
#     [ 2] 29622,
#     [ 3] 1395147350,
#     [ 4] "698552",
#     [ 5] 1395147350,
#     [ 6] "698552",
#     [ 7] "{\n}",
#     [ 8] "2012",
#     [ 9] "DOMINIC",
#     [10] "CAYUGA",
#     [11] "M",
#     [12] "6"
# ]

baby_objs = 
array_of_baby_arrays.map do |baby_array|
  {
    gender: baby_array[11],
    county: baby_array[10], 
      name: baby_array[9], 
     count: baby_array[12], 
      year: baby_array[8], 
  }
end

def year_sort_babies(baby_objs)
  return_strs = []
  baby_objs.each do |baby_obj| 
    years = []
    have = years.include? baby_obj[year] 
    if have

    else
      var_name_str = get_year_var_string baby_obj[year]
      declaration_str = var_name_str + " = []"
      eval declaration_str
      return_strs << var_name_str
      eval(var_name_str) << baby_obj 
    end 
  end 
end 

def get_year_var_string(year_str)
  year_num = year_str.to_i 
  in_words = year_num.humanize 
  in_words.replace ' ', '_'
end 

binding.pry 