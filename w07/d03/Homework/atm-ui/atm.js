//Account Types
// var checking = document.getElementsByClassName("account checking");
// var savings = document.getElementsByClassName("account savings");

// // Deposits
// var checkingDeposit = document.getElementsByClassName("deposit");
// var checkingWithdrawal = document.getElementsByClassName("withdraw");

// Account Balances
var balance = document.getElementsByClassName("balance");
var checking = balance[0];
var savings = balance[1];

// Account Deposits
var deposits = document.getElementsByClassName("deposit");
var checkingDeposit = deposits[0];
var savingsDeposit = deposits[1];

// Account Withdrawals
var withdrawals = document.getElementsByClassName("withdraw");
var checkingWithdrawal = withdrawals[0];
var savingsWithdrawal = withdrawals[1];

// Deposit/Withdrawal Amounts
var amounts = document.querySelectorAll("input")

var checkingAmount = parseInt(amounts[0].value);
var savingsAmount = parseInt(amounts[0].value);

  checkingDeposit.addEventListener("click", function() {
    var checkingBalance = parseInt(balance[0].innerText.split("$")[1]);
    var checkingAmount = parseInt(amounts[0].value);

    var newBalance = checkingBalance + checkingAmount
    checking.innerText = "$" + newBalance
    });

// Checking Deposit/Withdrawal
  checkingWithdrawal.addEventListener("click", function() {
    var checkingBalance = parseInt(balance[0].innerText.split("$")[1]);
    var checkingAmount = parseInt(amounts[0].value);
    var savingsBalance = parseInt(balance[1].innerText.split("$")[1]);

      if (checkingBalance < checkingAmount && savingsBalance >= checkingAmount) {
        var newBalance = savingsBalance - Math.abs(checkingBalance - checkingAmount)
        checking.innerText = '$' + 0;
        savings.innerText = '$' + newBalance;

      } else if (checkingBalance < checkingAmount && savingsBalance < checkingAmount) {
          alert("Insufficient Funds")

      } else {
          var newBalance = checkingBalance - checkingAmount;
          checking.innerText = '$' + newBalance;
        }

      });

// Savings Deposit/Withdrawal
   savingsDeposit.addEventListener("click", function() {
    var savingsBalance = parseInt(balance[1].innerText.split("$")[1]);
    var savingsAmount = parseInt(amounts[1].value);

      var newBalance = savingsBalance + savingsAmount
      savings.innerText = "$" + newBalance
    });

   savingsWithdrawal.addEventListener("click", function() {
    var savingsBalance = parseInt(balance[1].innerText.split("$")[1]);
    var savingsAmount = parseInt(amounts[1].value);

        if (savingsBalance < savingsAmount) {
          alert("Insufficient Funds")

        } else {
          var newBalance = savingsBalance - savingsAmount;
          savings.innerText = '$' + newBalance;
  }

});
