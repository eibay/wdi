numbers = {"Conor Hastings" => "5167214019" , "John Fakeguy" => "5555555555"}




test = numbers.select { |key, val| val == "5167214019" }
puts test