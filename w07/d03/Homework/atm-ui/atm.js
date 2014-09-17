// var action = "withdraw";
// var accountType = "checking";
// var amount = 500;


// var balance;


var buttons = document.querySelectorAll("button");
for (var i=0; i< buttons.length; i++){
  buttons[i].addEventListener("click", returnAction);
};

function returnAction(feed){
  var action = feed.target.innerText;
  var userInputChecking =document.querySelectorAll("input")[0];
  var userInputSavings =document.querySelectorAll("input")[1];
  var balance;
  var amount = parseInt(userInputNotEmpty(userInputChecking, userInputSavings).value);
  var accountType = userInputNotEmpty(userInputChecking, userInputSavings).parentElement.classList[1];


  if (accountType == "checking") {
    balance = getCurrentChecking();
    console.log("balance starting out at " + balance)
  } else {
    balance = getCurrentSavings();
    console.log("balance starting out at " + balance)
  };


  if (action == "Deposit") {
    balance = amount + balance;
    finishTransaction(balance);

  } else if (action == "Withdraw" && accountType == "savings") {

    if (amount > balance) {
      console.log("Insufficient funds");
    } else {
      balance = balance - amount;  
      finishTransaction(balance);
    }

  } else if (action == "Withdraw" && accountType == "checking") {
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

  function finishTransaction(balance) {
    //fs.writeFileSync('./' + accountType + '.txt', balance);
    console.log("You now have $" + balance + " in your " + accountType + " account");
  }

};


function userInputNotEmpty(checking, savings){
  if (checking.value != ""){
    return checking;
  }else{
    return savings;
  };
}

function getCurrentChecking() {
  //for now
  return 1000;
}

function getCurrentSavings() {
  //for now
  return 5000;  
}

// function finishTransaction(balance) {
//   //fs.writeFileSync('./' + accountType + '.txt', balance);
//   console.log("You now have $" + balance + " in your " + accountType + " account");
// }