values_hash={}

post=File.read("header.txt")

split_post=post.split("\n\n")
split_post_again=split_post[1].split("\n")
split_again=split_post[0].split("\n")
values_hash[:request]=split_again[0]
split_again.delete(split_again[0])

split_again.each do |n|
	if(n.include? ":")
		seperate=n.split(":")
		sym=seperate[0].to_sym
		values_hash[sym]=seperate[1]
	end
end
values_hash[:queryparam]={}
split_post_again.each do |n|
	if (n.include? "=")
		seperate=n.split("=")
		sym=seperate[0].to_sym
		values_hash[:queryparam][sym]=seperate[1]
	end
end

puts values_hash


