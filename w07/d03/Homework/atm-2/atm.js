window.onload = function(){
var depositButton = document.getElementsByClassName("deposit")
var withdrawButton = document.getElementsByClassName("withdraw")
var amountArray = document.querySelectorAll("input")

for(i = 0; i < depositButton.length; i++){
depositButton[i].addEventListener("click", function(event){
  if (event.target.parentNode.children[0].innerText == "Checking"){
     var checkingTotal = getCurrentChecking() + amountChecking()
      changeChecking(checkingTotal)
      amountArray[0].value=""
  }else if (event.target.parentNode.children[0].innerText == "Savings"){
    var savingTotal = getCurrentSavings() + amountSaving()
    changeSaving(savingTotal)
    amountArray[1].value=""
  };
 });

};

for(i = 0; i < withdrawButton.length; i++){
  withdrawButton[i].addEventListener("click", function(event){
  if (event.target.parentNode.children[0].innerText == "Checking"){
    if (getCurrentChecking()>=amountChecking()){
     var checkingTotal = getCurrentChecking() - amountChecking()
     changeChecking(checkingTotal)
     amountArray[0].value="" 
   }else if (getCurrentChecking()< amountChecking()){
    leftover = amountChecking() - getCurrentChecking()
    savingsLeft = getCurrentSavings() - leftover

      if (savingsLeft < 0){
        alert("INSUFFIENT FUNDS")
        amountArray[0].value=""
      }else{
        changeChecking(0)
        changeSaving(savingsLeft)
        amountArray[0].value=""
      };
   };

  }else if (event.target.parentNode.children[0].innerText == "Savings"){
    if (getCurrentSavings() >= amountSaving()){
      var savingTotal = getCurrentSavings() - amountSaving()
      changeSaving(savingTotal)
      amountArray[1].value=""
    }else if (getCurrentSavings() < amountSaving()){
      alert("INSUFFIENT FUNDS!")
      amountArray[1].value=""
    };
  };
 });
};

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
