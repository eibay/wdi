// function returnJoke(){

// 	return "my joke"

// };


// function helloName(name){
// 	return "hello" + name;
// };


// function helloArray(nameArray){

// for (var i=0; i<nameArray.length; i++){
// 		console.log("hello name")
// 	};

// };


// function helloName(nameArray){

// 	for (var i=0; i<nameArray.length; i++){
// 		console.log("hello " + nameArray[i])
// 	};

// };


// function double(number){
// 	return number * 2;
// };

// function quadruple(number){
// 	return double(number) * 2;
// };

var favColors = {
	yosh: 'green',
	jet: 'purple',
	holly: 'blue'
};

// function returnKeys(someHash){
// 	var names = Object.keys(someHash);
// 	for(var i = 0; i < names.length; i++){
// 		console.log(names[i] + "'s favorite color is " + someHash[names[i]]);
// 	};

// };

// returnKeys(favColors)

var moreFavs = {
	sak: 'orange'
}



function returnKeys(hash1, hash2){

	var keysArray1= []
	var keysArray2 = []
	var newHash={}
	
	for(var i = 0; i<hash1.length; i++){
		keysArray1 += Object.keys(hash1)
	};

	for(var i = 0; i<hash2.length; i++){
		keysArray2 += Object.keys(hash2)
	};

	for (var i = 0; i < hash1.length; i++){
		newHash += {keysArray1[i] = hash1[keysArray1]}
	}

	for (var i = 0; i < hash2.length; i++){
		newHash += {keysArray2[i] = hash2[keysArray1]}
	}
	
	return newHash

}









