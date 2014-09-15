var args = process.argv

var makes10 = function(num1, num2){

	if (num1 == 10) {
		console.log(true);
	} else if (num2 == 10){
		console.log(true);
	} else if (num1 + num2 == 10){
		console.log(true);
	} else{
		console.log(false);
	};

};
debugger //node debug filename.js --- cont --- repl

makes10(parseInt(args[2]), parseInt(args[3]));