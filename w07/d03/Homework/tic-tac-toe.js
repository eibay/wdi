var board = [ 	['o', 'o', 'x'], 
     			['x', 'x', 'o'],  
     			['o', 'o', 'x']
     		]

function won(board) {

	// top, across
	if (board[0][0] == 'x' && board[0][1] == 'x' && board[0][2] == 'x') {
		console.log('x is the winner')
	// middle, across
	} else if (board[1][0] == 'x' && board[1][1] == 'x' && board[1][2] == 'x') {
		console.log('x is the winner')
	// bottom, across 
	} else if (board[2][0] == 'x' && board[2][1] == 'x' && board[2][2] == 'x') {
		console.log('x is the winner')
	// middle column 
	} else if (board[0][1] == 'x' && board[1][1] == 'x' && board[2][1] == 'x') {
		console.log('x is the winner')
	// right, third column 
	} else if (board[0][2] == 'x' && board[1][2] == 'x' && board[2][2] == 'x') {
		console.log('x is the winner')
	// diagonal, top left corner-bottom right 
	} else if (board[0][0] == 'x' && board[1][1] == 'x' && board[2][2] == 'x') {
		console.log('x is the winner')
	// diagonal, top right corner-bottom left 
	} else if (board[0][2] == 'x' && board[1][1] == 'x' && board[2][0] == 'x') { 
		console.log('x is the winner')
	// left, first column
	} else if (board[0][0] == 'x' && board[1][0] == 'x' && board[2][0] == 'x') { 
		console.log('x is the winner')

////////////////////////////////////////////////////////////////////////////////

	// top, across
	} else if (board[0][0] == 'o' && board[0][1] == 'o' && board[0][2] == 'o') {
		console.log('o is the winner')
	// middle, across
	} else if (board[1][0] == 'o' && board[1][1] == 'o' && board[1][2] == 'o') {
		console.log('o is the winner')
	// bottom, across 
	} else if (board[2][0] == 'o' && board[2][1] == 'o' && board[2][2] == 'o') {
		console.log('o is the winner')
	// middle column 
	} else if (board[0][1] == 'o' && board[1][1] == 'o' && board[2][1] == 'o') {
		console.log('o is the winner')
	// right, third column 
	} else if (board[0][2] == 'o' && board[1][2] == 'o' && board[2][2] == 'o') {
		console.log('o is the winner')
	// diagonal, top left corner-bottom right 
	} else if (board[0][0] == 'o' && board[1][1] == 'o' && board[2][2] == 'o') {
		console.log('o is the winner')
	// diagonal, top right corner-bottom left 
	} else if (board[0][2] == 'o' && board[1][1] == 'o' && board[2][0] == 'o') { 
		console.log('o is the winner')
	// left, first column
	} else if (board[0][0] == 'o' && board[1][0] == 'o' && board[2][0] == 'o') { 
		console.log('o is the winner')
	} else {
		console.log('false, nobody wins')
	}
	
}
won(board)