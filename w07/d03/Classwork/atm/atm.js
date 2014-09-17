var args = process.argv
var fs = require("fs")
var action  = args[2]
var amount = parseInt(args[3])
var moneyatm = fs.readFileSync('./money.txt').toString()
moneyjson = JSON.parse(moneyatm)
if (moneyjson.length > 0){ 
  transaction = moneyjson[moneyjson.length-1]
}else{
  transaction = 0
};

if(action == "deposit"){
  transaction = (transaction + amount)
  console.log(transaction)
}else if (action == "withdraw"){
  transaction = (transaction - amount)
  console.log(transaction)
}else{
  console.log("INVALID ACTION")
};

moneyjson.push(transaction)
moneyjson = JSON.stringify(moneyjson)
fs.writeFileSync('./money.txt', moneyjson)