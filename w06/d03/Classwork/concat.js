var args = process.argv.slice(2);
var i = 0
var array = []
while (i < args.length) { 
	array.push(args[i]); 
	i +=1
};

console.log(array.join(""))

