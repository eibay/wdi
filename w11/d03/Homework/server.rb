require "sinatra"
require "sinatra/reloader"
require "pry"

use Rack::Session::Cookie, {
	:key => "rack.session",
	:path => "/",
	:secret => "banksy"
}

get("/") do
	erb(:index)
end