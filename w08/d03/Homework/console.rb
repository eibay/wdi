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
      year: baby_array[8] 
  }
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
  sorted_babies
end 

binding.pry 