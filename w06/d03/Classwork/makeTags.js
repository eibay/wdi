function makeTags (tag, str) {
	console.log('<' + tag + '>' + str + '</' + tag + '>')
};

makeTags('i', 'Yay')
// '<i>Yay</i>'
makeTags('i', 'Hello')
// '<i>Hello</i>'
makeTags('cite', 'Yay')
// '<cite>Yay</cite>'