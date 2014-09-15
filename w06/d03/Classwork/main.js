//process.argv => ["node", "main.js", "hello", "world"]



console.log(process.argv)
var args = process.argv;
var name = args[1]
process.argv => ["main.js", "name"]
console.log("hello" + name)