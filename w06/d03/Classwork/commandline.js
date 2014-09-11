// var args = process.argv
// var num1 = parseInt(args[2])
// var num2 = parseInt(args[3])

// function between(num1,num2) {
// var i = 1
// while (i < num2 ) {
//   console.log(num1+i)
//   i += 1
// }};

// console.log(between(num1, num2))


// var args = process.argv
// function conc(args) {
// var words = args.slice(2)
// console.log(words.join(''))
// }
// console.log(conc(args))


var args = process.argv

var text = args.slice(2)

function con(text){
var filename = []
var i = 0
while (i < text.length) {
var fs = require("fs")
filename.push(fs.readFileSync(text[i]).toString())
i += 1
}
return filename.join('')
}

console.log(con(text))

