// var fs = require("fs");
// var args = process.argv;
// var transaction = args[2];
// var amount = parseInt(args[3]);
// var account = args[4];
// var balanceChecking = parseInt(fs.readFileSync("./balancechecking.txt"))
// var balanceSavings = parseInt(fs.readFileSync("./balancesavings.txt"))
// var totalBalanceAfterWithdrawChecking = parseInt(balanceChecking) - amount
// var totalBalanceAfterDepositSavings = parseInt(balanceSavings) + amount
// var totalBalanceAfterWithdrawSavings = parseInt(balanceSavings) - amount
// var totalBalanceAfterDepositChecking = parseInt(balanceChecking) + amount
// var totalBalanceC = balanceSavings + amount
// var totalBalanceS = balanceSavings + amount

// var reportFundsChecking = function(balanceChecking){
// 	console.log("Your current balance in checking " + totalBalanceC)
// 	fs.writeFileSync("./balancechecking.txt", balanceChecking)
// }
// var reportFundsSavings = function(balanceSavings){
// 	console.log("Your current balance in savings is " + totalBalanceS)
// 	fs.writeFileSync("./balancesavings.txt", balanceSavings)
// }


// var compute = function(transaction, amount, account){
// 	if(transaction == "deposit" && account == "checking" ){
// 		totalBalanceC = balanceChecking + amount
// 		reportFundsChecking(totalBalanceAfterDepositChecking)
// 	}else if (transaction == "withdraw" && account == "checking"){
// 			if(totalBalanceAfterWithdrawChecking < 0){
// 				console.log("You have insufficient funds")
// 		}else if (totalBalanceAfterWithdrawChecking > 0){
// 				reportFundsChecking(totalBalanceAfterWithdrawChecking)
// 		}
// 	}
// 	if(transaction == "deposit" && account == "savings" ){
// 		totalBalanceS = balanceSavings + amount
// 		reportFundsSavings(totalBalanceAfterDepositSavings)
// 	}else if (transaction == "withdraw" && account == "savings"){
// 			if(totalBalanceAfterWithdrawSavings < 0){
// 				console.log("You have insufficient funds")
// 		}else if (totalBalanceAfterWithdrawSavings > 0){
// 				reportFundsSavings(totalBalanceAfterWithdrawSavings)
// 		}
// 	}

// };

// compute(transaction,amount,account)



var action = "deposit";
var amount = 50;
var accountType = "checking";
var saving_balance = 100;
var checking_balance = 100

if (action == "deposit") {

  balance = amount + balance;
  finishTransaction(balance);

} else if (action == "withdraw" && accountType == "savings") {

  if (amount > balance) {
    console.log("Insufficient funds");
  } else {
    balance = balance - amount;  
    finishTransaction(balance);
  }

} else if (action == "withdraw" && accountType == "checking") {
  if (amount > checking_balance) {
    // can savings cover it?
    var savingsBalance = 1000
    if (amount <= checking_balance + savingsBalance) {
      var overdraftAmount = amount - checking_balance;

      savingsBalance = savingsBalance - overdraftAmount;
      balance = 0;

      finishTransaction(balance);
    } else {
      console.log('Insufficient funds');
    }
  }
  else	{
  	checking_balance = checking_balance - amount;
  	finishTransaction(checking_balance)
  }
} else {
  console.log("Invalid action");
}

function finishTransaction(balance) {
  console.log("You have $" + balance + " in your account");
}



