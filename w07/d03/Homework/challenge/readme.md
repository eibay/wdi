#Tic Tac Toe challenge

Write a function ```won(board)``` which takes as a parameter a representation of a 3x3 tic tac toe board and returns the winner, if there is one.

- You can choose how you would like the ```board``` variable to be represented
  - a 2 dimensional array of characters. Like ```var board = [['x', 'o', '-'], ['-', 'o', '-'], ['-', 'o', 'x']]```
  - a 1 dimensional array of 3-character long strings. Like ```var board = ["xo-", "-o-", "-ox"]```

- The function should return "x" if X has won, "o" if O has won, and ```false``` if nobody has won
- Feel free to hardcode in that the board is 3x3. If you are really adventurous, handle the case of a nxn for any number n > 1
- There are a few ways to accomplish this, and they all are at least a little messy, so don't worry if you have (for instance) a bunch of if statements
