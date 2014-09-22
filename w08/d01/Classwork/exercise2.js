// 2. write a function ```howbig``` that takes a string as a parameter. The function returns:
//   - "small" if the string is less than 3 characters long
//   - "medium" if it is between 3 and 5 characters long
//   - "big" if it is greater than 5 characters long

var howbig = function(string){
	if(string.length < 3){
		console.log("small");
	}
	else if (string.length >= 3 && string.length <= 5){
		console.log("medium");
	}
	else if (string.length > 5){
		console.log("big");
	}
};

howbig("small");