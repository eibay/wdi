function jokeTell() {
	return "Why did the chicken cross the road?"
}

console.log(jokeTell())
// 
function helloYou(name) {
	return "Hello " + name
}

console.log(helloYou("Joe"))
// 
function helloGuys(names) {
	for(i=0;i<names.length;i++) {
		console.log("Hello " + names[i]) 
	}
}
nameArray = ['Joe', 'Julia', 'Rich']
helloGuys(nameArray)
// 
function helloArray(names) {
	helloName = []
	for(i=0;i<names.length;i++) {
		helloName.push("Hello " + names[i])
	}
	return helloName
}
nameArray = ['Joe', 'Julia', 'Rich']
console.log(helloArray(nameArray))
// 
function doubleMe(num) {
	return num * 2
}
console.log(doubleMe(3))
// 
function quadruple(num) {
	return doubleMe(num) * 2
}
console.log(quadruple(25))
// 
favColors = {}
favColors.Batman = "Black"
favColors.Superman = "Blue"
favColors.GreenArrow = "Green"
favColors.Shazam = "Red"

console.log(favColors)
// 
function favColorIs(hash) {
	keyArray = Object.keys(favColors);
	for(i=0;i<keyArray.length;i++) {
		message = keyArray[i] + "'s favorite color is " + favColors[keyArray[i]]
		console.log(message)
	}
}
favColorIs(favColors)
// 
favHobbies = {}
favHobbies.Spiderman = "Webslinging"
favHobbies.Ironman = "Flying"
favHobbies.Hulk = "Jumping"
favHobbies.Wolverine = "Fighting"

function combine(hash1, hash2) {
	for(key in hash2) {
		hash1[key] = hash2[key];
	}
	return hash1;
}

console.log(combine(favColors, favHobbies))
// 










