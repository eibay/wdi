require 'pry'

header = File.read("./header.txt")

first = header.split("\n\n")

head = first[0].split("\n")

body = first[1].split("\n")

hash ={}

head.each do |p| 
	hash[p.split(":")[0].to_sym] = p.split(":")[1]
end

hash[body[0].split("=")[0].to_sym] = body[0].split("=")[1]

puts hash
