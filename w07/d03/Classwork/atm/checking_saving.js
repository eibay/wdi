var fs = require('fs');

  if (process.argv[2]=="deposit") {

      if (process.argv[4]=="checking") {
        var checking = fs.readFileSync('checking.txt');
        checking = Number(checking) + Number(process.argv[3]);
        fs.writeFileSync('checking.txt', checking);
        console.log("You have " + checking + " in your checking account");
      } else if (process.argv[4]=="saving") {
        var saving = fs.readFileSync('saving.txt');
        saving = Number(saving) + Number(process.argv[3]);
        fs.writeFileSync('saving.txt', saving);
        console.log("You have " + saving + " in your saving account");
      }

  } else if (process.argv[2]=="withdraw") {

      if (process.argv[4]=="checking") {
        var checking = fs.readFileSync('checking.txt');
          if (checking<process.argv[3]) {
            fs.writeFileSync('saving.txt', checking - process.argv[3]);
            console.log("Insufficient funds, transacton canceled")
          } else if (process.argv[4]=="saving") {
            fs.writeFileSync('checking.txt', checking - process.argv[3]);
            checking = Number(checking) - Number(process.argv[3]);
            console.log(checking + " in your checking account")
          }
      } 

      if (process.argv[4]=="saving") {
        var saving = fs.readFileSync('saving.txt');
        saving = Number(saving) + Number(process.argv[3]);
        console.log(saving + " in your saving account")
      }
  };