require 'sinatra'
require 'haml'

get "/sign_in" do 
  if params["user"] 
    response.header["Set-Cookie"] = "user=" + params["user"] + "; path=/;"
    redirect '/'
  else 
    haml :sign_in 
  end 
end 

get '/' do 
  if request.header["Cookie"]
    
  else 
    redirect "/sign_in"
  end 
end 