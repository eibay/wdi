var fs = require('fs')
var readline = require('readline');


var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var action = ""
var account = ""
var amount = 0
var savingsBal = Number(fs.readFileSync('./savings.txt'));
var checkingBal = Number(fs.readFileSync('./checking.txt'));

rl.question("Hello, what can I help you with? (withdraw or deposit) ", function(decision) {
	var action = decision;

	rl.question("Which account would you like to use? (checking or savings) ", function(accountChoice) {
		account = accountChoice;

		rl.question("Amount? ", function(amountChoice) {
			amount = amountChoice;
			rl.close();

			if (action == "deposit" && account == "checking") {
				newBalance = checkingBal + amount;
				fs.writeFile('./checking.txt', newBalance);
				console.log("Your current checking balance is " + newBalance);

			} else if (action == "withdraw" && account == "checking" && checkingBal < amount && savingsBal >= amount) {
				console.log("overdraft protection");

			} else if (action == "withdraw" && account == "checking") {
				newBalance = checkingBal - amount;
				fs.writeFile('./checking.txt', newBalance);
				console.log("Your current checking balance is " + newBalance);

			} else if (action == "deposit" && account == "savings") {
				newBalance = savingsBal + amount;
				fs.writeFile('./savings.txt', newBalance);
				console.log("Your current savings balance is " + newBalance);

			} else if (action == "withdraw" && account == "savings" && savingsBal < amount) {
				console.log("insufficient funds");

			} else if (action == "withdraw" && account == "savings") {
				newBalance = savingsBal - amount;
				fs.writeFile('./savings.txt', newBalance);
				console.log("Your current savings balance is " + newBalance);
			}
		})
	})
});