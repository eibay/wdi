// Create a function that takes two hashes and combines the elements

hash_one = {
  "hello": "world",
  "I'm": "batman",
  "I am being": "serious"
}

hash_two = {
  "no": "really",
  "I am": "the batman",
  "legit": "dude"
}

function truth(one, two) {
    var mixedHash = {}
    for (var attrname in one) { mixedHash[attrname] = one[attrname]; }
    for (var attrname in two) { mixedHash[attrname] = two[attrname]; }
  console.log(mixedHash)
}

truth(hash_one, hash_two)
