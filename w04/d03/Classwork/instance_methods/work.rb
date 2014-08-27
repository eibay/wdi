require "pry"
require_relative "./comedian"

mitch = Comedian.new("Mitch Hedberg", 46, "I really hate protests, but I don't know how to show it.")
steven = Comedian.new("Steven Wright", 59, "Everywhere is walking distance if you have the time." )
steve = Comedian.new("Steve Martin", 69, "I've taken up juggling, but in my mind.  Whoops!")

comics = [mitch, eddie, steve]

comics.each {|comic| comic.tell_joke}