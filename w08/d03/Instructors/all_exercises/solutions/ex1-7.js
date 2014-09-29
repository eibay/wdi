var people = {
	"Neel": "Orange",
	"Sean": "Blue",
	"Jeff": "Red"
};

function colors(hashOfPeople){
	var keysArray = Object.keys(hashOfPeople);

	for(var i = 0; i < keysArray.length; i++){
		console.log(keysArray[i] + "'s favorite color is " + hashOfPeople[keysArray[i]]);
	};
};

colors(people);