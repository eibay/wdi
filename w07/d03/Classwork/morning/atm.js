

var fs = require("fs")

var command = process.argv[2];

var amount = parseInt(process.argv[3]);

var accountType = process.argv[4];

var balances = fs.readFileSync("./account.txt", "UTF8").split("/");

for (i = 0; i < balances.length; i++){balances[i] = parseInt(balances[i])};

function banking(account){

	if (account == "checking") {var balance = balances[0]};
	if (account == "savings") {var balance = balances[1]};

	if (account == "checking" && amount > balance && amount < balances[2]) {
		balances[2] -= amount;
		balances[1] = balances[2];
		balances[0] = 0;
		console.log("You have overdrawn your checking account.  Your savings account has beed debited the difference.")
		console.log("Your total in savings is now " + balances[2] + " dollars.")
		debugger;
	}

	else if (command == "withdraw") {
		if (amount > balance) {
			console.log("insufficient funds, transaction cancelled")
		}
		else {
			balance -= amount;
			console.log("You have " + balance + " dollars in your " + accountType + " account");
		}
	}

	else if (command == "deposit") {
		balance += amount;
		console.log("You have " + balance + " dollars in your " + accountType + " account");
	}

	else if (command == "balance") {
		var balance = balances[2];
		console.log("You have " + balance + " dollars in your " + accountType + " account");
		console.log("It was nice of you to stop by to say hello");
	}

	var total = balances[0] + balances[1]
	fs.writeFileSync("./account.txt", (balances[0] + "/" + balances[1] + "/" + total))
}

banking(accountType)


