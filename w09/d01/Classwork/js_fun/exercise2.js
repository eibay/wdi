array_of_integers = [8,3,4];

function numbers(array_of_integers, integer){
	for (var i = 0; i < array_of_integers.length; i++){
		if (array_of_integers[i] != integer)
		return false;
	}
};
