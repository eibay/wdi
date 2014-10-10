# Create a function that takes two hashes and combines the elements

hash_one = {
  "hello" => "world",
  "I'm" => "batman",
  "I am being" => "serious"
}

hash_two = {
  "no" => "really",
  "I am" => "the batman",
  "legit" => "dude"
}

def truth(one, two)
    mixed_hash = one.merge(two) {|key, first, second| first + " " + second }
  puts mixed_hash
end

truth(hash_one, hash_two)