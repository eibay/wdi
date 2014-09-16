var fs = require("fs");
var crypto = require('crypto');
var first = JSON.parse(fs.readFileSync('./first_names.txt'));
var last = JSON.parse(fs.readFileSync('./last_names.txt'));
var breed = JSON.parse(fs.readFileSync('./breeds.txt'));

function createRandom() {
		var x = Math.floor(Math.random() * 20);
		var y = Math.floor(Math.random() * 20);
		var z = Math.floor(Math.random() * 20);

		function randomValueHex (len) {
    		return crypto.randomBytes(Math.ceil(len/2))
        .toString('hex') 
        .slice(0,len);
				}

		var random_dog = {};
		random_dog["first"] = first[x];
		random_dog["last"] = last[y];
		random_dog["breed"] = breed[z];
		random_dog["id"] = randomValueHex(7)
		

		// var random_array = JSON.parse(fs.readFileSync("./array_of_hashes.txt"));
		// random_array = random_array.push(random_dog);
		// fs.writeFileSync("./array_of_hashes.txt", JSON.stringify(random_array));

		var msg = JSON.stringify(random_dog);
		return msg
	}
console.log(createRandom())