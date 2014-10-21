def twisted_fizzbuzz(num)
  i = num - 1

  while i > 0 

    if (i % 3 == 0) && (i % 5 == 0)
      ## do nothing
    elsif i % 3 == 0
      puts i
    elsif i % 5 == 0
      puts i
    end

    i -= 1
  end
end