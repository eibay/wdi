

newPersonHash = {}
function createPerson(){
		var name = ["lisa", "grayson", "jeff"]
		var location = ["orange county", "miami", "orlando"]
    //create a person with random attributes
    //add that person to the people array
    //return that person
    for(var i=0; i<name.length; i++){
    	newPersonHash["name"]= name[Math.floor(Math.random()*name.length)]
    	newPersonHash["location"]= location[Math.floor(Math.random()*location.length)]
    	people.push(newPersonHash)
    }return newPersonHash
	};

	console.log(createPerson());


