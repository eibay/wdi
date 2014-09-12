var args = process.argv

var inBetween = function(num1, num2){

	for (var i = 1; i < num2; i++){
		console.log(num1 + i)
	};

};

inBetween(parseInt(args[2]), parseInt(args[3]));