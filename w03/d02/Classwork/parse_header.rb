post_request = {}

post = <<POST_REQUEST
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
POST_REQUEST

# split into lines 
post = post.split "\n"

# get & parse the first line & 
# remove it from the array 
yo = post.first

method, action, protocol = yo.split ' '

post_request[:method] = method 
post_request[:action] = action 
post_request[:protocol] = protocol 

post.delete yo

# remove, get & parse the body 

body = post.pop.split '=' 
var, val = body[0], body[1]

post_request[:body] = { :var[var] = val } 

# split the remaining lines 

post.map! do |l|
	l.split ": "
end 

post.each do |l|
	key, val = l[0].to_sym, l[1]
	post_request[key] = val 
end 

p post_request
