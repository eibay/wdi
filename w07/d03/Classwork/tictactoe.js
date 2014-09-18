var board=[['x', 'x', 'o'], ['-', 'x', '-'], ['x', 'x', '-']]
var board2=[['o', 'x', 'o','o','o'], ['-', 'o', '-','o', '-'], ['x', 'x', 'o','o', 'o'], ['x', 'x', '-','o', '-'], ['x', 'x', '-','o', 'o']]

function won(board){

	for(var i=0; i < board.length; i++){

		if(board[i][0]===board[i][1]&&board[i][1]===board[i][2]){

			return board[i][0]+" is the winner in row "+ (i+1);
		}

		else if(board[0][i]===board[1][i]&&board[0][i]===board[2][i]){

			return board[0][i]+" is the winner in column "+(i+1);
		}
	}
	if(board[0][0]==board[1][1] && board[1][1]==board[2][2]){

		return board[0][0]+" wins diagnolly from the top left";

	}
	else if(board[0][2]==board[1][1] && board[1][1]==board[2][0]){

		return board[0][2]+" wins diagnolly from the top right";
	}
	else
	{
		return false;
	}
}

function wonVariableLength(board){
	length=board.length;
	var columnsArray=[];
	left_diagnol=[];
	right_diagnol=[];
	var check_x='';
	var check_o='';
	for(var i=0; i < length; i++){
		var new_column=[];
		for(var n=0; n < length; n++){
			new_column.push(board[board.length-(n+1)][i])
		}
		left_diagnol.push(board[i][i])
		right_diagnol.push(board[i][board.length-(i+1)])
		columnsArray.push(new_column);
			check_x=check_x+'x';
			check_o=check_o+'o';
}
	for(var k=0; k< length; k++){
		if((board[k].join('')==check_x)||(board[k].join('')==check_o)){
			return board[k][0]+" has won in row "+ (k+1);
		}else if((columnsArray[k].join('')==check_x)||(columnsArray[k].join('')==check_o)){
			return columnsArray[k][0]+" has won in column "+ (k+1);

		}	else if((left_diagnol.join('')==check_x)||(left_diagnol.join('')==check_o)){
				return "left diagnol has won"
		} else if((right_diagnol.join('')==check_x)||(right_diagnol.join('')==check_o)){
				return "right diagnol has won"
		}
	}
		return false;
}


console.log(wonVariableLength(board2))

console.log(won(board));











