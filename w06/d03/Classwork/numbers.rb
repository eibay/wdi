# Given 2 integers, return true if one is negative and one is positive.

# Pseudocode
#  - If statements to check the first number against the second and then output diff puts statements based on scenario.

    def pos_neg(x, y)
      if x > 0 && y > 0
        true
      elsif x < 0 && y > 0
        true
      elsif x > 0 && y < 0
        true
      elsif x < 0 && y < 0
        false
      end
      end

puts pos_neg(1, 2)
puts pos_neg(1, -1)
puts pos_neg(-2, -2)
puts pos_neg(-1, 1)





