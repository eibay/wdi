
function initials(name) {
	var init = [];
	var i = 0;

	while (i < name.length) {
		if ((name.charAt(i) == name.charAt(i).toUpperCase()) && (name.charAt(i) != ' ')) {
			init.push(name.charAt(i));
		}
		i += 1;
	}

	newString = init.join();
	newString = newString.replace(/,/g, '');

	return newString;
}


console.log(initials("Jill Robin Ortenberg"));


