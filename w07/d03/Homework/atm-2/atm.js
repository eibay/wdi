window.onload = function(){
var depositButton = document.getElementsByClassName("deposit")
var withdrawButton = document.getElementsByClassName("withdraw")


for(i = 0; i < depositButton.length; i++){
depositButton[i].addEventListener("click", function(event){
  if (event.target.parentNode.children[0].innerText == "Checking"){
     changeChecking(totalsDeposit(getCurrentChecking(), amountChecking()))
     clear()
  }else if (event.target.parentNode.children[0].innerText == "Savings"){
     changeSaving(totalsDeposit(getCurrentSavings(), amountSaving()))
     clear()
  };
 });

};

for(i = 0; i < withdrawButton.length; i++){
  withdrawButton[i].addEventListener("click", function(event){
  if (event.target.parentNode.children[0].innerText == "Checking"){
    if (getCurrentChecking()>=amountChecking()){
     changeChecking(totalsWithdraw(getCurrentChecking(), amountChecking()))
     changeChecking(checkingTotal)
     clear()
   }else if (getCurrentChecking()< amountChecking()){
     leftover = amountChecking() - getCurrentChecking()
     savingsLeft = getCurrentSavings() - leftover

      if (savingsLeft < 0){
        alert("INSUFFIENT FUNDS")
        clear()
      }else{
        changeChecking(0)
        changeSaving(savingsLeft)
        clear()
      };
   };

  }else if (event.target.parentNode.children[0].innerText == "Savings"){
    if (getCurrentSavings() >= amountSaving()){
      changeSaving(totalsWithdraw(getCurrentSavings(), amountSaving()))
      clear()
    }else if (getCurrentSavings() < amountSaving()){
      alert("INSUFFIENT FUNDS!")
      clear()
    };
  };
 });
};

function totalsDeposit(current,amount){
 return total = current + amount
}

function totalsWithdraw(current, amount){
return total = current - amount
}

function clear(){
  var amountArray = document.querySelectorAll("input")
  amountArray[0].value=""
  amountArray[1].value=""
}
function amountChecking(){
  var amountArray = document.querySelectorAll("input")
  amount = parseInt(amountArray[0].value)
  return amount
};

function amountSaving(){
  var amountArray = document.querySelectorAll("input")
  amount = parseInt(amountArray[1].value)
  return amount
};

function changeChecking(newvalue){
  var values = document.getElementsByClassName("balance")
  return values[0].innerText = "$"+ newvalue
};

function changeSaving(newvalue){
  var values = document.getElementsByClassName("balance")
  return values[1].innerText = "$"+ newvalue
};

function getCurrentChecking() {
  var values = document.getElementsByClassName("balance")
  return parseInt(values[0].innerText.split("$")[1])
};

function getCurrentSavings() {
  var values = document.getElementsByClassName("balance")
  return parseInt(values[1].innerText.split("$")[1])  
};

};
