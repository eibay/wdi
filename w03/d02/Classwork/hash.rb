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


string = File.read('./header.txt')
puts string


main = string.split(' /')
puts main
first_line = string.gets


# lines(separator=$/) → an_array
# Returns an array of lines in str split using the supplied record separator ($/ by default). This is a shorthand for str.each_line(separator).to_a.

