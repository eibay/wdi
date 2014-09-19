var fs = require('fs');

  if (process.argv[2]=="deposit") {
  	var deposit = fs.readFileSync('deposit.txt');
  	deposit = Number(deposit) + Number(process.argv[3]);
  	fs.writeFileSync('deposit.txt', deposit);
  	console.log("You have " + deposit + " in your account");
  } else if (process.argv[2]=="withdraw") {
  	var deposit = fs.readFileSync('deposit.txt');
  	if (deposit<0) {
  		console.log("Insufficient funds, transacton canceled")
  	} else {
  		var withdraw = deposit - process.argv[3];
  		fs.writeFileSync('deposit.txt', withdraw);
  		console.log("You have " + withdraw + " in your account");
  };
