// buttons
var buttonCheckingDeposit = document.getElementsByClassName("account checking")[0].children[3]
var buttonCheckingWithdraw = document.getElementsByClassName("account checking")[0].children[4]
var buttonSavingsDeposit = document.getElementsByClassName("account savings")[0].children[3]
var buttonSavingsWithdraw = document.getElementsByClassName("account savings")[0].children[4]
var deposit = document.getElementsByClassName("account checking")[0].children[2]

// functions
var depositChecking = function() {
  buttonCheckingDeposit.addEventListener("click", function() {
    var checkingBalanceEl = document.getElementsByClassName("account checking")[0].children[1].innerText
    var checkingDepositAmount = document.getElementsByClassName("account checking")[0].children[2].value
    var checkingBalance = parseInt(checkingBalanceEl.split("$")[1])
    checkingBalance = checkingBalance + parseInt(checkingDepositAmount);
    document.getElementsByClassName("account checking")[0].children[1].innerText = "$" + checkingBalance;
  });
}
depositChecking()

var depositSavings = function() {
  buttonSavingsDeposit.addEventListener("click", function() {
    var savingsBalanceEl = document.getElementsByClassName("account savings")[0].children[1].innerText
    var savingsDepositAmount = parseInt(document.getElementsByClassName("account savings")[0].children[2].value)
    var savingsBalance = parseInt(savingsBalanceEl.split("$")[1])
    savingsBalance = savingsBalance + savingsDepositAmount;
    document.getElementsByClassName("account savings")[0].children[1].innerText = "$" + savingsBalance; 
  });
}
depositSavings()

var withdrawSavings = function() {
  buttonSavingsWithdraw.addEventListener("click", function() {
    var savingsBalanceEl = document.getElementsByClassName("account savings")[0].children[1].innerText
    var savingsWithdrawAmount = parseInt(document.getElementsByClassName("account savings")[0].children[2].value)
    var savingsBalance = parseInt(savingsBalanceEl.split("$")[1])
    if (savingsBalance >= savingsWithdrawAmount) {
      savingsBalance = savingsBalance - savingsWithdrawAmount;
      document.getElementsByClassName("account savings")[0].children[1].innerText = "$" + savingsBalance; 
    } else {
      document.getElementsByClassName("account savings")[0].children[1].innerText = "Insufficient funds!"; 
    }
  });
}
withdrawSavings()

var withdrawChecking = function() {
  buttonCheckingWithdraw.addEventListener("click", function() {
    var savingsBalanceEl = document.getElementsByClassName("account savings")[0].children[1].innerText
    var savingsBalance = parseInt(savingsBalanceEl.split("$")[1])
    var checkingBalanceEl = document.getElementsByClassName("account checking")[0].children[1].innerText
    var checkingWithdrawAmount = parseInt(document.getElementsByClassName("account checking")[0].children[2].value)
    var checkingBalance = parseInt(checkingBalanceEl.split("$")[1])
    if (checkingBalance >= checkingWithdrawAmount) {
      checkingBalance = checkingBalance - checkingWithdrawAmount;
      document.getElementsByClassName("account checking")[0].children[1].innerText = "$" + checkingBalance; 
    } else if (checkingBalance + savingsBalance < checkingWithdrawAmount) {
        document.getElementsByClassName("account checking")[0].children[1].innerText = "Insufficient funds!"; 
    } else {
      withdrawAmount = checkingWithdrawAmount - checkingBalance;
      checkingBalance = 0
      document.getElementsByClassName("account checking")[0].children[1].innerText = "$" + checkingBalance;
      savingsBalance = savingsBalance - withdrawAmount
      document.getElementsByClassName("account savings")[0].children[1].innerText = "$" + savingsBalance;
    }
  });
}
withdrawChecking()