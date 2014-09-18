// var fs = require('fs');

// var action = process.argv[2];
// var amount = parseInt(process.argv[3]);
// var account = process.argv[4];

// var balance = 0;

function get_balance(which) {
	// balance = parseInt(fs.readFileSync(which + '.txt'));
	return balance
}

function new_balance(which, number) {
	// fs.writeFile(which + '.txt', number.toString());
}

function report_balance(which) {
	// console.log("You have " + balance.toString() + " in your " + which + " account");
}

function deposit(which) {
	get_balance(which);
	balance += amount;
	new_balance(which, balance);
	report_balance(which);
}

function withdraw(which) {
	get_balance(which);
	if (which == "savings" && amount > balance) {
		// console.log("Insufficient funds, you only have " + balance.toString() + " in " + which);
	} else if (which == "checking" && amount > balance) {
		amount -= balance;
		balance = 0;
		new_balance("checking", balance);
		report_balance("checking");
		withdraw("savings");
	}else {
		balance -= amount;
		new_balance(which, balance);
		report_balance(which)
	}
}

if (action == "deposit") {
	deposit(account);
} else if (action == "withdraw") {
	withdraw(account);
} else {
	console.log("You can't do that!");
}

