
function joke(){
  return "joke"
}

function nameFunction(name){
  return "hello"+ name
}

function nameArray(arrayOfNames){
  for(var i=0; i < arrayOfNames.length; i++){
    console.log("hello"+arrayOfNames[i])
  }
}

function arrayName(arrayOfNames){
  newArray = []
  for(var i=0; i < arrayOfNames.length; i++){
    newArray.push("hello"+arrayOfNames[i])

  }
  return newArray
}

function double(number){
  return (2 * number)
}

function quadruple(number){
  var newNumber = double(number)
  return double(newNumber)

}

var hash = {}
hash.Tracy = "blue"
hash.Tejal = "orange"
hash.Sonny = "pink"

function hashStuff(hash){
  var keys = Object.keys(hash)
  var values = keys.map(function(v) { return hash[v]; });
  for (var i = 0; i < keys.length; i++){
    console.log(keys[i] + " fav color is "+ values[i])
  }

}

function combine(hash1, hash2){
  var keys = Object.keys(hash1)
  for  (var i = 0; i < keys.length; i++){
  hash2[keys[i]] = hash1[keys[i]]
}
}

