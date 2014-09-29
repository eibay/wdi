var people = []
function createPerson() {
	var fnames = ["John", "Paul", "George", "Ringo"]
	var lnames = ["Lennon", "McCartney", "Harrison", "Starr"]
	var instruments = ["rhythm guitar", "bass", "lead guitar", "drums"]
	var first = rando(fnames);
	var last = rando(lnames);
	var inst = rando(instruments);
	var beatle = {
		fname: first,
		lname: last,
		instrument: inst
	}
	return beatle
}
function rando(arr) {
	var index = arr[Math.floor(Math.random() * arr.length)]
	return index
}



console.log(createPerson());