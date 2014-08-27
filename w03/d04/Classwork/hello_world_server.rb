# how to say hello world in sinatra with the least number of lines

require 'sinatra'
get '/' do 
	erb(:index)
	# takes us to this page where we say 'hello world'
end


require 'sinatra'
get '/' do 
	"hello world"
	# this will just display 'hello world' 
	# we have get '/' because the main page we open in the browswer to run this is the root ('/'')
end
# the last line always gets 'put to the terminal'








# with ruby - you can put multiple lines all on one line separating each line by semi-colons (;)

require 'sinatra'
get '/' {"hello world"} 
end

# do this instead of the block code

get correct sytax for this:

require 'sinatra'
public/index.html
public/style.css
end


