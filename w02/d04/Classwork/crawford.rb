require 'socket'

# for the yellow on blue text 
class String 
	def excitedly 
		"\033[1;33;44m" + self + "\033[0m"
	end 
end 

urls = %w(
	https://avatars.githubusercontent.com/u/8105300?v=2 
	https://avatars.githubusercontent.com/u/7014171?v=2
	https://avatars.githubusercontent.com/u/689206?v=2 
	https://avatars.githubusercontent.com/u/7461951?v=2 
	https://avatars.githubusercontent.com/u/8276190?v=2 
	https://avatars.githubusercontent.com/u/8261821?v=2 
	https://avatars.githubusercontent.com/u/8161686?v=2 
	https://avatars.githubusercontent.com/u/8139449?v=2 
	https://avatars.githubusercontent.com/u/6555939?v=2
	https://avatars.githubusercontent.com/u/7749386?v=2 
	https://avatars.githubusercontent.com/u/6674492?v=2 
	https://avatars.githubusercontent.com/u/7996806?v=2 
	https://avatars.githubusercontent.com/u/8169976?v=2 
	https://avatars.githubusercontent.com/u/6874416?v=2 
	https://avatars.githubusercontent.com/u/5423195?v=2 
	https://avatars.githubusercontent.com/u/8263298?v=2 
	https://avatars.githubusercontent.com/u/8097306?v=2 
	https://avatars.githubusercontent.com/u/8110109?v=2 
	https://avatars.githubusercontent.com/u/7261534?v=2 
	https://avatars.githubusercontent.com/u/8259036?v=2 
	https://avatars.githubusercontent.com/u/8257713?v=2 
	https://avatars.githubusercontent.com/u/7145267?v=2 
	https://avatars.githubusercontent.com/u/8117970?v=2
)

# p urls 

page = <<HERE_BE_HTML 
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset=utf-8> 
		<title>Generating Hex Codes from Some URLS</title>
	</head> 
	<body style=background-color:{{hex}}>
		<div style=background-color:white;margin:auto;height:5em;width:75%>
			<p style=font-family:impact;font-size:3em;>{{hex}}</p>
		</div>
	</body>
</html> 
HERE_BE_HTML

url = ''

description = <<DESCRIBE_THING 
Crawford has done an amazing thing!
He took the numerals from the url:
#{url}
& modified the str to contain just 6 numerals:
DESCRIBE_THING

instructions = <<WHAT_TO_DO
Try loading localhost:2000
& reloading it
WHAT_TO_DO

# p page 

s = TCPServer.new 2000 

loop do 
	urls.each do |url|
		# describe thing 
		print description.excitedly 

		# transform url into str of 6 digits 
		url_arr = url.split '/'
		p url_arr 
		num_str = url_arr[4].split('?')[0]
		p num_str 
		nums_arr = num_str.split ''
		nums_arr.delete_at 6     
		p nums_arr
		hex = '#' + (nums_arr.join)
		p hex  

		print instructions.excitedly 

		# wait for requests 
		c = s.accept 
		r = c.gets.split ' '
		r = r[1]

		# if they want the home page, send them the view 
		if r == '/'
			v = page.gsub "{{hex}}", hex 
			c.puts v 
		else 
			c.puts "<h1>404 Not Found</h1>"
		end 
	end  
end 

=begin 
p css2

# using Nastassia's url as an example 
avatar = "https://avatars.githubusercontent.com/u/689206?v=2"
p avatar 
avatar2 = avatar.split '/'
p avatar2
avatar2 = avatar2[4].split '?'
p avatar2[4]
p avatar2

avatarArr = []
p avatarArr

avatarArr = avatar2[0].split ''
p avatar2[0]
p avatarArr

avatarArr.delete_at 6 
p avatarArr 

avatar2 = avatarArr.join '' 
p avatar2
avatar2 = '#' + avatar2
p avatar2

css2 = css2.gsub '{{avatar2}}', avatar2 
p css2
=end 
