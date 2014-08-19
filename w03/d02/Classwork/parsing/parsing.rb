
require "pry"
"
POST /words HTTP/1.1
Host: 127.0.0.1:2000
Connection: keep-alive
Content-Length: 19
Cache-Control: max-age=0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Origin: http://127.0.0.1:2000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36
Content-Type: application/x-www-form-urlencoded
Referer: http://127.0.0.1:2000/
Accept-Encoding: gzip,deflate,sdch
Accept-Language: en-US,en;q=0.8


specific_word=hello
"

text = File.read("header.txt")

post = text.split("HTTP/1.1")[0]
post += "HTTP/1.1"
	# POST /words HTTP/1.1

query = text.split("HTTP/1.1")[1].split("\n")[-1]
	# specific_word=hello

header = text.split("HTTP/1.1")[1].split("\n\n")[0]
	# POST /words HTTP/1.1
	# Host: 127.0.0.1:2000
	# Connection: keep-alive
	# Content-Length: 19
	# Cache-Control: max-age=0
	# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
	# Origin: http://127.0.0.1:2000
	# User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36
	# Content-Type: application/x-www-form-urlencoded
	# Referer: http://127.0.0.1:2000/
	# Accept-Encoding: gzip,deflate,sdch
	# Accept-Language: en-US,en;q=0.8

header = header.split("\n") unless header.split("\n")[0][-1] == ":"
# [
#     [ 0] "",
#     [ 1] "Host: 127.0.0.1:2000",
#     [ 2] "Connection: keep-alive",
#     [ 3] "Content-Length: 19",
#     [ 4] "Cache-Control: max-age=0",
#     [ 5] "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
#     [ 6] "Origin: http://127.0.0.1:2000",
#     [ 7] "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36",
#     [ 8] "Content-Type: application/x-www-form-urlencoded",
#     [ 9] "Referer: http://127.0.0.1:2000/",
#     [10] "Accept-Encoding: gzip,deflate,sdch",
#     [11] "Accept-Language: en-US,en;q=0.8"
# ]


hash = {}


header.each do |x|
	key = x.split(": ")[0]
	value = x.split(": ")[1]

	hash[key] = value
end



hash[query.split("=")[0]]=query.split("=")[1]

hash[post.split(" /")[0]]= "/" + post.split(" /")[1]

puts hash


