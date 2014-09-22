function srtingInfo(word){
	
	var length, original, splitBySlash;
	var infoHash={ len: "", original: "", splitBySlash : ""}
	

	length = word.length
	original = word
	splitBySlash = word.split("/")
	infoHash.len = length
	infoHash.original = original
	infoHash.splitBySlash= splitBySlash
	return infoHash
}


console.log(srtingInfo("HELLO/WORLD"))