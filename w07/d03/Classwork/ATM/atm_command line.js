var args = process.argv;
var transaction = args[2];
var ammount = parseInt(args[3]);
var account = args[4];


var fs = require ("fs");



function account_type(account){

	if (account == "savings"){
		var savings_balance =  parseInt(fs.readFileSync("./savings_balance.txt"));
		compute(transaction, ammount, savings_balance);
		fs.writeFileSync("./savings_balance.txt", savings_balance);
	}


	else if (account == "checking"){
		var checking_balance =  parseInt(fs.readFileSync("./checking_balance.txt"));
		compute(transaction, ammount, checking_balance);
		fs.writeFileSync("./checking_balance.txt", checking_balance);
	}
}


function compute(transaction, ammount, balance){
 if (transaction == "deposit"){
 	var current_total = balance + ammount
	reportFunds(current_total)
 }
 else if (transaction == "withdraw"){
 	var current_total = balance - ammount
	reportFunds(current_total)
 }
}

var reportFunds = function(balance){
 console.log("You curent balance is " + balance)
}
account_type(account)

