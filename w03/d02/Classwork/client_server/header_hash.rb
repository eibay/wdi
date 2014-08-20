require 'pry'

text_file = File.read("header.txt")
puts text_file

header_array = text_file.split("\n")

hash = {}

i=0
while i < 11
  key = header_array[i].split(" ")[0]
  value = header_array[i].split(" ")[1]
  hash[key] = value
  i+=1
end

key = header_array[13].split("=")[0]
value = header_array[13].split("=")[1]

hash[key] = [value]

#binding.pry
