function stringInfo(string) {
	var hash = {}
	hash["length"] = string.length
	hash.original = string
	hash.splitBySlash = string.split('/')
	return hash
}
console.log(stringInfo('hello /my name is /joe'))
