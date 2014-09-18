// define variables first before proceeding!
// account for div, balances, checking, display, split on $?, deposits/withdrawals, input field
// event listener on buttons 

// select div tags
var div_select = document.querySelectorAll("div");
// balance class
var balances = document.getElementsByClassName("balance");

// displaying balance on screen
var checking_display = balances[0];
var savings_display = balances[1];

// balances for each account, splitting on $
  // needs to be number, not a string
var checking_balance = Number(balances[0].innerText.split("$")[1]);
var savings_balance = Number(balances[1].innerText.split("$")[1]);

// deposits
var deposits = document.getElementsByClassName("deposit");
var checking_deposit = deposits[0];
var savings_deposit = deposits[1];

// withdrawal
var withdrawals = document.getElementsByClassName("withdraw");
var checking_withdrawal = withdrawals[0];
var savings_withdrawal = withdrawals[1];

// input field where to add money
input = document.querySelectorAll("input");
checking_input = Number(input[0].value);
savings_input = Number(input[1].value);

//////////////////////// CHECKING////////////////////////////////

// eventlistener on deposit button when clicked
checking_deposit.addEventListener('click', function() {
    checking_input = Number(input[0].value);
      checking_balance = Number(balances[0].innerText.split("$")[1]);
        new_balance = checking_balance + checking_input;
         checking_display.innerText = "$" + new_balance;
})

// eventlistener on withdrawal button when clicked
checking_withdrawal.addEventListener('click', function(event) {
    checking_input = Number(input[0].value);
      checking_balance = Number(balances[0].innerText.split("$")[1]);
        savings_balance = Number(balances[1].innerText.split("$")[1]);

//if checking balance < checking input (& vice versa) overdraft will occur.
      if(checking_balance < checking_input && 
                    savings_balance >= checking_input) {
          var alert = document.createElement("alert");
          alert.innerText = "Overdraft Fee will Incur"
          checking_display.parentNode.appendChild(alert);
          new_balance = savings_balance - Math.abs(checking_balance - checking_input)
          savings_display.innerText = "$" + new_balance; 
        } 
      else {
          new_balance = checking_balance - checking_input;
          checking_display.innerText = "$" + new_balance;
    }
})
//////////////////////// SAVINGS////////////////////////////////

// eventlistener on deposit button when clicked
savings_deposit.addEventListener('click', function() {
    savings_balance = Number(balances[1].innerText.split("$")[1]);
      savings_input = Number(input[1].value);
        new_balance = savings_balance + savings_input;
          savings_display.innerText = "$" + new_balance;
})

// eventlistener on withdrawal button when clicked
savings_withdrawal.addEventListener('click', function(event) {
  savings_balance = Number(balances[1].innerText.split("$")[1]);
    savings_input = Number(input[1].value);


    if (savings_balance < savings_input) {
          alert("Insufficient funds, jackass.")  
    } 
    else {
          new_balance = savings_balance - savings_input;
          savings_display.innerText = "$" + new_balance;
    }
})





