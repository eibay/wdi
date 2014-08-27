#!/usr/bin/ruby
# Make a joke telling class called Comedian
# such a comedian can tell jokes

class Comedian

white_suit = <<WHITE_SUIT_JOKE
Why did Mark Zuckerburg have to wear a white suit to the white house?
I've given a lot of thought to this. You see, he didn't really HAVE 
to wear a white suit to the white house. There isn't really any necessity 
for him to do that. I didn't have to wear a tuxedo to my wedding. My wife made me.
I don't have to wear a hat & gloves to work. My wife makes me. I know this, now you know this.
So the reason why Mark Zuckerburg had to wear a white suit to the white house must be
my wife made him. Haven't asked her about it though.
WHITE_SUIT_JOKE

furniture = <<TWO_FURNITURE
OK, OK, OK. So I was in this bar. Not a whole lotta people in there,
because I don't go to places w/ lotsa people. The only drawback is I have to hear
lots of people taking, even if they're smart enough not to talk to me.
But there were these to furniture salesman sitting there, whining about their jobs.
"If I don't sell some furniture, I'm gonna lose my ass." That kind of nonsense.
Other furniture salesman says, "Hey watch it, there's a lady sitting next to you."
Lady says, "It's OK. I'm a hooker. If I don't sell some ass, 
I'm gonna lose my furniture."
OK, OK, OK. 
TWO_FURNITURE

  @@joke_array = [white_suit]
  @@knock_knock_joke_array = [{"who" => "Brad", "who who" => "Brad Pitt, what other Brad is worth talking about?"}] 

  def tell_joke
    puts @@joke_array.sample 
  end

  def tell_knock_knock_joke
    form = @@knock_knock_joke_array.sample
    puts "Knock knock." 
    puts "Yeah yeah yeah. Who's there?"
    puts form["who"] 
    puts "Now you say,"
    puts "#{form["who"]} who?"
    puts form["who who"]
    puts "That's not funny."
  end
end

joker = Comedian.new
joker.tell_joke
joker.tell_knock_knock_joke

