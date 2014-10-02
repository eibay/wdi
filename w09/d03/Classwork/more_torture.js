// /*A function that takes 2 arrays and returns a combined array.*/

// var array1 = ["rice", "potatoes", "bread", "tortillas", "quinoa"]
// var array2 = ["beans", "lentils", "chickpeas", "kidney beans"]

// var array3 = array1.concat(array2);


// var array1 = ["rice", "potatoes", "bread", "tortillas", "quinoa"]
// var array2 = ["beans", "lentils", "chickpeas", "kidney beans"]
// var array3 = ["hot sauce", "coconut oil", "brewers yeast"]

// var array4 = array1.concat(array2).concat(array3);

//Join two arrays using combine
var array1 = ["rice", "potatoes", "bread", "tortillas", "quinoa"]
var array2 = ["beans", "lentils", "chickpeas"]
var array3 = ["hot sauce", "coconut oil"]


function twoArrays(x,y){

	var mixedArray = x
	for (var i=0; i < y.length; i++) {
     mixedArray.push( y[i] );
    }   
	return mixedArray;
 };

 var combination = twoArrays(array3, array2);
 var n = twoArrays(array1, combination);
 console.log(n)

