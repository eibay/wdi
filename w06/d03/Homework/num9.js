var initials = function(string){
	var arr = string.split(" ")
	var inits = []
	for (var i=0; i < arr.length; i++){
		inits.push(arr[i][0]);
	}
	inits = inits.join('')
	console.log(inits)
}

initials('Neel Jayendra Patel');