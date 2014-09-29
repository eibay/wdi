

function inArray(array, num){
	for (var i=0;i<array.length;i++) {
		if (array[i]== num){
		return true
		}
	} return false
};

var arr= [1, 2, 3, 4]
var num= 4
var nums= 6


console.log(inArray(arr, num))
console.log(inArray(arr, nums))
