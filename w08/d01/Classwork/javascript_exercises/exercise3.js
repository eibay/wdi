function stringInfo (str) {
	var hash = {};
	hash["length"] = str.length;
	hash["original"] = str;
	hash["splitBySlash"] = str.split("/");
	return hash;
}