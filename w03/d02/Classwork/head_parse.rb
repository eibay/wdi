require "pry"

request = "POST /words HTTP/1.1
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

specific_word=hello"

batch = {}
scratch = []
request.each_line do |x|
	scratch = x.split(" ") if x.include?(" ")
	batch[scratch[0].to_sym] = scratch[1..-1].join(" ")
end


if request.include?("\n\n")
	scratch = request.split("\n\n")
	batch[:query_params] = {}
	scratch[1..-1].each do |x|
		search_terms = x.split("=")
		batch[:query_params][search_terms[0].to_sym] = search_terms[1]
		# search = request.split("\n")[-1].split("=")
		# batch[search[0].to_sym] = search[1]
	end
end

puts batch
