def twisted (n)
  i = 1
  while i < n
    if i % 3 == 0 && i % 5 != 0
      puts i
    elsif  i % 5 == 0 && i % 3 != 0 
      puts i
        
  end
  i  += 1
end
end


#othersolution

def twisted_fizbuzz(num)
  i = num - 1
  while i < 0
     if i % 3 == 0 && i % 5 != 0
      puts i
    elsif  i % 5 == 0 && i % 3 != 0 
      puts i
        
  end


    i -= 1

    end
  end