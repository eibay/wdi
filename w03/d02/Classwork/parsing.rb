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

# specific_word=hello

#     [ 0] "POST /words HTTP/1.1",
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
#     [11] "Accept-Language: en-US,en;q=0.8",
#     [12] "",
#     [13] "specific_word=hello",
#     [14] "",

text = File.read('header.txt')
array = text.split("\n")

hash = {}
request = array.split.to_s

hash [:request => request]

query = array.pop.to_s
hash.push[:query => query]


another_array = []
array.each do |X|
	another_array.push

