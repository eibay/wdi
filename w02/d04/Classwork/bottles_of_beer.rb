beer = (1..9).to_a

b = 99
def bob(b)
  beer = (1..9).to_a
  # bottle = b
  while bottle <= beer.length && b > 0
    puts bottle
    bottle -= 1
  end
end

## using a while loop
while b <= beer.length && b > 0
   puts b
   b -= 1
end

## using the each iterator
beer = (1..99).to_a
beer.reverse.each {|x| puts "#{x} bottles of beer on the wall, #{x} bottles of beer!"
puts "You take one down, and pass it around... #{x -1} bottles of beer on the wall!" }
