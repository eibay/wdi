var args = process.argv
var fs = require('fs')
var words = []
for (var i=2; i < args.length; i++){
	var txt = fs.readFileSync(args[i]);
	words.push(txt)
}
console.log(words.join(""))