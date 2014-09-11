
function ten(int1, int2) {
	if (int1 + int2 == 10) {
		return true;
	}	else if ((int1 == 10) || (int2 == 10)) {
		return true;
	}	else {
		return false;
	}
}

console.log(ten(9, 10));
console.log(ten(9, 9));
console.log(ten(1, 9));