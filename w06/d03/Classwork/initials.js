var args = process.argv

var initials = function(string){

	var names = string.split(' ');
	var initials = "";

	for (var i = 0; i <= names.length -1; i++){
		
		initials += names[i][0];
	};

	console.log(initials);
};


initials(args[2]);