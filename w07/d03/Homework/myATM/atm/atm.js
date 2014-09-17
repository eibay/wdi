var getAccount = function(which) {
        var account = document.getElementsByClassName(which);
        return account
      }

      var getAmount = function(which) {
        account = getAccount(which)
        var amount = parseInt(account[0].children[2].value);
        account[0].children[2].value = "";
        return amount;
      }

      var getBalance = function(which) {
        account = getAccount(which);
        var balance = parseInt(account[0].children[1].innerText.split("$")[1]);
        return balance;
      }

      var newBalance = function(which, number) {
        // localStorage.setItem(which, number);
        account = getAccount(which);
        account[0].children[1].innerText = "$" + number.toString();
      }

      var deposit = function(which) {
        balance = getBalance(which);
        amount = getAmount(which)
        balance += amount;
        newBalance(which, balance);
      }

      function withdraw(which) {
        balance = getBalance(which);
        amount = getAmount(which)
        // if (which == "savings" && amount > balance) {
        //   window.alert("Insufficient funds, you only have " + balance.toString() + " in " + which);
        // } else 
        if (which == "checking" && amount >= balance) {
          savings = getBalance("savings");
          amount -= balance;
          if (savings >= amount) {
          balance = 0;
          newBalance("checking", balance);
          balance = savings - amount;
          newBalance("savings", balance);
	        } else if (amount >= savings) {
	          window.alert("Insufficient funds, you only have " + savings.toString() + " in savings");
	        }
        } else {
          balance -= amount;
          newBalance(which, balance);
        }
      }

      checking = getAccount("checking");
      var depositChecking = checking[0].children[3];
      depositChecking.addEventListener("click", function(){
        deposit("checking");
      })
      var withdrawChecking = checking[0].children[4];
      withdrawChecking.addEventListener("click", function(){
        withdraw("checking");
      })

      savings = getAccount("savings");
      var depositSavings = savings[0].children[3];
      depositSavings.addEventListener("click", function(){
        deposit("savings");
      })
      var withdrawSavings = savings[0].children[4];
      withdrawSavings.addEventListener("click", function(){
        withdraw("savings");
      })