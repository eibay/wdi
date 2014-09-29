function namer(array){
	var newArray = [];
	for(var i = 0; i < array.length; i++){
		newArray.push("Hello " + array[i]);
	};

	return newArray;
};

var namesArray = ["Neel", "Jeff", "Sean"];

// calling with an array set to a variable
console.log(namer(namesArray));

// calling by passing an array directly into function
console.log(namer(["Arya", "Rob", "Jon"]));

