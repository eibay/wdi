def posNeg(num1, num2)
  if num1 < 0 
    num1 = "negative"
  else num1 = "positive"
  end

   if num2 < 0 
    num2 = "negative"
  else num2 = "positive"
  end

  if (num2 == "positive" && num1 == "negative") || (num2 == "negative" && num1 == "positive")
    return true
  else
    return false
  end
end

def count(string)
  string.scan(/xx/).count
end


