THIS ENTIRE POST DATA IS ALL ACTUALLY A STRING

post_hash_string = File.read('./header.txt') is a useful tool #we do a .slash, even when the item is not in a subfolder in the same folder

# example of using File.read
# css = File.read('./stylesheets/styles.css')

this returns =>

post_hash_string = "POST /words HTTP/1.1\nHost: 127.0.0.1:2000\nConnection: keep-alive\nContent-Length: 19\nCache-Control: max-age=0\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\nOrigin: http://127.0.0.1:2000\nUser-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36\nContent-Type: application/x-www-form-urlencoded\nReferer: http://127.0.0.1:2000/\nAccept-Encoding: gzip,deflate,sdch\nAccept-Language: en-US,en;q=0.8\n\nspecific_word=hello\n"

# GOAL = PARSE THIS TO A HASH

# hash will look something like:

# post_hash = {path: path,
# Host: host_name,}

# if we separate out by \n we'll get all of our basic key - value elements for the hash, AND we'll get our path

unique_post_hash_lines = post_hash_string.split("\n")

# this gives us an array of pieces

# post_hash_string.split("\n")[0] this contains the path
# 		but we want to do something to catch ALL the data at each of the indexes

"POST /words HTTP/1.1"

path = post_hash_string.split("\n")[1].split(" ")
   [0] "POST",
    [1] "/words",
    [2] "HTTP/1.1"

path = post_hash_string.split("\n")[1].split(" ")[1]

to get the array of all key/value pairs:

key_value_pairs = []

unique_post_hash_lines.each do |key_value|

	key_value.each do |key, value|
		{key: value}
	end

end










