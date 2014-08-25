# Assignment: 

# make the following pages:

# submit email pages

# a page with all emails

# bonus - be able to access those saved emails AFTER restarting the server


# MAKE SURE TO PUT .ERB FILES IN A 'VIEWS' FOLDER, OTHERWISE YOU WILL GET THIS ERROR:
# ERROR:
# No such file or directory @ rb_sysopen - /Users/aow/dev/wdi/rosencrantz/w03/d04/Classwork/views/email_index_page.erb
# file: template.rb location: initialize line: 91


require 'pry'
require 'sinatra'

get("/") do
  erb(:email_index_page)
end

# post example i found online
# post '/' do
#   @task =  params[:task]
#   slim :task
# end

all_emails = []

post("/all_emails_list") do 
  
 # DO IT THIS WAY W/PARAMS
  email = params["email"]

# binding.pry

# VALUES RETREIVED FROM PRY:

# 	[4] Pry(#<Sinatra::Application>)> params["email"]                               
# 	"happy@happy.com"

# 	[5] Pry(#<Sinatra::Application>)> request.params["email"]                       
# 	"happy@happy.com" (Instructors said dont use request.params b/c will cause more issues down the line. We can get the same value returned with 'params' all by itself)

# 	[1] Pry(#<Sinatra::Application>)> email                                         
# 	"happy@happy.com"

# 	[2] Pry(#<Sinatra::Application>)> params                                        
# 	{
# 	    "email" => "happy@happy.com"
# 	}

		# DONT DO IT THIS WITH WITH REQUEST.PARAMS
		  # email = request.params["email"]
  
  all_emails.push(email)
  all_emails.join(",")
  erb(:all_emails_list, { locals: { email: email, all_emails: all_emails } })
end

get("/all_emails_list") do
  all_emails.join
  erb(:all_emails_list, { locals: { all_emails: all_emails} })

end



# example of get with a path

# get("/tag") do

# 	tagword = request.params["tag"]

# 	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tagword}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")

# 	erb(:secondpage, { locals: { response: response}})	
# end






