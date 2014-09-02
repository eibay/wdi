require_relative './random_user'
require 'erb'

user = random_user()

# erb(:user, locals: {user: user})
erb(:user)
