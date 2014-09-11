function makeTags(tag, word) {

	return '<' + tag + '>' + word + '</' + tag + '>'

}

console.log(makeTags("i", "Yay"));
console.log(makeTags("i", "Hello"));
console.log(makeTags("cite", "Yay"));