function oneHashToAnother(hash, newHash){
	var keysArray = Object.keys(hash);

	for(var i = 0; i < keysArray.length; i++){
		newHash[keysArray[i]] = hash[keysArray[i]]
	};

	return newHash;

};

function hashMash(hashOne, hashTwo){
	var combinedHash = {};

	oneHashToAnother(hashOne, combinedHash);
	oneHashToAnother(hashTwo, combinedHash);

	return combinedHash;
};

var people = {
	"Neel": "Orange",
	"Sean": "Blue",
	"Jeff": "Red"
};

var cats = {
	"Tom": "Magenta",
	"Leroy": "Cyan",
	"Homer": "Lilac"
};

//calling with hashes set to variables
console.log(hashMash(people, cats));

//calling by passing hashes directly in
console.log(
	hashMash(
		{
			"Jon": "White",
			"Arya": "Orange",
			"Sansa": "Pink"
		},
		{
			"Bran": "Green",
			"Ned": "Blue",
			"Rob": "Red"
		}
	)
);