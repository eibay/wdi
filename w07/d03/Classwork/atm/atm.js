var fs = require('fs')

var commands = process.argv;
var savingsBal = Number(fs.readFileSync('./savings.txt'));
var checkingBal = Number(fs.readFileSync('./checking.txt'));

var action = commands[2];
var amount = Number(commands[3]);
var account = commands[4]

if (action == "deposit" && account == "checking") {
	newBalance = checkingBal + amount;
	fs.writeFile('./checking.txt', newBalance);
	console.log("Your current checking balance is " + newBalance);

} else if (action == "withdraw" && account == "checking" && checkingBal < amount && savingsBal >= amount) {
	console.log("overdraft protection");
	newBalance = savingsBal - Math.abs(checkingBal - amount)
  	console.log("Your current savings balance is " + newBalance); 

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



