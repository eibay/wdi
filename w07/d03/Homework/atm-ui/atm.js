balances = document.getElementsByClassName("balance");
checkingTag = balances[0];
savingsTag = balances[1];
checkingBal = Number(balances[0].innerText.split("$")[1]);
savingsBal = Number(balances[1].innerText.split("$")[1]);

deposits = document.getElementsByClassName("deposit");
checkingDep = deposits[0];
savingsDep = deposits[1];

withdrawals = document.getElementsByClassName("withdraw");
checkingWith = withdrawals[0];
savingsWith = withdrawals[1];

inputs = document.querySelectorAll("input");
checkingInput = Number(inputs[0].value);
savingsInput = Number(inputs[1].value);

checkingDep.addEventListener('click', function() {
  checkingBal = Number(balances[0].innerText.split("$")[1]);
  checkingInput = Number(inputs[0].value);

  newBal = checkingBal + checkingInput;
  checkingTag.innerText = '$' + newBal;
})

checkingWith.addEventListener('click', function(event) {
  checkingBal = Number(balances[0].innerText.split("$")[1]);
  checkingInput = Number(inputs[0].value);
  savingsBal = Number(balances[1].innerText.split("$")[1]);

  if (checkingBal < checkingInput && savingsBal >= checkingInput) {
    new_p = document.createElement("p");
    new_p.innerText = "overdraft protection"
    checkingTag.parentNode.appendChild(new_p);
    newBal = savingsBal - Math.abs(checkingBal - checkingInput)
    checkingTag.innerText = '$' + 0;
    savingsTag.innerText = '$' + newBal;

  } else if (checkingBal < checkingInput && savingsBal < checkingInput) {
    alert("Whooooooaaaa, you don't have that much, stupid.")

  } else {
    newBal = checkingBal - checkingInput;
    checkingTag.innerText = '$' + newBal;
  }
  
})

savingsDep.addEventListener('click', function() {
  savingsBal = Number(balances[1].innerText.split("$")[1]);
  savingsInput = Number(inputs[1].value);

  newBal = savingsBal + savingsInput;
  savingsTag.innerText = '$' + newBal;
})

savingsWith.addEventListener('click', function(event) {
  savingsBal = Number(balances[1].innerText.split("$")[1]);
  savingsInput = Number(inputs[1].value);

  if (savingsBal < savingsInput) {
    alert("Whooooooaaaa, you don't have that much, stupid.")
    
  } else {
    newBal = savingsBal - savingsInput;
    savingsTag.innerText = '$' + newBal;
  }

})

