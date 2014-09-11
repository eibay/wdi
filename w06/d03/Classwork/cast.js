args=process.argv
function rand_array(array) {

	 var rand=Math.floor(Math.random() * (cast.length));
	 console.log(array[rand])
}

cast=["Matthew Perry", "Jennifer Anniston", "Courtney Cox", "David Schwimmer", "Matt LeBlanc", "Lisa Kudrow"];

if(args[2]=="cast"){

	rand_array(cast)

}

