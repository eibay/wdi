function chopped(word){
	var lng = word.length;
	return word.substring(1, lng-1);
}



console.log(chopped("hello"));
console.log(chopped("java"));
console.log(chopped("coding"));