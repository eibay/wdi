var _ = require('underscore')
var winboard = [['x', 'o', '-'], ['-', 'o', '-'], ['-', 'o', 'x']]

tictactoe = function(board) {
	for (var i = 0; i < board.length; i++) {

		if (board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
			return board[i][0]
		} else if (board[0][i] == board[1][i] && board[0][i] == board[2][i]) {
			return board[0][i]
		}
	}

	if (board[0][0] == board[1][1] && board[0][1] == board[2][2]) {
		return board[0][0]
	} else if (board[0][2] == board[1][1] && board[0][2] == board[2][0]) {
		return board[0][2]
	}

	return false 
}

var diagboard=[['x', 'x', 'o'], ['-', 'x', '-'], ['-', 'x', 'x']]

console.log(tictactoe(winboard));
console.log(tictactoe(diagboard));

[i][board.length - (i + 1)]