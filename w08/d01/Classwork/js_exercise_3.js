// write a function stringInfo that takes a string as a parameter and returns a hash with the following key-value pairs:
// key: length, value: the string's length
// key: original, value: the string itself
// key: splitBySlash, value: the string split by the "/" string

function stringInfo(string) {
	var hash = {}
	hash.length = string.length
	//alternate is hash["length"] = string.length
	hash.original = string
	hash.splitBySlash = string.split("/")
	return hash
};

console.log(stringInfo("http://www.yahoo.com/news"));