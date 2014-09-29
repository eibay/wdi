var namesArray = ["Neel", "Jeff", "Sean"];

function namer(arrayOfNames){
	for(var i = 0; i < arrayOfNames.length; i++){
		console.log(arrayOfNames[i]);
	};
};

// calling with an array set to a variable
namer(namesArray);

// calling by passing an array directly into function
namer(["Arya", "Rob", "Jon"]);
