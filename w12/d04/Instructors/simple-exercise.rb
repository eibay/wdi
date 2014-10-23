def assert_equal(actual, expected)
  if actual != expected
    raise "Expected #{expected} but #{actual} was given"
  else
    puts "PASS"
  end
end

assert_equal("monkey", "monkey")

def compare_string(letters, word)
  letter_arr = letters.split('')
  word_arr = word.split('')

  word_arr.each do |l|
    if (i = letter_arr.index(l))
      letter_arr.slice!(i, 1)
    else
      return false
    end
  end

  return true
end

assert_equal(compare_string("arpkln", "park"), true)
assert_equal(compare_string("", "park"), false)
assert_equal(compare_string("arkln", "park"), false)
assert_equal(compare_string("banana", "banana"), true)
assert_equal(compare_string("labp", "ball"), false)

