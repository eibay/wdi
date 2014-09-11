
function tag_this_string(tag, tagged) {
	var string_tagged = ('<' + tag + '>' + tagged + '</' + tag + '>');
	return string_tagged;
}

console.log(tag_this_string('i', 'Hello World'));