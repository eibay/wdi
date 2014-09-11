// def sum_ten(x, y)
// if (x == 10 || y == 10) || x + y == 10
// return true
// else
// return false
// end
// end

function sumTen(x, y) {
	if ((x == 10 || y == 10) || x + y == 10) {
		console.log(true);
	} else {
		console.log(false);
	};

}; 

sumTen(9, 10)
// true
sumTen(9, 9)
// false
sumTen(1, 9)
// true