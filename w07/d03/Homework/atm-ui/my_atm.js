window.onload = function() {
	var checking_dep_btn = document.getElementsByClassName('deposit')[0];
	var checking_wit_btn = document.getElementsByClassName('withdraw')[0];
	var savings_dep_btn = document.getElementsByClassName('deposit')[1];
	var savings_wit_btn = document.getElementsByClassName('withdraw')[1];

	checking_dep_btn.addEventListener('click', function(event) {

		var amount = document.getElementsByClassName('deposit')[0].parentNode.querySelector('input');
		var amount_num = Number(document.getElementsByClassName('deposit')[0].parentNode.querySelector('input').value);
		var balance = document.getElementsByClassName('deposit')[0].parentNode.getElementsByClassName('balance')[0];
		var balance_num = Number(document.getElementsByClassName('deposit')[0].parentNode.getElementsByClassName('balance')[0].innerText.split('$')[1]);
		var balance_text = document.getElementsByClassName('deposit')[0].parentNode.getElementsByClassName('balance')[0];
		
		balance_text.innerText = amount_num + balance_num;
		balance_text.innerText = "$" + balance_text.innerText;
		amount.value = "";

	});

	checking_wit_btn.addEventListener('click', function(event) {

		var amount = document.getElementsByClassName('deposit')[0].parentNode.querySelector('input');
		var amount_num = Number(document.getElementsByClassName('deposit')[0].parentNode.querySelector('input').value);
		var balance = document.getElementsByClassName('deposit')[0].parentNode.getElementsByClassName('balance')[0];
		var balance_num = Number(document.getElementsByClassName('balance')[0].innerText.split('$')[1]);
		var balance_text = document.getElementsByClassName('deposit')[0].parentNode.getElementsByClassName('balance')[0];

		if (balance_num - amount_num < 0) {

			balance_text.innerText = 0 ;
			balance_text.innerText = "$" + balance_text.innerText;

			var savings_num = balance_num - amount_num
			var balance = document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[0];
			var balance_num = Number(document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[0].innerText.split('$')[1]);
			var balance_text = document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[0];

			balance_text.innerText = (balance_num - savings_num)*(-1);
			balance_text.innerText = "$" + balance_text.innerText;
			amount.value = "";

		} else {
		
			balance_text.innerText = amount_num - balance_num;
			balance_text.innerText = "$" + balance_text.innerText;
			amount.value = "";
		}
	});

	savings_dep_btn.addEventListener('click', function(event) {

		var amount = document.getElementsByClassName('deposit')[1].parentNode.querySelector('input');
		var amount_num = Number(document.getElementsByClassName('deposit')[1].parentNode.querySelector('input').value);
		var balance = document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[1];
		var balance_num = Number(document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[0].innerText.split('$')[1]);
		var balance_text = document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[0];
		
		balance_text.innerText = amount_num + balance_num;
		balance_text.innerText = "$" + balance_text.innerText;
		amount.value = "";

	});

	savings_wit_btn.addEventListener('click', function(event) {

		var amount = document.getElementsByClassName('deposit')[1].parentNode.querySelector('input');
		var amount_num = Number(document.getElementsByClassName('deposit')[1].parentNode.querySelector('input').value);
		var balance = document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[0];
		var balance_num = Number(document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[0].innerText.split('$')[1]);
		var balance_text = document.getElementsByClassName('deposit')[1].parentNode.getElementsByClassName('balance')[0];
		
		balance_text.innerText = balance_num - amount_num;
		balance_text.innerText = "$" + balance_text.innerText;
		amount.value = "";

	});



	function getCurrentChecking() {
  	//for now
  	return 1000;
	}

	function getCurrentSavings() {
	  //for now
	  return 5000;  
	}

	function finishTransaction(balance) {
	  //fs.writeFileSync('./' + accountType + '.txt', balance);
	  console.log("You now have $" + balance + " in your " + accountType + " account");

	}
}