function howBig (string) {
	if (string.length < 3) {
		return "small"
	} else if (string.length > 5) {
		return "big"
	} else {
		return "medium"
	}
}
console.log(howBig("as"))
console.log(howBig("asdf"))
console.log(howBig("asdfasdf"))