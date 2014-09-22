var arg = process.argv;
var one = arg[2];
var two = arg[3];

function makeArray(one, two) {
	console.log(one.concat(two));
};

makeArray(one, two);