function makeTags(tag, text) {
	return "<" + tag + ">" + text + "</" + tag + ">"
}

ans = makeTags('i', 'Yay')
console.log(ans)

ans = makeTags('i', 'Hello')
console.log(ans)

ans = makeTags('cite', 'Yay')
console.log(ans)