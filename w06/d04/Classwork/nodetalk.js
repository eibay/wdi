var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

hash = {}

rl.question("What is your first name? ", function(name) {
	hash["name"] = name;

	rl.question("How old are you? ", function(age) {
		hash["age"] = age;

		rl.question("Where do you live? ", function(city) {
			hash["city"] = city;
			rl.close();

			console.log(hash);
		})
	})
});

// function gets(key, question, answer) {
// 	hash[key] = answer
// }

// gets("name", rl.question("What is your first name? ", function(name))
	