
function board(won, rowLength) {
	var permutations = [];

	var xWinner = "";
	var oWinner = ""
	for (i = 0; i < rowLength; i++) {
		xWinner += "x";
		oWinner += "o";
	}

	var rowIndex = 0;
	while (rowIndex < (rowLength * rowLength)) {
		var permutation = "";
		for (rowIterator = 0; rowIterator < rowLength; rowIterator++) {
			permutation += won[rowIndex];
			rowIndex += 1;
		}
		permutations.push(permutation);
	}

	var columnIterator = 0;
	while (columnIterator < rowLength) {
		var limit = columnIterator + (rowLength * (rowLength - 1));
		var permutation = "";
		for(columnIndex = columnIterator; columnIndex <= limit; columnIndex += rowLength) {
			permutation += won[columnIndex];
		}
		permutations.push(permutation);
		columnIterator += 1;
	}

	var firstDiagIndex = 0;
	var permutation = ""
	while (firstDiagIndex < (rowLength * rowLength)) {
		permutation += won[firstDiagIndex];
		firstDiagIndex += (rowLength + 1);
	}
	permutations.push(permutation);

	var secondDiagIndex = rowLength - 1;
	var permutation = "";
	while ( secondDiagIndex <= (rowLength * (rowLength - 1)) ) {
		permutation += won[secondDiagIndex];
		secondDiagIndex += rowLength - 1;
	}
	permutations.push(permutation);

	xWon = false;
	oWon = false;

	permutations.forEach(function(line) {
		if (line == xWinner) {xWon = true};
		if (line == oWinner) {oWon = true};
	})
	if (xWon) {console.log("x has won.")};
	if (oWon) {console.log("o has won.")};



}

test = ["x", "o", "", "o", "o", "", "x", "o", "x", "", "", "x", "x", "x", "o", "x", "x", "x", "x", "x", "o", "", "", "", "o"]

board(test, 5)


	