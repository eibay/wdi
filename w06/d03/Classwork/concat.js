#!/usr/local/bin/node
args=process.argv


 

// function concat(array){
// concat_array=[]
// for (i=2; i < array.length; i++){
// 	read=Filereader.new
// 	concat_array.push(read.readAsText(args[i]))
// }
// return concat_array.join("")
// }
// console.log(concat(args))

	concat_array=[]
var fs = require('fs')
for (var i=2; i < args.length; i++){
var file = fs.readFileSync(args[i]);
	concat_array.push(file)
}
console.log(concat_array.join(""))
	var to_write=fs.createWriteStream('output.txt');
	to_write.write(concat_array.join(""))
