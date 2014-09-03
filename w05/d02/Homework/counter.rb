def countr(string)
  values = []
  alph = ('a'..'z').to_a
  letters = string.split('')
  letters.each do |letter|
  value = alph.index(letter)+1
  values << value
  end
  sum = 0
  values.each do |value|
  sum += value
  end
return sum
end
