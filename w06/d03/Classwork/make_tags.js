// makeTags('i', 'Yay')
// // '<i>Yay</i>'
// makeTags('i', 'Hello')
// // '<i>Hello</i>'
// makeTags('cite', 'Yay')
// // '<cite>Yay</cite>'


function makeTags(tagstr, str){
	newtag = ( '<' + tagstr + '>' + str + '</' + tagstr + '>'  )
	console.log(newtag);
};

makeTags('i', 'Yay')
// '<i>Yay</i>'
makeTags('i', 'Hello')
// '<i>Hello</i>'
makeTags('cite', 'Yay')
// '<cite>Yay</cite>'

