var fs = require("fs");

var args = process.argv;

var command = args[2];

var account = args[3]

var amount = parseInt(args[4]);

if (command == "deposit") {
	if (account == "checking") {
		var checking_balance = parseInt(fs.readFileSync("./checking_balance.txt"))
		var new_checking_balance = (checking_balance + amount);
		console.log("Your new checking balance is $" + new_checking_balance)
		fs.writeFileSync("./checking_balance.txt", new_balance)
	} else if (account == "savings") {
		var savings_balance = parseInt(fs.readFileSync("./savings_balance.txt"))
		var new_savings_balance = (savings_balance + amount);
		console.log("Your new savings balance is $" + new_savings_balance)
		fs.writeFileSync("./savings_balance.txt", new_savings_balance)
		}
} else if (command == "withdraw") {
		if account == "savings" {
				var savings_balance = parseInt(fs.readFileSync("./savings_balance.txt"))
				if (savings_balance < amount) {
				console.log("You have insufficient funds")
			} else {
				var new_savings_balance = (savings_balance - amount);
				console.log("Your new savings balance is $" + new_savings_balance)
				fs.writeFileSync("./savings_balance.txt", new_savings_balance)
			} 
	} else if (account == "checking") {
		var savings_balance = parseInt(fs.readFileSync("./savings_balance.txt"))
		var checking_balance = parseInt(fs.readFileSync("./checking_balance.txt"))
			if (amount > (savings_balance + checking_balance)) {
				console.log("Insufficient funds")
			} else {
				var overDraft = amount - checking_balance;
				new_savings_balance = savings_balance - overDraft;
			}
	}
else {
	console.log("Invalid action.")
	}
 