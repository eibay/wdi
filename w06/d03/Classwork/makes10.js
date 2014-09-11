var args = process.argv;

console.log(args);

function makes10(a,b) {
	if (a + b == 10) {
		console.log("true");
	} else if ((a + b) - 10 == a || (a + b) - 10 == b) {
		console.log("true");
	} else {
		console.log("false")
	};
};


makes10(parseInt(args[2]), parseInt(args[3]))

// makes10(9, 9)

// makes10(1, 9)
