var action = "withdraw";
var accountType = "checking";
var amount = 120;
var balance = 1000;
var savingsBalance = 300;

// targets 
var display_check = document.querySelectorAll("div.balance")[0]
var display_sav = document.querySelectorAll("div.balance")[1]
var input_check = document.getElementsByName("amount")[0]
var input_sav = document.getElementsByName("amount")[1]
var dep_button_check = document.getElementsByClassName("deposit")[0]
var dep_button_sav = document.getElementsByClassName("deposit")[1]
var wdrw_button_check = document.getElementsByClassName("withdraw")[0]
var wdrw_button_sav = document.getElementsByClassName("withdraw")[1]

display_check = getCurrentChecking();
display_sav = getCurrentSavings();


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
  if (amount > balance) {
    // can savings cover it?
    var savingsBalance = getCurrentSavings();
    if (amount <= balance + savingsBalance) {
      var overdraftAmount = amount - balance;

      savingsBalance = savingsBalance - overdraftAmount;
      console.log('your savings balance is now ' + savingsBalance)
      balance = 0;

      finishTransaction(balance);
    } else {
      console.log('Insufficient funds');
    }
  } else {
    balance = balance - amount;
    finishTransaction(balance);
  }
} else {
  console.log("Invalid action");
}

// display checking balance
function getCurrentChecking() {
  display_check.innerText = balance;
}

// display savings balance
function getCurrentSavings() {
  display_sav.innerText = savingsBalance;
}

function finishTransaction(balance) {
  //fs.writeFileSync('./' + accountType + '.txt', balance);
  console.log("You now have $" + balance + " in your " + accountType + " account");
}