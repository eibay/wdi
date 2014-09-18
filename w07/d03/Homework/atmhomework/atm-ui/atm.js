// var action = "withdraw";
// var accountType = "checking";
// var amount = 1200;

// var balance;

// if (accountType == "checking") {
//   balance = getCurrentChecking();
//   console.log("balance starting out at " + balance)
// } else {
//   balance = getCurrentSavings();
//   console.log("balance starting out at " + balance)
// }

// if (action == "deposit") {

//   balance = amount + balance;
//   finishTransaction(balance);

// } else if (action == "withdraw" && accountType == "savings") {

//   if (amount > balance) {
//     console.log("Insufficient funds");
//   } else {
//     balance = balance - amount;
//     finishTransaction(balance);
//   }

// } else if (action == "withdraw" && accountType == "checking") {
//   if (amount > balance) {
//     // can savings cover it?
//     var savingsBalance = getCurrentSavings();
//     if (amount <= balance + savingsBalance) {
//       var overdraftAmount = amount - balance;

//       savingsBalance = savingsBalance - overdraftAmount;
//       console.log('your savings balance is now ' + savingsBalance)
//       balance = 0;

//       finishTransaction(balance);
//     } else {
//       console.log('Insufficient funds');
//     }
//   } else {
//     balance = balance - amount;
//     finishTransaction(balance);
//   }
// } else {
//   console.log("Invalid action");
// }

// function getCurrentChecking() {
//   //for now
//   return 1000;
// }

// function getCurrentSavings() {
//   //for now
//   return 5000;
// }

// // function finishTransaction(balance) {
// //   //fs.writeFileSync('./' + accountType + '.txt', balance);
// //   console.log("You now have $" + balance + " in your " + accountType + " account");
// // }

  var div = document.querySelectorAll("div");

   var balance = document.getElementsByClassName("balance");

   var checking = balance[0];

    var savings = balance[1];

    var checkingBalance = Number(balance[0].innerText.split("$")[1]);

    var savingBalance = Number(balance[1].innerText.split("$")[1]);

     var deposits = document.getElementsByClassName("deposit");

     var checkingDeposit = deposits[0];
     var savingsDeposit = deposits[1];

      var withdrawals = document.getElementsByClassName("withdraw");

      var checkingWithdrawal = withdrawals[0];
      var savingsWithdrawal = withdrawals[1];

   var inputs = document.querySelectorAll("input")

   var checkingInput = Number(inputs[0].value);
   var savingsInput = Number(inputs[0].value);

   // Event Listeners based on click events


    checkingDeposit.addEventListener("click", function() {

      var checkingBalance = Number(balance[0].innerText.split("$")[1]);
      var checkingInput = Number(inputs[0].value);


      var newBalance = checkingBalance + checkingInput
      checking.innerText = "$" + newBalance
    });


      checkingWithdrawal.addEventListener("click", function() {

      var checkingBalance = Number(balance[0].innerText.split("$")[1]);
      var checkingInput = Number(inputs[0].value);
      var savingsBalance = Number(balance[1].innerText.split("$")[1]);


        if (checkingBalance < checkingInput && savingsBalance >= checkingInput) {
          var overdraft = document.createElement("p");
          console.log(overdraft)
          overdraft.innerText = "overdraft protection"
          checking.parentNode.appendChild(overdraft);
          var newBalance = savingsBalance - Math.abs(checkingBalance - checkingInput)
          checking.innerText = '$' + 0;
          savings.innerText = '$' + newBalance;

        } else if (checkingBalance < checkingInput && savingsBalance < checkingInput) {
          alert("You are broke, go get a job")

        } else {
          var newBalance = checkingBalance - checkingInput;
          checking.innerText = '$' + newBalance;
        }

      });


   savingsDeposit.addEventListener("click", function() {

      var savingBalance = Number(balance[1].innerText.split("$")[1]);
      var savingsInput = Number(inputs[1].value);

      var newBalance = savingBalance + savingsInput
      savings.innerText = "$" + newBalance
      console.log(newBalance)
    });

   savingsWithdrawal.addEventListener("click", function() {

      var savingBalance = Number(balance[1].innerText.split("$")[1]);
      var savingsInput = Number(inputs[1].value);

        if (savingBalance < savingsInput) {

      alert("Now you're really broke dude, seriously get a job")

    } else {

      var newBalance = savingBalance - savingsInput;
      savings.innerText = '$' + newBalance;
  }

});



