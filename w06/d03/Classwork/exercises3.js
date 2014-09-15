var args = process.argv;

console.log(args);

function makes10(num1, num2) {
	if(num1 == 10 || num2 == 10 || num1 + num2 == 10) {
		return true;
	} else {
		return false;
	}
}

console.log(makes10(9, 10))
  // true
console.log(makes10(9, 9))
  // false
console.log(makes10(1, 9))
  // true

function withoutEnd(str) {
	var word = "";

	if(str.length >= 2) {
		for (i = 1; i < str.length - 1; i++) {
			word += (str.charAt(i));
		}
	}
	console.log(word);
}

withoutEnd('Hello')
  // 'ell'
withoutEnd('java')
  // 'av'
withoutEnd('coding')
  // 'odin'

function makeTags(tag, str) {
	console.log("<" + tag + ">" + str + "</" + tag + ">")
}

makeTags('i', 'Yay')
  // '<i>Yay</i>'
  makeTags('i', 'Hello')
  // '<i>Hello</i>'
  makeTags('cite', 'Yay')
  // '<cite>Yay</cite>'

////  

function maxOfThree(num1, num2, num3) {
	greatest = Math.max(num1, num2, num3);
	console.log(greatest);
}

maxOfThree(1, 4, 6)

////  
// #! /usr/local/bin/node

function inbetween(num1, num2) {
	for (i = num1 + 1; i < num2; i++) {
		console.log(i);
	}
}
//process.argv
inbetween(2, 6)

////

function filterLongWords(int, array) {
	list = []
	for(var i = 0; i < array.length; i++) {
		if(array[i].length > int) {
			list.push(array[i]);
		}
	}
	console.log(list);
}

filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])

////

function initials(name) {
	var names = name.split(" ")
	var initials = []
	for (var i = 0; i < names.length; i++) {
		initials.push(names[i].slice(0,1))
	}
	initials = initials.join("")
	console.log(initials)
}

initials("Eric Hamilton Kramer")

////

function randomCastMember(array) {
	i =  Math.floor(Math.random() * array.length);
	console.log(array[i]);
}

randomCastMember(["Jennifer Anniston", "Matthew Perry", "David Schwimmer", "Courtney Cox", "Lisa Kudrow"])