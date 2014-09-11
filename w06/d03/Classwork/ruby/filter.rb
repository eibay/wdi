require 'pry'

def filter_long_words(num, word1, word2, word3, word4, word5) 
array = [word1, word2, word3, word4, word5]
array2 = []

x = 0

while num < array[x].length
array2 << array[x]

x = x + 1
	end
binding.pry
puts array2

end

filter_long_words(3, "hello", "hi", "hey", "hola", "aloha")