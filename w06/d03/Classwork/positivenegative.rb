# Given 2 integers, return true 
# if one is negative and one is positive.

  # ```javascript
  # posNeg(1, -1)
  # // true
  # posNeg(-1, 1)
  # // true
  # posNeg(-4, -5)
  # // false
  # ```


  def truefalse(one, two)
  	if one < 0 || two < 0
		return true
  	elsif one < 0 && two < 0 
  		return false
	else
		return false
  	end
 end
  		