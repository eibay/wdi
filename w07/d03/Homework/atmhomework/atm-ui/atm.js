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

// function finishTransaction(balance) {
//   //fs.writeFileSync('./' + accountType + '.txt', balance);
//   console.log("You now have $" + balance + " in your " + accountType + " account");
// }

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



//    checkingWith.addEventListener('click', function(event) {
//   checkingBal = Number(balances[0].innerText.split("$")[1]);
//   checkingInput = Number(inputs[0].value);
//   savingsBal = Number(balances[1].innerText.split("$")[1]);

//   if (checkingBal < checkingInput && savingsBal >= checkingInput) {
//     new_p = document.createElement("p");
//     new_p.innerText = "overdraft protection"
//     checkingTag.parentNode.appendChild(new_p);
//     newBal = savingsBal - Math.abs(checkingBal - checkingInput)
//     checkingTag.innerText = '$' + 0;
//     savingsTag.innerText = '$' + newBal;

//   } else if (checkingBal < checkingInput && savingsBal < checkingInput) {
//     alert("Whooooooaaaa, you don't have that much, stupid.")

//   } else {
//     newBal = checkingBal - checkingInput;
//     checkingTag.innerText = '$' + newBal;
//   }

// })



   checkingDeposit.addEventListener("click", function() {

      checkingBalance = Number(balance[0].innerText.split("$")[1]);
      checkingInput = Number(inputs[0].value);

      newBalance = checkingBalance + checkingInput
      checking.innerText = "$" + newBalance
    });

   checkingWithdrawal.addEventListener("click", function() {

      checkingBalance = Number(balance[0].innerText.split("$")[1]);
      checkingInput = Number(inputs[0].value);

      newBalance = checkingBalance - checkingInput
      checking.innerText = "$" + newBalance
    });

   savingsDeposit.addEventListener("click", function() {

      savingBalance = Number(balance[1].innerText.split("$")[1]);
      savingsInput = Number(inputs[1].value);

      newBalance = savingBalance + savingsInput
      savings.innerText = "$" + newBalance
      console.log(newBalance)
    });

   savingsWithdrawal.addEventListener("click", function() {

      savingBalance = Number(balance[1].innerText.split("$")[1]);
      savingsInput = Number(inputs[1].value);

      newBalance = savingBalance - savingsInput
      savings.innerText = "$" + newBalance
    });


