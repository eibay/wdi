function stringInfo (string) {
	var hash = {
		length:(string.length)
		original:(string)
		splitBySlash:(string.split("/"))
	}
	return hash
};

console.log(stringInfo("slash/dot"))