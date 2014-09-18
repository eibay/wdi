var _ = require('underscore');
var horWin = [['x', 'o', '-', 'o'], ['-', 'o', '-', 'x'], ['-', 'o', 'x', 'o'], ['x', 'x', 'x', 'x']];
var vertWin = [['x', 'o', '-', '-'], ['-', 'o', '-', 'x'], ['-', 'o', 'x', 'x'], ['x', 'o', 'x', 'o']];
var diagWin =[['x', 'x', 'o', '-'], ['-', 'x', '-', 'o'], ['-', 'x', 'x', 'o'], ['o', 'o', '-', 'x']];
var noWin = [['x', 'o', '-', 'o'], ['-', 'o', '-', 'x'], ['-', 'x', 'x', 'o'], ['x', 'o', 'x', 'x']];

tictactoe = function(board) {
// create winning number of x's
	var winX = '';
	board.forEach(function() {
		winX += 'x';
	})

// create winning number of o's
	var winO = '';
	board.forEach(function() {
		winO += 'o';
	})	

// check horizontal 
	for (var i = 0; i < board.length; i++) {
		var horizontal = ''; 
		var winner = '';
		for (var j = 0; j < board[i].length; j++) {
			horizontal += board[i][j];
		}

		if (horizontal == winX) {
			winner = 'x';
			return winner
		} else if (horizontal == winO) {
			winner = 'o';
			return winner
		} 
	} 

// check vertical
	for (var i = 0; i < board.length; i++) {
		var vertical = _.pluck(board, [i]).join(''); 
		var winner = '';

		if (vertical == winX) {
			winner = 'x';
			return winner
		} else if (vertical == winO) {
			winner = 'o';
			return winner
		} 
	}

// check diagonal
var diagonal = '';
 	for (var i = 0; i < board.length; i++) {
		var winner = '';
		diagonal += board[i][i];
	}
	if (diagonal == winX) {
			winner = 'x';
			return winner
		} else if (diagonal == winO) {
			winner = 'o';
			return winner
		}
	return false
}

console.log(tictactoe(horWin));
console.log(tictactoe(vertWin));
console.log(tictactoe(diagWin));
console.log(tictactoe(noWin));