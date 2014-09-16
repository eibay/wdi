var people = []
function createPerson() {
	var fnames = ["John", "Paul", "George", "Ringo"]
	var lnames = ["Lennon", "McCartney", "Harrison", "Starr"]
	var instruments = ["rhythm guitar", "bass", "lead guitar", "drums"]
	var first = fnames[Math.floor(Math.random() * fnames.length)]
	var last = lnames[Math.floor(Math.random() * lnames.length)]
	var inst = instruments[Math.floor(Math.random() * instruments.length)]
	var beatle = {
		fname: first,
		lname: last,
		instrument: inst
	}
	return beatle


}

console.log(createPerson());