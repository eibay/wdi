function double(num){
	return num * 2;
};

function quadruple(num){
	return (double(num) + double(num));
};

console.log(quadruple(4));
console.log(quadruple(5));
console.log(quadruple(3));
