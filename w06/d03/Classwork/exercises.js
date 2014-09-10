function posNeg(a, b){
	// treat zero as positive  
	if(a < 0) {
		a = false; 
	} else {
		a = true; 
	}  

	if(b < 0) {
		b = false; 
	} else {
		b = true;  
	}

	// simulate XOR 
	return (( a && !b ) || ( !a && b )); 
}

function count_xx(str){
	var xxes = 0; 
	// length not method but property of str
	for(var i = 0; i < str.length; i++){
		if(str[i] === 'x' && str[i+1] === 'x'){
			xxes++; 
		} 
	}
	return xxes;
}