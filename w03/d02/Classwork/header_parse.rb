re

header = File.read("./header.txt")


# "POST /words HTTP/1.1
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

# specific_word=hello"

def header_parse(header)
	lines = header.split("\n")
	parsed_header = {}
	
	key_values = {}
	lines.each do |line|
		if line.include?(":")
			key_values[line.split(":")[0].to_sym] = "#{line.split(':')[1]}"
		elsif line.include?("HTTP")
			parsed_header[:request_first_line] = line
		else 
			parsed_header[:posted]
		end
		
	end
end
