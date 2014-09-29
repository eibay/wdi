// Create a function that takes a hash of favorite colors and uses Object.keys to print out "[name] favorite color is [color]" for each name

var people_hash = {
        "tim": "blue",
        "batman": "black",
        "flash": "red"
}

function favColors() {
  for(var value in people_hash) {
  console.log(value + " has a favorite color of " + people_hash[value]);
  }
}

favColors(people_hash)
