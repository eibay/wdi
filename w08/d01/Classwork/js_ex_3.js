function stringInfo (string) {
	var hash = new Object();
		hash["length"] = (string.length)
		hash.original = (string)
		hash.splitBySlash = (string.split("/"))
	return hash
};

console.log(stringInfo("slash/dot"))