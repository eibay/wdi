var board = [['x', 'x', '-'], ['-', 'x', '-'], ['-', 'x', 'x']]

function won(game) {
	if (board[0][0] = 'x' && board[1][0] == 'x' && board[2][0] == 'x') { 
		console.log('x')
	} else if (board[0][1] = 'x' && board[1][1] == 'x' && board[2][1] == 'x') {
		console.log('x')
	} else if (board[0][2] = 'x' && board[1][2] == 'x' && board[2][2] == 'x') {
		console.log('x')
	} else if (board[0][0] = 'x' && board[1][1] == 'x' && board[2][2] == 'x') {
		console.log('x')
	} else if (board[0][0] = 'x' && board[0][1] == 'x' && board[0][2] == 'x') {
		console.log('x')
	} else if (board[1][0] = 'x' && board[1][1] == 'x' && board[1][2] == 'x') {
		console.log('x')
	} else if (board[2][0] = 'x' && board[2][1] == 'x' && board[2][2] == 'x') {
		console.log('x')


	} else if (board[0][0] = 'o' && board[1][0] == 'o' && board[2][0] == 'o') { 
		console.log('o')
	} else if (board[0][1] = 'o' && board[1][1] == 'o' && board[2][1] == 'o') {
		console.log('o')
	} else if (board[0][2] = 'o' && board[1][2] == 'o' && board[2][2] == 'o') {
		console.log('o')
	} else if (board[0][0] = 'o' && board[1][1] == 'o' && board[2][2] == 'o') {
		console.log('o')
	} else if (board[0][0] = 'o' && board[0][1] == 'o' && board[0][2] == 'o') {
		console.log('o')
	} else if (board[1][0] = 'o' && board[1][1] == 'o' && board[1][2] == 'o') {
		console.log('o')
	} else if (board[2][0] = 'o' && board[2][1] == 'o' && board[2][2] == 'o') {
		console.log('o')
	

	} else {
		console.log(false)
	}
		


}

won(board)

// var varyBoard = [process.argv[2]]

// for (i=0 j=0; i < board[i].length; i++ j++) {
// 	if (board[i][j] == 'x' && board[i][j+1])
// }
