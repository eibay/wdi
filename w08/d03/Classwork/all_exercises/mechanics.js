// Create a function that returns a string with a joke.
	function joke(str) {
		return str
	}
	console.log(joke("The depressing thing about tennis is that no matter how good I get, I'll never be as good as a wall."))

// Create a function that takes a name and returns "hello [name]"
	function hello(name) {
		return "hello " + name
	}
	console.log(hello("Bob"))

// Create a function that takes an array of names and console.logs "hello name" for each name
	function greetings(arr) {
		for (var i = 0; i < arr.length; i++) {
			console.log(hello(arr[i]))
		}
	}
	greetings(["Bob", "Caroll", "Andy", "Wendall"])

// Create a function that takes an array of names and returns a new array with "hello [name]" for each name
	function greetingArray(arr) {
		var newArray = []
		for (var i = 0; i < arr.length; i++) {
			newArray.push(hello(arr[i]))
		}
		return newArray
	}
	console.log(greetingArray(["Bob", "Caroll", "Andy", "Wendall"]))

// Create a function double that takes a number as an argument and returns it doubled
	function double(num) {
		return num * 2;
	}
	console.log(double(15))

// Create a function quadruple that uses double - ie quadruple(4) === 16
	function quadruple(num) {
		return double(num) * 2;
	}
	console.log(quadruple(8))

// Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
	peopleColors = {}

	peopleColors["Bob"] = "green"
	peopleColors["Larry"] = "blue"
	peopleColors["Agnes"] = "purple"

	console.log(peopleColors)

// Create a function that takes a hash of favorite colors and uses Object.keys to print out "[name] favorite color is [color]" for each name

	function colorPrinter(hash) {
		var keys = Object.keys(hash)
		for (var i = 0; i < keys.length; i++) {
			console.log(keys[i] +  "'s favorite color is " + hash[keys[i]])
		}
	}
	colorPrinter(peopleColors)

// Create a function that takes two hashes and combines the elements
morePeopleColors = {"Estelle" : "yellow", "Arthur" : "green", "Harriet" : "red"}

function hashMerge(hash1, hash2) {
	var keys1 = Object.keys(hash1)
	var keys2 = Object.keys(hash2)
	newHash = {}
	for (var i = 0; i < keys1.length; i++) {
		newHash[keys1[i]] = hash1[keys1[i]]
	};
	for (var i = 0; i < keys2.length; i++) {
		newHash[keys2[i]] = hash2[keys2[i]]
	};
	return newHash
}
console.log(hashMerge(peopleColors, morePeopleColors))
















