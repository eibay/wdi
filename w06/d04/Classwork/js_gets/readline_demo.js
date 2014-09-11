var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var user_arr = []

rl.question("What's your name?\n", function(answer) {

	user_arr.push(answer);

	rl.question("Thank you.\nAnd, where do you live?\n", function(answer){

		user_arr.push(answer);

		rl.question("That's very interesting.  Where should I go to  get tacos there?\n", function(answer) {

			user_arr.push(answer);
			console.log(user_arr);

			rl.close();
		})
	})
})

process.exit