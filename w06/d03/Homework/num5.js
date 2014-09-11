var makeTags = function(tag, string) {
	return '<' + tag + '>' + string + '<' + tag + '>'
};
console.log(makeTags('i', 'Yay'))
console.log(makeTags('i', 'Hello'))
console.log(makeTags('cite', 'Yay'))
