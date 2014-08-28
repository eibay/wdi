require_relative "instance_methods/comedian.rb"
require 'pry'


bob = Comedian.new("bob", 36, "y u no laugh?
\n cuz u dumb")
bozo = Comedian.new("bozo", 45, "y chicken cross road? \n get other side lah")
revolutionary = Comedian.new("revolutionary", 32, " u noe what i am? \n revolting")

# clowns = []

# clowns << bob
# clowns << bozo
# clowns << revolutionary

clowns = [bob, bozo, revolutionary]


clowns.each {|clown| clown.tell_joke}



##########################

