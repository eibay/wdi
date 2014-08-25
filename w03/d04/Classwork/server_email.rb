require 'sinatra'

get('/') do 
	erb(:index_email)
	
end

Every_email[]

post("/email_list") do

	email = request.params["emailaddy"]
	email.each do |emaillst| 
	
	erb(:email_list, { locals: { ,  }})

end