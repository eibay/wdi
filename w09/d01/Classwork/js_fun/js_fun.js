function octopus(arrayOfIntegers, integer){
	for(var i=0; i<arrayOfIntegers.length; i++){
		if(arrayOfIntegers[i] == integer){
			return true;
		} else {
			return false;
		}
	}	
}

console.log(octopus([1,2,3], 1));

console.log(octopus([1,2,3], 4));


