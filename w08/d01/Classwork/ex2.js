
function howBig(word){
	if (word.length < 3){
		return "small"
	} else if (word.length < 5){
		return "medium"
	} else {
		return "big"
	}
}

console.log(howBig("sm"))
console.log(howBig("medi"))
console.log(howBig("larges"))