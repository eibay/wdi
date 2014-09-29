// Create a function quadruple that uses double - ie quadruple(4) === 16

function double(num) {
	return (num * 2)
};

function quadruple(num) {
	return (double(num) + double(num))
};

console.log(quadruple(4));



