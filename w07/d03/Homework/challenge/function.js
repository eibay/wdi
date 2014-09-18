b = [['x', '-', 'o'], 
     ['x', 'x', 'o'],  
     ['o', '-', 'x']]


function won(board) {
	// across 
	for (var line in board) {
		var oh = board[line].every(function(m) { return m == 'o'; }) 
		var ex = board[line].every(function(m) { return m == 'x'; }) 
		var across = (oh || ex)  
		if (across) {
			return board[line][0]; 
		}
	}

	// down 
	for (var i = 0; i < board.length; i++) {
		
		var ex = [board[0][i], board[1][i], board[2][i]].every(function(m) {
			return m == 'x';  
		});

		var oh = [board[0][i], board[1][i], board[2][i]].every(function(m) {
			return m == 'o';  
		});
		var down = (oh || ex)
		if (down) {
			return board[0][i]; 
		}   
	}

	// diagonals 

	var testOne = [board[0][0], board[1][1], board[2][2]].every(function(m) {
		return m == 'x'; 
	})

	var testTwo = [board[0][0], board[1][1], board[2][2]].every(function(m) {
		return m == 'o'; 
	})

	var testThree = [board[2][2], board[1][1], board[0][0]].every(function(m) {
		return m == 'o';  
	}) 

	var testFour = [board[2][2], board[1][1], board[0][0]].every(function(m) {
		return m == 'x';  
	}) 

	var diagonal = (testOne || testTwo || testThree || testFour)

	if (diagonal) {
		return board[1][1]; 
	}

	return false;
} 

var result = won(b); 
console.log(result); 
