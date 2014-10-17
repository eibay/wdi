# A user can sign up for a bank account with an email and a password.
# both an email and password are required, and emails must be unique
# A user can sign in to their account and view how much money they have
# A user can debit or credit their account
# You should not be able to view a user's account balance or make edits to their balance unless you are signed in as that user.

require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative  './lib/connection'
require_relative './lib/account'
require_relative './lib/user'

use Rack::Session::Cookie, {
  :key => 'rack.session',
  :path => '/',
  :secret => '21289172ejhjdhdjfgdkhfgdkhf'
}



after do
    ActiveRecord::Base.connection.close
end

get "/" do

  erb(:"bankinfo/clients")
end

get "/user/:id" do
  user = User.find_by({username: session["name"]})
  firstname = user.firstname
  lastname = user.lastname
  email = user.email
  id = user.id
  erb(:main, {locals: {first_name: firstname, last_name: lastname, email: email, id: id}})
end

post '/sign_up' do
    new_user = {
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password],
    balance: 0
  }

  User.create(new_user)

  erb(:"bankinfo/new", {locals: {user: User.last() }})
end

get '/login' do
  session[:email] = params[:email]
  session[:password] = params[:password]
  new_user = User.find_by(email: session[:email])

  if session[:email] == new_user.email && session[:password] == new_user.password
    "You have logged in!"

  erb(:"bankinfo/existing", {locals: {user: new_user }})
  else
    redirect '/'
  end

end

get '/users/:id/account' do


end

# put '/users/:id/account' do
# used for debiting and crediting feature for accounts

# end

get '/logout' do
  response.delete_cookie("rack.session")
  "You have logged out"
end