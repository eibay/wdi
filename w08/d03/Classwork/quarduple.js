// Create a function double that takes a number as an argument and returns it doubled
function double(x){
	return x * 2
} 

console.log(double(4))



// Create a function quadruple that uses double - ie quadruple(4) === 16



function quadruple(x){
	return double(x) + double(x)
}

console.log(quadruple(4))