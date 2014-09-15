var args = process.argv

var inBetween = function(x, y) {
	var counter = x
	while (counter < y - 1) {
		counter+=1
		console.log(counter)
	}
};

inBetween(parseInt(args[2]), parseInt(args[3]))
