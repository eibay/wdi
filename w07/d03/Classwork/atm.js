var fs = require('fs')

var action = process.argv[2];
var amount = Number(process.argv[3]);
var account = process.argv[4];
var balanceChecking = Number(fs.readFileSync("./balanceChecking.txt"));
var balanceSaving = Number(fs.readFileSync("./balanceSaving.txt"));
//convert to Number at top

// console.log("action: " + action);
// console.log("amount: " + amount);
function printBalance(startOrEnd, balance) {
	console.log(account + " " + startOrEnd + "ing balance: " + balance)
}


// setting account and file
if (account == "checking") {
	var balance = balanceChecking
	var file = './balanceChecking.txt'
} else if (account == "saving") {
	var balance = balanceSaving
	var file = './balanceSaving.txt'
}


//update logic
if(action == "deposit") {

	printBalance("start", balance)
	balance = balance + amount

	fs.writeFile(file, balance)
	printBalance("end", balance)

} else if (action == "withdraw") {
	if (amount > balance && account == "checking") {
		var balanceSaving = Number(fs.readFileSync("./balanceSaving.txt"))
		if (amount - balance > balanceSaving) {
			console.log("insufficient funds")
		} else {
			balanceSaving = balanceSaving - amount + balance
			fs.writeFile('./balanceSaving.txt', balance)
			balance = 0
			fs.writeFile(file, balance)

			console.log("checking ending balance: " + balance)
			console.log("saving ending balance: " + balanceSaving)
		}

	} else if (amount > balance) {
		console.log("insufficient funds")
		console.log('ending balance: ' + balance)
	} else {
		printBalance("start", balance)
		balance = balance - amount

		fs.writeFile(file, balance)
		printBalance("end", balance)
	}
	
}



// if(action == "deposit") {
// 	printBalance("start", balance)
// 	balance = balance + amount

// 	fs.writeFile('./data.txt', balance)
// 	printBalance("end", balance)

// } else if (action == "withdraw") {
// 	if (amount > balance) {
// 		console.log("insufficient funds")
// 		console.log('ending balance: ' + balance)
// 	} else {
// 		printBalance("start", balance)
// 		balance = balance - amount
// 		fs.writeFile('./data.txt', balance)
// 		printBalance("end", balance)
// 	}
	
// }





















// var fs = require('fs')


// var args = process.argv

// var balance = fs.readFileSync("./data.txt")


// function update(amt) {
	
// 	balance = balance + amt
// 	balance = fs.writeFile("./data.txt")
// 	console.log("new balance: " + balance)
// }

// update(parseInt(args[2]));










// var deposit = function(amt) {
// 	balance = fs.readFileSync("./data.txt")
// 	balance = balance + amt
// 	balance = fs.writeFile("./data.txt")
// }

// var withdraw = function(amt) {
// 	balance = fs.readFileSync("./data.txt")
// 	balance = balance - amt
// 	balance = fs.writeFile("./data.txt")
// }

