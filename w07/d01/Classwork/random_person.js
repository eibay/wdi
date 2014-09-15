var people = []

var info = [
	{first_name: "Veronica", last_name: "Sawyer"},
  {first_name: "Martha", last_name: "Dumptruck"},
  {first_name: "Betty", last_name: "Finn"},
  {first_name: "J.D.", last_name: "Dean"},
  {first_name: "Heather", last_name: "Chandler"}]

function createPerson() {
 var random =  
    {first_name: info[Math.floor(Math.random() * info.length)]["first_name"], 
    last_name: info[Math.floor(Math.random() * info.length)]["last_name"], };
    people.push(random);
    new_random = JSON.stringify(random);
    return(new_random);
}

console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());
console.log(createPerson());