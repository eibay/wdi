def doc_search
csv = File.read('./greys.txt')
all_actors = []
docs = []
file_array = csv.split("\n")

file_array.each do |actor_string|
	actor_array = actor_string.split(",")
	hash = {}
	hash[:character] = actor_array[1]
	all_actors<<hash
end

all_actors.each do |x|
	if x[:character].include?("Dr.")
		docs.push(x[:character])
	end
end

x = rand(docs.length - 1)

doc = docs[x]
if doc.split(" ").length > 2
doc = "#{doc.split(" ")[0]} " + "#{doc.split(" ")[2]}"
end
return doc
end