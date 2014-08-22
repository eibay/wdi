require 'sinatra'
get ("/") do erb(:index) end
	#or require sinartra
	#get ("/") do
	#"Hello World"
	#end

	#get ("/") { erb "HELLO WORLD"}
	#or just require 'sinatra'
	#because if u put in public it already 
	#knows to get the files