  //create a person with random attributes
  //add that person to the plp array
  //return that person

var people = []
function createPerson() {
  var peeps = ["Johnny Bananas", "Princess Consuela", "Mr. Rogers"]
  var hobby = ["Bananas", "Queening", "Neighboring"]

  person = {}
  person.peeps = randomElement(peeps);
  person.hobby = randomElement(hobby);


   people.push(person)

   return person;

   function randomElement(arr) {

    var index = parseInt(Math.random()*arr.length)
    return arr[index];

   }

}

console.log(createPerson());
