var args = process.argv

var makes10 = function(num1, num2){

	if (num1 == 10) {
		return true;
	} else if (num2 == 10){
		return true;
	} else if (num1 + num2 == 10){
		return true;
	} else{
		return false;
	};

};


makes10(parseInt(args[2]), parseInt(args[3]));