function posNeg(a, b, opt){
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

	// add option to return true only if both
	// are negative  

	if(!opt) { 
		// simulate XOR 
		return (( a && !b ) || ( !a && b )); 
	} else {
		return ((!a) && (!b))  
	}
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

function makesTen(a, b){
	if(a == 10 || b == 10){
		return true; 
	} else {
		return (a + b == 10); 
	}
}

function withoutEnd(str){
	 return str.substring(1,str.length-1);  
}

function makeTags(tagName, textNode){
	var opening = "<" + tagName + ">";
	var closing = "</" + tagName + ">";
	return opening + textNode + closing;  
}

function maxOfThree(a, b, c){
	// I remember Math.max(a, b, c) but  
	if (a < b){
		if(b < c){
			return c; 
		} else {
			return b; 
		}
	} else {
		if(a < c){
			return c;
		} else {
			return a; 
		}
	}
}

function filterLongWords(l, arr){
	var return_array = [];
	for(var i = 0; i < arr.length; i++){
		if(arr[i].length > l){
			return_array.push(arr[i]); 
		}
	}
	return return_array; 
}

function initials(fullName){
	names = fullName.split(' ');
	initials_array = [];
	for(var i = 0; i < names.length; i++){
		var name = names[i]; 
		var initial = name[0].toUpperCase(); 
		initials_array.push(initial); 
	}
	return initials_array.join(''); 
}