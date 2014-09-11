var args = process.argv
var words = []
for (var i=2; i < args.length; i++){
	words.push(args[i])
}
console.log(words.join(""))