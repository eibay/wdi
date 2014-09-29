var command = process.argv[2]
var amount = parseInt(process.argv[3])
var account_type = process.argv[4]
var fs = require('fs');
var checking = parseInt(fs.readFileSync('./account.txt'))
var savings = parseInt(fs.readFileSync('./savings.txt'))

if (command == "deposit") {
	account_type += amount
	console.log(amount + " deposited. your current balance is " + account_type)
}

else if (command == "withdraw" && amount <= balance){
	balance -= amount
	console.log(amount + " withdrawn. your current balance is " + balance)
}

else if (command == "withdraw" && amount >= balance){
	console.log("You only have " + balance + ", time to get a job.")
}

else if (command == "balance"){
	console.log(balance)
}

