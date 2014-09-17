var checkingAccount = document.querySelectorAll(".account")[0];
var savingsAccount = document.querySelectorAll(".account")[1];
var balanceChecking = checkingAccount.querySelector(".balance");
var balanceSavings = savingsAccount.querySelector(".balance");
var inputChecking = checkingAccount.getElementsByTagName("input")[0];
var inputSavings = savingsAccount.getElementsByTagName("input")[0];
var depositChecking = checkingAccount.querySelector(".deposit");
var depositSavings = savingsAccount.querySelector(".deposit");
var withdrawChecking = checkingAccount.querySelector(".withdraw");
var withdrawSavings = savingsAccount.querySelector(".withdraw");

depositChecking.addEventListener("click", function() {
  var bal = parseInt(inputChecking.value) + parseInt(balanceChecking.innerText.slice(1));
  balanceChecking.innerText = "$" + bal;
  inputChecking.value = "";
})

depositSavings.addEventListener("click", function() {
  var bal = parseInt(inputSavings.value) + parseInt(balanceSavings.innerText.slice(1));
  balanceSavings.innerText = "$" + bal;
  inputSavings.value = "";
})

withdrawChecking.addEventListener("click", function() {
  if (parseInt(inputChecking.value) < parseInt(balanceChecking.innerText.slice(1) )) {
    var bal = parseInt(balanceChecking.innerText.slice(1)) - parseInt(inputChecking.value);
    balanceChecking.innerText = "$" + bal;
    inputChecking.value = "";
  }
  else if (parseInt(inputChecking.value) > parseInt(balanceChecking.innerText.slice(1) )) {
    if (parseInt(balanceChecking.innerText.slice(1)) + parseInt(balanceSavings.innerText.slice(1)) > parseInt(inputChecking.value)) {
      var bal = parseInt(inputChecking.value) - parseInt(balanceChecking.innerText.slice(1));
      bal = parseInt(balanceSavings.innerText.slice(1)) - bal;
      balanceSavings.innerText = "$" + bal;
      balanceChecking.innerText = "$0";
      balanceSavings.style.backgroundColor = "red";
      timeoutID = window.setTimeout(function() {
        balanceSavings.style.backgroundColor = "white";
      }, 2000)
    }
    else {
      inputChecking.style.backgroundColor = "red";
      timeoutID = window.setTimeout(function() {
        inputChecking.style.backgroundColor = "white";
      }, 2000)
    }
  }
})

withdrawSavings.addEventListener("click", function(){
  if ( parseInt(inputSavings.value) < parseInt(balanceSavings.innerText.slice(1) )) {
    bal = parseInt(balanceSavings.innerText.slice(1)) - parseInt(inputSavings.value);
    balanceSavings.innerText = "$" + bal;
    inputSavings.value = "";
  }
  else {
    inputSavings.style.backgroundColor = "red";
    timeoutID = window.setTimeout(function(){
      inputSavings.style.backgroundColor = "white"
    }, 2000)
  }
})