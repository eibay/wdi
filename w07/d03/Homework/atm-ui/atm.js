// var action = "withdraw";
// var accountType = "checking";
// var amount = 500;


// var balance;

var checkingAmount = 2000;
var savingsAmount = 1000;
var checkingDisplay = document.querySelector("div.account.checking").children[1];
var savingsDisplay = document.querySelector("div.account.savings").children[1];
  checkingDisplay.innerText= "$"+checkingAmount;
  savingsDisplay.innerText= "$"+savingsAmount;

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
    
    if(accountType == 'checking'){
      checkingAmount += amount;

      }else{
        savingsAmount += amount;
    };

    balance = amount + balance;
    finishTransaction(balance);
    checkingDisplay.innerText= "$"+checkingAmount;
    savingsDisplay.innerText= "$"+savingsAmount;

    var accountDiv = document.querySelector("div.account."+accountType);
    accountDiv.children[2].value = ""

  } else if (action == "Withdraw" && accountType == "savings") {

    if (amount > balance) {
      console.log("Insufficient funds");
    } else {
      balance = balance - amount; 
      savingsAmount -= amount; 
      finishTransaction(balance);
      checkingDisplay.innerText= "$"+checkingAmount;
      savingsDisplay.innerText= "$"+savingsAmount;
      userInputSavings.value = ""
    }

  } else if (action == "Withdraw" && accountType == "checking") {
    if (amount > balance) {
      // can savings cover it?
      var savingsBalance = getCurrentSavings();
      if (amount <= checkingAmount + savingsAmount) {
        var overdraftAmount = amount - balance;

        savingsBalance = savingsBalance - overdraftAmount;
        savingsAmount -= overdraftAmount;
        console.log('your savings balance is now ' + savingsBalance)
        checkingAmount = 0;
        balance = 0;

        finishTransaction(balance);
        checkingDisplay.innerText= "$"+checkingAmount;
        savingsDisplay.innerText= "$"+savingsAmount;
        userInputChecking.value = ""
      } else {
        console.log('Insufficient funds');
        userInputChecking.value = ""
      }
    } else {
      balance = balance - amount;
      checkingAmount -= amount;
      finishTransaction(balance);
      checkingDisplay.innerText= "$"+checkingAmount;
      savingsDisplay.innerText= "$"+savingsAmount;
      userInputChecking.value = ""
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
  return checkingAmount;
}

function getCurrentSavings() {
  //for now
  return savingsAmount;  
}

// function finishTransaction(balance) {
//   //fs.writeFileSync('./' + accountType + '.txt', balance);
//   console.log("You now have $" + balance + " in your " + accountType + " account");
// }