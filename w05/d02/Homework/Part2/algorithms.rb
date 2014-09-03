

# 1 Count the number of "xx" in the given string. We'll say that overlapping is allowed, so "xxx" contains 2 "xx".
def count_xx(string)
  spling = string.split("")
  i = 0
  count = 0

  while i < string.length
    if spling[i] == "x" && spling[i+1] == "x"
      count += 1
    end
    i += 1
  end
  return count

end

# 2 

###### small version -- no accounting for wasted big bars ######
def make_chocolate(small, big, goal)
  kilo_b = big * 5
  kilo_s = small * 1
  # kilo_total = 0
  # kilo_total += big
  required_s = goal - kilo_b

  if required_s <= kilo_s
    return required_s
  else
    return kilo_s - required_s
  end

end

##### big version -- conservers big bars, no food wastage ######
def make_chocolate(small, big, goal)
  kilo_b = big * 5
  kilo_s = small * 1
  # kilo_total = 0
  # kilo_total += big
  while kilo_b > goal
    kilo_b -= 5
  end

  used_big = kilo_b / 5

  required_s = goal - kilo_b

  if required_s <= kilo_s
    # return required_s
    puts "#{required_s} small bars used, #{used_big} out of #{big} big bars used, #{big-used_big} big bar remaining."

  else
    # return kilo_s - required_s
    puts "#{kilo_s - required_s} small bars. I.e. #{-1*(kilo_s - required_s)} small bars still needed."
  end

end



#### jeff version ####
# def make_chocolate(small, big, goal_weight)
#   big_bars_used = goal_weight / 5
#   # cond_a -> (3, 3, 11)
#   # big_bars_used = 2.x


#   small_bars_used = goal_weight - (big_bars_used * 5)
#   # small_bars_used = 11 - 10 == 1


#   if small_bars_used > small || big_bars_used > big
#     return -1
#   else
#     return small_bars_used
#   end
# end








#3
def zeroFront(array)
  ary_zero = []

  array.each do |x|
    ary_zero << x if x == 0
  end

  array.each do |x|
    ary_zero << x if x != 0
  end

  return ary_zero
end


#4
alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]

def countr(string, alphabet)
  spling = string.split("")
  value = 0

  spling.each do |elmt|
    alphabet.each do |letter|
      if elmt == letter
        value += alphabet.index(letter) + 1
      end
    end
  end
  return value
end


#5
def palindrome(string)
  string_rev = string.reverse
  if string == string_rev
    return true
  else
    return false
  end
end





