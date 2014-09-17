

function getAccountBalance(accountType) {
	var balanceDiv = document.querySelector("div." + accountType + " div.balance"); 
	var dollarString = balanceDiv.innerText; 
	var intString = dollarString.replace(/\$/, ''); 
	return parseInt(intString); 
} 

function setAccountBalance(accountType, newAmount) {
	var balanceDiv = document.querySelector("div." + accountType + " div.balance"); 
	balanceDiv.innerText = '$' + newAmount 
}

function getTransactionAmount(accountType) {
	var accountInput = document.querySelector("div." + accountType + " input"); 
	return parseInt(accountInput.value);
}


window.onload = function() {
	var buttons = document.getElementsByTagName("button");
	for (var button = 0; button < buttons.length; button++) {
		buttons[button].addEventListener('click', function() {
			var transactionType = event.target.getAttribute("class"); 
			var accountType = event.target.parentNode.getAttribute("class").split(' ')[1];
			var accountBalance = getAccountBalance(accountType);
			var transactionAmount = getTransactionAmount(accountType);
			if (transactionType == "deposit") {
				accountBalance = accountBalance + transactionAmount
				setAccountBalance(accountType, accountBalance);
			} else {
				accountBalance = accountBalance - transactionAmount
				if (accountBalance < 0) { 
					if (accountType == "checking") {
						if (Math.abs(accountBalance) < getAccountBalance("savings")) {
							setAccountBalance(accountType, 0); 
							var overdraftProtection = getAccountBalance("savings") - Math.abs(accountBalance);
							setAccountBalance("savings", overdraftProtection); 
						}
					}
				} else {
					setAccountBalance(accountType, accountBalance); 
				}
			}
		})
	}
}