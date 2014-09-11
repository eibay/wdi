function ten(a, b){
	if (a == 10 || b == 10){
		return true
	} else if (a + b == 10){
		return true
	} else {
		return false
	}
}

console.log(ten(3, 7));
console.log(ten(9, 9));
console.log(ten(10, 10000));

