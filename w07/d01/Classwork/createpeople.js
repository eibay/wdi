
var name = ["Tejal", "Brenda", "Jessica"]
var location = ["new york city", "san francisco", "toronto"]

function createPerson() {
  indexarray1 = Math.floor(Math.random() * name.length)
  indexarray2 = Math.floor(Math.random() * location.length)
  person = {name: name[indexarray1], location: location[indexarray2]}
  return person
}

console.log(createPerson())
console.log(createPerson())
console.log(createPerson())
console.log(createPerson())
