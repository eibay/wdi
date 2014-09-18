var _ = require('underscore');
// var winboard = [['x', 'o', '-'], ['-', 'o', '-'], ['-', 'o', 'x']];
var horWin = [['x', 'o', '-', 'o'], ['-', 'o', '-', 'x'], ['-', 'o', 'x', 'o'], ['x', 'x', 'x', 'x']];
var vertWin = [['x', 'o', '-', '-'], ['-', 'o', '-', 'x'], ['-', 'o', 'x', 'x'], ['x', 'o', 'x', 'o']];
var diagWin =[['x', 'x', 'o', '-'],
						  ['-', 'x', '-', 'o'], 
						  ['-', 'x', 'x', 'o'], 
						  ['o', 'o', '-', 'x']];
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
		// for (var j = 0; j < board[i].length; j++) {
		// 	vertical += board[i][j];
		// }

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


//////////////////////////////////////////////////////////////////

// console.log(_.pluck(winboard, [0]));

	// for (var i = 0; i < board.length; i++) {
	// 	var winner = ''
	// 	// for (var j = 0; j < board.length; j++) {
	// 		if (board[i][i] == board[i][board.length - (i + 1)]) {
	// 			winner = board[i][0];
	// 		} else {
	// 			winner = ''
	// 		}
	// 	}
	// 	console.log(winner)
	// }
	// }
// }

// function won(board) {
// 	winX = 'x' * board.length;
// 	winO = 'o' * board.length;
// 	across = ''

// 	for (var i = 0; i < board.length; i++) {
// 		if (board[i][board.length - (i + 1))


// 	}
// 	return false
// }

// tictactoe(winboard);
// tictactoe = function(board) {
// 	for (var i = 0; i < board.length; i++) {

// 		if (board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
// 			return board[i][0]
// 		} else if (board[0][i] == board[1][i] && board[0][i] == board[2][i]) {
// 			return board[0][i]
// 		}
// 	}

// 	if (board[0][0] == board[1][1] && board[0][1] == board[2][2]) {
// 		return board[0][0]
// 	} else if (board[0][2] == board[1][1] && board[0][2] == board[2][0]) {
// 		return board[0][2]
// 	}

// 	return false 
// }

// tictactoe = function(board) {




// 	for (var i = 0; i < board.length; i++) {
// 		for (var j = 0; j < board.length; j++) {
// 		if board[i][board.length - (i + 1)]

// 		}



// 	}
// }


// console.log(tictactoe(winboard));
// console.log(tictactoe(diagboard));

// [i][board.length - (i + 1)]