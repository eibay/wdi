suit=["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
full_deck=[]
suits=["hearts", "spades", "diamonds" , "clubs"]
i=0
while(i < suits.count)
suit.each{ |x| full_deck.push("#{x} #{suits[i]}") }
i+=1
end
puts full_deck

