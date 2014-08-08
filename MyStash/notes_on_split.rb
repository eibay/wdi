puts " now's  the time".split        #=> ["now's", "the", "time"]
puts " now's  the time".split(' ')   #=> ["now's", "the", "time"]
puts " now's  the time".split(/ /)   #=> ["", "now's", "", "the", "time"]
puts "1, 2.34,56, 7".split(%r{,\s*}) #=> ["1", "2.34", "56", "7"]
puts "hello".split(//)               #=> ["h", "e", "l", "l", "o"]
puts "hello".split(//, 3)            #=> ["h", "e", "llo"]
puts "hi mom".split(%r{\s*})         #=> ["h", "i", "m", "o", "m"]

puts "mellow yellow".split("ello")   #=> ["m", "w y", "w"]
puts "1,2,,3,4,,".split(',')         #=> ["1", "2", "", "3", "4"]
puts "1,2,,3,4,,".split(',', 4)      #=> ["1", "2", "", "3,4,,"]
puts "1,2,,3,4,,".split(',', -4)     #=> ["1", "2", "", "3", "4", "", ""]

puts "".split(',', -1)               #=> []


name_email = ["Sean West", "sean.west@generalassemb.ly"]





name_test
first.last 
DATA			PATTERN
first.last == first.last
first.last == first 
first.last == firstlast 
sean.west == first_initiallast 
doesnt match any patterns





# str = "sean.west"
# str2 = "seanwest"

first = "sean"
last = "west"