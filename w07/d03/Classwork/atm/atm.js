// var action = "deposit";
// var accountType = "checking";
// var amount = 1200;


//connect this js file to the UI
//first problem to solve - how to add a deposit to checking.
//When the user inputs an amount, we need to add it to the account checking div class.
/*
if (accountType == "checking") {
  balance = getCurrentChecking();
  console.log("balance starting out at " + balance)
} else {
  balance = getCurrentSavings();
  console.log("balance starting out at " + balance)
}*/

var balance = document.getElementsByClassName("balance");
var checking = balance[0];
var savings = balance[1];

var checkingBalance = Number(balance[0].innerText.split("$")[1]);

var savingsBalance = Number(balance[1].innerText.split("$")[1]);

var deposits = document.getElementsByClassName("deposit");

var checkingDeposit = deposits[0];
var savingsDeposit = deposits[1];

var withdrawls = document.getElementsByClassName("withdraw");

var checkingWithdrawl = withdrawls[0];
var savingsWithdrawl = withdrawls[1];

var inputs = document.querySelectorAll("input");

var checkingInput = Number(inputs[0].value);
var savingsInput = Number(inputs[0].value);


checkingDeposit.addEventListener("click", function(){
var checkingBalance = Number(balance[0].innerText.split("$")[1]);
var checkingInput = Number(inputs[0].value);

var newBalance = checkingBalance + checkingInput
checking.innerText = "$" + newBalance
});

checkingWithdrawl.addEventListener("click", function() {
var checkingBalance = Number(balance[0].innerText.split("$")[1]);
var checkingInput = Number(inputs[0].value);
var savingsBalance = Number(balance[1].innerText.split("$")[1]);

if (checkingBalance < checkingInput && savingsBalance >= checkingInput){
  var overdraft = document.createElement("p");
  overdraft.innerText = "overdraft protection"
  checking.parentNode.appendChild(overdraft);
  var newBalance = savingsBalance - Math.abs(checkingBalance - checkingInput)
  checking.innerText = '$' + 0;
  savings.innerText = '$' + newBalance;

} else if (checkingBalance < checkingInput && savingsBalance < checkingInput){
 alert("You are broke, go get a job")

} else {
  var newBalance = checkingBalance - checkingInput;
  checking.innerText = '$' + newBalance;
}
});

savingsDeposit.addEventListener("click", function(){
  var savingsBalance = Number(balance[1].innerText.split("$")[1]);
  var savingsInput = Number(inputs[0].value);

  var newBalance = savingsBalance + savingsInput
  savings.innerText = "$" + newBalance

});

savingsWithdrawl.addEventListener("click", function(){
  var savingsBalance = Number(balance[1].innerText.split("$")[1]);
  var savingsInput = Number(inputs[0].value);

  var newBalance = savingsBalance - savingsInput;
  savings.innerText = '$' + newBalance;

});

/*if (action == "deposit") {

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

function getCurrentChecking() {
  //for now
  return 1000;
}

function getCurrentSavings() {
  //for now
  return 5000;  
}

function finishTransaction(balance) {
  //fs.writeFileSync('./' + accountType + '.txt', balance);
  console.log("You now have $" + balance + " in your " + accountType + " account");
}*/