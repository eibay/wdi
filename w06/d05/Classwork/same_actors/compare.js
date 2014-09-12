// var http = require('http');
var fs = require('fs');

var incep = fs.readFileSync("./inception.txt").toString()
var incepArr = incep.split(', ');

var titan = fs.readFileSync("./titanic.txt").toString()
var titanArr = titan.split(', ');

function find(arr1, arr2) {
	if ((arr1[0]) == (arr2[0])) {
		return arr1[0];
	}
	else {
		return 'no match';
	}
}

console.log(find(arr1, arr2));

// for ([initialization]; [condition]; [final-expression]) 
// statement

// Look in the instructors folder for 4 different solutions
i = 0
j = 0
while incepArr.length < i {
	while titanArr.length < j {
		if incepArr[i] == titanArr[j] {
			return incepArr[i]
		else 
			j++
		}
	}
	i++
}
