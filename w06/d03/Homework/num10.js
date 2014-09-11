var args = process.argv
var friends = [args[2], args[3], args[4], args[5], args[6], args[7]]
var actor = friends[Math.floor(Math.random() * friends.length)];

console.log(actor)