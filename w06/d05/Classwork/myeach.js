var friends=["Matt LeBlanc", "Courtney Cox", "Jennifer Aniston", "David Schwimmer", "Lisa Kudrow", "Matthew Perry"]


var myEach=function(array, myfunction){


	for(i=0; i < array.length; i++)
	{

		myfunction(array[i]);

	}
}

var love=function(friend) {

	console.log("I love "+ friend);
}
myEach(friends, love)











