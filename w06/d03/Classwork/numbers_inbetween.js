var args = process.argv

function inBetween(x, y) {

for (var i =  x + 1; i < y; i++) {
  console.log(i);
}
}

inBetween(parseInt(args[2]), parseInt(args[3]));

// U run the file by typing node filename.js argument 1 argument 2...argument n

// so if u want the numbers between 2 adn 6 u type in the terminal

// node numbers_inbetween.js 2 6

// output is 3, 4, 5 in terminal.


