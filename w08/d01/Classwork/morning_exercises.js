var arg = process.argv;
var one = arg[2];
var two = arg[3];

function makeArray(one, two) {
	console.log(one.concat(two));
};

// makeArray(one, two);

function howBig(str) {
	if (str.length<3) {
		console.log('small');
	} else if (3<str.length<5) {
		console.log('medium');
	} else {
		console.log('big');
	};
};

howBig('goasdfasdf');