//Part 1

var posNeg = function(x, y) {

	if (x < 0 && y > 0) {
		return true;
	} else if (x > 0 && y < 0){
		return true;
	} else{
		return false;
	};

};



var posNeg = function(x, y, boolean) {

	if (x < 0 && y > 0 && boolean == false) {
		return true;
	} else if (x > 0 && y < 0 && boolean == false){
		return true;
	} else if (x < 0 && y < 0 && boolean == true){
		return true;
	} else {
		return false;
	};

};


//PART 2

var countX = function(string){
	
	var i = 0;
	var count = 0;

	while (i < string.length) {
		if (string[i] == 'x' && string [i + 1] == 'x'){
			var count + 1
		};
		
		var i + 1;

	return var count;

	};
};










