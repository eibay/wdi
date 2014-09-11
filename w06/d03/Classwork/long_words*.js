function long_words(number, words){
	x = 0
	var word = []

	var num = parseInt(number)
	
	while (x < words.legth){
		if (words[x].length > num){
			word.push(words[x])
			x += 1
		}	else
			x +=1
	} return words
}

console.log(long_words(3, ["hello", "hi", "hey", "hola", "aloha"]))