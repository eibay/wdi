function make_tags(tag, word){
	return ("<" + tag + ">" + word + "</" + tag + ">")
}


console.log(make_tags("h1", "HELLO WORLD!"))