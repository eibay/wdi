
function deposit(where, howmuch){
		
		var deposit=parseInt(howmuch);
		var current_balance=parseInt(localStorage.getItem(where));
		var new_balance=current_balance+deposit;
		console.log("your new balance is "+new_balance)
	
		localStorage.setItem(where, new_balance)
	
}
function withdraw(where, howmuch){

		var withdrawal=parseInt(howmuch);
		var current_balance=parseInt(localStorage.getItem(where));
		var new_balance=current_balance-withdrawal;

		if((0 > new_balance)&&(where=="savings")){

			console.log("you do not have enough money to withdraw, your balance will remain at "+current_balance+", please manage your finances better")

		}
		else if((0 > new_balance)&&(where=="checking")){

				var savings_balance=parseInt(localStorage.getItem('savings'));
				if(savings_balance+new_balance > 0){
					var new_savings=savings_balance+new_balance
					localStorage.setItem('checking', '0');
					localStorage.setItem('savings', new_savings);

					console.log("you did not have enough money to cover it in your checking account so we entered your savings, your new savings is "+new_savings)
					}
				else{
					console.log("Your checking account even when combined with your savings could not cover that withdrawal, DAYUM")
				}
	
		}
		else
		{
			console.log("your new balance is "+new_balance)
			localStorage.setItem(where, new_balance);


		}


}


function transfer(where, from, howmuch){
		
		var transfer=parseInt(howmuch);
		var current_balance_where=parseInt(localStorage.getItem(where));
		var new_balance_where=current_balance_where+transfer;
		console.log("your new balance is "+new_balance_where)
	
		var current_balance_from=parseInt(localStorage.getItem(from));
		var new_balance_from=current_balance_from-transfer;
		if(current_balance_from > transfer){
		localStorage.setItem(from, new_balance_from);
		localStorage.setItem(where, new_balance_where);
	}
	
}




  if(localStorage.getItem("checking")==null){
      var checking=localStorage.setItem("checking", 0)
      console.log("ok")
    }
    else{
      var checking=localStorage.getItem("checking")
      
    }
    if(localStorage.getItem("savings")==null){
      var savings=localStorage.setItem("savings", 0)
    }
    else{
      var savings=localStorage.getItem("savings")
    }

    document.getElementsByClassName('balance')[0].innerText=checking;
    document.getElementsByClassName('balance')[1].innerText=savings;

    var checking_deposit=document.getElementsByClassName('deposit')[0];
    var savings_deposit=document.getElementsByClassName('deposit')[1];
    var checking_withdraw=document.getElementsByClassName('withdraw')[0];
    var savings_withdraw=document.getElementsByClassName('withdraw')[1];
    var checking_transfer=document.getElementsByClassName('transfer')[0];
    var savings_transfer=document.getElementsByClassName('transfer')[1];

    checking_deposit.addEventListener('click', function(event){

      var checking_account=document.getElementsByClassName('balance')[0];
      var new_checking=parseInt(document.getElementsByClassName('amount')[0].value);

      deposit('checking', new_checking);
      checking_account.innerText=localStorage.getItem("checking");
      document.getElementsByClassName('amount')[0].value='';
   });
    savings_deposit.addEventListener('click', function(event){

      var savings_account=document.getElementsByClassName('balance')[1];
      var new_savings=parseInt(document.getElementsByClassName('amount')[1].value);

      deposit('savings', new_savings);
      savings_account.innerText=localStorage.getItem("savings");
      document.getElementsByClassName('amount')[1].value=''
   })
    checking_withdraw.addEventListener('click', function(event){

      var checking_account=document.getElementsByClassName('balance')[0];
      var savings_account=document.getElementsByClassName('balance')[1];

      

      var new_checking=parseInt(document.getElementsByClassName('amount')[0].value);
      withdraw('checking', new_checking);
      checking_account.innerText=localStorage.getItem("checking");
      savings_account.innerText=localStorage.getItem("savings");
      document.getElementsByClassName('amount')[0].value=''
   });
      savings_withdraw.addEventListener('click', function(event){

      var savings_account=document.getElementsByClassName('balance')[1];
      var new_savings=parseInt(document.getElementsByClassName('amount')[1].value);

      withdraw('savings', new_savings);
      savings_account.innerText=localStorage.getItem("savings");
      
   })
    checking_transfer.addEventListener('click', function(event){

      var checking_account=document.getElementsByClassName('balance')[0];
      var savings_account=document.getElementsByClassName('balance')[1];
      var new_checking=parseInt(document.getElementsByClassName('amount')[0].value);

      transfer('savings', 'checking', new_checking);
      checking_account.innerText=localStorage.getItem("checking");
      savings_account.innerText=localStorage.getItem("savings");
      document.getElementsByClassName('amount')[0].value='';
   });
    savings_transfer.addEventListener('click', function(event){

      var checking_account=document.getElementsByClassName('balance')[0];
      var savings_account=document.getElementsByClassName('balance')[1];
      var new_savings=parseInt(document.getElementsByClassName('amount')[1].value);

      transfer('checking', 'savings', new_savings);
      checking_account.innerText=localStorage.getItem("checking");
      savings_account.innerText=localStorage.getItem("savings");
      document.getElementsByClassName('amount')[1].value='';
   });















