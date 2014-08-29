# `/` -> A welcome page with links to `/characters` and `/houses`
#   * `/characters` -> a list of the characters with links to their `/charaters/:id` page
#   * `/characters/:id` -> information about the character and what house they belong to.
#   * `/characters/new` -> a form to create a new character
#   * `/houses` -> a list of houses with links to the `/houses/:id` page for each one
#   * `/houses/:id` -> A page with information about an individual house and a list of characters that belong to it.

require 'sinatra'
require 'sinatra/reloader'

get("/") do
  erb(:index)
end