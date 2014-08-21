require 'sinatra'

get('/') do
	erb(:index, { locals: {hello: "Hello World!"} })
end