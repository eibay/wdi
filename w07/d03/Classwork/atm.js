var fs = require('fs');
var args = process.argv;
var action = args[2];
var amount = parseInt(args[3]);
var account = args[4];

var checking_balance= parseInt(fs.readFileSync('./checkingAccount.txt'));
var savings_balance = parseInt(fs.readFileSync('./savingsAccount.txt'));


if(account == 'checking'){

	if(action == 'deposit'){
		checking_balance += amount;
		finishTransaction(checking_balance, savings_balance)
	}else if(action =='withdraw'){

		if(checking_balance >= amount){
			checking_balance -= amount;
			finishTransaction(checking_balance, savings_balance);
		
		}else if(checking_balance < amount && checking_balance + savings_balance >= amount){
		
			var remainder = checking_balance - amount;
			checking_balance = 0;
			savings_balance += remainder;
			finishTransaction(checking_balance, savings_balance);

		}else{
			console.log('insufficient funds');
		}

	}else{
		console.log("error: action not recognized")
	};


}else if(account == 'savings'){
	if(action == 'deposit'){
		savings_balance += amount;
		finishTransaction(checking_balance, savings_balance)
	}else if(action =='withdraw'){

		if(savings_balance >= amount){
			savings_balance -= amount;
			finishTransaction(checking_balance, savings_balance);
		
		}else if(savings_balance < amount && savings_balance + checking_balance >= amount){
		
			var remainder = savings_balance - amount;
			savings_balance = 0;
			checking_balance += remainder;
			finishTransaction(checking_balance, savings_balance);

		}else{
			console.log('insufficient funds');
		}

	}else{
		console.log("error: action not recognized")
	};


}else{
	console.log("account doesn't exist")
};


function finishTransaction(checking_balance, savings_balance){
	fs.writeFileSync('./checkingAccount.txt', checking_balance);	
	fs.writeFileSync('./savingsAccount.txt', savings_balance);
	console.log("Checking Account balance: $" + checking_balance);
	console.log("Savings Account balance: $" + savings_balance);	
};































// var fs = require('fs');
// var args = process.argv;
// var action = args[2];
// var amount = parseInt(args[3]);

// var balance = parseInt(fs.readFileSync("./balance.txt"));


// if(action == "deposit"){
// 	balance += amount;

// 	console.log("$" + amount + ' deposited!');
// 	finishTransaction(balance);

// }else if(action == "withdraw"){
	
// 	if(balance >= amount){
// 		balance -= amount;
// 		console.log("$" + amount + ' withdrawn!')
// 		finishTransaction(balance);
// 	}else{
// 	console.log('insufficient funds!')
// 	};

// }else{
// 	console.log("error!")
// };



// function finishTransaction(balance){
// 	fs.writeFileSync('./balance.txt', balance)
// 	console.log("You now have $"+ balance + " in you account")
// };