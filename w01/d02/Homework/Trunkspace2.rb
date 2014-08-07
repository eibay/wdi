# From Tejal: 
# This is what I got
# I didn't do the second part with a 30 sec interval

items=["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]


puts items


index=0


puts "Would you like to order?"

more =gets.chomp.downcase


while more=="yes"

puts "What would you like to order?"

answer=gets.chomp

if answer.include? items[0] 

	index +=1

elsif answer.include? items[1] 

	index +=2

elsif answer.include? items[2] 

	index +=3

elsif answer.include? items[3] 

	index +=4

elsif answer.include? items[4] 

	index +=5

elsif answer.include? items[5] 

	index +=6

elsif answer.include? items[6] 

	index +=7

elsif answer.include? items[7] 

	index +=8

elsif answer.include? items[8]

	index +=9

else puts "That is not on the menu"

end
puts "Would you like to order anything else?"

more = gets.chomp.downcase

if more =="no" 

	puts "Your order will take #{index} minutes"

end
end


puts "Have a great day!"



On Tue, Aug 5, 2014 at 9:13 PM, Andrea Ortega-Williams <williamsfilms@gmail.com> wrote:
k, thanks for getting back to me to let me know. good luck with the ruby review. 

see u tomorow!


On Tue, Aug 5, 2014 at 9:11 PM, Brenda Dargan <brenda.dargan@gmail.com> wrote:
Hi there. I played around with it a bit without success so I abandoned
it in favor of reviewing Ruby. It's a better use of my time, for now I
think. I'm hoping it will start clicking for me better tomorrow. It's
too early for me to be this frustrated. ;)

On Tue, Aug 5, 2014 at 8:53 PM, Andrea Ortega-Williams
<williamsfilms@gmail.com> wrote:
> did you guys have any luck with the extra credit? i got nothing..... started
> a few different approaches but got stumped on each one.....
>
> pls send it my way if you've got something that works! i'd love to take a
> look at it.
>
> thanks,
> a
>
>
> On Tue, Aug 5, 2014 at 5:42 PM, Andrea Ortega-Williams
> <williamsfilms@gmail.com> wrote:
>>
>> trunk = []
>> items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag",
>> "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]
>> index = 0
>> puts "Do you want to add an item?"
>> user_response = gets.chomp
>>
>> while user_response == "yes" && index < 6
>> trunk.push(items[index]) #this is to add just one item at at time
>> index += 1
>> if index < 6
>> puts "do you want to add an item?"
>> user_response = gets.chomp
>> else puts "Trunk is full!"
>> end
>> end
>>
>>
>>
>>
>>
>>
>>
>