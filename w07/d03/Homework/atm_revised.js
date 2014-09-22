// checking and savings divs
var checking_div = document.getElementsByClassName("account checking")[0]

var savings_div = document.getElementsByClassName("account savings")[0]

//adding event listeners to buttons
var deposit_check = checking_div.children[3]
deposit_check.addEventListener("click", deposit_checking)

var withdraw_check = checking_div.children[4]
withdraw_check.addEventListener("click", withdraw_checking)

var deposit_save = savings_div.children[3]
deposit_save.addEventListener("click", deposit_savings)

var withdraw_save = savings_div.children[4]
withdraw_save.addEventListener("click", withdraw_savings)



function getInputChecking(){
var checking = document.getElementsByName("amount")[0]
var checkingInt = parseInt(checking.value)
return checkingInt
}

function getInputSavings(){
var savings = document.getElementsByName("amount")[1]
var savingsInt = parseInt(savings.value)
return savingsInt
}

function getCheckingBalance(){
var checking_balance_ammount = checking_div.children[1].innerText 
var checking_balance_ammount_int = parseInt(checking_balance_ammount.slice(1))
return checking_balance_ammount_int
}

function getSavingsBalance(){
var savings_balance_amount = savings_div.children[1].innerText
var savings_balance_amount_int = parseInt(savings_balance_amount.slice(1))
return savings_balance_amount_int
}

function deposit_checking(){
balance = getCheckingBalance()
deposit = getInputChecking()
balance += deposit 

updateCheckingAccount(balance)
}

function withdraw_checking(){
balance = getCheckingBalance()
balanceSavings = getSavingsBalance()
withdraw = getInputChecking()
console.log(withdraw)

if (balance >= withdraw) {
balance -= withdraw
updateCheckingAccount(balance)
}
else if (balance + balanceSavings >= withdraw){
var overdraft = balance - withdraw
balance = 0
balanceSavings += overdraft

updateCheckingAccount(balance)
updateSavingsAccount(balanceSavings)

}
else {
window.alert("You do not have enough money for this transaction. Please select a smaller amount")
}
}

function deposit_savings(){
balance = getSavingsBalance()
deposit = getInputSavings()
balance += deposit

updateSavingsAccount(balance)
}

function withdraw_savings () {
balance = getSavingsBalance()
withdraw = getInputSavings()

if (balance >= withdraw) {
balance -= withdraw

updateSavingsAccount(balance)
}
else {
window.alert("You do not have enough money for this transaction. Please select a smaller amount")
}
}

function updateSavingsAccount(amount){
var savings_balance_amount = savings_div.children[1]
savings_balance_amount.innerText = "$" + amount
}

function updateCheckingAccount(amount){
var checking_balance_amount = checking_div.children[1]
checking_balance_amount.innerText = "$" + amount

}