	
	var make=document.getElementById('makeboard');
	makeboard.addEventListener('click', function(){

		var input=parseInt(document.getElementById('howmany').value);
		createBoard(input)
		document.getElementById('howmany').value=''

})



	var turn="x";

	var square=document.getElementsByClassName('square');

	for(i=0; i < square.length; i++){

		square[i].addEventListener('click', function(event){
			if(event.target.innerText==""){
			event.target.innerText=turn;
				if(turn=="x")
			{
				turn="o"
			}
			else{
				turn="x"
			}
				var board=countBoard()
				
		if(wonVariableLength(board) != false){
			document.getElementById('winner').innerText=wonVariableLength(board);
			setTimeout(clearBoard, 2000)
			
		}
		}

		else{
			window.alert("you can't go there!")
		}
		
	});

	}


function countBoard(){

			var squares=document.getElementsByClassName('square');
			var squares_per_row=Math.sqrt(squares.length);
			var all_squares=[]
			var rows=[]
			

				for(i=0; i < squares.length; i++){
						all_squares.push(squares[i].innerText)
				}
				
				var count=squares_per_row;
				for(var j=0; j < (all_squares.length); j+=squares_per_row){
					console.log(all_squares.length-squares_per_row)
					var new_array=all_squares.slice(j, count)
					rows.push(new_array);
					count+=squares_per_row
				}
				
				console.log(rows)

			return rows;


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
				return left_diagnol[0]+" has won on left diagnol"
		} else if((right_diagnol.join('')==check_x)||(right_diagnol.join('')==check_o)){
				return right_diagnol[0]+" has won on right diagnol"
		}
	}
		return false;
}

function clearBoard(){

	var square=document.getElementsByClassName('square');

	for(var n=0; n < square.length; n++){

		square[n].innerText="";

	}

	document.getElementById('winner').innerText="";



}

function createBoard(rows){
	var table=document.getElementById('board');
	table.innerHTML='';
	var board=document.getElementById('board');

	for(var i=0; i < rows; i++){
			var tr=document.createElement('tr');
			tr.id="row"+i;
			board.appendChild(tr);
			
			for(var j=0; j < rows; j++){
				var td=document.createElement('td');
				td.className="square";
				tr.appendChild(td);
				td.addEventListener('click', function(event){
			if(event.target.innerText==""){
			event.target.innerText=turn;
				if(turn=="x")
			{
				turn="o"
			}
			else{
				turn="x"
			}
				var board=countBoard()
		if(wonVariableLength(board) != false){
			document.getElementById('winner').innerText=wonVariableLength(board);
			setTimeout(clearBoard, 2000)
			
		}
		}

		else{
			window.alert("you can't go there!")
		}
		
	});
				}
		}
}












